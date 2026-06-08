from nltk.stem import WordNetLemmatizer
import re
import inflect
import string
from nltk.corpus import stopwords
from nltk.stem import PorterStemmer
from nltk.tokenize import word_tokenize
from Scrapping import Seller_Comment


# Convert text to lowercase
def text_lowercase(text):
    return text.lower()


# Numbers removing
# Remove numbers
def remove_numbers(text):
    result = re.sub(r'\d+', '', text)
    return result


# numbers in words
p = inflect.engine()


# convert number into words
def convert_number(text):
    # split string into list of words
    temp_str = text.split()
    # initialise empty list
    new_string = []

    for word in temp_str:
        # if word is a digit, convert the digit
        # to numbers and append into the new_string list
        if word.isdigit():
            temp = p.number_to_words(word)
            new_string.append(temp)

        # append the word as it is
        else:
            new_string.append(word)

    # join the words of new_string to form a string
    temp_str = ' '.join(new_string)
    return temp_str


# Punctuation removal
# remove punctuation
def remove_punctuation(text):
    translator = str.maketrans('', '', string.punctuation)
    return text.translate(translator)


# White spaces removal
# remove whitespace from text
def remove_whitespace(text):
    return " ".join(text.split())


# Stop words removal
# remove stopwords function
def remove_stopwords(text):
    stop_words = set(stopwords.words("english"))
    word_tokens = word_tokenize(text)
    filtered_text = [word for word in word_tokens if word not in stop_words]
    return filtered_text


# Stemming using NLTK:

stemmer = PorterStemmer()


# stem words in the list of tokenised words
def stem_words(text):
    # word_tokens = word_tokenize(text)
    stems = [stemmer.stem(word) for word in text]
    return stems


# Lemmatization using NLTK:
lemmatizer = WordNetLemmatizer()


# lemmatize string
def lemmatize_word(text):
    # word_tokens = word_tokenize(text)
    # provide context i.e. part-of-speech
    lemmas = [lemmatizer.lemmatize(word, pos='v') for word in text]
    return lemmas


def pre_Processing(in_string):
    input = in_string
    lc_string = text_lowercase(input)
    # rn_string=remove_numbers(lc_string)
    rp_string = remove_punctuation(lc_string)
    cn_string = convert_number(rp_string)
    rw_string = remove_whitespace(cn_string)
    rs_string = remove_stopwords(rw_string)
    # print(rs_string)
    sw_string = stem_words(rs_string)
    # lemmatize_string=lemmatize_word(sw_string)
    # print(sw_string)
    return sw_string
