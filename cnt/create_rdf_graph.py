"""
This code contains the implementation discussed in the bachelor thesis 
"Optimizing a Natural Language Processing Pipeline for the automatic creation of RDF data".
All code in the cnt package has been developed by Patricia Klinger and was
modified by Nils Dambowy.

"""

from rdflib import Graph, URIRef, Literal, BNode
from rdflib.namespace._XSD import XSD
import mysql.connector

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

def add_categories(g, result, res, cursor):
    """
    This functions add the categories of X to the graph.

    Args:
        g      : the rdf graph
        result : categories
        res    : named entity
        cursor : mysql cursor
    """
    if len(result) != 0:
                    for cat in result[0]:
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

def map_coin(g, cursor, id, property_set, class_set):
    """
    Creates the rdf triples for the overall information
    of the coin.

    Args:
        g            : the rdf graph
        cursor       : mysql cursor
        ids          : the ids of the coins
        property_set : holds the different properties
        class_set    : holds the different classes
    """

    ##########################
    # Coin general information
    ##########################
    cursor.execute("Select id from data_coins where id = {};".format(int(id)))
    query_result = cursor.fetchall()
    coin_id = check_for_none(query_result,"Select id from data_coins where id = {};.format(int(id))")
    pattern = "https://www.corpus-nummorum.eu/CN_"+ str(coin_id[0][0])

    #coin property bridges
    g.add((URIRef(pattern), URIRef(prefix_dict["nmo"]+"hasObjectType"), URIRef(prefix_dict["nm"]+"coin")))
    g.add((URIRef(pattern), URIRef(prefix_dict["dcterms"]+"identifier"), Literal("coin_id="+str(id))))
    g.add((URIRef(pattern), URIRef(prefix_dict["rdf"]+"type"), URIRef(prefix_dict["nmo"]+"NumismaticObject")))
    # Coin -> obverse_coin
    g.add((URIRef(pattern), URIRef(prefix_dict["nmo"]+"hasObverse"), URIRef("https://www.corpus-nummorum.eu/CN_{}#obverse".format(str(id)))))
    # Coin -> reverse_coin
    g.add((URIRef(pattern), URIRef(prefix_dict["nmo"]+"hasReverse"), URIRef("https://www.corpus-nummorum.eu/CN_{}#reverse".format(str(id)))))
    
    ###########################
    #  Designs --> ObverseCoins
    ###########################
    cursor.execute("Select id_design, design_en, design_de from d2r_coin_obv_design where id_coin = {};".format(int(id)))
    query_result = cursor.fetchall()
    obv_data = check_for_none(query_result,"Select id_design, design_en, design_de from d2r_coin_obv_design where id_coin = {};.format(int(id))")

    # if coin has a obverse description:
    if obv_data != []:
        #  Obverse --> DesignURI
        g.add( (URIRef("https://www.corpus-nummorum.eu/CN_{}#obverse".format(str(id))), URIRef(prefix_dict["nmo"]+"hasAppearance"), URIRef("https://www.corpus-nummorum.eu/designs/"+str(obv_data[0][0]))))
        #  Obverse --> Design (en) 
        g.add( (URIRef("https://www.corpus-nummorum.eu/CN_{}#obverse".format(str(id))), URIRef(prefix_dict["dcterms"]+"description"), Literal(str(obv_data[0][1]), lang="en")))
        #  Obverse --> Design (de) 
        g.add( (URIRef("https://www.corpus-nummorum.eu/CN_{}#obverse".format(str(id))), URIRef(prefix_dict["dcterms"]+"description"), Literal(str(obv_data[0][2]), lang="de")))
    
    ###########################
    #  Designs --> ReverseCoins
    ###########################
    cursor.execute("Select id_design, design_en, design_de from d2r_coin_rev_design where id_coin = {};".format(int(id)))
    query_result = cursor.fetchall()
    rev_data = check_for_none(query_result,"Select id_design, design_en, design_de from d2r_coin_rev_design where id_coin = {};.format(int(id))")

    # if coin has a reverse description:
    if rev_data != []:
        #  Reverse --> DesignURI
        g.add( (URIRef("https://www.corpus-nummorum.eu/CN_{}#reverse".format(str(id))), URIRef(prefix_dict["nmo"]+"hasAppearance"), URIRef("https://www.corpus-nummorum.eu/designs/"+str(rev_data[0][0]))))
        #  Reverse --> Design (en) Literal
        g.add( (URIRef("https://www.corpus-nummorum.eu/CN_{}#reverse".format(str(id))), URIRef(prefix_dict["dcterms"]+"description"), Literal(str(rev_data[0][1]), lang="en")))
        #  Reverse --> Design (de) Literal
        g.add( (URIRef("https://www.corpus-nummorum.eu/CN_{}#reverse".format(str(id))), URIRef(prefix_dict["dcterms"]+"description"), Literal(str(rev_data[0][2]), lang="de")))

    #######################
    # add property and class values
    #######################
    property_set.add(prefix_dict["nmo"]+"hasAppearance")
    property_set.add(prefix_dict["dcterms"]+"description")
    property_set.add(prefix_dict["nmo"]+"hasObjectType")
    property_set.add(prefix_dict["dcterms"]+"identifier")
    property_set.add(prefix_dict["rdf"]+"type")
    property_set.add(prefix_dict["nmo"]+"hasObverse")
    property_set.add(prefix_dict["nmo"]+"hasReverse")
    class_set.add(prefix_dict["nmo"]+"NumismaticObject")

def map_designs(g, cursor, id, property_set):
    """
    Maps the general information of the designs to rdf
    Args:
        g            : the rdf graph
        cursor       : mysql cursor
        ids          : the ids of the coins
        property_set : holds the different properties
    """

    # retrieves the design id(reverse)
    cursor.execute("Select id_design from d2r_coin_rev_design where id_coin = {};".format(int(id)))
    query_result = cursor.fetchall() 
    if query_result == []:
        # No design id was found for the reverse side
        id_r = None
    else:
        id_r_query = check_for_none(query_result, "Select id_design from d2r_coin_rev_design where id_coin = {};.format(int(id))") 
        id_r  = id_r_query[0][0]

    # retrieves the design id(obverse)
    cursor.execute("Select id_design from d2r_coin_obv_design where id_coin = {};".format(int(id)))
    query_result = cursor.fetchall()
    if query_result == []:
        # No design id was found for the obverse side
        id_o = None
    else:
        id_o_query = check_for_none(query_result, "Select id_design from d2r_coin_obv_design where id_coin = {};.format(int(id))") 
        id_o  = id_o_query[0][0]

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
        cursor.execute("Select design_de, design_en from data_designs where id = {};".format(int(id_r)))
        query_result = cursor.fetchall()
        designs_rev = check_for_none(query_result, "Select design_de, design_en from data_designs where id = {};.format(int(id_r))")

        # Design -> dcterms:descriptions (de)
        g.add((URIRef("https://data.corpus-nummorum.eu/api/designs/"+str(id_r)), URIRef(prefix_dict["dcterms"]+"description"), Literal(str(designs_rev[0][0]), lang="de"))) 
        # Design -> dcterms:descriptions (en)
        g.add((URIRef("https://data.corpus-nummorum.eu/api/designs/"+str(id_r)), URIRef(prefix_dict["dcterms"]+"description"), Literal(str(designs_rev[0][1]), lang="en")))

    if id_o != None:
        #######################
        # obverse design
        #######################
        # design id
        g.add((URIRef("https://data.corpus-nummorum.eu/api/designs/"+str(id_o)), URIRef(prefix_dict["dcterms"]+"identifier"), Literal("design_id="+str(id_o))))
        #title
        g.add((URIRef("https://data.corpus-nummorum.eu/api/designs/"+str(id_o)), URIRef(prefix_dict["dcterms"]+"title"), Literal("CNT Design"+str(id_o))))
        #publisher
        g.add((URIRef("https://data.corpus-nummorum.eu/api/designs/"+str(id_o)), URIRef(prefix_dict["dcterms"]+"publisher"), Literal("Corpus Nummorum Thracorum")))
        
        # retrieves the descriptions of the design(de, en)
        cursor.execute("Select design_de, design_en from data_designs where id = {};".format(int(id_o)))
        query_result = cursor.fetchall() 
        designs_obv = check_for_none(query_result, "Select design_de, design_en from data_designs where id = {};.format(int(id_o))")

        # Design -> dcterms:descriptions (de)
        g.add((URIRef("https://data.corpus-nummorum.eu/api/designs/"+str(id_o)), URIRef(prefix_dict["dcterms"]+"description"), Literal(str(designs_obv[0][0]), lang="de")))  
        # Design -> dcterms:descriptions (en)
        g.add((URIRef("https://data.corpus-nummorum.eu/api/designs/"+str(id_o)), URIRef(prefix_dict["dcterms"]+"description"), Literal(str(designs_obv[0][1]), lang="en")))

    # add properties
    property_set.add(prefix_dict["dcterms"]+"identifier")
    property_set.add(prefix_dict["dcterms"]+"title")
    property_set.add(prefix_dict["dcterms"]+"publisher")

def map_reverse_nlp(g, cursor, cursor2, id, property_set, class_set):
    """
    Maps the NLP part of the reverse side
    Args:
        g            : the rdf graph
        cursor       : mysql cursor
        cursor2      : mysql cursor
        id           : coin id
        property_set : holds the different properties
        class_set    : holds the different classes
    """

    # retrieves the design id(reverse)
    cursor.execute("Select id_design from d2r_coin_rev_design where id_coin = {};".format(int(id)))
    query_result = cursor.fetchall() 

    if query_result == []:
        id_r = None
    else:
        id_r_query = check_for_none(query_result, "Select id_design from d2r_coin_rev_design where id_coin = {};.format(int(id))") 
        id_r  = id_r_query[0][0]

    if id_r != None:
        ###############################
        # reverse
        ###############################

        # Designs --> nlp_bag (hasAppearance)
        design_bnode_bag_r_appr = BNode()
        g.add((URIRef("https://data.corpus-nummorum.eu/api/designs/"+str(id_r)), URIRef(prefix_dict["nmo"]+"hasAppearance"), design_bnode_bag_r_appr))

        # Designs --> nlp_bag (hasIconography)
        design_bnode_bag_r_icon = BNode()
        g.add((URIRef("https://data.corpus-nummorum.eu/api/designs/"+str(id_r)), URIRef(prefix_dict["nmo"]+"hasIconography"), design_bnode_bag_r_icon))
        
        # assign bnodes to the bag class
        g.add((design_bnode_bag_r_icon, URIRef(prefix_dict["rdf"]+"type"), URIRef(prefix_dict["rdf"]+"Bag")))
        g.add((design_bnode_bag_r_appr, URIRef(prefix_dict["rdf"]+"type"), URIRef(prefix_dict["rdf"]+"Bag")))

        ################################
        # Named Entity Recognition
        ################################
        # select the named entities of the design
        cursor.execute("Select entity_url,entity,label_entity from cnt_pipeline_ner_url where design_id = {};".format(int(id_r))) 

        for res in cursor:
            #print(res)
            # bag -> named entity
            g.add((design_bnode_bag_r_appr, URIRef(prefix_dict["rdf"]+"li"), URIRef(res[0])))
            g.add((URIRef(res[0]), URIRef(prefix_dict["skos"]+"prefLabel"), Literal(res[1], datatype=XSD.string)))
            
            # create labels
            try:
                cursor2.execute("select relation,relation_url, subject from cnt_pipeline_url where design_id = {};".format(int(id_r)))
                query_result = cursor2.fetchall()
                relation_query = check_for_none(query_result, "select relation,relation_url, subject from cnt_pipeline_url where design_id = {};.format(int(id_r))")
                #print(relation_query)
                #print(relation_query[0][1])
                g.add((URIRef(relation_query[0][1]), URIRef(prefix_dict["skos"]+"prefLabel"), Literal(relation_query[0][0], datatype=XSD.string)))

                # create labels for predicates
                for relation in relation_query:
                    cursor2.execute("select id from nlp_list_verb where name_en = '{}';".format(str(relation[0])))
                    query_result = cursor2.fetchall()
                    result = check_for_none(query_result, "select id from nlp_list_verb where name_en = '{}';.format(str(result[0]))")
                    g.add((URIRef(relation_query[0][1]), URIRef(prefix_dict["skos"]+"prefLabel"), Literal("predicate_id="+str(result[0][0]))))

            except IndexError:
                # in case no relation was found in the description
                pass
   
            # entity is a person
            if str(res[2]).lower() == "person":
                # retrieve id from the name or the alternativenames column
                try: 
                    cursor2.execute("select id from nlp_list_person where name = '{}';".format(str(res[1]).lower()))
                    query_result = cursor2.fetchall()
                    result = check_for_none(query_result, "select id from nlp_list_person where name = {};.format(id_r)")
                    g.add((URIRef(res[0]), URIRef(prefix_dict["dcterms"]+"identifier"), Literal("subject_id="+str(result[0][0]))))
                    
                    # add cat I, cat II, cat III, cat IV and/or cat V
                    # get the values of the categories
                    cursor2.execute("select Cat_I, Cat_II, Cat_III, Cat_IV, Cat_V from nlp_list_person where name like '{}';".format(str(res[1]).lower()))
                    query_result = cursor2.fetchall()
                    result = check_for_none(query_result, "select Cat_I, Cat_II, Cat_III, Cat_IV, Cat_V from nlp_list_person where name like '{}';.format(id_r)")
                    #print(result)  
                    # checks if there are no entries

                    add_categories(g, result, res, cursor2)
                
                except IndexError:
                    cursor2.execute("select id from nlp_list_person where alternativenames like '%{}%';".format(str(res[1])))
                    query_result = cursor2.fetchall()
                    result = check_for_none(query_result, "select id from nlp_list_person where name = {} or where alternativenames;.format(id_r)")             
                    g.add((URIRef(res[0]), URIRef(prefix_dict["dcterms"]+"identifier"), Literal("subject_id="+str(result[0][0]))))
                    
                    # add cat I, cat II, cat III, cat IV and/or cat V
                    # get the values of the categories
                    cursor2.execute("select Cat_I, Cat_II, Cat_III, Cat_IV, Cat_V from nlp_list_person where alternativenames like '%{}%'".format(str(res[1]).lower()))
                    query_result = cursor2.fetchall()
                    result = check_for_none(query_result, "select Cat_I, Cat_II, Cat_III, Cat_IV, Cat_V from nlp_list_person where alternativenames  like '%{}%'.format(str(res[1]).lower())")  
                    
                    add_categories(g, result, res, cursor2)

            # entity is an animal                  
            elif str(res[2]).lower() == "animal":
                # retrieve id from the name or the alternativenames column
                try: 
                    cursor2.execute("select id from nlp_list_animal where name_en like '{}';".format(str(res[1]).lower()))
                    query_result = cursor2.fetchall()
                    result = check_for_none(query_result, "select id from nlp_list_animal where name_en like '{}';.format(id_r)")
                    g.add( (URIRef(res[0]), URIRef(prefix_dict["dcterms"]+"identifier"), Literal("object_id="+str(result[0][0]))))

                    # add cat I and/or cat II
                    # get the values of the categories
                    cursor2.execute("select Cat_I, Cat_II from nlp_list_animal where name_en like '{}';".format(str(res[1]).lower()))
                    query_result = cursor2.fetchall()
                    result = check_for_none(query_result, "select Cat_I, Cat_II from nlp_list_animal where name_en like '{}';.format(str(res[1]).lower())")  
                    
                    add_categories(g, result, res, cursor2)

                except IndexError:
                    cursor2.execute("select id from nlp_list_animal where alternativenames_en like '%{}%';".format(str(res[1]).lower()))
                    query_result = cursor2.fetchall()
                    result = check_for_none(query_result, "select id from nlp_list_animal where alternativenames_en like '%{}%';.format(str(res[1]).lower())")  
                    g.add( (URIRef(res[0]), URIRef(prefix_dict["dcterms"]+"identifier"), Literal("object_id="+str(result[0][0]))))

                    # add cat I and/or cat II
                    # get the values of the categories
                    cursor2.execute("select Cat_I, Cat_II from nlp_list_animal where alternativenames_en  like '%{}%';".format(str(res[1]).lower()))
                    query_result = cursor2.fetchall()
                    result = check_for_none(query_result, "select Cat_I, Cat_II from nlp_list_animal where alternativenames_en  like '%{}%';.format(str(res[1]).lower())")  
                    
                    add_categories(g, result, res, cursor2)
            
            # entity is an object
            elif str(res[2]).lower() == "object":
                # retrieve id from the name or the alternativenames column     
                try: 
                    cursor2.execute("select id from nlp_list_obj where name_en like '{}';".format(str(res[1]).lower()))
                    query_result = cursor2.fetchall()
                    result = check_for_none(query_result, "select id from nlp_list_obj where name_en like '{}';.format(str(res[1]).lower())")
                    g.add( (URIRef(res[0]), URIRef(prefix_dict["dcterms"]+"identifier"), Literal(str(res[2]).lower()+"_id="+str(result[0][0]))))

                    # add cat I, cat II and/or cat III
                    # get the values of the categories
                    cursor2.execute("select Cat_I, Cat_II, Cat_III from nlp_list_obj where name_en like '{}';".format(str(res[1]).lower()))
                    query_result = cursor2.fetchall()
                    result = check_for_none(query_result, "select Cat_I, Cat_II, Cat_III from nlp_list_obj where name_en like '{}';.format(str(res[1]).lower())")  
                    
                    add_categories(g, result, res, cursor2)

                except IndexError:
                    cursor2.execute("select id from nlp_list_obj where alternativenames_en  like '%{}%';".format(str(res[1]).lower()))
                    query_result = cursor2.fetchall()
                    result = check_for_none(query_result, "select id from nlp_list_obj where alternativenames_en  like '%{}%';.format(str(res[1]).lower())")  
                    g.add( (URIRef(res[0]), URIRef(prefix_dict["dcterms"]+"identifier"), Literal(str(res[2]).lower()+"_id="+str(result[0][0]))))

                    # add cat I, cat II and/or cat III
                    # get the values of the categories
                    cursor2.execute("select Cat_I, Cat_II, Cat_III from nlp_list_obj where alternativenames_en  like '%{}%';".format(str(res[1]).lower()))
                    query_result = cursor2.fetchall()
                    result = check_for_none(query_result, "select Cat_I, Cat_II, Cat_III from nlp_list_obj where alternativenames_en like '%{}%';.format(str(res[1]).lower())")  
                    
                    add_categories(g, result, res, cursor2)

            # entity is a plant
            else:
                # retrieve id from the name or the alternativenames column
                try: 
                    cursor2.execute("select id from nlp_list_plant where name_en like '{}';".format(str(res[1]).lower()))
                    query_result = cursor2.fetchall()
                    result = check_for_none(query_result, "select id from nlp_list_plant where name_en like '{}';.format(str(res[1]).lower())")
                    g.add( (URIRef(res[0]), URIRef(prefix_dict["dcterms"]+"identifier"), Literal(str(res[2]).lower()+"_id="+str(result[0][0]))))

                    # add cat I and/or cat II
                    # get the values of the categories
                    cursor2.execute("select Cat_I, Cat_II from nlp_list_plant where name_en  like '{}';".format(str(res[1]).lower()))
                    query_result = cursor2.fetchall()
                    result = check_for_none(query_result, "select Cat_I, Cat_II from nlp_list_plant where name_en  like '{}';.format(str(res[1]).lower())")  
                    
                    add_categories(g, result, res, cursor2)

                except IndexError:
                    cursor2.execute("select id from nlp_list_plant where alternativenames_en  like '%{}%';".format(str(res[1]).lower()))
                    query_result = cursor2.fetchall()
                    result = check_for_none(query_result, "select id from nlp_list_plant where alternativenames_en  like '%{}%';.format(str(res[1]).lower())")  
                    g.add( (URIRef(res[0]), URIRef(prefix_dict["dcterms"]+"identifier"), Literal(str(res[2]).lower()+"_id="+str(result[0][0]))))

                    # add cat I and/or cat II
                    # get the values of the categories
                    cursor2.execute("select Cat_I, Cat_II from nlp_list_plant where alternativenames_en  like '%{}%';".format(str(res[1]).lower()))
                    query_result = cursor2.fetchall()
                    result = check_for_none(query_result, "select Cat_I, Cat_II from nlp_list_plant where alternativenames_en  like '%{}%';.format(str(res[1]).lower())")  
                    
                    add_categories(g, result, res, cursor2)

        ################################
        # Relationship Extraction
        ################################
        # select the entries of the design
        cursor.execute("Select id, subject_url, object_url, relation_url from cnt_pipeline_url where design_id = {};".format(int(id_r)))

        for entry in cursor:
            # blank node for current entry
            curr_b_node = BNode()

            # assign entry to the Statement class
            g.add((curr_b_node, URIRef(prefix_dict["rdf"]+"type"), URIRef(prefix_dict["rdf"]+"Statement")))           

            #  nlp_bag --> entry
            g.add((design_bnode_bag_r_icon, URIRef(prefix_dict["rdf"]+"li"), curr_b_node))

            # create triples
            g.add((curr_b_node, URIRef(prefix_dict["rdf"]+"subject"), URIRef(entry[1])))
            g.add((curr_b_node, URIRef(prefix_dict["rdf"]+"object"), URIRef(entry[2])))
            g.add((curr_b_node, URIRef(prefix_dict["rdf"]+"predicate"), URIRef(entry[3])))

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

def map_obverse_nlp(g, cursor, cursor2, id): 
    """
    Maps the NLP part of the obverse side

    Args:
        g       : the rdf graph
        cursor  : mysql cursor
        cursor2 : mysql cursor
        id      : id of coin
    """

    # retrieves the design id(obverse)
    cursor.execute("Select id_design from d2r_coin_obv_design where id_coin = {};".format(int(id)))
    query_result = cursor.fetchall()

    if query_result == []:
        id_o = None
    else:
        id_o_query = check_for_none(query_result, "Select id_design from d2r_coin_obv_design where id_coin = {};.format(int(id))") 
        id_o  = id_o_query[0][0]

    if id_o != None:
        ###############################
        # obverse
        ###############################
        # Designs --> nlp_bag (hasAppearance)
        design_bnode_bag_o_appr = BNode()
        g.add((URIRef("https://data.corpus-nummorum.eu/api/designs/"+str(id_o)), URIRef(prefix_dict["nmo"]+"hasAppearance"), design_bnode_bag_o_appr))

        # Designs --> nlp_bag (hasIconography)
        design_bnode_bag_o_icon = BNode()
        g.add((URIRef("https://data.corpus-nummorum.eu/api/designs/"+str(id_o)), URIRef(prefix_dict["nmo"]+"hasIconography"), design_bnode_bag_o_icon))
    
        # Design --> nlp_bag (blank node)
        # creating blank node for the bag of nlp words and labels over DesignID of cnt_pipeline_url_id table 
        g.add((design_bnode_bag_o_icon, URIRef(prefix_dict["rdf"]+"type"), URIRef(prefix_dict["rdf"]+"Bag")))
        g.add((design_bnode_bag_o_appr, URIRef(prefix_dict["rdf"]+"type"), URIRef(prefix_dict["rdf"]+"Bag")))

        ################################
        # Named Entity Recognition
        ################################
        # select the named entities of the design
        cursor.execute("Select entity_url,entity,label_entity from cnt_pipeline_ner_url where design_id = {};".format(int(id_o))) 
        for res in cursor:
            # bag -> named entity
            g.add((design_bnode_bag_o_appr, URIRef(prefix_dict["rdf"]+"li"), URIRef(res[0])))
            g.add((URIRef(res[0]), URIRef(prefix_dict["skos"]+"prefLabel"), Literal(res[1], datatype=XSD.string)))

            # create labels
            try:
                cursor2.execute("select relation,relation_url from cnt_pipeline_url where design_id = {};".format(int(id_o)))
                query_result = cursor2.fetchall()
                relation_query = check_for_none(query_result, "select relation,relation_url from cnt_pipeline_url, subject where design_id = {};.format(int(id_o))")

                g.add((URIRef(relation_query[0][1]), URIRef(prefix_dict["skos"]+"prefLabel"), Literal(relation_query[0][0], datatype=XSD.string)))

                # create predicate labels
                for relation in relation_query:
                    cursor2.execute("select id from nlp_list_verb where name_en = '{}';".format(str(relation[0])))
                    query_result = cursor2.fetchall()
                    result = check_for_none(query_result, "select id from nlp_list_verb where name_en = '{}';.format(str(result[0]))")
                    g.add((URIRef(relation_query[0][1]), URIRef(prefix_dict["skos"]+"prefLabel"), Literal("predicate_id="+str(result[0][0]))))

            except IndexError:
                # in case no relation was found in the description
                pass
            
            # entity is a person
            if str(res[2]).lower() == "person":
                # retrieve id from the name or the alternativenames column
                try: 
                    cursor2.execute("select id from nlp_list_person where name like '{}';".format(str(res[1]).lower()))
                    query_result = cursor2.fetchall()
                    result = check_for_none(query_result, "select id from nlp_list_person where name   like '{}';.format(str(res[1]).lower())")                 
                    g.add((URIRef(res[0]), URIRef(prefix_dict["dcterms"]+"identifier"), Literal("subject_id="+str(result[0][0]))))

                    # add cat I, cat II, cat III, cat IV and/or cat V
                    # get the values of the categories
                    cursor2.execute("select Cat_I, Cat_II, Cat_III, Cat_IV, Cat_V from nlp_list_person where name like '{}';".format(str(res[1]).lower()))
                    query_result = cursor2.fetchall()
                    result = check_for_none(query_result, "select Cat_I, Cat_II, Cat_III, Cat_IV, Cat_V from nlp_list_person where name like '{}';.format(str(res[1]).lower())")        
                    
                    add_categories(g, result, res, cursor2)

                except IndexError:
                    cursor2.execute("select id from nlp_list_person where alternativenames like '%{}%';".format(str(res[1]).lower()))
                    query_result = cursor2.fetchall()
                    result = check_for_none(query_result, "select id from nlp_list_person where alternativenames  like '%{}%';.format(str(res[1]).lower())")              
                    g.add((URIRef(res[0]), URIRef(prefix_dict["dcterms"]+"identifier"), Literal("subject_id="+str(result[0][0]))))
                    
                    # add cat I, cat II, cat III, cat IV and/or cat V
                    # get the values of the categories
                    cursor2.execute("select Cat_I, Cat_II, Cat_III, Cat_IV, Cat_V from nlp_list_person where alternativenames like '%{}%';".format(str(res[1]).lower()))
                    query_result = cursor2.fetchall()
                    result = check_for_none(query_result, "select Cat_I, Cat_II, Cat_III, Cat_IV, Cat_V from nlp_list_person where alternativenames like '%{}%';.format(str(res[1]).lower())")
                    
                    add_categories(g, result, res, cursor2)
            
            # entity is an animal
            elif str(res[2]).lower() == "animal":
                # retrieve id from the name or the alternativenames column
                try: 
                    cursor2.execute("select id from nlp_list_animal where name_en like '{}';".format(str(res[1]).lower()))
                    query_result = cursor2.fetchall()
                    result = check_for_none(query_result, "select id from nlp_list_animal where name_en like '{}';.format(str(res[1]).lower())")
                    g.add( (URIRef(res[0]), URIRef(prefix_dict["dcterms"]+"identifier"), Literal("object_id="+str(result[0][0]))))

                    # add cat I and/or cat II
                    # get the values of the categories
                    cursor2.execute("select Cat_I, Cat_II from nlp_list_animal where name_en like '{}';".format(str(res[1]).lower()))
                    query_result = cursor2.fetchall()
                    result = check_for_none(query_result, "select Cat_I, Cat_II from nlp_list_animal where name_en like '{}';.format(str(res[1]).lower())")  

                    add_categories(g, result, res, cursor2)

                except IndexError:
                    cursor2.execute("select id from nlp_list_animal where alternativenames_en  like '%{}%';".format(str(res[1]).lower()))
                    query_result = cursor2.fetchall()
                    result = check_for_none(query_result, "select id from nlp_list_animal where alternativenames_en  like '%{}%';.format(str(res[1]).lower())")  
                    g.add( (URIRef(res[0]), URIRef(prefix_dict["dcterms"]+"identifier"), Literal("object_id="+str(result[0][0]))))

                    # add cat I and/or cat II
                    # get the values of the categories
                    cursor2.execute("select Cat_I, Cat_II from nlp_list_animal where alternativenames_en  like '%{}%';".format(str(res[1]).lower()))
                    query_result = cursor2.fetchall()
                    result = check_for_none(query_result, "select Cat_I, Cat_II from nlp_list_animal where alternativenames_en  like '%{}%';.format(str(res[1]).lower())")   

                    add_categories(g, result, res, cursor2)

            # entity is an object
            elif str(res[2]).lower() == "object":
                # retrieve id from the name or the alternativenames column   
                try: 
                    cursor2.execute("select id from nlp_list_obj where name_en like '{}';".format(str(res[1]).lower()))
                    query_result = cursor2.fetchall()
                    result = check_for_none(query_result, "select id from nlp_list_obj where name_en like '{}';.format(str(res[1]).lower())")
                    g.add( (URIRef(res[0]), URIRef(prefix_dict["dcterms"]+"identifier"), Literal(str(res[2]).lower()+"_id="+str(result[0][0]))))

                    # add cat I and/or cat II
                    # get the values of the categories
                    cursor2.execute("select Cat_I, Cat_II, Cat_III from nlp_list_obj where name_en like '{}';".format(str(res[1]).lower()))
                    query_result = cursor2.fetchall()
                    result = check_for_none(query_result, "select Cat_I, Cat_II, Cat_III from nlp_list_obj where name_en like '{}';.format(str(res[1]).lower())")  

                    add_categories(g, result, res, cursor2)

                except IndexError:
                    cursor2.execute("select id from nlp_list_obj where alternativenames_en  like '%{}%';".format(str(res[1]).lower()))
                    query_result = cursor2.fetchall()
                    result = check_for_none(query_result, "select id from nlp_list_obj where alternativenames_en  like '%{}%';.format(str(res[1]).lower())")  
                    g.add( (URIRef(res[0]), URIRef(prefix_dict["dcterms"]+"identifier"), Literal(str(res[2]).lower()+"_id="+str(result[0][0]))))

                    # add cat I and/or cat II
                    # get the values of the categories
                    cursor2.execute("select Cat_I, Cat_II from nlp_list_obj where alternativenames_en like '%{}%';".format(str(res[1]).lower()))
                    query_result = cursor2.fetchall()
                    result = check_for_none(query_result, "select Cat_I, Cat_II from nlp_list_obj where alternativenames_en like '{}';.format(str(res[1]).lower())")  
                    
                    add_categories(g, result, res, cursor2)
        
            # entity is a plant
            else:
                # retrieve id from the name or the alternativenames column       
                try: 
                    cursor2.execute("select id from nlp_list_plant where name_en like '{}';".format(str(res[1]).lower()))
                    query_result = cursor2.fetchall()
                    result = check_for_none(query_result, "select id from nlp_list_plant where name_en like '{}';.format(str(res[1]).lower())")
                    g.add( (URIRef(res[0]), URIRef(prefix_dict["dcterms"]+"identifier"), Literal(str(res[2]).lower()+"_id="+str(result[0][0]))))

                    # add cat I and/or cat II
                    # get the values of the categories
                    cursor2.execute("select Cat_I, Cat_II from nlp_list_plant where name_en like '{}';".format(str(res[1]).lower()))
                    query_result = cursor2.fetchall()
                    result = check_for_none(query_result, "select Cat_I, Cat_II from nlp_list_plant where name_en like '{}';.format(str(res[1]).lower())")  
                    
                    add_categories(g, result, res, cursor2)

                except IndexError:
                    cursor2.execute("select id from nlp_list_plant where alternativenames_en  like '%{}%';".format(str(res[1]).lower()))
                    query_result = cursor2.fetchall()
                    result = check_for_none(query_result, "select id from nlp_list_plant where alternativenames_en  like '%{}%';.format(str(res[1]).lower())")  
                    g.add( (URIRef(res[0]), URIRef(prefix_dict["dcterms"]+"identifier"), Literal(str(res[2]).lower()+"_id="+str(result[0][0]))))
                    # add cat I and/or cat II
                    # get the values of the categories
                    cursor2.execute("select Cat_I, Cat_II from nlp_list_plant where alternativenames_en  like '%{}%';".format(str(res[1]).lower()))
                    query_result = cursor2.fetchall()
                    result = check_for_none(query_result, "select Cat_I, Cat_II from nlp_list_obj where alternativenames_en  like '%{}%';.format(str(res[1]).lower())")  

                    add_categories(g, result, res, cursor2)

        ###############################
        # Relationship Extraction
        ################################
        # select the entries of the design
        cursor.execute("Select id, subject_url, object_url, relation_url from cnt_pipeline_url where design_id = {};".format(int(id_o)))
        for entry in cursor:
            # blank node for current entry
            curr_b_node = BNode()

            # assign entries the Statement class
            g.add((curr_b_node, URIRef(prefix_dict["rdf"]+"type"), URIRef(prefix_dict["rdf"]+"Statement")))           

            #  nlp_bag --> entry
            g.add((design_bnode_bag_o_icon, URIRef(prefix_dict["rdf"]+"li"), curr_b_node))

    	    # create triples
            g.add((curr_b_node, URIRef(prefix_dict["rdf"]+"subject"), URIRef(entry[1])))
            g.add((curr_b_node, URIRef(prefix_dict["rdf"]+"object"), URIRef(entry[2])))
            g.add((curr_b_node, URIRef(prefix_dict["rdf"]+"predicate"), URIRef(entry[3])))
            
def create_hierachy(g, cursor, property_set, class_set):
    """
    Maps the content of nlp_hierarchy table
    Args:
        g            : the rdf graph
        cursor       : mysql cursor
        property_set : holds the different properties
        class_set    : holds the different classes
    """
    cursor.execute("Select class, superclass, class_uri, superclass_uri from nlp_hierarchy;") 
    for (c,sc,cu,scu) in cursor:
        g.add((URIRef(cu), URIRef(prefix_dict["skos"]+"prefLabel"), Literal(c, datatype=XSD.string)))
        g.add((URIRef(cu), URIRef(prefix_dict["rdf"]+"type"), URIRef(prefix_dict["rdfs"]+"Class")))
        g.add((URIRef(cu), URIRef(prefix_dict["rdfs"]+"subClassOf"), URIRef(scu)))

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

def serialize_graph(g):
    """
    Creates the output file by serializing the graph.

    Args:
        g : the rdf graph
    """
    print("Started serializing!")
    g.serialize(destination="/home/bigdatalab/Projects/D4N4/NLP/rdf/" + "output_all_coins.ttl", format="nt", encoding="utf-8")

def create_graph(ids, params):
    """
    This function executes the different mapping functions and
    establishes a connection to the database.
    
    Args:
        ids : array of coin ids
    """

    g = Graph()

    # fill out with your own data
    mysql_param = params
    mydb = mysql.connector.connect(**mysql_param
    #host = "HOST",
    #user = "USERNAME",
    #password = "PASSWORD",
    #database="DATABASE NAME"
    )
    cursor = mydb.cursor(buffered=True)

    # used for executing sql statements when iterating over the first cursor
    cursor2 = mydb.cursor(buffered=True) 

    # holds the different properties
    property_set = set()

    # holds the different classes
    class_set = set()

    if ids == "all":
        cursor.execute("Select id from data_coins;")
        query_result = cursor.fetchall()
        ids = [x[0] for x in query_result]

    for id in ids:
        map_coin(g, cursor, id, property_set, class_set)
        map_designs(g, cursor, id, property_set)
        map_reverse_nlp(g, cursor, cursor2, id, property_set, class_set)
        map_obverse_nlp(g, cursor, cursor2, id)

    create_hierachy(g, cursor, property_set, class_set)
    create_prop_class(g, property_set, class_set)
    serialize_graph(g)
