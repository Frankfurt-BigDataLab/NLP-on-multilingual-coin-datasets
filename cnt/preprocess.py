import pandas as pd
import re



class Preprocess():

	def __init__(self, rules={}):
		self.rules = rules
		self.rules_applied = {}

	def add_rule(self, original, preprocessed):
		self.rules[original] = preprocessed

	def preprocess_design(self, design, id):
		for preprocessed in self.rules:
			if preprocessed in design:
				if id in self.rules_applied:
					self.rules_applied[id].append(preprocessed)
				else:
					self.rules_applied[id] = []
					self.rules_applied[id].append(preprocessed)

			design = design.replace(preprocessed, self.rules[preprocessed])

		return design

	def map_back_design(self, design, id):
		rules_applied = self.rules_applied[id]
		for preprocessed in rules_applied:
			design = design.replace(self.rules[preprocessed], preprocessed)

		return design

	def map_result_ner(self, design, result, id):

		mapped = []
		rules_applied = self.rules_applied[id]
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
			else:
				to_map.append(token)
			label[token] = res[2]

		design = self.map_back_design(design, id)
		regex = r'\b' + '(' + "|".join(to_map) + ')' + r'\b'
		occurences = re.finditer(regex, design)
		mapped= [(match.start(), match.end(), label[design[match.start():match.end()]]) for match in occurences]


		return mapped
