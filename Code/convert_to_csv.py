import numpy as np
import idx2numpy
# 설치 필요, 방법은 cmd에서 pip install idx2numpy 용도는 mnist자료 형태를 numpy배열로 바꿔줌
import csv

path = "C:\\Users\\fight\\Desktop\\NN_catastrophic_forgetting\\convert\\gzip\\"

img = 'emnist-digits-train-images-idx3-ubyte'
label = 'emnist-digits-train-labels-idx1-ubyte'

train_img = idx2numpy.convert_from_file(path + img)
train_label = idx2numpy.convert_from_file(path + label)

images = np.concatenate([train_img.reshape(240000, 784)])
#갯수와 28*28임, 갯수는 논문 내용 참고하되 Table 2 structure and organization of the EMNIST datasets 부분을 참고
#기존 참고하던 테이블(table 1)이 아님!!!
labels = np.concatenate([train_label.reshape(240000, 1)])
# 라벨을 reshape하지 않으면, csv파일 작성할때 에러사항이 꽃필꺼임

with open('img.csv', 'w', newline='') as csvfile:
    writer = csv.writer(csvfile, delimiter=',', quotechar='|', quoting=csv.QUOTE_MINIMAL)
    for row in images:
        writer.writerow(row)

with open('label.csv', 'w', newline='') as csvfile:
    writer = csv.writer(csvfile, delimiter=',', quotechar='|', quoting=csv.QUOTE_MINIMAL)
    for row in labels:
        writer.writerow(row)
# 두개를 한 파일에 넣어도 되고, 위 처럼 별개로 작성해도 됨. 한개의 파일에 작성한게 편할 것이라 예상.
