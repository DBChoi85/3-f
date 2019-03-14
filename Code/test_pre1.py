import pandas as pd
import re
import csv

PATH = 'c:\\3-f\\3friend_raw_data\\'
ori_data = '3friend_raw_data.xlsx'
extra_data = '3friend_extra_data.xlsx'

p = re.compile('요금')

ori = pd.read_excel(PATH + ori_data, sheet_name='전부', usecols='n') # 2017년도 자료
#extra_1 = pd.read_excel(PATH + extra_data, sheet_name='전자세금계산서', usecols='n') # 2018년도 자료
#extra_2 = pd.read_excel(PATH + extra_data, sheet_name='전자계산서', usecols='l') # 2018년도 자료


#a = p.sub('요금', ori.loc[1, '품명'])
#print(a)

for i in range(len(ori)):
    b = str(ori.loc[i, '품명'])
    a = p.search(b)
    print(a)
