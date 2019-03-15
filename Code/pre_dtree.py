import pandas as pd
import re
import csv
import openpyxl

import sys
import io
import os

sys.stdout = io.TextIOWrapper(sys.stdout.detach(), encoding = 'utf-8')
sys.stderr = io.TextIOWrapper(sys.stderr.detach(), encoding = 'utf-8')

PATH = 'c:\\3-f\\3friend_raw_data\\'
excel_PATH = 'c:\\3-f\\excel_data\\'
ori_data = '3friend_raw_data.xlsx'
extra_data = '3friend_extra_data.xlsx'
test_dtree_excel = 'test_dtree.xlsx'
keyword_data = 'keyword_table.xlsx'


ori = pd.read_excel(PATH + extra_data, sheet_name='전자계산서') # 2018년도 자료

key = pd.read_excel(excel_PATH + keyword_data)
#extra_data = '3friend_extra_data.xlsx'
#print(key)
#print(len(key))

#base = ori.loc[:, ['회사명', '사업자번호', '거래처', '사업자등록번호', '품명']]

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

#merge = pd.merge(base, ori, how='inner', on='품명')
ori.to_excel("categori_test.xlsx")


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
