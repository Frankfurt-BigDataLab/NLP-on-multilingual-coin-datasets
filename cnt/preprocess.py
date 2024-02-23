import pandas as pd
import re
import pickle


class Preprocess():

    def __init__(self, rules={}):
        self.rules = rules
        self.rules_applied = {}

    def add_rule(self, original, preprocessed):
        # add rule - at the moment its only a simple replace operation
        self.rules[original] = preprocessed

    def preprocess_design_old(self, design, id):
        # check which entitie exists in the defined rules
        for preprocessed in self.rules:
            if preprocessed in design:
                if id in self.rules_applied:
                    self.rules_applied[id].append(preprocessed) # add applied rule
                else:
                    self.rules_applied[id] = []
                    self.rules_applied[id].append(preprocessed) # add applied rule if it is the first one applied

            design = design.replace(preprocessed, self.rules[preprocessed]) # do a simple replace operation

        return design
    
    def preprocess_design(self, design, id):
        # check which entitie exists in the defined rules
        for preprocessed in self.rules:
            if re.search(r"\b%s\b" %preprocessed, design, flags=re.IGNORECASE):
                if id in self.rules_applied:
                    self.rules_applied[id].append(preprocessed) # add applied rule
                else:   
                    self.rules_applied[id] = []
                    self.rules_applied[id].append(preprocessed) # add applied rule if it is the first one applied

            design = re.sub(r"\b%s\b" %preprocessed, self.rules[preprocessed], design, flags=re.IGNORECASE)
        if design[0].islower():
            design = design[0].upper() + design[1:]
        return design

    def map_back_design(self, design, id):
        # check which rules where applied and replace back
        rules_applied = self.rules_applied[id]
        rules_applied = reversed(rules_applied)
        for preprocessed in rules_applied:
            design = re.sub(r"\b%s\b" %self.rules[preprocessed], preprocessed, design, flags=re.IGNORECASE)
            #design = design.replace(self.rules[preprocessed], preprocessed) 
        if design[0].islower():
            design = design[0].upper() + design[1:]
        return design

    def map_result_ner(self, design, result, id):
        # map back ner results and find original indizes
        mapped = []
        rules_applied = self.rules_applied[id]
        rules_applied = reversed(rules_applied)
        local_rules = {}
        for i in rules_applied:
            local_rules[self.rules[i]] = i

        to_map = []
        label = {}
        for res in result:
            token = design[res[0]: res[1]]
            if token in local_rules.keys():
                token = local_rules[token]
                to_map.append(token)
                label[token] = res[2]
            # Handling for tokens at the beginning of the sentence
            if token[0].lower() + token[1:] in local_rules.keys():
                token = local_rules[token[0].lower() + token[1:]]
                to_map.append(token[0].upper() + token[1:])
                label[token[0].upper() + token[1:]] = res[2]
            else:
                to_map.append(token)
                label[token] = res[2]

        design = self.map_back_design(design, id)
        regex = r'\b' + '(' + "|".join(to_map) + ')' + r'\b'
        occurences = re.finditer(regex, design, flags=re.IGNORECASE)
        mapped = [(match.start(), match.end(), label[design[match.start():match.end()]]) for match in occurences]

        return mapped


    def save_applied_rules(self, rules_file="rules_defined.pickle", rules_applied_file="rules_applied.picke"):
        filehandler = open(rules_applied_file,"wb")
        pickle.dump(self.rules_applied,filehandler)
        filehandler.close()

        filehandler = open(rules_file,"wb")
        pickle.dump(self.rules,filehandler)
        filehandler.close()

    def load_applied_rules(self, rules_file="rules_defined.pickle", rules_applied_file="rules_applied.picke"):
        file = open(rules_applied_file,'rb')
        self.rules_applied = pickle.load(file)
        file.close()
        file = open(rules_file,'rb')
        self.rules = pickle.load(file)
        file.close()