import pandas as pd

PATH = 'c:\\3-f\\3friend_raw_data\\'
excel_PATH = 'c:\\3-f\\excel_data\\'
ori_data = '3friend_raw_data.xlsx'
extra_data = '3friend_extra_data.xlsx'
test_dtree_excel = 'test_dtree.xlsx'
keyword_data = 'keyword_table.xlsx'

DATA = pd.read_excel(PATH + extra_data, sheet_name='전자계산서', encoding='utf-8')

test = DATA['품명'].copy()
test = test.fillna('기타')
test = test.drop_duplicates()
test.to_excel('keyword_2018_sheet2.xlsx')
print(test)
