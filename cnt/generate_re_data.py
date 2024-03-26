import pandas as pd
import random as rand



class AutoRE():
    
    def __init__(self):
        self.subjects = []
        self.relations = {}
        
    def set_subjects(self, subjects):
        self.subjects = subjects
        
    def set_relations(self, relations):
        self.relations = relations
        
        
    def generate(self, samples):
        df = pd.DataFrame(columns=["design_en", "y"])
        while df.shape[0] <samples:
            s = rand.choice(self.subjects)
            p = rand.choice(list(self.relations.keys()))
            o = rand.choice(self.relations[p])
            
            df = df.append({"design_en":s+" "+p.replace("_"," ")+" "+o+".","y": (s,p,o)}, ignore_index=True)
            df.drop_duplicates(inplace=True)
        return df