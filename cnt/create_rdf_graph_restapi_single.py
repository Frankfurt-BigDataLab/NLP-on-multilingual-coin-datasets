"""
This code contains the implementation discussed in the bachelor thesis 
"Optimizing a Natural Language Processing Pipeline for the automatic creation of RDF data".
All code in the cnt package has been developed by Patricia Klinger and was
modified by Nils Dambowy and Sebastian Gampe.

"""

from rdflib import Graph, URIRef, Literal, BNode
from rdflib.namespace._XSD import XSD
from cnt.model import DesignEstimator
import mysql.connector
import pandas as pd

prefix_dict = { 
                "meta"    : "http://www4.wiwiss.fu-berlin.de/bizer/d2r-server/metadata#", 
                "map"     : "#",
                "db"      : "<>",
                "rdf"     : "http://www.w3.org/1999/02/22-rdf-syntax-ns#",
                "rdfs"    : "http://www.w3.org/2000/01/rdf-schema#",
                "xsd"     : "http://www.w3.org/2001/XMLSchema#",
                "d2rq"    : "http://www.wiwiss.fu-berlin.de/suhl/bizer/D2RQ/0.1#",
                "d2r"     : "http://sites.wiwiss.fu-berlin.de/suhl/bizer/d2r-server/config.rdf#",
                "jdbc"    : "http://d2rq.org/terms/jdbc/",
                "skos"    : "http://www.w3.org/2004/02/skos/core#",
                "owl"     : "http://www.w3.org/2002/07/owl#",
                "foaf"    : "http://xmlns.com/foaf/0.1/",
                "un"      : "http://www.w3.org/2005/Incubator/urw3/XGR-urw3-20080331/Uncertainty.owl",
                "dcterms" : "http://purl.org/dc/terms/",
                "void"    : "http://rdfs.org/ns/void#/",
                "nm"      : "http://nomisma.org/id/",
                "nmo"     : "http://nomisma.org/ontology#",
                "cnt"     : "http://www.dbis.cs.uni-frankfurt.de/cnt/id/",
                "cn"      : "https://www.corpus-nummorum.eu/"
            }

def get_db_data(mysql_connection):
    # Persons
    persons = pd.read_sql("select * from nlp_list_person",mysql_connection)
    persons_view = pd.read_sql("select * from nlp_list_person_view",mysql_connection)
    # Objects
    objects = pd.read_sql("select * from nlp_list_obj",mysql_connection)
    objects_view = pd.read_sql("select * from nlp_list_obj_view",mysql_connection)
    # Animals
    animals = pd.read_sql("select * from nlp_list_animal",mysql_connection)
    animals_view = pd.read_sql("select * from nlp_list_animal_view",mysql_connection)
    # Plants
    plants = pd.read_sql("select * from nlp_list_plant",mysql_connection)
    plants_view = pd.read_sql("select * from nlp_list_plant_view",mysql_connection)
    # Verbs
    verbs = pd.read_sql("select * from nlp_list_verb",mysql_connection)
    # Hierarchy
    hierarchy = pd.read_sql("select * from nlp_hierarchy",mysql_connection)
    return persons, persons_view, objects, objects_view, animals, animals_view, plants, plants_view, verbs, hierarchy
	
def get_csv_data(csv_path, none_value):
    # persons
    columns_1 = ['id', 'name', 'name_german', 'description', 'alternativenames', 'typos', 'link', 'related', 'cnt_PersonID', \
          'Cat_I', 'Cat_II', 'Cat_III', 'Cat_IV', 'Cat_V']
    # objects, plants, animals
    columns_2 = ['id', 'name_en', 'name_ger', 'description', 'alternativenames_en', 'alternativenames_ger', 'typos_en', \
        'typos_ger', 'link', 'Cat_I', 'Cat_II', 'Cat_III']
    # verbs
    columns_3 = ['id', 'name_en', 'name_ger', 'alternativenames_en', 'alternativenames_ger', 'link']
    # views
    columns_4 = ['value', 'link']
    # hierarchy
    columns_5 = ['class', 'superclass', 'class_uri', 'superclass_uri']

    # Load the csvs into dataframes
    # Persons
    persons = pd.read_csv(csv_path + "nlp_list_person.csv", header=None, names=columns_1, \
                      na_values=[none_value], keep_default_na=False)
    persons.fillna('None', inplace=True)
    persons_view = pd.read_csv(csv_path + "nlp_list_person_view.csv", header=None, names=columns_4, \
                      na_values=[none_value], keep_default_na=False)
    # Objects
    objects = pd.read_csv(csv_path + "nlp_list_obj.csv", header=None, names=columns_2, \
                      na_values=[none_value], keep_default_na=False)
    objects.fillna('None', inplace=True)
    objects_view = pd.read_csv(csv_path + "nlp_list_obj_view.csv", header=None, names=columns_4, \
                      na_values=[none_value], keep_default_na=False)
    # Animals
    animals = pd.read_csv(csv_path + "nlp_list_animal.csv", header=None, names=columns_2, \
                      na_values=[none_value], keep_default_na=False)
    animals.fillna('None', inplace=True)
    animals_view = pd.read_csv(csv_path + "nlp_list_animal_view.csv", header=None, names=columns_4, \
                      na_values=[none_value], keep_default_na=False)
    # Plants
    plants = pd.read_csv(csv_path + "nlp_list_plant.csv", header=None, names=columns_2, \
                      na_values=[none_value], keep_default_na=False)
    plants.fillna('None', inplace=True)
    plants_view = pd.read_csv(csv_path + "nlp_list_plant_view.csv", header=None, names=columns_4, \
                      na_values=[none_value], keep_default_na=False)
    # Verbs
    verbs = pd.read_csv(csv_path + "nlp_list_verb.csv", header=None, names=columns_3, \
                      na_values=[none_value], keep_default_na=False)
    verbs.fillna('None', inplace=True)
    #hierarchy
    hierarchy = pd.read_csv(csv_path + "nlp_hierarchy.csv", header=None, names=columns_5, \
                      na_values=[none_value], keep_default_na=False)
    hierarchy.fillna('None', inplace=True)
    return persons, persons_view, objects, objects_view, animals, animals_view, plants, plants_view, verbs, hierarchy


def ner_uri(df, persons, persons_view, objects, objects_view, animals, animals_view, plants, plants_view):
# match the found ner entities with the matching uris from the lists 
    entity_not_in_list = ()
    for side in ['NER_Entities']:
        entity_list = []
        for entity in df.at[0, side]:
            cat_list = [] 
            df_categories = pd.DataFrame()
            entity_id = 0
            if entity[1] == 'PERSON':
                df_link = pd.DataFrame(persons_view.loc[persons_view['value'] == entity[0]]['link'])
                if  df_link.empty == True:
                # check if there is a problem with case sensitivity
                    df_link = pd.DataFrame(persons_view.loc[persons_view['value'].str.lower() == entity[0].lower()]['link'])
                    if  df_link.empty == True:
                        entity_not_in_list = (df.at[0, 'design_id'], entity[0], entity[1])
                    # create fake uri for entities which are not in the lists
                        #df_link.at[0, 'value'] = entity[0]
                        #df_link.at[0, 'link'] = 'http://www.dbis.cs.uni-frankfurt.de/cnt/id/' + entity[0].replace(" ", "_") + '_' + entity[1].lower()
                        #entity = (df_link.iloc[0]["link"], entity[0], entity[1], '0', 'None', 'None', 'None', \
                        #    'None', 'None',)
                        #entity_list.append(entity)
                        continue
                df_categories = pd.DataFrame(persons[persons['link'] == df_link.iloc[0]["link"]])
                entity_id = df_categories.iloc[0]["id"]
                cat_list = [df_categories.iloc[0]["Cat_I"], df_categories.iloc[0]["Cat_II"], \
                        df_categories.iloc[0]["Cat_III"], df_categories.iloc[0]["Cat_IV"], df_categories.iloc[0]["Cat_V"]]
                entity = (df_link.iloc[0]["link"], entity[0], entity[1], entity_id, cat_list[0], cat_list[1], cat_list[2], \
                      cat_list[3], cat_list[4],)
                entity_list.append(entity)

            if entity[1] == 'OBJECT':
                df_link = pd.DataFrame(objects_view.loc[objects_view['value'] == entity[0].lower()]['link'])
                if  df_link.empty == True:
                    df_link = pd.DataFrame(objects_view.loc[objects_view['value'].str.lower() == entity[0].lower()]['link'])
                    if  df_link.empty == True:
                        entity_not_in_list = (df.at[0, 'design_id'], entity[0], entity[1])
                        #df_link.at[0, 'value'] = entity[0]
                        #df_link.at[0, 'link'] = 'http://www.dbis.cs.uni-frankfurt.de/cnt/id/' + entity[0].replace(" ", "_") + '_' + entity[1].lower()
                        #entity = (df_link.iloc[0]["link"], entity[0], entity[1], '0', 'None', 'None', 'None')
                        #entity_list.append(entity)
                        continue					
                df_categories = pd.DataFrame(objects[objects['link'] == df_link.iloc[0]["link"]])
                entity_id = df_categories.iloc[0]["id"]
                cat_list = [df_categories.iloc[0]["Cat_I"], df_categories.iloc[0]["Cat_II"], df_categories.iloc[0]["Cat_III"]]
                entity = (df_link.iloc[0]["link"], entity[0], entity[1], entity_id, cat_list[0], cat_list[1], cat_list[2])
                entity_list.append(entity)

            if entity[1] == 'PLANT':
                df_link = pd.DataFrame(plants_view.loc[plants_view['value'] == entity[0].lower()]['link'])
                if  df_link.empty == True:
                    df_link = pd.DataFrame(plants_view.loc[plants_view['value'].str.lower() == entity[0].lower()]['link'])
                    if  df_link.empty == True:
                        entity_not_in_list = (df.at[0, 'design_id'], entity[0], entity[1])
                        #df_link.at[0, 'value'] = entity[0]
                        #df_link.at[0, 'link'] = 'http://www.dbis.cs.uni-frankfurt.de/cnt/id/' + entity[0].replace(" ", "_") + '_' + entity[1].lower()
                        #entity = (df_link.iloc[0]["link"], entity[0], entity[1], '0', 'None', 'None')
                        #entity_list.append(entity)
                        continue								
                df_categories = pd.DataFrame(plants[plants['link'] == df_link.iloc[0]["link"]])
                entity_id = df_categories.iloc[0]["id"]
                cat_list = [df_categories.iloc[0]["Cat_I"], df_categories.iloc[0]["Cat_II"]]
                entity = (df_link.iloc[0]["link"], entity[0], entity[1], entity_id, cat_list[0], cat_list[1])
                entity_list.append(entity)

            if entity[1] == 'ANIMAL':
                df_link = pd.DataFrame(animals_view.loc[animals_view['value'] == entity[0].lower()]['link'])
                if  df_link.empty == True:
                    df_link = pd.DataFrame(animals_view.loc[animals_view['value'].str.lower() == entity[0].lower()]['link'])
                    if  df_link.empty == True:
                        entity_not_in_list = (df.at[0, 'design_id'], entity[0], entity[1])
                        #df_link.at[0, 'value'] = entity[0]
                        #df_link.at[0, 'link'] = 'http://www.dbis.cs.uni-frankfurt.de/cnt/id/' + entity[0].replace(" ", "_") + '_' + entity[1].lower()
                        #entity = (df_link.iloc[0]["link"], entity[0], entity[1], '0', 'None', 'None')
                        #entity_list.append(entity)
                        continue								
                df_categories = pd.DataFrame(animals[animals['link'] == df_link.iloc[0]["link"]])
                entity_id = df_categories.iloc[0]["id"]
                cat_list = [df_categories.iloc[0]["Cat_I"], df_categories.iloc[0]["Cat_II"]]
                entity = (df_link.iloc[0]["link"], entity[0], entity[1], entity_id, cat_list[0], cat_list[1])
                entity_list.append(entity)    

            else:
                continue
        df.at[0, side] = entity_list
        #print(df.at[0, side])
    return entity_not_in_list

def re_uri(df, persons, persons_view, objects, objects_view, animals, animals_view, plants, plants_view, verbs):
# match the found re entities and verbs with the matching uris from the lists 
    for side in ['RE_Objects']:
        entity_list = []
        for entity in df.at[0, side]:
            objects_list = []
            entity_2 = entity
            entity_3 = entity
            cat_list = [] 
            df_categories = pd.DataFrame()
            entity_id = 0
            # Subject
            if entity[1] == 'PERSON':
                df_link = pd.DataFrame(persons_view.loc[persons_view['value'] == entity[0]]['link'])
                if  df_link.empty == True:
				# check if there is a problem with case sensitivity
                    df_link = pd.DataFrame(persons_view.loc[persons_view['value'].str.lower() == entity[0].lower()]['link'])
                    if  df_link.empty == True:
                    # create fake uri for entities which are not in the lists
                        df_link.at[0, 'value'] = entity[0]
                        df_link.at[0, 'link'] = 'http://www.dbis.cs.uni-frankfurt.de/cnt/id/' + entity[0].replace(" ", "_") + '_' + entity[1].lower()
                        entity = (df_link.iloc[0]["link"], entity[0], entity[1], '0', 'None', 'None', 'None', \
                            'None', 'None',)
                        objects_list.append(entity)
                        continue							
                df_categories = pd.DataFrame(persons[persons['link'] == df_link.iloc[0]["link"]])
                entity_id = df_categories.iloc[0]["id"]
                cat_list = [df_categories.iloc[0]["Cat_I"], df_categories.iloc[0]["Cat_II"], \
                        df_categories.iloc[0]["Cat_III"], df_categories.iloc[0]["Cat_IV"], df_categories.iloc[0]["Cat_V"]]
                entity = (df_link.iloc[0]["link"], entity[0], entity[1], entity_id, cat_list[0], cat_list[1], cat_list[2], \
                      cat_list[3], cat_list[4],)
                objects_list.append(entity)

            if entity[1] == 'OBJECT':
                df_link = pd.DataFrame(objects_view.loc[objects_view['value'] == entity[0]]['link'])
                if  df_link.empty == True:
                    df_link = pd.DataFrame(objects_view.loc[objects_view['value'].str.lower() == entity[0].lower()]['link'])
                    if  df_link.empty == True:
                        df_link.at[0, 'value'] = entity[0]
                        df_link.at[0, 'link'] = 'http://www.dbis.cs.uni-frankfurt.de/cnt/id/' + entity[0].replace(" ", "_") + '_' + entity[1].lower()
                        entity = (df_link.iloc[0]["link"], entity[0], entity[1], '0', 'None', 'None', 'None')
                        objects_list.append(entity)
                        continue
                df_categories = pd.DataFrame(objects[objects['link'] == df_link.iloc[0]["link"]])
                entity_id = df_categories.iloc[0]["id"]
                cat_list = [df_categories.iloc[0]["Cat_I"], df_categories.iloc[0]["Cat_II"], df_categories.iloc[0]["Cat_III"]]
                entity = (df_link.iloc[0]["link"], entity[0], entity[1], entity_id, cat_list[0], cat_list[1], cat_list[2])
                objects_list.append(entity)

            if entity[1] == 'PLANT':
                df_link = pd.DataFrame(plants_view.loc[plants_view['value'] == entity[0]]['link'])
                if  df_link.empty == True:
                    df_link = pd.DataFrame(plants_view.loc[plants_view['value'].str.lower() == entity[0].lower()]['link'])
                    if  df_link.empty == True:
                        df_link.at[0, 'value'] = entity[0]
                        df_link.at[0, 'link'] = 'http://www.dbis.cs.uni-frankfurt.de/cnt/id/' + entity[0].replace(" ", "_") + '_' + entity[1].lower()
                        entity = (df_link.iloc[0]["link"], entity[0], entity[1], '0', 'None', 'None')
                        objects_list.append(entity)
                        continue							
                df_categories = pd.DataFrame(plants[plants['link'] == df_link.iloc[0]["link"]])
                entity_id = df_categories.iloc[0]["id"]
                cat_list = [df_categories.iloc[0]["Cat_I"], df_categories.iloc[0]["Cat_II"]]
                entity = (df_link.iloc[0]["link"], entity[0], entity[1], entity_id, cat_list[0], cat_list[1])
                objects_list.append(entity)

            if entity[1] == 'ANIMAL':
                df_link = pd.DataFrame(animals_view.loc[animals_view['value'] == entity[0]]['link'])
                if  df_link.empty == True:
                    df_link = pd.DataFrame(animals_view.loc[animals_view['value'].str.lower() == entity[0].lower()]['link'])
                    if  df_link.empty == True:
                        df_link.at[0, 'value'] = entity[0]
                        df_link.at[0, 'link'] = 'http://www.dbis.cs.uni-frankfurt.de/cnt/id/' + entity[0].replace(" ", "_") + '_' + entity[1].lower()
                        entity = (df_link.iloc[0]["link"], entity[0], entity[1], '0', 'None', 'None')
                        objects_list.append(entity)
                        continue							
                df_categories = pd.DataFrame(animals[animals['link'] == df_link.iloc[0]["link"]])
                entity_id = df_categories.iloc[0]["id"]
                cat_list = [df_categories.iloc[0]["Cat_I"], df_categories.iloc[0]["Cat_II"]]
                entity = (df_link.iloc[0]["link"], entity[0], entity[1], entity_id, cat_list[0], cat_list[1])
                objects_list.append(entity)    
        
            # Object 
            if entity_2[4] == 'PERSON':
                df_link = pd.DataFrame(persons_view.loc[persons_view['value'] == entity_2[3]]['link'])
                if  df_link.empty == True:
                    df_link = pd.DataFrame(persons_view.loc[persons_view['value'].str.lower() == entity_2[3].lower()]['link'])
                    if  df_link.empty == True:
                        df_link.at[0, 'value'] = entity_2[3]
                        df_link.at[0, 'link'] = 'http://www.dbis.cs.uni-frankfurt.de/cnt/id/' + entity_2[3].replace(" ", "_") + '_' + entity_2[4].lower()	
                        entity_2 = (df_link.iloc[0]["link"], entity_2[3], entity_2[4], '0', 'None', 'None', 'None', \
                            'None', 'None',)
                        objects_list.append(entity_2)
                        continue			
                df_categories = pd.DataFrame(persons[persons['link'] == df_link.iloc[0]["link"]])
                entity_id = df_categories.iloc[0]["id"]
                cat_list = [df_categories.iloc[0]["Cat_I"], df_categories.iloc[0]["Cat_II"], \
                        df_categories.iloc[0]["Cat_III"], df_categories.iloc[0]["Cat_IV"], df_categories.iloc[0]["Cat_V"]]
                entity_2 = (df_link.iloc[0]["link"], entity_2[3], entity_2[4], entity_id, cat_list[0], cat_list[1], \
                        cat_list[2], cat_list[3], cat_list[4],)
                objects_list.append(entity_2)

            if entity_2[4] == 'OBJECT':
                df_link = pd.DataFrame(objects_view.loc[objects_view['value'] == entity_2[3]]['link'])
                if  df_link.empty == True:
                    df_link = pd.DataFrame(objects_view.loc[objects_view['value'].str.lower() == entity_2[3].lower()]['link'])
                    if  df_link.empty == True:
                        df_link.at[0, 'value'] = entity_2[3]
                        df_link.at[0, 'link'] = 'http://www.dbis.cs.uni-frankfurt.de/cnt/id/' + entity_2[3].replace(" ", "_") + '_' + entity_2[4].lower()	
                        entity_2 = (df_link.iloc[0]["link"], entity_2[3], entity_2[4], '0', 'None', 'None', 'None')
                        objects_list.append(entity_2)
                        continue
                df_categories = pd.DataFrame(objects[objects['link'] == df_link.iloc[0]["link"]])
                entity_id = df_categories.iloc[0]["id"]
                cat_list = [df_categories.iloc[0]["Cat_I"], df_categories.iloc[0]["Cat_II"], df_categories.iloc[0]["Cat_III"]]
                entity_2 = (df_link.iloc[0]["link"], entity_2[3], entity_2[4], entity_id, cat_list[0], cat_list[1], \
                        cat_list[2])
                objects_list.append(entity_2)

            if entity_2[4] == 'PLANT':
                df_link = pd.DataFrame(plants_view.loc[plants_view['value'] == entity_2[3]]['link'])
                if  df_link.empty == True:
                    df_link = pd.DataFrame(plants_view.loc[plants_view['value'].str.lower() == entity_2[3].lower()]['link'])
                    if  df_link.empty == True:
                        df_link.at[0, 'value'] = entity_2[3]
                        df_link.at[0, 'link'] = 'http://www.dbis.cs.uni-frankfurt.de/cnt/id/' + entity_2[3].replace(" ", "_") + '_' + entity_2[4].lower()	
                        entity_2 = (df_link.iloc[0]["link"], entity_2[3], entity_2[4], '0', 'None', 'None')
                        objects_list.append(entity_2)
                        continue		
                df_categories = pd.DataFrame(plants[plants['link'] == df_link.iloc[0]["link"]])
                entity_id = df_categories.iloc[0]["id"]
                cat_list = [df_categories.iloc[0]["Cat_I"], df_categories.iloc[0]["Cat_II"]]
                entity_2 = (df_link.iloc[0]["link"], entity_2[3], entity_2[4], entity_id, cat_list[0], cat_list[1])
                objects_list.append(entity_2)

            if entity_2[4] == 'ANIMAL':
                df_link = pd.DataFrame(animals_view.loc[animals_view['value'] == entity_2[3]]['link'])
                if  df_link.empty == True:
                    df_link = pd.DataFrame(animals_view.loc[animals_view['value'].str.lower() == entity_2[3].lower()]['link'])
                    if  df_link.empty == True:
                        df_link.at[0, 'value'] = entity_2[3]
                        df_link.at[0, 'link'] = 'http://www.dbis.cs.uni-frankfurt.de/cnt/id/' + entity_2[3].replace(" ", "_") + '_' + entity_2[4].lower()	
                        entity_2 = (df_link.iloc[0]["link"], entity_2[3], entity_2[4], '0', 'None', 'None')
                        objects_list.append(entity_2)
                        continue		
                df_categories = pd.DataFrame(animals[animals['link'] == df_link.iloc[0]["link"]])
                entity_id = df_categories.iloc[0]["id"]
                cat_list = [df_categories.iloc[0]["Cat_I"], df_categories.iloc[0]["Cat_II"]]
                entity_2 = (df_link.iloc[0]["link"], entity_2[3], entity_2[4], entity_id, cat_list[0], cat_list[1])
                objects_list.append(entity_2)  

            # Relation 
            if entity_3[2] != 'None':
                df_link = pd.DataFrame(verbs.loc[verbs['name_en'].str.lower() == entity_3[2].lower()]['link'])
                if  df_link.empty == True:
                     df_link.at[0, 'value'] = entity_3[2]
                     df_link.at[0, 'link'] = 'http://www.dbis.cs.uni-frankfurt.de/cnt/id/' + entity_3[2].replace(" ", "_")
                     entity_3 = (df_link.iloc[0]["link"], entity_3[2], '0')
                     objects_list.append(entity_3)
                     continue
                df_categories = pd.DataFrame(verbs[verbs['link'] == df_link.iloc[0]["link"]])
                entity_id = df_categories.iloc[0]["id"]
                entity_3  = (df_link.iloc[0]["link"], entity_3[2], entity_id)
                objects_list.append(entity_3)
        
            else:
                continue
            entity_list.append(objects_list)
               
        df.at[0, side] = entity_list
        #print(df.at[0, side])
    return df	

def add_categories(g, categories, res, cursor):
    """
    This functions add the categories of X to the graph.

    Args:
        g      : the rdf graph
        categories : categories
        res    : named entity
        cursor : mysql cursor
    """
    if len(categories) != 0:
                    for cat in categories[0]:
                        if cat is None:
                            # if category is empty
                            pass
                        else:
                            # search for class uri
                            try:                                
                                # search for category in nlp_hierarchy
                                # in order to retrieve the class uri
                                cursor.execute("select class_uri from nlp_hierarchy where Class like '{}';".format(str(cat)))
                                query_result = cursor.fetchall()
                                c_uri = check_for_none(query_result, "select class_uri from nlp_hierarchy where Class like '{}';.format(str(cat))")
                                g.add((URIRef(res[0]), URIRef(prefix_dict["rdf"]+"type"), URIRef(c_uri[0][0])))
                        
                            # search for superclass uri
                            except IndexError:
                                # search for category in nlp_hierarchy
                                # in order to retrieve the superclass uri
                                cursor.execute("select superclass_uri from nlp_hierarchy where superclass like '{}';".format(str(cat)))
                                query_result = cursor.fetchall()
                                c_uri = check_for_none(query_result, "select superclass_uri from nlp_hierarchy where superclass like '{}';.format(str(cat))")
                                g.add((URIRef(res[0]), URIRef(prefix_dict["rdf"]+"type"), URIRef(c_uri[0][0])))

def add_categories_csv(g, categories, res, hierarchy):
    # function for csv files
    if len(categories) != 0:
                    for cat in categories[0]:
                        if cat is None:
                            # if category is empty
                            pass
                        else:
                            # search for class uri
                            try:
                                c_uri = pd.DataFrame(hierarchy.loc[hierarchy['class'] == cat]['class_uri'])
                                g.add((URIRef(res[0]), URIRef(prefix_dict["rdf"]+"type"), URIRef(c_uri.iloc[0]["class_uri"])))
                            except IndexError:
                                 continue
							

def check_for_none(output, query):
    """
    Checks if the output for the used query 
    is None and if it is: it prints
    the usdq query for debugging.
    """
    if output is None:
        return "error with: {}".format(query)
    else:
        return output


def map_designs(g, df, property_set):
    """
    Maps the general information of the designs to rdf
    Args:
        g            : the rdf graph
        cursor       : mysql cursor
        ids          : the ids of the coins
        property_set : holds the different properties
    """

	# retrieves the design id
    id_r = df.at[0, 'design_id']


    if id_r != None:
        #######################
        # reverse design
        #######################
        # design id
        g.add((URIRef("https://data.corpus-nummorum.eu/api/designs/"+str(id_r)), URIRef(prefix_dict["dcterms"]+"identifier"), Literal("design_id="+str(id_r))))
        #title
        g.add((URIRef("https://data.corpus-nummorum.eu/api/designs/"+str(id_r)), URIRef(prefix_dict["dcterms"]+"title"), Literal("CNT Design"+str(id_r))))
        #publisher
        g.add((URIRef("https://data.corpus-nummorum.eu/api/designs/"+str(id_r)), URIRef(prefix_dict["dcterms"]+"publisher"), Literal("Corpus Nummorum Thracorum")))
        
        # retrieves the descriptions of the design(de, en)
        designs_rev_en = df.at[0, 'description_org']
        designs_rev_de = df.at[0, 'description_de']

        # Design -> dcterms:descriptions (de)
        g.add((URIRef("https://data.corpus-nummorum.eu/api/designs/"+str(id_r)), URIRef(prefix_dict["dcterms"]+"description"), Literal(str(designs_rev_de), lang="de"))) 
        # Design -> dcterms:descriptions (en)
        g.add((URIRef("https://data.corpus-nummorum.eu/api/designs/"+str(id_r)), URIRef(prefix_dict["dcterms"]+"description"), Literal(str(designs_rev_en), lang="en")))

    # add properties
    property_set.add(prefix_dict["dcterms"]+"identifier")
    property_set.add(prefix_dict["dcterms"]+"title")
    property_set.add(prefix_dict["dcterms"]+"publisher")

def map_nlp(g, df, property_set, class_set, cursor, hierarchy, use_csv):
    """
    Maps the NLP part of the reverse side
    Args:
        g            : the rdf graph
        df           : dataframe with all data
        id           : coin id
        property_set : holds the different properties
        class_set    : holds the different classes
    """

    # retrieves the design id()
    design_rev = df.at[0, 'design_id']


    if design_rev == None:
        print("No entities found")
    else:	
        ###############################
        # reverse
        ###############################

        # Designs --> nlp_bag (hasAppearance)
        design_bnode_bag_r_appr = BNode()
        design_bnode_bag_r_icon = BNode()
		
        g.add((URIRef("https://data.corpus-nummorum.eu/api/designs/"+str(design_rev)), URIRef(prefix_dict["nmo"]+"hasAppearance"), design_bnode_bag_r_appr))

        # Designs --> nlp_bag (hasIconography)
        g.add((URIRef("https://data.corpus-nummorum.eu/api/designs/"+str(design_rev)), URIRef(prefix_dict["nmo"]+"hasIconography"), design_bnode_bag_r_icon))

        
        # assign bnodes to the bag class
        g.add((design_bnode_bag_r_icon, URIRef(prefix_dict["rdf"]+"type"), URIRef(prefix_dict["rdf"]+"Bag")))
        g.add((design_bnode_bag_r_appr, URIRef(prefix_dict["rdf"]+"type"), URIRef(prefix_dict["rdf"]+"Bag")))
        #g.add((design_bnode_bag_r_icon, URIRef(prefix_dict["rdf"]+"type"), URIRef(prefix_dict["rdf"]+"Bag")))
        #g.add((design_bnode_bag_r_appr, URIRef(prefix_dict["rdf"]+"type"), URIRef(prefix_dict["rdf"]+"Bag")))
				

        ################################
        # Named Entity Recognition
        ################################
        # select the named entities of the design
        ner_entities_rev = df.at[0, 'NER_Entities']

        for entity in ner_entities_rev:
            # bag -> named entity
            g.add((design_bnode_bag_r_appr, URIRef(prefix_dict["rdf"]+"li"), URIRef(entity[0])))
            g.add((URIRef(entity[0]), URIRef(prefix_dict["skos"]+"prefLabel"), Literal(entity[1], datatype=XSD.string)))
   
            # entity is a person
            if str(entity[2]).lower() == "person":
                # retrieve id from the name or the alternativenames column
                try: 
                    g.add((URIRef(entity[0]), URIRef(prefix_dict["dcterms"]+"identifier"), Literal("subject_id="+str(entity[3]))))
                    
                    # add cat I, cat II, cat III, cat IV and/or cat V
                    # get the values of the categories
                    res = (entity[0], entity[1], entity[2])
                    cats = [(entity[4], entity[5], entity[6], entity[7], entity[8])]
                    if use_csv == True:
                        add_categories_csv(g, cats, res, hierarchy)
                    else:
                        add_categories(g, cats, res, cursor)
                
                except IndexError:
                    continue

            # entity is an animal                  
            elif str(entity[2]).lower() == "animal":
                # retrieve id from the name or the alternativenames column
                try: 
                    g.add( (URIRef(entity[0]), URIRef(prefix_dict["dcterms"]+"identifier"), Literal(str(entity[2]).lower()+"_id="+str(entity[3]))))

                    # add cat I and/or cat II
                    # get the values of the categories
                    res = (entity[0], entity[1], entity[2])
                    cats = [(entity[4], entity[5])]            
                    if use_csv == True:
                        add_categories_csv(g, cats, res, hierarchy)
                    else:
                        add_categories(g, cats, res, cursor)

                except IndexError:
                    continue
            
            # entity is an object
            elif str(entity[2]).lower() == "object":
                # retrieve id from the name or the alternativenames column     
                try: 
                    g.add( (URIRef(entity[0]), URIRef(prefix_dict["dcterms"]+"identifier"), Literal(str(entity[2]).lower()+"_id="+str(entity[3]))))

                    # add cat I, cat II and/or cat III
                    # get the values of the categories
                    res = (entity[0], entity[1], entity[2])
                    cats = [(entity[4], entity[5], entity[6])]                        
                    if use_csv == True:
                        add_categories_csv(g, cats, res, hierarchy)
                    else:
                        add_categories(g, cats, res, cursor)

                except IndexError:
                    continue

            # entity is a plant
            elif str(entity[2]).lower() == "plant":
                # retrieve id from the name or the alternativenames column
                try: 
                    g.add( (URIRef(entity[0]), URIRef(prefix_dict["dcterms"]+"identifier"), Literal(str(entity[2]).lower()+"_id="+str(entity[3]))))

                    # add cat I and/or cat II
                    # get the values of the categories)  
                    res = (entity[0], entity[1], entity[2])
                    cats = [(entity[4], entity[5])]                        
                    if use_csv == True:
                        add_categories_csv(g, cats, res, hierarchy)
                    else:
                        add_categories(g, cats, res, cursor)

                except IndexError:
                    continue

        ################################
        # Relationship Extraction
        ################################
        # select the entries of the design
		       
        re_objects_rev = df.at[0, 'RE_Objects']
				
        # create labels
        for re_object in re_objects_rev:
            try:
                g.add((URIRef(re_object[2][0]), URIRef(prefix_dict["skos"]+"prefLabel"), Literal(re_object[2][1], datatype=XSD.string)))

                # create labels for predicates
                g.add((URIRef(re_object[2][0]), URIRef(prefix_dict["skos"]+"prefLabel"), Literal("predicate_id="+str(re_object[2][2]))))

            except IndexError:
                # in case no relation was found in the description
                pass

        for re_obj in re_objects_rev:
            try:
                #blank node for current entry
                curr_b_node = BNode()
                # assign entry to the Statement class
                g.add((curr_b_node, URIRef(prefix_dict["rdf"]+"type"), URIRef(prefix_dict["rdf"]+"Statement")))
                #  nlp_bag --> entry
                g.add((design_bnode_bag_r_icon, URIRef(prefix_dict["rdf"]+"li"), curr_b_node))
                # create triples
                g.add((curr_b_node, URIRef(prefix_dict["rdf"]+"subject"), URIRef(re_obj[0][0])))
                g.add((curr_b_node, URIRef(prefix_dict["rdf"]+"object"), URIRef(re_obj[1][0])))
                g.add((curr_b_node, URIRef(prefix_dict["rdf"]+"predicate"), URIRef(re_obj[2][0])))

            except IndexError:
                continue

        # add properties
        property_set.add(prefix_dict["nmo"]+"hasIconography")
        property_set.add(prefix_dict["nmo"]+"hasAppearance")
        property_set.add(prefix_dict["rdf"]+"type")
        property_set.add(prefix_dict["skos"]+"prefLabel")
        property_set.add(prefix_dict["rdf"]+"type")
        property_set.add(prefix_dict["rdf"]+"li")
        property_set.add(prefix_dict["rdf"]+"subject")
        property_set.add(prefix_dict["rdf"]+"object")
        property_set.add(prefix_dict["rdf"]+"predicate")
        class_set.add(prefix_dict["rdf"]+"Statement")
        class_set.add(prefix_dict["rdf"]+"Bag")

            
def create_hierarchy(g, cursor, property_set, class_set):
    """
    Maps the content of nlp_hierarchy table
    Args:
        g            : the rdf graph
        cursor       : mysql cursor
        property_set : holds the different properties
        class_set    : holds the different classes
    """
    print("Using NLP tables from database")
    cursor.execute("Select class, superclass, class_uri, superclass_uri from nlp_hierarchy;") 
    for (c,sc,cu,scu) in cursor:
        g.add((URIRef(cu), URIRef(prefix_dict["skos"]+"prefLabel"), Literal(c, datatype=XSD.string)))
        g.add((URIRef(cu), URIRef(prefix_dict["rdf"]+"type"), URIRef(prefix_dict["rdfs"]+"Class")))
        g.add((URIRef(cu), URIRef(prefix_dict["rdfs"]+"subClassOf"), URIRef(scu)))

    # add property and classes
    property_set.add(prefix_dict["rdfs"]+"subClassOf")
    class_set.add(prefix_dict["rdfs"]+"Class")

def create_hierarchy_csv(g, cursor, property_set, class_set, hierarchy):
    """
    Maps the content of nlp_hierarchy table
    Args:
        g            : the rdf graph
        cursor       : mysql cursor
        property_set : holds the different properties
        class_set    : holds the different classes
    """
    
    #print("Using csv files")
    for index, row in hierarchy.iterrows():
        row["class"], row["superclass"], row["class_uri"], row["superclass_uri"]
        g.add((URIRef(row["class_uri"]), URIRef(prefix_dict["skos"]+"prefLabel"), Literal(row["class"], datatype=XSD.string)))
        g.add((URIRef(row["class_uri"]), URIRef(prefix_dict["rdf"]+"type"), URIRef(prefix_dict["rdfs"]+"Class")))
        g.add((URIRef(row["class_uri"]), URIRef(prefix_dict["rdfs"]+"subClassOf"), URIRef(row["superclass_uri"])))

    # add property and classes
    property_set.add(prefix_dict["rdfs"]+"subClassOf")
    class_set.add(prefix_dict["rdfs"]+"Class")

def create_prop_class(g, property_set, class_set):
    """
    Maps the content of the property and class set.

    Args:
        g            : the rdf graph
        property_set : holds the different properties
        class_set    : holds the different classes
    """
    for prop in property_set:
        g.add((URIRef(prop), URIRef( prefix_dict["rdf"]+"type" ), URIRef(prefix_dict["rdf"]+"Property")))

    for c in class_set:
        g.add((URIRef(c), URIRef( prefix_dict["rdf"]+"type" ), URIRef(prefix_dict["rdfs"]+"Class")))

def serialize_graph(g, save_path):
    """
    Creates the output file by serializing the graph.

    Args:
        g : the rdf graph
    """
    print("Started serializing!")
    g.serialize(destination= save_path + "output_" + ".ttl", format="nt", encoding="utf-8")


def create_graph_rest_api(df, params, hierarchy, use_csv, save_path): #save_path
    """
    This function executes the different mapping functions and
    establishes a connection to the database.
    
    Args:
        ids : array of coin ids
    """

    g = Graph()

    # fill out with your own data
    mysql_param = params
    mydb = mysql.connector.connect(**mysql_param)
    cursor = mydb.cursor(buffered=True)

    # used for executing sql statements when iterating over the first cursor
    cursor2 = mydb.cursor(buffered=True) 

    # holds the different properties
    property_set = set()

    # holds the different classes
    class_set = set()
	
    map_designs(g, df, property_set)
    map_nlp(g, df, property_set, class_set, cursor, hierarchy, use_csv)
    if use_csv == True: 
        create_hierarchy_csv(g, cursor, property_set, class_set, hierarchy)
    else:
        create_hierarchy(g, cursor, property_set, class_set)
	    
    create_prop_class(g, property_set, class_set)
    serialize_graph(g, save_path)


def create_graph_for_all_designs(df, designs, hierarchy, params, use_csv, model_ner_eng, model_re_eng, persons, persons_view, objects, objects_view, animals, animals_view, plants, \
                            plants_view, verbs, save_path, only_ner):
    g = Graph()
    mysql_param = params
    mydb = mysql.connector.connect(**mysql_param)
    cursor = mydb.cursor(buffered=True)

    # used for executing sql statements when iterating over the first cursor
    cursor2 = mydb.cursor(buffered=True) 

    # holds the different properties
    property_set = set()

    # holds the different classes
    class_set = set()
    create_prop_class(g, property_set, class_set)

    if use_csv == True: 
        create_hierarchy_csv(g, cursor, property_set, class_set, hierarchy)
    else:
        create_hierarchy(g, cursor, property_set, class_set)
		
    data = \
    {'design_id': 0, \
     'description': [""], \
     'description_de': [""], \
     'description_org': [""], \
     'NER_Entities': [""], \
     'RE_Objects' : [""]}

    df = pd.DataFrame(data)
    entity_not_in_list = []
    temp_entity = ()
	
    for index, row in designs.iterrows():
        df.at[0, "design_id"] = row["id"]
        df.at[0, "description"] = row["design_en"]
        df.at[0, "description_de"] = row["design_de"]
        df.at[0, "description_org"] = row["design_en_org"]
        df.at[0, 'NER_Entities'] = DesignEstimator.predict_single_sentence_clear(model_ner_eng, df.at[0, 'description'])
        df1 = df[['design_id', 'description', 'description_de', 'description_org']]
        df1 = df1.rename(columns={"description": "design_en", "description_de": "design_de", "description_org": "design_en_org"})
        if only_ner != True:
            df.at[0, 'RE_Objects'] = model_re_eng.predict(df1).at[0, 'y']
        temp_entity = (ner_uri(df, persons, persons_view, objects, objects_view, animals, animals_view, plants, plants_view))
        if len(temp_entity) != 0:
            entity_not_in_list.append(temp_entity)
        re_uri(df, persons, persons_view, objects, objects_view, animals, animals_view, plants, plants_view, verbs)
        map_designs(g, df, property_set)
        map_nlp(g, df, property_set, class_set, cursor, hierarchy, use_csv)
        #create_graph_rest_api(df, g, params, hierarchy, use_csv) #save_path
		
    with open('/home/bigdatalab/Projects/D4N4/NLP/readme.txt', 'w') as f:
        f.write(str(entity_not_in_list))

    serialize_graph(g, save_path)
	
    