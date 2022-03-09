"""
This package contains the implementations discussed in the bachelor thesis 
"Natural Language Processing to enable semantic search on numismatic descriptions".
All code in the cnt package has been developed by Patricia Klinger.
The Code has been modified by Kerim Gencer and Chrisowalandis Deligio, discussed in the master thesis
"Natural Language Processing auf mehrsprachigen Münzdatensätzen - Untersuchung der Qualität, Datenqualität und Übertragbarkeit auf andere Datensätze".

"""

from sklearn.base import TransformerMixin, BaseEstimator
import numpy as np
#import gensim
#from gensim.models.doc2vec import TaggedDocument

class Doc2Str(TransformerMixin, BaseEstimator):
    def fit(self, X, y):
        return self
    
    def transform(self, X):
        """
        builds a list of words as input for vectorization
        
        Parameters
        ----------
        
        X: list of Feature objects
        """
        X_vect = [" ".join(map(str, x.doc)) for x in X]
        return X_vect


class Path2Str(TransformerMixin, BaseEstimator):
    def __init__(self, pos=False, dep=False, ent=False):
        self.pos = pos
        self.dep = dep
        self.ent = ent
    def fit(self, X, y):
        return self
    
    def transform_single(self, x):
        #
        #Feature(subj=Herakles, path=[Herakles, Nackter, stehend, vorn], obj=vorn, doc=Nackter, bärtiger
        #Herakles, stehend von vorn, Kopf nach links, mit der rechten Hand sich auf die Keule stützend, mit dem linken Arm das
        #Löwenfell haltend.Bildleiste.Perlkreis., verbs = ['stehend'])
        #
        if self.ent and not self.dep and not self.pos:
            x_vect = " ".join(map(lambda t: t.text.replace(" ", "_") + "\\" + t.ent_type_, x.path))
        elif self.pos and not self.dep and not self.ent:
            x_vect = " ".join(map(lambda t: t.text.replace(" ", "_") + "\\" + t.pos_, x.path))
        elif self.dep and not self.pos and not self.ent:
            x_vect = " ".join(map(lambda t: t.text.replace(" ", "_") + "\\" + t.dep_, x.path))
        elif self.pos and self.dep and not self.ent:
            x_vect = " ".join(map(lambda t: t.text.replace(" ", "_") + "\\" + t.pos_ + "\\" + t.dep_, x.path))
        elif self.ent and self.pos and not self.dep:
            x_vect = " ".join(map(lambda t: t.text.replace(" ", "_") + "\\" + t.ent_type_ + "\\" + t.pos_, x.path))
        elif self.ent and self.dep and not self.pos:
            x_vect = " ".join(map(lambda t: t.text.replace(" ", "_") + "\\" + t.ent_type_ + "\\" + t.dep_, x.path))
        elif self.ent and self.dep and self.pos:
            x_vect = " ".join(map(lambda t: t.text.replace(" ", "_") + "\\" + t.ent_type_ + "\\" + t.pos_ + "\\" + t.dep_, x.path))
        else:
            x_vect = " ".join(map(str, x.path))
            
        return x_vect
    
    def transform(self, X):
        """
        builds a list of words as input for vectorization
        
        Parameters
        ----------
        
        X: list of Feature objects
        """
        return [self.transform_single(x) for x in X]

class Verbs2Str(TransformerMixin, BaseEstimator):
    def fit(self, X, y):
        return self
    
    def transform(self, X):
        """
        builds a list of words as input for vectorization
        
        Parameters
        ----------
        
        X: list of Feature objects
        """
        X_vect = [" ".join(map(str, x.verbs)) for x in X]
        return X_vect
    
class AveragedPath2Vec(TransformerMixin, BaseEstimator):
    # vector size on the en_core_web_sm = 384
    vec_dim = 300
    
    def fit(self, X, y):
        return self
    
    def transform_single(self, x):
        """
        Parameters:
        -----------
        
        x: single Feature object
        """
        path_vector = sum((token.vector for token in x.path), np.zeros(self.vec_dim))
        averaged_path_vector = path_vector / len(x.path) if len(x.path) > 0 else path_vector
        return averaged_path_vector
        
    def transform(self, X):
        """
        builds an averaged path vector
        
        Parameters
        ----------
        
        X: list of Feature objects
        """
        return [self.transform_single(x) for x in X]
    
class AveragedRest2Vec(TransformerMixin, BaseEstimator):
    # vector size on the en_core_web_sm = 384
    vec_dim = 300
    
    def fit(self, X, y):
        return self
    
    def transform_single(self, x):
        """
        Parameters:
        -----------
        
        x: single Feature object
        """
        path_vector = sum((token.vector for token in x.path), np.zeros(self.vec_dim))
        doc_vector = sum((token.vector for token in x.doc), np.zeros(self.vec_dim))
        averaged_vector = ((doc_vector - path_vector) / (len(x.doc) - len(x.path))
                           if (len(x.doc) - len(x.path)) > 0 else np.zeros(self.vec_dim))
        return averaged_vector
        
    def transform(self, X):
        """
        builds an averaged path vector
        
        Parameters
        ----------
        
        X: list of Feature objects
        """
        return [self.transform_single(x) for x in X]
        