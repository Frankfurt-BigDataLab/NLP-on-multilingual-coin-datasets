from re import split
from cnt.annotate import (annotate_designs)
from cnt.nlp_annotate import (nlp_annotate_designs)
from cnt.nlp_evaluations import (transform_scores_from_dataframe_eng, get_all_scores, group_annotations)



class Stem_Lemma_Annotatizer():

	def __init__(self, method="lemma_stem", language="en", backbone="spacy_snowball"):
		self.method = method
		self.language = language
		self.backbone = backbone


	def annotate(self, designs, entities, id_col, design_col):
		return nlp_annotate_designs(entities, designs, self.language, self.method, id_col, design_col)