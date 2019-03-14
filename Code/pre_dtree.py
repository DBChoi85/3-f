import pandas as pd
import re
import csv
import openpyxl

import sys
import io
import os

sys.stdout = io.TextIOWrapper(sys.stdout.detach(), encoding = 'utf-8')
sys.stderr = io.TextIOWrapper(sys.stderr.detach(), encoding = 'utf-8')


PATH = 'C:\\Users\\aiia\\.atom\\python\\data_keyword\\'
ori_data = '2017categori.xlsx'
ori = pd.read_excel(PATH + ori_data, sheet_name='전부') # 2017년도 자료
keyword_data = 'keyword_table.xlsx'
key = pd.read_excel(PATH + keyword_data)
#extra_data = '3friend_extra_data.xlsx'
#print(key)
#print(len(key))

categori_name = list(key)
for z in categori_name:

    for j in range(len(key)):
        keyword = str(key.loc[j, z])
        print(keyword)
        if keyword == 'nan' : break
        p = re.compile(keyword)
        for i in range(len(ori)):
            b = str(ori.loc[i, '품명'])
            a = p.search(b)
            if a != None:
                #print(a, i)
                ori.loc[i, 'c'] = z
ori.to_excel("2017categori_test(전부).xlsx")
#print(ori)

'''
p = re.compile('요금')

ori = pd.read_excel(PATH + ori_data, sheet_name='전부') # 2017년도 자료
#extra_1 = pd.read_excel(PATH + extra_data, sheet_name='전자세금계산서', usecols='n') # 2018년도 자료
#extra_2 = pd.read_excel(PATH + extra_data, sheet_name='전자계산서', usecols='l') # 2018년도 자료


#a = p.sub('요금', ori.loc[1, '품명'])
#print(a)

count = 0

for i in range(len(ori)):
    b = str(ori.loc[i, '품명'])
    a = p.search(b)
    if a != None:
        print(a, i)
        ori.loc[i, 'c'] = 1
ori.to_excel("2017categori_1.xlsx")
'''
