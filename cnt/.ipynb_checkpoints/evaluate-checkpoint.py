"""
This package contains the implementations discussed in the bachelor thesis 
"Natural Language Processing to enable semantic search on numismatic descriptions".
All code in the cnt package has been developed by Patricia Klinger.
The Code has been modified by Kerim Gencer and Chrisowalandis Deligio, discussed in the master thesis
"Natural Language Processing auf mehrsprachigen Münzdatensätzen - Untersuchung der Qualität, Datenqualität und Übertragbarkeit auf andere Datensätze".

"""
import pandas as pd

class Metrics():


    def score_precision_recall(self, y_true, y_pred):
        """
        calculates precision and recall of the classifier

        Parameters
        ------------
        y_true: list of lists of (subj, relation_class_label, obj)
            The annotations from the gold standards

        y_pred: list of lists of (subj, relation_class_label, obj)
            The predictions made by the estimator
        """

        true = set((sentence_counter, relation) for sentence_counter, relations in enumerate(y_true["y"])
                                           for relation in relations)

        pred = set((sentence_counter, relation) for sentence_counter, relations in enumerate(y_pred["y"])
                                           for relation in relations)

        recall = len(true & pred) / len(true) if len(true) > 0 else 0
        precision = len(true & pred) / len(pred) if len(pred) > 0 else 0

        return precision, recall


    def score_accuracy(self, y_true, y_pred, ignore_order=True):
        """
        Percentage of annotated input data that 
        is labeled correctly by the estimator

        Parameters 
        ------------

        y_true: column of a data frame
            The annotations from the gold standards
        
        y_pred: column of a data frame
            The predictions made by the estimator
        """
        if ignore_order:
            sort = set
        else:
            sort = lambda x: x
        
        counter = 0
        for a, b in zip(y_pred["y"], y_true["y"]):
            if sort(a) == sort(b):
                counter += 1
        accuracy = counter/len(y_pred)
        return accuracy



    def to_set(self, y):
        """
        transform the target to a set
        """
        new_set = set((sentence_counter, relation) for sentence_counter, relations in enumerate(y["y"])
                   for relation in relations)
        return new_set


    def entity_score(self, true, pred, entity):
        """
        calculate the true positive and false positive class
        """
        entity_true = []
        entity_pred = []

        for i in true:
            if i[1][2] == entity:
                entity_true.append(i)
        for i in pred:
            if i[1][2] == entity:
                entity_pred.append(i)

        entity_true = set(entity_true)
        entity_pred = set(entity_pred)

        if len(true) > 0:
            total = len(entity_true)
            hits = len(entity_true & entity_pred)
        else:
            0
        if len(pred) > 0:
            wrongs = len(entity_pred - entity_true)
        else:
            0

        return total, hits, wrongs

    def create_score_frame(self, true, pred, labels):

        scores= {}

        for label in labels:
            scores[label] = self.entity_score(self.to_set(true), self.to_set(pred), label)

        n = []
        total = []
        hits = []
        wrongs = []
        for i in scores:
            n.append(i)
            total.append(scores[i][0])
            hits.append(scores[i][1])
            wrongs.append(scores[i][2])

        frame = pd.DataFrame({" ": n, "Total(TP+FN)": total, "Hits(TP)": hits, "Wrongs(FP)": wrongs})
        frame['%'] = frame.apply(lambda row: round(row['Hits(TP)']/row['Total(TP+FN)'],3)*100,axis=1)
        return frame


    def entity_prec_rec_f1(self, scores):
        scores_dict = {}
        for i in scores:
            precision = scores[i][1]/(scores[i][1]+scores[i][2])
            recall = scores[i][1]/(scores[i][0])
            f1 = (2*precision*recall)/(precision+recall)
            scores_dict[i] = [precision, recall, f1]

        return scores_dict

    def get_entities(self, true, pred, entity):
        entity_true = []
        entity_pred = []

        for i in true:
            if i[1][2] == entity:
                entity_true.append(i)
        for i in pred:
            if i[1][2] == entity:
                entity_pred.append(i)

        entity_true = set(entity_true)
        entity_pred = set(entity_pred)

        if len(true) > 0:
            total = entity_true
            hits = entity_true & entity_pred
        else:
            0
        if len(pred) > 0:
            wrongs = entity_pred - entity_true
        else:
            0

        return total, hits, wrongs  


    def acc_per_entity(self, true, pred):
        pass