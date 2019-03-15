import pandas as pd
import re
import csv

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

p = re.compile('요금')

#ori = pd.read_excel(PATH + ori_data, sheet_name='전부') # 2017년도 자료
#extra_1 = pd.read_excel(PATH + extra_data, sheet_name='전자세금계산서', usecols='n') # 2018년도 자료
extra_2 = pd.read_excel(PATH + extra_data, sheet_name='전자계산서') # 2018년도 자료
test_dtree = pd.read_excel(excel_PATH + test_dtree_excel)

test = pd.merge(extra_2, test_dtree, how='extra_2', on='품명')

test.to_excel('test_merge_dtree.xlsx')

#a = p.sub('요금', ori.loc[1, '품명'])
#print(a)


#abc = list(ori) # header를 리스트화
#print(abc)

