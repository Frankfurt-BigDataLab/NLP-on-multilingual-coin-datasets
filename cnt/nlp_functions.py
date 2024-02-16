#!/usr/bin/env python3
"""
This package contains the implementations discussed in the bachelor thesis 
"Optimierung beim Annotieren mehrsprachiger Münzdatensätze im Kontext des Natural Language Processing"
All code in this package has been developed by Katrin Peikert.
"""

import sys
sys.path.append('../')
from re import split
import spacy
from spacy.tokenizer import Tokenizer
from compound_split import char_split
import nltk
from nltk.stem.cistem import Cistem
from nltk.stem import SnowballStemmer
import pandas as pd
import regex as re
import numpy as np
from HanTa import HanoverTagger as ht
from nltk.stem import WordNetLemmatizer
import krovetzstemmer as krot
import Stemmer 

# Initialize Wordnet & HanTa
#nltk.download("point")
nltk.download('wordnet')
tagger = ht.HanoverTagger('morphmodel_ger.pgz')

# Initialize Spacy & Cistem & Snowball (English)
GER_NLP = spacy.load("de_core_news_sm")
ger_tokenizer = Tokenizer(GER_NLP.vocab)
GER_STEMMER = SnowballStemmer("german")#Cistem()


ENG_NLP = spacy.load("en_core_web_sm")
eng_tokenizer = Tokenizer(ENG_NLP.vocab)
ENG_STEMMER = SnowballStemmer("english")

def german_tokenizer_spacy(sentence):
    return GER_NLP(sentence)

def english_tokenizer_spacy(sentence):
    return ENG_NLP(sentence)

def german_lemma_spacy(word):
    """Lemmatizer of german using SpaCy

    Args:
        word (str): a word or sentence to be lemmatized

    Returns:
        lemma (str): lemmatized word or sentence
    """
    lemmatized = ""
    for i in word.split(" "):
        if len(i) > 0:
            lemmatized += GER_NLP(i)[0].lemma_ + " "
    return lemmatized

def english_lemma_spacy(word):
    """Lemmatizer of English using SpaCy

    Args:
        word (str): a word or sentence to be lemmatized

    Returns:
        lemma (str): lemmatized word or sentence
    """
    lemmatized = ""
    for i in word.split(" "):
        if len(i) > 0:
            lemmatized += ENG_NLP(i)[0].lemma_ + " "
    return lemmatized

def german_stem_cistem(word):
    """Stemmer of German using Cistem

    Args:
        word (str): a word or sentence to be lemmatized

    Returns:
        lemma (str): lemmatized word or sentence
    """
    stemmer = Cistem()
    stemmed = ""
    for i in word.split(" "):
        if len(i) > 0:
            stemmed += (stemmer.stem(i)) + " "
    return stemmed

def english_stem_snowball(word):
    """Stemmer of English using Snowball

    Args:
        word (str): a word or sentence to be lemmatized

    Returns:
        lemma (str): lemmatized word or sentence
    """
    stemmer = SnowballStemmer("english")
    stemmed = ""
    for i in word.split(" "):
        if len(i) > 0:
            stemmed += (stemmer.stem(i)) + " "
    return stemmed

##
def english_lemma_WordNet(word):
    """lemmatizer of English using Wordnet

    Args:
        word (str): a word or sentence to be lemmatized

    Returns:
        lemma (str): lemmatized word or sentence
    """
    lemmatizer = WordNetLemmatizer()
    lemma = ""
    for i in word.split(" "):
        lemma += lemmatizer.lemmatize(i) +" "
    return lemma

def german_lemma_HanTa(word):
    """Lemmatizer german using HannoverTagger

    Args:
        word (str): a word or sentence to be lemmatized

    Returns:
        lemma (str): lemmatized word or sentence
    """
    sentences = nltk.sent_tokenize(word,language='german')
    tokenized_text = [nltk.word_tokenize(sent, language='german') for sent in sentences]
    tags = [tagger.tag_sent(word) for word in tokenized_text]
    lemma = ""
    try:
        for i in tags[0]:
            lemma += i[1] +" "
    except:
        print("word", word, "tags", tags)
    return lemma
    
def german_stem_pystem(word):
    """Stemmer of German using Pystem(Snowball)

    Args:
        word (str): a word or sentence to be lemmatized

    Returns:
        lemma (str): lemmatized word or sentence
    """
    stemmer = Stemmer.Stemmer('german')
    stemmed = ""
    for i in word.split(" "):
        if len(i) > 0:
            stemmed += stemmer.stemWord(i) + " "
    return stemmed

def english_stem_krovetz(word):
    """Stemmer of German using Krovetz-Stemmer

    Args:
        word (str): a word or sentence to be lemmatized

    Returns:
        lemma (str): lemmatized word or sentence
    """
    stemmer = krot.Stemmer()
    stemmed = ""
    for i in word.split(" "):
        if len(i) > 0:
            stemmed += stemmer.stem(i) + " "
    return stemmed 



def get_most_likely_comp(word):
    """Splits a word, when it is very likely that it can be splitted

    Parameters:
    ---------
        word (str): The word/words to be analyzed]

    Returns:
    --------
        splitted_w tuple(str) : The split word 
    """
    splitted_w = char_split.split_compound(word)[0]
    if splitted_w[0] > 0.99:
        return splitted_w[1:]
    else:
        return None

def get_lemma_word(word, lang):
    """Extracts lemma of word in given lang

    Parameters:
    ---------
        word (str): The word/words to be analyzed
        lang (str): language of the word (either de or en)

    Returns:
    --------
        [str] : Lemmatized version of the word/words
    """
    
    lemmatized = ""
    if word == "":
        return ""
    if lang == "de":
        lemmatized = german_lemma_spacy(word)
    elif lang == "en":
        lemmatized = english_lemma_spacy(word)
    else:
        print("lang is either de or en.")

    return lemmatized[:-1]

def get_stem_word(word, lang):
    """Extracts stem of a word or several words(e.g. "agnostische Krone")

    Parameters:
    --------
        word (str): 
            The word to be analyzed
        lang (str): 
            language of the word (either de or en)

    Returns:
    --------
        [str]: Stemmed version od the word/words
    """
    if word == "":
        return ""
    stemmed = ""
    if lang == "de":
        stemmed = german_stem_cistem(word)
    elif lang == "en":
        stemmed = english_stem_snowball(word)
    else:
        print("lang is either de or en.")
    return stemmed[:-1]

def tokenize_sentence(sentence, lang="de"):
    """
    Given a string, tokenizes it with Spacy

    Parameters:
    --------
        word (str): 
            The word to be analyzed
        lang (str): 
            language of the word (either de or en)

    Returns:
    --------
        tok (str): Tokenized Sentence
    """
    if lang == "de":
        tok = german_tokenizer_spacy(sentence)
    elif lang == "en":
        tok = english_tokenizer_spacy(sentence)
    return tok


def get_word_position(sentence, word):
    """Given a word and a sentence, calculates the exact position of the word in the sentence

    Parameters:
    --------
        word (str): 
            The word to be found
        sentence (str):
            The sentence in which the word can be found

    Returns:
    --------
        int, int : Coordinates of the word
    """
    start_index = sentence.find(word)
    end_index = start_index + len(word)
    return start_index, end_index

def nlp_find_max_entity(mylist):
    """
    Given a list of annotations, removes overlapping annotations

    Parameters:
    --------
        mylist: [(int,int, str, int)]

    Returns:
    --------
        [(int,int,str)] 
    """
    if len(mylist) == 0:
        return []
    sorted_list = sorted(list(set(mylist)),key = lambda x : (x[0],x[1]))
    sorted_list = sorted(sorted_list, key = lambda x : (x[3]), reverse=True)
    result_list = []
    for i in range(0,len(sorted_list)):
        start, end, label, comp_counter = sorted_list[i]
        overlap = False
        for j in range(0, len(result_list)):
            start2, end2, label2, comp_counter2 = result_list[j]
            if start == start2 and end >= end2 and comp_counter >= comp_counter2:  
                result_list[j] = (start, end, label, comp_counter)
                overlap = True
                break
            elif start == start2 and end >= end2 and comp_counter < comp_counter2:
                overlap = True
                break
            elif start > start2 and end <= end2:
                # (0,5) vs. (2,5)
                overlap = True
                break
            elif start == start2 and end < end2:
                #(0,5) vs. (0,3)
                overlap = True
                break
        if not(overlap):
            result_list.append(sorted_list[i])
    for i in range(0,len(result_list)):
        result_list[i] = (result_list[i][0],result_list[i][1],result_list[i][2])

    return sorted(result_list,key = lambda x : (x[0],x[1]))

def clean_input(word):
    """
    Given a word, replaces non-alphabetic characters.
    
    Parameters
    ----------

    word: str
        The sentence to be annotated.
    """
    
    replace_no_space_symbols = ",;()."
    replace_empty_space= "_-"
    for sym in replace_no_space_symbols:
        word = word.replace(sym, "")
    for sym in replace_empty_space:
        word = word.replace(sym, " ")
    return word


def find_all(p, s):
    '''Yields all the positions of
    the pattern p in the string s.
    
    Source: https://stackoverflow.com/a/34445090 (18.02.2022)
    '''
    i = s.find(p)
    while i != -1:
        yield i
        i = s.find(p, i+1)

