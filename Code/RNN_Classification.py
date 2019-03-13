import numpy as np
import pandas as pd
import tensorflow as tf
from keras.models import Sequential
from keras.layers import Dense, LSTM
from keras.layers.embeddings import Embedding
from keras.preprocessing import sequence


# 글자 최대 수 구하는 함수
def max_lenght(X):
    a = 0
    for i in X:
        b = len(i)
        if b > a:
            a = b
    return a


np.random.seed(7)
max_review_length = 110

PATH = 'C:\\3-f\\NewData\\'
data = pd.read_excel(PATH + "text_test.xlsx")
data_test = pd.read_excel(PATH + "text_test_test.xlsx")

label = data.loc[:, ['계정과목']]
test_label = data_test.loc[:, ['계정과목']]

label.dropna(inplace=True)
index = label['계정과목'].str.split(' ', n=1, expand=True)
label['code'] = index[0]
label['name'] = index[1]

test_label.dropna(inplace=True)
test_index = test_label['계정과목'].str.split(' ', n=1, expand=True)
test_label['code'] = test_index[0]
test_label['name'] = test_index[1]

total_label = pd.concat([label, test_label])
#print(total_label)
num_total_label = np.unique(total_label['code'])
#print(num_total_label)
num_total_label = len(num_total_label)
#print(num_total_label)

pre_Y = label['code']
pre_Y = pd.to_numeric(pre_Y, errors='coerce').astype(np.int64) # str을 int64로 변환
pre_test_Y = test_label['code']
pre_test_Y = pd.to_numeric(pre_test_Y, errors='coerce').astype(np.int64) # 혹시 존재하는 str을 int64로 변경

# train data setting
X = data.loc[:, ['회사명', '사업자번호', '거래처', '사업자등록번호', '품명']]
X = X.applymap(str)
X['text'] = X['회사명'].str.cat(X['사업자번호'])
X['text'] = X['text'].str.cat(X['거래처'])
X['text'] = X['text'].str.cat(X['사업자등록번호'])
X['text'] = X['text'].str.cat(X['품명'])
X = X['text']

# test data setting
test_X = data_test.loc[:, ['회사명', '사업자번호', '거래처', '사업자등록번호', '품명invalid literal for int() with base 10']]
test_X = test_X.applymap(str)
test_X['text'] = test_X['회사명'].str.cat(test_X['사업자번호'])
test_X['text'] = test_X['text'].str.cat(test_X['거래처'])
test_X['text'] = test_X['text'].str.cat(test_X['사업자등록번호'])
test_X['text'] = test_X['text'].str.cat(test_X['품명'])
test_X = test_X['text']

test_X = test_X.copy()
test_X = test_X.apply(str)
test_Y = pre_test_Y.copy()
test_Y = tf.one_hot(test_Y, num_total_label)
X = X.copy()  # 가장 긴 문자 길이는 102
X = X.apply(str)
Y = pre_Y.copy()
Y = tf.one_hot(Y, num_total_label)

print(test_X)

