#!/usr/bin/env python3

"""
This package contains the implementations discussed in the bachelor thesis 
"Optimierung beim Annotieren mehrsprachiger Münzdatensätze im Kontext des Natural Language Processing"
All code in this package has been developed by Katrin Peikert.
"""

import sys
sys.path.append('../')
import pandas as pd
from itertools import groupby


def nlp_extract_string_from_annotation(annotations, design):
    """
    Given the annotations, extract the corresponding string
    from a sentence.

    Parameters
    -----------

    annotations: list of list of triples
        E.g. y = [[(0, 5, "PERSON"), (10, 15, "OBJECT")], ...]

    design: str
        The input sentence.
    """
    list_of_strings = []
    for (start, stop, label) in annotations:
        list_of_strings.append((design[start:stop], label))
    return list_of_strings

def df_to_set(df_col):
    """
    Transforms a panda dataframe-column into a set
    
        Parameters
    ----------
        df_col (list of lists of tuples): [[('Amphora', 'OBJECT'), ('Ähren', 'PLANT')], [('Apis', 'PERSON'), ('stehend', 'VERBS'), ('Kopf', 'OBJECT')]]
        
    """
    output = set([i for j in df_col for i in j])
    return output

def transform_scores_from_dataframe(df, unique = True):
    """
    Given a dataframe of german annotations, extracts all annotations in each row and returns the annotations as a set
    
    Parameters
    ----------
        df : panda dataframe
    
    """

    df["annotations_old_named"] = df.apply(lambda row : nlp_extract_string_from_annotation(row["annotations_old"], row["Design_old"]),axis=1)
    df["annotations_new_named"] = df.apply(lambda row : nlp_extract_string_from_annotation(row["annotations_new"], row["Design_old"]),axis=1)
    if unique:
        gold_annotation = df_to_set(list(df["annotations_old_named"]))
        test_annotation = df_to_set(list(df["annotations_new_named"]))
    else:
        gold_annotation = [i for j in df["annotations_old_named"] for i in j]
        test_annotation = [i for j in df["annotations_new_named"] for i in j]
    return test_annotation, gold_annotation

def transform_scores_from_dataframe_eng(df, unique = True):
    """
    Given a dataframe of german annotations, extracts all annotations in each row and returns the annotations as a set
    
    Parameters
    ----------
        df : panda dataframe
    
    """
 
    df["annotations_old_named"] = df.apply(lambda row : nlp_extract_string_from_annotation(row["annotations_old"], row["DesignEng_old"]),axis=1)
    df["annotations_new_named"] = df.apply(lambda row : nlp_extract_string_from_annotation(row["annotations_new"], row["DesignEng_old"]),axis=1)
    if unique:
        gold_annotation = df_to_set(list(df["annotations_old_named"])) 
        test_annotation = df_to_set(list(df["annotations_new_named"]))
    else:
        gold_annotation = [i for j in df["annotations_old_named"] for i in j]
        test_annotation = [i for j in df["annotations_new_named"] for i in j]
    return test_annotation, gold_annotation

def recall(test_scores, gold_scores):
    """
    Calculates Recall between test scores and the old annotations

    Parameters
    ----------
        test_scores ([tuples]): list of annotations
        gold_scores ([tuples]): list of annotations
    """
    intersection = [word for word in test_scores if word in gold_scores]
    return len(intersection) / len(gold_scores)
    
def precision(test_scores, gold_scores):
    """
    Calculates Precision between test scores and the old annotations

    Parameters
    ----------
        test_scores ([tuples]): list of annotations
        gold_scores ([tuples]): list of annotations
    """
    intersection = [word for word in test_scores if word in gold_scores]
    return len(intersection) / len(test_scores)

def fscore(test_scores, gold_scores):
    """
    Calculates F-Score between test scores and the old annotations

    Parameters
    ----------
        test_scores ([tuples]): list of annotations
        gold_scores ([tuples]): list of annotations
    """
    r = recall(test_scores, gold_scores)
    p = precision(test_scores,gold_scores)
    return 2 * (r*p)/(r+p)
    
def get_all_scores(test_scores, gold_scores):
    """ Function that calculates recall, precision, f-score for the whole lists, ands splits up the result by entity

    Parameters
    ----------
        test_scores ([tuples]): list of annotations
        gold_scores ([tuples]): list of annotations
    """
    r_all = recall(test_scores, gold_scores)
    p_all = precision(test_scores, gold_scores)
    f_all = fscore(test_scores, gold_scores)
    
    test_splitted_entities = {"PERSON": [], "OBJECT":[], "VERBS":[], "PLANT":[], "ANIMAL":[]}
    gold_splitted_entities = {"PERSON": [], "OBJECT":[], "VERBS":[], "PLANT":[], "ANIMAL":[]}
    for i in test_scores:
        try:
            test_splitted_entities[i[1]].append(i)
        except:
            print(i)

    for i in gold_scores:
        gold_splitted_entities[i[1]].append(i)
    
    val = []
    val.append(["TOTAL", r_all, p_all, f_all])
    
    for key in test_splitted_entities:
        r = recall(set(test_splitted_entities[key]), set(gold_splitted_entities[key]))
        p = precision(set(test_splitted_entities[key]), set(gold_splitted_entities[key]))
        f =  fscore(set(test_splitted_entities[key]), set(gold_splitted_entities[key]))
        val.append([key,r,p,f])
    x = pd.DataFrame(val, columns=["TYPE", "RECALL", "PRECISION", "F_SCORE"])
    return x

def group_annotations(annotations, annotation_name):
    res = dict()
    amounts=[annotation_name]
    for key, val in groupby(sorted(list(annotations), key = lambda ele: ele[1]), key = lambda ele: ele[1]):
        res[key] = [ele[0] for ele in val] 
    labels = ["ANIMAL", "OBJECT", "PERSON", "PLANT", "VERBS"]
    for label in labels:
        if label in res.keys():
            amounts.append(len(res[label]))
        else:
            amounts.append(0)
    #print(i, len(all_res[i]), "\n\n")
    return res, amounts