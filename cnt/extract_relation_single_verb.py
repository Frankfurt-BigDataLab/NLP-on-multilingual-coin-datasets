"""
This package contains the implementations discussed in the bachelor thesis
"Natural Language Processing to enable semantic search on numismatic descriptions".
All code in the cnt package has been developed by Patricia Klinger.
predict_single_sentence_clear and predict_clear developed by Sebastian Gampe.
The Code has been modified by Kerim Gencer and Chrisowalandis Deligio, discussed in the master thesis
"Natural Language Processing auf mehrsprachigen Münzdatensätzen - Untersuchung der Qualität, Datenqualität und Übertragbarkeit auf andere Datensätze".

"""

from collections import namedtuple
from sklearn.base import TransformerMixin, BaseEstimator, ClassifierMixin

from cnt.annotate import annotate_designs
from cnt.model import DesignEstimator, load_ner_model_v2
from sklearn.model_selection import train_test_split
import spacy
from functools import lru_cache
import pandas as pd

NER = namedtuple("NER", ["doc", "subj", "verb"])


def make_my_estimator(X, model_directory, model_name, id_col, design_col):
    #my_estimator = load_ner_model(model_dir, model_name)
    model = load_ner_model_v2(model_directory, model_name, id_col, design_col)
    return model


class SingleSentenceTransformerMixin:
    def transform(self, X):
        """
        transforms a list of sentences into NER objects
        with sentence = spacy.doc, subj and obj = spacy.span
        
        Parameters
        -----------
        
        X: list of strings

        Returns
        -------

        list of lists of NER objects
        """
        trans = X[self.KEY].map(self.transform_single_sentence)
        return pd.DataFrame({self.id_col: X[self.id_col], "y": trans})



class NERTransformer(SingleSentenceTransformerMixin, TransformerMixin, BaseEstimator):
    KEY = "DesignEng"

    def __init__(self, model_dir, model_name, id_col, design_col):
        self.model_dir= model_dir
        self.model_name = model_name
        self.id_col = id_col
        self.design_col = design_col
        self.KEY = self.design_col

    def fit(self, X, y):
        """
        fits the model
        
        Parameters
        -----------
        
        X: list of designs
        y: list of lists of (subj, relation_class_label)
        """
        self.my_estimator = make_my_estimator(X, self.model_dir, self.model_name, self.id_col, self.KEY)
        return self

    def transform_single_sentence(self, x):
        """
        transforms a sentence into a NER object
        with sentence = spacy.doc, subj and obj = spacy.span
        
        Parameters
        -----------
        
        x: string
        """
        doc = self.my_estimator.predict_single_sentence(x, as_doc=True) # DesignEstimator

        sent_subj = []

        my_label_subj = ["PERSON", "OBJECT", "ANIMAL", "PLANT"]
        my_label_verb = ["VERBS"]
        doc_list = list(doc.ents)
        for subj in doc_list:
            if subj.label_ in my_label_subj:
               for obj in doc_list:
                    if subj != obj:
                        if obj.label_ in my_label_verb:
                            sent_subj.append(NER(doc, subj, obj))
        return sent_subj

def get_verbs(doc):
        verbs = []
        for token in doc:
            if token.pos_ == "VERB":
                verbs.append(token)
        return verbs


def path(subj, obj):
    """
    determines the least common ancestor of two nodes
    and prints the whole path between them

    Parameters
    -----------

    subj: token
        word in the sentence / node in the tree
        to start the path
    obj: token
        word in the sentence / node in the tree
        to end the path

    Returns
    -------

    list of spacy.Token
    """
    up_from_obj = []  # Amphora
    up_from_subj = []
    current_token = obj  # Amphora, Apollo
    while True:
        up_from_obj.append(current_token)
        if current_token == current_token.head:
            break
        current_token = current_token.head

    up_from_obj = list(reversed(up_from_obj))

    current_token = subj
    while current_token not in up_from_obj and current_token != current_token.head:
        up_from_subj.append(current_token)
        current_token = current_token.head
    try:
        intersection = up_from_obj.index(current_token)
    except ValueError:  # current_token not in up_from_obj
        return []

    path = up_from_subj + up_from_obj[intersection:]
    
    return path


def path_sov(doc, subj, obj):

    subj_index = subj.i
    obj_index = obj.i

    verbs = []
    for index in range (obj_index, len(doc)):
        if doc[index] == '.':
            break


Feature = namedtuple("Feature", ["subj", "path","verb", "doc", "verbs"])
class FeatureExtractor(SingleSentenceTransformerMixin, TransformerMixin, BaseEstimator):
    KEY = "y"
    def __init__(self, model_dir, model_name, id_col, design_col):
        self.model_dir= model_dir
        self.model_name = model_name
        self.id_col = id_col
        self.design_col = design_col

    def fit(self, X, y):
        return self
    
    def transform_single_sentence(self, x):
        """
        transforms a sentence into a Feature object
        with sentence = spacy.doc, subj and obj = spacy.span

        Parameters
        -----------

        X: list of NER objects
        """
        #[ NER(doc=Nackter, bärtige..., subj = Nackter, obj = Herakles),...]
        extracted_paths = []
        for ner in x:

            p = path(ner.subj.root, ner.verb.root)
            extracted_paths.append(Feature(ner.subj, p, ner.verb, ner.doc, ner.verb))
        return extracted_paths

    def extract_verbs_single_sentence(self, p):
        verbs = []
        for token in p:
            if token.label_ == "VERBS":
                verbs.append(token.text)
        return verbs

class RelationExtractor(BaseEstimator, ClassifierMixin):
    NONEXISTINGRELATION = "nonexisting_relation"
    KEY = "y"

    def __init__(self, pipeline, output_dir, model_name, id_col):
        self.pipeline = pipeline
        self.output_dir = output_dir
        self.model_name = model_name
        self.id_col = id_col

    def fit(self, X, y):
        """
        fits the model

        Parameters
        ----------

        X: list of lists of Feature objects
        y: list of lists of (subj, relation_class_label, obj)
        """
        X_features = []
        y_for_classification = []
        for list_of_features, list_of_annotations in zip(X["y"], y["y"]):
            dict_of_annotations = {(subj, verb_sentence): verb_classified for subj,_, verb_sentence, verb_classified in list_of_annotations}
            #dict_of_annotations = {(subj, verb): verb for subj, _, verb in list_of_annotations}
            for feature in list_of_features:
                if (feature.subj.text, feature.verb.text) in dict_of_annotations:
                    verb = dict_of_annotations[(feature.subj.text, feature.verb.text)]
                else:
                    verb = self.NONEXISTINGRELATION

                y_for_classification.append(verb)
                X_features.append(feature)
        self.pipeline.fit(X_features, y_for_classification)
        return self

    def predict(self, X, rdf=False):
        """
        predicts the models' output for a list of sentences

        Parameters
        ----------

        X: list of lists of Feature objects
        """
        trans = [self.predict_single(pred, rdf) for pred in X[self.KEY]]#X[self.KEY].map(self.predict_single)
        return pd.DataFrame({self.id_col: X[self.id_col], "y": trans})

    def predict_single(self, x, rdf=False):
        """
        predicts the models' output for a single sentence

        Parameters
        ----------

        X: list of Feature objects
        """
        if len(x) == 0:
            return []
        list_of_predicted_relations = self.pipeline.predict(x)
        prediction = []
        for feature, rel in zip(x, list_of_predicted_relations):
            if rel != self.NONEXISTINGRELATION:
                if rdf==True:
                    prediction.append((feature.subj.text, feature.subj.label_, rel, "no-value"))
                else:
                    prediction.append((feature.subj.text, feature.subj.label_, feature.verb.text, rel))

        return prediction
