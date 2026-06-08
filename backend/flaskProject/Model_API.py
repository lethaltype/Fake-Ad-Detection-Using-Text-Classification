from sklearn.feature_extraction.text import TfidfVectorizer
import joblib
from Preprocessing import pre_Processing
from Scrapping import Seller_Comment
from sklearn.model_selection import train_test_split
import pandas as pd
from sklearn import model_selection

def predict_ML(url):
    seller_comment = Seller_Comment(url)
    # print(seller_comment)
    com = pre_Processing(seller_comment)
    com = ' '.join(map(str, com))
    # print(com)

    dataset_train = "MyDF.csv"
    df = pd.read_csv(dataset_train)

    # ngram level tf-idf
    tfidf_vect_ngram = TfidfVectorizer(analyzer='word', token_pattern=r'\w{1,}', ngram_range=(2,3), max_features=5000)
    tfidf_vect_ngram.fit(df['text'].fillna(''))
    # load the model from disk
    model = joblib.load('Navie_ngram.sav')
    tfidf_t=tfidf_vect_ngram.transform([com])

    prediction=model.predict(tfidf_t)
    # print(prediction)
    results = ' '.join([str(elem) for elem in prediction])
    # print(results)
    return results
