"""
This package contains the implementations discussed in the bachelor thesis 
"Natural Language Processing to enable semantic search on numismatic descriptions".
All code in the cnt package has been developed by Patricia Klinger.
The Code has been modified by Kerim Gencer and Chrisowalandis Deligio, discussed in the master thesis
"Natural Language Processing auf mehrsprachigen Münzdatensätzen - Untersuchung der Qualität, Datenqualität und Übertragbarkeit auf andere Datensätze".

"""

import re
import pandas as pd
import numpy as np

def annotate(sentence, label, entities):
    """
    Given the entities, annotate a sentence with a label.
    
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
    annotation = [(match.start(), match.end(), label) for match in occurences]
    return annotation


def annotate_single_design(entities, design):
    """
    Given the entities, annotate a concrete design.
    
    Parameters
    ----------

    entities: dict
        Dictionary whose keys are the labels and whose values
        are the corresponding lists of entities.

    design: str
        The input sentence.
    """
    annotations = []
    for label, entities in entities.items():
        annotations += annotate(design, label, entities)
    annotations = sorted(annotations, key = lambda x : x[0])
   # UM Problem [(0, 11, 'OBJECT'), (0, 4, 'PLANT')] übertraining auf teilworte
    annotations = find_max_entity(annotations)
    return annotations


def annotate_designs(entities, designs, id_col, design_col):
    """
    Given the entities, annotate a list of design.
    
    Parameters
    ----------

    entities: dict
        Dictionary whose keys are the labels and whose values
        are the corresponding lists of entities.

    design: list
        List of sentences.
    """

    annotated_designs = pd.DataFrame({
        design_col: designs[design_col],
        id_col: designs[id_col],
        "annotations": list(map(lambda x: 
        annotate_single_design(entities, x), designs[design_col]))})
    return annotated_designs

def extract_string_from_annotation(annotations, design):
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
        list_of_strings.append(design[start:stop])
    return list_of_strings


def labeling_eng(d, entities):
    """
    labels the RE Ground Truth
    :param d: dictionary
    :return: labeld dictionary
    """

    X_list = []
    y_list = []  # for each design a list of (subj, relation_class_label, obj)
    for sentence, relations in d.items():
        X_list.append(sentence)
        list_of_annotations = []
        y_list.append(list_of_annotations)
        for rel in relations:
            if rel[1] != "":
                label_rel0 = find_label(rel[0], entities)
                label_rel2 = find_label(rel[2], entities)
                if (label_rel0 == "None") or (label_rel2 == "None"):
                    pass
                else:
                    list_of_annotations.append((rel[0], label_rel0, rel[1], rel[2], label_rel2))

    return X_list, y_list

def labeling_single_entity(d, entities):
    """
    labels the extension RE Ground Truth
    :param d: dictionary
    :return: labeld dictionary
    """
    X_list = []
    y_list = []  # for each design a list of (subj, relation_class_label, obj)
    for sentence, relations in d.items():
        X_list.append(sentence)
        list_of_annotations = []
        y_list.append(list_of_annotations)
        for rel in relations:
            if rel[1] != "":
                label_rel0 = find_label(rel[0], entities)
                if (label_rel0 == "None"):
                    pass
                else:
                    list_of_annotations.append((rel[0], label_rel0, rel[1], rel[2]))

    return X_list, y_list
    
def labeling_ger(d, entities):
    """
    labels the german RE Ground Truth
    :param d: dictionary
    :return: labeld dictionary
    """
    X_list = []
    y_list = []  # for each design a list of (subj, relation_class_label, obj)
    for sentence, relations in d.items():
        X_list.append(sentence)
        list_of_annotations = []
        y_list.append(list_of_annotations)
        for rel in relations:
            if rel[1] != "":
                label_rel0 = find_label(rel[0], entities)
                label_rel2 = find_label(rel[2], entities)

                if (label_rel0 == "None") or (label_rel2 == "None"):
                    pass

                elif label_rel0 == 'ANIMAL' and label_rel2 == 'PERSON':
                    pass
                elif label_rel0 == 'ANIMAL' and label_rel2 == 'PLANT':
                    pass
                elif label_rel0 == 'ANIMAL' and label_rel2 == 'OBJECT':
                    pass
                elif label_rel0 == 'OBJECT' and label_rel2 == 'OBJECT':
                    pass
                elif label_rel0 == 'OBJECT' and label_rel2 == 'PLANT':
                    pass
                else:
                    list_of_annotations.append((rel[0], label_rel0, rel[1], rel[2], label_rel2))

    return X_list, y_list

def find_label(to_label, entities):

    for i in entities:
        if to_label in entities[i]:
            return i
    return "None"

def get_max_overlap(my_list):
    max_len = 0
    max_entity = None

    for i in my_list:
        temp_len = i[1] - i[0]

        if temp_len > max_len:
            max_len = temp_len
            max_entity = i

    return max_entity

def find_max_entity(my_list):
    """
    Builds a list of non overlapping entities
    :param my_list:
    :return:
    """
    if len(my_list) == 0:
        return []
    else:
        list_without_overlaps = []
        list_with_overlaps = []
        increment = None
        for i in range(0, len(my_list)):
            overlap = False
            start, end, entity = my_list[i]
            if increment and i < increment:
                continue
            for j in range(i, len(my_list)):
                if i == j:
                    continue
                jstart, jend, jentity = my_list[j]
                if (start >= jstart and start <= jend) or (end >= jstart and end <= jend):
                        overlap = True
                        list_with_overlaps.append((start, end, entity))
                        list_with_overlaps.append((jstart, jend, jentity))
                        increment = j+1
            if not overlap:
                list_without_overlaps.append((start, end, entity))
            else:
                list_without_overlaps.append(get_max_overlap(list_with_overlaps))
    return list_without_overlaps

def map_find_max_entity(my_list):
    return tuple(map(find_max_entity, my_list))




def split_alternativenames(dataframe):
    links = {}
    for index, row in dataframe.iterrows():
        if row.alternativenames ==" ":
            continue
        names = row.alternativenames.split(",")
        for name in names:
            links[name] = row.link
    dataframe.drop("alternativenames", inplace=True, axis=1)
    new_df = pd.DataFrame.from_dict(links, orient="index", columns=["link"])
    new_df["name"] = new_df.index
    result = dataframe.append(new_df)
    result.reset_index(inplace=True, drop=True)
    return result
