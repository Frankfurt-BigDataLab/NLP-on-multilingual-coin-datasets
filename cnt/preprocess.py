# This code has been developed by Chrisowalandis Deligio and Sebastian Gampe.


import pandas as pd
import re
import pickle


class Preprocess():

    def __init__(self, rules={}):
        self.rules = rules
        self.rules_applied = {}

    def add_rule(self, original, preprocessed):
        # add rules for preprocessing
        if (original != ""):
            self.rules[original] = preprocessed

    def preprocess_design_old(self, design, id):
        # check which entities exists in the defined rules
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
        return design, self.rules_applied

    def map_back_design(self, design, id):
        # check which rules where applied and replace back
        rules_applied = self.rules_applied[id]
        rules_applied = reversed(rules_applied)
        for preprocessed in rules_applied:
            design = re.sub(r"\b%s\b" %self.rules[preprocessed], preprocessed, design, flags=re.IGNORECASE)
        if design[0].islower():
            design = design[0].upper() + design[1:]
        return design

    def map_result_ner(self, design, result, id):
        # map back ner results and find original indizes
        mapped = []
        if len(self.rules_applied) == 0:
            return result
        else:
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
            map_len = len(to_map)
            map_combined_label = {}
            # Adding combined entities from nlp result for handling ents like "horseman"
            for i in range(map_len):
                if i == (map_len - 1):
                    break
                combined = to_map[i] + to_map[i+1]
                combined_label = to_map[i] + to_map[i+1], label[to_map[i]], label[to_map[i+1]]
                to_map.append(combined)
                map_combined_label.update({to_map[i] + to_map[i+1]: (label[to_map[i]], label[to_map[i+1]])})

            design = self.map_back_design(design, id)
            regex = r'\b' + '(' + "|".join(to_map) + ')' + r'\b'
            occurences = re.finditer(regex, design, flags=re.IGNORECASE)
            for match in occurences:
                # Check if normal entities are available in dict
                if design[match.start():match.end()] in label.keys():
                    mapped.append((match.start(), match.end(), label[design[match.start():match.end()]]))
                # Check if combined entities are available in extra dict
                if design[match.start():match.end()] in map_combined_label.keys():
                    mapped.append((match.start(), match.end(), map_combined_label[design[match.start():match.end()]][0]))
                    mapped.append((match.start(), match.end(), map_combined_label[design[match.start():match.end()]][1]))

            return mapped

        
    # RE functions
    
    def preprocess_re(self, annotations, design_id):
        if design_id in self.rules_applied:
            for annotation in annotations:
                annotation = list(annotation)
                if annotation[0] in self.rules_applied[design_id]:
                    annotation[0] = self.rules[annotation[0]]
                if annotation[2] in self.rules_applied[design_id]:
                    annotation[2] = self.rules[annotation[2]]
                if annotation[3] in self.rules_applied[design_id]:
                    annotation[3] = self.rules[annotation[3]]
                annotation = tuple(annotation)
        return annotations
    
    def map_re(self, predictions, design_id):
        if design_id in self.rules_applied:

            rules_applied_local = {}
            for i in self.rules_applied[design_id]:
                rules_applied_local[self.rules[i]] = i
            for prediction in predictions:
                prediction = list(prediction)
                if prediction[0] in rules_applied_local:
                    prediction[0] = rules_applied_local[prediction[0]]
                if prediction[2] in rules_applied_local:
                    prediction[2] = rules_applied_local[prediction[2]]
                if prediction[3] in rules_applied_local:
                    prediction[3] = rules_applied_local[prediction[3]]
                prediction = tuple(prediction)
        return predictions

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