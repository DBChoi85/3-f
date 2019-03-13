#-*- coding: utf-8 -*-

import numpy as np
import win32com.client
import text_to_image
#import input_data
from PIL import Image
import sys
import io
import os
import csv

#path = 'C:\\Users\\aiia\\.atom\\python\\text_to_image\\train'

sys.stdout = io.TextIOWrapper(sys.stdout.detach(), encoding = 'utf-8')
sys.stderr = io.TextIOWrapper(sys.stderr.detach(), encoding = 'utf-8')

excel = win32com.client.Dispatch("Excel.Application")

excel_file = excel.Workbooks.Open('C:\\Users\\aiia\\.atom\\python\\text_to_image_2\\test(회사명).xlsx')
w_sheet = excel_file.Activesheet

WIDTH, HEIGHT = 28, 28

train, test = 100000, 100000


for i in range(2,99999):
    if(w_sheet.Cells(i,1).Value==None):
        break
    if(w_sheet.Cells(i,3).Value==None):
        w_sheet.Cells(i,3).Value='0 미정' #라벨빈칸 '0 미정'으로 바꿈

    st1 = w_sheet.Cells(i,1).Value # 회사명 받기
    st2 = w_sheet.Cells(i,2).Value # 가게명 받기
    st1 = str(st1)
    st2 = str(st2) #스트링 형식으로

    de = w_sheet.Cells(i,3).Value # 라벨 받아오기


    encoded_image_path = text_to_image.encode(st1+st2, "C:\\Users\\aiia\\.atom\\python\\text_to_image_2\\test\\a_%d_%d.png" %(test,de)) #이미지로 인코딩
    img = Image.open("C:\\Users\\aiia\\.atom\\python\\text_to_image_2\\test\\a_%d_%d.png" %(test,de)) # 이미지 사이즈 조절을 위해 이미지 다시 받아오기
    re_img = img.resize((28,28)) # 이미지 크기 설정
    re_img.save("C:\\Users\\aiia\\.atom\\python\\text_to_image_2\\test\\a_%d_%d.png" %(test,de))# 변경된 이미지 다시 저장
    test = test + 1

excel_file.Save()
excel.Quit()

