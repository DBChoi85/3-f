from keras.datasets import cifar10
from keras.utils import np_utils
from keras.models import Sequential, load_model
from keras.layers import Dense, Dropout, Flatten, Conv2D, MaxPooling2D, BatchNormalization, Activation
from keras.callbacks import ModelCheckpoint, TensorBoard
from PIL import Image
import win32com.client

import numpy as np
import pandas as pd
import os
import csv
import tensorflow as tf
import matplotlib.pyplot as plt


labels_count =  10
no_ = 31
list_acc =[]
#list_pre =np.zeros((no_, 1000))


excel = win32com.client.Dispatch("Excel.Application")

excel_file = excel.Workbooks.Open('C:\\Users\\aiia\\.atom\\python\\CIFER-10\\bagging_data.xlsx')
w_sheet = excel_file.Activesheet

def editer(num, acc):
    for i in range(1,1001):
        if w_sheet.Cells(i,num).Value==None :
            w_sheet.Cells(i,num).Value=acc
            break



def sampling(teX, teY, label):

    SIZE = 1000
    teX_2 = np.empty((SIZE, 32, 32, 3), dtype=np.float32)
    teY_2 = np.empty((SIZE), dtype=np.int)
    #trY_2 = np.zeros((SIZE), dtype=np.int)

    count3 = 0
    count5 = 0
    count = 0
    index = 0

    for i in range(len(teY)):
        #if index == 40100 : break
        #print(trY[i])
        if teY[i] == label:
            count3 += 1
            teX_2[index] = teX[i]
            teY_2[index] = teY[i]
            index += 1

    return teX_2, teY_2

(trX, trY), (tex, tey) = cifar10.load_data()

for i in range(no_):
    index = 6
    count_ = 0
    model = load_model('./model_test/model_num_%d.h5' %i)
    for ind_ in range(1000):

        teX_2 = np.empty((1, 32, 32, 3), dtype=np.float32)
        teY_2 = np.empty((1,10), dtype=np.int)
        teX, teY = sampling(tex,tey,index)

        teY = np_utils.to_categorical(teY, labels_count)
        teX = teX.astype('float32')
        teX /= 255

        teX_2[0] = teX[ind_]
        teY_2[0] = teY[ind_]
        #print(np.shape(teX_2))

        emnist1_acc = model.evaluate(teX_2, teY_2)
        e1_acc = emnist1_acc[1]

        #print("\n%d Acc: %.4f" % (i,e1_acc))
        #print(emnist1_acc)
        #list_acc.append(e1_acc)

        predict = model.predict(teX_2)
        predict = predict.argmax(axis = -1)
        if predict == index: editer(i+1, 1)  # func 실행
        else : editer(i+1, 0)  # func 실행

excel_file.Save()
excel.Quit()

#print(list_acc)
#[0.463, 0.093, 0.01, 0.073, 0.001, 0.819, 0.244, 0.044, 0.277, 0.354]
