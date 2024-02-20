import pandas as pd



class Database_Connection():
    def __init__(self, mysql_connection):
        """
        mysql database connection to send queries using pandas

        mysql_connection format: mysql+mysqlconnector://USER@IP/DATABASE
            Replace USER,IP and DATABASE with your data.")
            For example: mysql+mysqlconnector://user:@127.0.0.1:3306/CNO
        """
        
        self.mysql_connection = mysql_connection

    def load_designs_from_db(self, table_name, column_list):
        """
        input:  table_name: Name of the mysql table
                column_list: A list containing all columns for the query, example: [ID, Name]

        return: pandas dataframe
        """
        select_query = ','.join(map(str, column_list))

        try:
            table = pd.read_sql_query("select " + select_query + " from " + table_name, self.mysql_connection)

        except:
             print("SQL query failed.")
             return

        return table

    def load_entities_from_db(self, table_name, column_list, columns_multi_entries=[], delimiter="", has_delimiter=False):
        """
        input:  table_name: Name of the mysql table
                column_list: A list containing all columns for the query, example: [ID, Name]
                columns_multi_entries: A list containing all columns having more than one element in a string, example "Alexander, Alexander the Great"
                delimiter, for example a comma
                has_delimiter: If there is a column with multi entries, set this parameter to true
        output: List containing all entities 
        """
        select_query = ','.join(map(str, column_list))

        try:
            table = pd.read_sql_query("select " + select_query + " from " + table_name, self.mysql_connection)

        except:
            print("SQL query failed.")


        columns_without_multi = list(set(column_list) - set(columns_multi_entries))

        exists = False
        values = []
        for column in columns_without_multi:
            if exists == False:
                values += table[column].tolist()
                exists = True
            else:
                values += table[column].tolist()
    
        if has_delimiter == True:
            for multi_column in columns_multi_entries:
                columns_with_multi = table[multi_column]
                multi_values = sum(columns_with_multi.fillna("").str.split(delimiter), [])
                values += multi_values

        return self.preprocess_entities(values)


    def preprocess_entities(self, entities):
        entities = [str(entity).strip() for entity in entities if entity !=None]
        entities = [entity for entity in entities if len(entity) > 0]
        capitalized_entities = [entity.capitalize() for entity in entities]
        entities += capitalized_entities
        # added sorting 2023_06_28
        entities.sort(key=len, reverse=True)
        return entities


    def create_own_query(self, query):
        try:
            return pd.read_sql_query(query, self.mysql_connection)

        except:
            print("SQL query failed.")













### This part must still be updated.
def replace_left_right_single_design(design):
    """
    preprocesses the data by replacing r. and l.

    Parameters
    -----------

    design: string
        the input sentence
    """
    a = design.strip()
    b = a.replace(" l.", " left")
    c = b.replace(" r.", " right")
    if not c.endswith("."):
        d = c + "."
    else:
        d = c
    return d

def replace_left_right_list_of_designs(designs):
    """
    Parameters
    ----------

    designs: list of strings
    """
    preprocessed_designs = []
    for design in designs:
        preprocessed_designs.append(replace_left_right_single_design(design))
    return preprocessed_designs

def replace_left_right(design):
    """
    Parameters
    ----------

    design: string or list of strings
    """
    if isinstance(design, str):
        return replace_left_right_single_design(design)
    elif isinstance(design, list):
        return replace_left_right_list_of_designs(design)
    elif isinstance(design, pd.DataFrame):
        res = design.copy()
        res["DesignEng"] = design["DesignEng"].map(replace_left_right_single_design)
        return res
    else:
        raise Exception("replace_left_right only accepts str of list of str as input")
