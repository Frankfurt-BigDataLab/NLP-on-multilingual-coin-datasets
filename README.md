# NLP-on-multilingual-coin-descriptions
-----------

### Experimental: You can try it as a human: [Open under Corpus Numorum](https://www.corpus-nummorum.eu/resources/nlp)
or test it in Colab:
[![Open In Colab](https://colab.research.google.com/assets/colab-badge.svg)](https://colab.research.google.com/github/Frankfurt-BigDataLab/NLP-on-multilingual-coin-datasets/blob/main/Colab/NER.ipynb)

### Use it in your code via FastAPI:
There is also a FastAPI were you can POST requests with parameters in a JSON block: https://data.corpus-nummorum.eu/api/nlp#/default/
Providing:
- /ner/ Named Entity Recognition
- /re/ Predict Relation Extraction
- /rdf/ The generation of a RDF representation for NER and RE


-----------
Access relevant information from iconographies of the Corpus Numorum Online using natural language processing. Improvement of named entity recognition, followed by the extraction of relationships for the entity types "PERSON", "OBJECT", "ANIMAL" and "PLANT".
-----------
# Requirements:

- python          3.8.12
- pandas          1.3.3 
- spacy           2.3.7 
- scikit-learn       0.24.2
- SQL database

-----------
## Credits
This project is based on a number of theses:
- Patricia Klinger: [Natural Language Processing to enable semantic search on numismatic descriptions](http://www.bigdata.uni-frankfurt.de/wp-content/uploads/2021/11/Bachelorthesis-Patricia-Klinger-final-version.pdf).

- Sebastian Gampe: [Kombination maschineller Lernmethoden der Bild- und Texterkennung auf antiken Münzdaten ](http://www.bigdata.uni-frankfurt.de/wp-content/uploads/2021/11/Arbeit_Sebastian_finale_Fassung_28_03_19-1.pdf) 

- Kerim Gencer und Chrisowalandis Deligio: [Natural Language Processing auf mehrsprachigen Münzdatensätzen – Untersuchung der Qualität, Datenqualität und Übertragbarkeit auf andere Datensätze](http://www.bigdata.uni-frankfurt.de/wp-content/uploads/2021/11/Masterthesis_Deligio_Gencer_DBISOnline.pdf)

-----------
## Reference
- https://www.corpus-nummorum.eu/
- http://numismatics.org/ocre/
- Patricia Klinger, Sebastian Gampe, Karsten Tolle, Ulrike Peter (2018). Semantic Search based on Natural Language Processing – a Numismatic example. Journal of Ancient History and Archaeology (JAHA) Vol 5 No. 3 (2018) 68-79 (DOI: 10.14795/j.v5i3.334, http://jaha.org.ro/index.php/JAHA/article/view/334/244)
