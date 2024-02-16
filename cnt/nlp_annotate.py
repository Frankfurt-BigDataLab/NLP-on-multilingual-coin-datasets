#!/usr/bin/env python3
"""
This package contains the implementations discussed in the bachelor thesis 
"Optimierung beim Annotieren mehrsprachiger Münzdatensätze im Kontext des Natural Language Processing"
The code has been developed by Katrin Peikert
Some functions have been adapted by Katrin Peikert from Kerim Gencer and Chrisowalandis Deligio master thesis "Natural Language Processing auf mehrsprachigen Münzdatensätzen - Untersuchung der Qualität, Datenqualität und Übertragbarkeit auf andere Datensätze" (2021).
"""

import sys
sys.path.append('../')
import re as re
import pandas as pd
import numpy as np
import copy as cp
from cnt.io import Database_Connection
from cnt.nlp_functions import(tokenize_sentence, get_lemma_word, get_most_likely_comp, get_stem_word, nlp_find_max_entity, clean_input, find_all)
pd.set_option("display.max_colwidth", None)


def merge_dictionaries(dict1, dict2):
    """
    Merges two Dictionaries
    
    Parameters
    ----------

    dict1: dict
    
    dict2: dict
    """

    for key in dict1:
        dict1[key] = [*dict1[key],*dict2[key]]
    return dict1

def nlp_analyse_entities(entities, mode, lang):
    """
    Given dictionary with  entities, adds nlp-analyzed forms to it
    
    Parameters
    ----------

    entities: dict
        The dictionary matches labels to their entities
    
    mode: str
        Either "stem" or "lemma"; defines which nlp-tool to use
    
    lang: str
        Either "de" or "en"; defines whether the english or german nlp-tool is to use
    """

    for label, list_entities in entities.items():
        analyzed_entities = []
        if mode == "lemma":
            for entity in list_entities:
                if entity != "" and entity != '':
                    analyzed_entities.append(get_lemma_word(clean_input(entity), lang).lower())
                    analyzed_entities.append(entity.lower())
                    
        elif mode == "stem":
            for entity in list_entities:
                if entity != "" and entity != '':
                    analyzed_entities.append(get_stem_word(clean_input(entity), lang).lower())
                    analyzed_entities.append(entity.lower())
        entities[label] = list(set(analyzed_entities))

    return entities

def get_sentence_dict(orig_sentence, lang, mode="lemma"):
    """
    Given a sentence this returns a dictionary which matches nlp-analyzed words to their original form and a string with the nlp-analyzed forms
    
    Parameters
    ----------

    orig_sentence: str
        The sentence to be analyzed.
    
    mode: str
        Either "stem" or "lemma"; defines which nlp-tool to use
    
    lang: str
        Either "de" or "en"; defines whether the english or german nlp-tool is to use
    """

    s_dict = dict()
    nlp_sentence = ""
    tok_sentence = tokenize_sentence(orig_sentence,lang)
    for word in range(0,len(tok_sentence)):
        splitted_words = get_most_likely_comp(tok_sentence[word].text)
        if splitted_words == None:
            if mode == "lemma":
                nlp_word = get_lemma_word(clean_input(tok_sentence[word].text), lang).lower()
            elif mode == "stem":
                nlp_word = get_stem_word(clean_input(tok_sentence[word].text), lang).lower()
            nlp_sentence += str(nlp_word) + " "
            if not(nlp_word in s_dict):
                s_dict[nlp_word] = [[tok_sentence[word].pos_, tok_sentence[word].text]]
            else:
                if not(([tok_sentence[word].pos_, tok_sentence[word].text]) in s_dict[nlp_word]): 
                    s_dict[nlp_word].append([tok_sentence[word].pos_, tok_sentence[word].text])
                    s_dict[nlp_word]= sorted(list(s_dict[nlp_word]), key = lambda x : len(x[1]), reverse=True)
        else:
            counter = 0
            # Add splitted words to our sentence and dict
            for w in splitted_words:
                if mode == "lemma":
                    nlp_w = get_lemma_word(clean_input(w), lang).lower()
                elif mode == "stem":
                    nlp_w = get_stem_word(clean_input(w), lang).lower()
                nlp_sentence += str(nlp_w) + " "
                if not(nlp_w in s_dict):
                    s_dict[nlp_w] = [[tok_sentence[word].pos_, tok_sentence[word].text, counter]]
                else:
                    s_dict[nlp_w].append([tok_sentence[word].pos_, tok_sentence[word].text, counter])
                counter +=1
        
            # Add original word to our sentence and dict as well, but with highest priority for annotation
            if mode == "lemma":
                nlp_word = get_lemma_word(clean_input(tok_sentence[word].text), lang).lower()
            elif mode == "stem":
                nlp_word = get_stem_word(clean_input(tok_sentence[word].text), lang).lower()
            nlp_sentence += str(nlp_word) + " "    
            if not(nlp_word in s_dict):
                s_dict[nlp_word] = [[tok_sentence[word].pos_, tok_sentence[word].text, counter]]
            else:
                s_dict[nlp_word].append([tok_sentence[word].pos_, tok_sentence[word].text, counter])
    return s_dict,nlp_sentence[:-1]



def get_coordinates(sen_dict,matches_obj, design,label,annotation):
    """
    Given a potential entity, consisting of a single word,  locates the original coordinates of it in the original sentence
    
    Parameters
    ----------

    sen_dict: dict
        The dictionary which matches nlp-analyzed words to their original form
    
    matches_obj: str
        Potential entity which was detected in the nlp-analyzed sentence

    design: str
        The original sentence

    label: str
        The label, e.g. "PERSON", "ANIMAL", ...
    
    annotation: list 
        A list consisiting of the annotations for this sentence for this label so far 
        

    """
    compound_counter = 0
    for nlp_word in sen_dict[matches_obj]:
        pos, word = nlp_word[0], nlp_word[1]
        # Filtering pos tags according to current entity_list
        if  (pos in ['SPACE', 'PUNCT']) or (
            label == "VERBS" and not(pos in["VERB", "ADV", "ADJ"])) or (
                label != "VERBS" and pos in ["DET","PRON","ADV", "ADJ","VERB", "AUX"] ):
            return annotation
        else:
            indices = [i for i in find_all(word, design)]
            for start in indices:
                end = start+len(word)
                if len(nlp_word) == 3:
                    compound_counter = nlp_word[2]
                    in_annotation = False
                    for i in annotation:
                        if (i[0],i[1]) == (start,end):
                            in_annotation =  True
                            if compound_counter > i[3]:
                                i[2] = label
                                i[3] = compound_counter
                    if not(in_annotation):
                        annotation.append([start,end,label,compound_counter])                   
                else:
                    annotation.append([start,end, label,compound_counter])
    return annotation

def get_coordinates_split_expression(sen_dict,matches_obj, design,label,annotation):
    """
    Given a potential entity, consisting of >1 words, locates the original coordinates of the full phrase in the original sentence
    
    Parameters
    ----------

    sen_dict: dict
        The dictionary which matches nlp-analyzed words to their original form
    
    matches_obj: str
        Potential entity which was detected in the nlp-analyzed sentence

    design: str
        The original sentence

    label: str
        The label, e.g. "PERSON", "ANIMAL", ...
    
    annotation: list 
        A list consisting of the annotations for this sentence for this label so far 

    """
    orig_word = ""
    all_words = matches_obj.split(" ")
    start_word = sen_dict[all_words[0]][0]
    start_pos, start_word = start_word[0], start_word[1]
    orig_word += start_word + " "
    for word in all_words[1:]:
        for nlp_word in sen_dict[word]:    
            pos, word = nlp_word[0], nlp_word[1]
            backup_orig_word = orig_word
            orig_word = orig_word + word + " "
            indices = [i for i in find_all(orig_word[:-1], design)]
            if indices != []:
                for index in indices:
                    start = index
                    end = start + len(orig_word[:-1])
                    annotation.append([start, end, label,0])
            else: 
                orig_word = backup_orig_word
    return annotation


def annotate_dict(design, sen_dict, alt_sen, label, processed_entities,lang, mode):
    """
    Given the entities and nlp-analyzed wordforms, annotates the sentence
    
    Parameters
    ----------

    design: str
        The sentence to be annotated.
        
    label: str
        label of entity category
    
    sen_dict: dict
        The dictionary which matches nlp-analyzed words to their original form
    
    alt_sen: str
        The sentence to be annotated in nlp-analyzed form

    processed_entities: list
        List of entities belonging to the label
    
    lang: str
        either "de" or "en"; marks lanugage of design
    """

    if alt_sen != " ":
        annotation = [] 
        processed_entities.sort(reverse=True) 
        regex = r'\b' + '(' + "|".join(processed_entities) + ')' + r'\b'
        occurences = re.findall(regex, alt_sen)
        for matches_obj in occurences:
            if type(matches_obj) != str: 
                matches_obj = matches_obj[0]
            try:
                if matches_obj in sen_dict:
                    annotation = get_coordinates(sen_dict,matches_obj, design,label,annotation)
                    annotation = get_coordinates_split_expression(sen_dict, matches_obj, design,label, annotation)
            except:
                pass      
        annotated_sentence = []
        for i in annotation:
             annotated_sentence.append(tuple(i))
        annotated_sentence = set(annotated_sentence)
    return annotated_sentence

def annotate_regex(sentence, label, entities):
    """
    Given the entities, annotate a sentence with a label.
    
    Adapted from Deligio und Gencer, 2021.
    
    Parameters
    ----------

    sentence: str
        The sentence to be annotated.
        
    label: str
        The label, e.g. "PERSON", "ANIMAL", ...
        
    entities: list
        List of entities belonging to the label.
        E.g. ["Aphrodite", "Apollo", ...]
    """
    regex = r'\b' + '(' + "|".join(entities) + ')' + r'\b'
    occurences = re.finditer(regex, sentence)
    annotation = [(match.start(), match.end(), label, 0) for match in occurences]
    return annotation


def annotate_single_design(entities, design, lang, mode, orig_entities):
    """
    Takes entites, the sentence, and NLP-Method and returns an annotated sentence
    
    Adapted from Deligio und Gencer, 2021
    
    Parameters
    ----------

    entities: dict
        Dictionary whose keys are the labels and whose values
        are the corresponding lists of entities and their nlp-analyzed forms

    design: str
        The sentence
    
    lang: str
        Language of the Sentence

    mode: str
        The NLP-Method (stem, lemma, lemma_stem)

    orig_entities: dict
        Dictionary whose keys are the labels and whose values
        are the corresponding lists of entities without their nlp-analyzed forms

    """

    annotations = []
    annotations_lemma = []
    annotations_stem = []
    
    #Annotation without NLP-Methods
    for orig_label, orig_entities in orig_entities.items():
        annotations += annotate_regex(design, orig_label, orig_entities)
    annotations = sorted(list(annotations), key = lambda x : x[0])
    
    #Annotation with NLP-Methods
    if mode == "lemma_stem":
        sen_dict_lemma, alt_sen_lemma = get_sentence_dict(design, lang,"lemma")
        sen_dict_stem, alt_sen_stem = get_sentence_dict(design, lang,"stem")
        for label, entities in entities.items():
            annotations_lemma += annotate_dict(design, sen_dict_lemma, alt_sen_lemma, label, entities, lang, "lemma")
            annotations_stem += annotate_dict(design, sen_dict_stem, alt_sen_stem, label, entities, lang, "stem")
        annotations += list(set(annotations_lemma + annotations_stem))
    else:
        sen_dict, alt_sen = get_sentence_dict(design, lang,mode)
        for label, entities in entities.items():
            annotations += annotate_dict(design, sen_dict, alt_sen, label, entities, lang, mode)

    annotations = sorted(list(annotations), key = lambda x : x[0])
    annotations = nlp_find_max_entity(annotations)
    return annotations

def nlp_annotate_designs_german(entities, designs, lang, mode):
    """
    Given the entities, annotate a list of design.
    
    Adapted from Deligio und Gencer, 2021

    Parameters
    ----------

    entities: dict
        Dictionary whose keys are the labels and whose values
        are the corresponding lists of entities.

    design: list
        List of sentences.
    """
    original_entities = cp.deepcopy(entities)
    if mode != "lemma_stem":
        processed_entities = nlp_analyse_entities(entities,mode=mode, lang = lang)
    else:
        processed_entities = merge_dictionaries(nlp_analyse_entities(entities,mode="lemma", lang = lang),
                                                nlp_analyse_entities(entities,mode="stem", lang = lang))
    annotated_designs = pd.DataFrame({
        design_col: designs[design_col],
        id_col: designs[id_col],
        "annotations": list(map(lambda x: annotate_single_design(processed_entities, design=x,lang=lang, 
                                            mode=mode, orig_entities=original_entities), designs["Design"]))
        })
    return annotated_designs

def nlp_annotate_designs(entities, designs, lang, mode, id_col, design_col):
    """
    Given the entities, annotate a list of design.
    
    Adapted from Deligio und Gencer, 2021

    Parameters
    ----------

    entities: dict
        Dictionary whose keys are the labels and whose values
        are the corresponding lists of entities.

    design: list
        List of sentences.
    """
    original_entities = cp.deepcopy(entities)
    if mode != "lemma_stem":
        processed_entities = nlp_analyse_entities(entities,mode=mode, lang = lang)
    else:
        processed_entities = merge_dictionaries(nlp_analyse_entities(entities,mode="lemma", lang = lang),
                                                nlp_analyse_entities(entities,mode="stem", lang = lang))
    annotated_designs = pd.DataFrame({
        design_col: designs[design_col],
        id_col: designs[id_col],
        "annotations": list(map(lambda x: annotate_single_design(processed_entities, design=x, 
                                lang=lang, mode=mode, orig_entities=original_entities), designs[design_col]))
        })
    return annotated_designs

def check_sentence(num, mode, dc, id_col, design_col):
    """Annotates a single sentence of the german coin descriptions

    Args:
        num (int): ID of coin descriptions
        mode (str): either "lemma" or "stem" or "lemma_stem"
    """
    mysql_connection = "mysql+mysqlconnector://root:YourConnection" # Format user:password@IP/Database
    german_designs =  dc.load_designs_from_db("designs", [id_col, design_col])
    entities_german = {
    "PERSON": dc.load_entities_from_db("nlp_list_person", ["name", "alternativenames"], ["alternativenames"], ",", True),
    "OBJECT": dc.load_entities_from_db("nlp_list_obj_ger", ["name", "alternativenames"], ["alternativenames"], ",", True),
    "ANIMAL": dc.load_entities_from_db("nlp_list_animal_ger", ["name", "alternativenames"], ["alternativenames"], ",", True),
    "PLANT": dc.load_entities_from_db("nlp_list_plant_ger", ["name", "alternativenames"], ["alternativenames"], ",", True),
    "VERBS": dc.load_entities_from_db("nlp_list_verb_ger", ["name", "alternativenames"], ["alternativenames"], ",", True)
    }
    annotated_designs_german = nlp_annotate_designs_german(entities_german, german_designs.loc[german_designs["DesignID"] == num], lang="de", mode=mode)
    s = annotated_designs_german.loc[annotated_designs_german["DesignID"] == num, "Design"]
    a = annotated_designs_german.loc[annotated_designs_german["DesignID"] == num,"annotations"]
    print(s,a)



def check_sentence_eng(num, mode):
    """Annotates a single sentence of the english coin descriptions

    Args:
        num (int): ID of coin descriptions
        mode (str): either "lemma" or "stem" or "lemma_stem"
    """
    mysql_connection = "mysql+mysqlconnector://root:YourConnection" # Format user:password@IP/Database
    english_designs = load_designs(mysql_connection)
    entities_english = {
    "PERSON": load_entities_from_db("nlp_list_person_ger_both", mysql_connection),
    "OBJECT": load_entities_from_db("nlp_list_obj_manual", mysql_connection),
    "ANIMAL": load_entities_from_db("nlp_list_animal_manual", mysql_connection),
    "PLANT": load_entities_from_db("nlp_list_plant_manual", mysql_connection),
    "VERBS": load_entities_from_db("nlp_list_verb_manual", mysql_connection)}
    annotated_designs_english = nlp_annotate_designs(entities_english, english_designs.loc[english_designs["DesignID"] == num], lang="en", mode=mode)
    s = annotated_designs_english.loc[annotated_designs_english["DesignID"] == num, "DesignEng"]
    a = annotated_designs_english.loc[annotated_designs_english["DesignID"] == num,"annotations"]
    print(s,a)


