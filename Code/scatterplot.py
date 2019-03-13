# 산점도 만들기
import pandas as pd
import numpy as np
import matplotlib.pyplot as plt


train = pd.read_excel('C:\\3-f\\excel_data\\train.xlsx')
test = pd.read_excel('C:\\3-f\\excel_data\\test.xlsx')

tr_c = train['code']
tr_label = np.unique(tr_c)
te_c = test['code']
te_label = np.unique(te_c)
index = list()

for i in range(len(tr_label)):
    for j in range(len(te_label)):
        if tr_label[i] == te_label[j]:
            index.append(tr_label[i])

print(index)
print(len(index))



def tr_b(code):
    train = pd.read_excel("C:\\3-f\\excel_data\\train.xlsx")
    tr = train[train['code'].isin([code])]
    b = tr['buyer']
    return b


def tr_s(code):
    train = pd.read_excel("C:\\3-f\\excel_data\\train.xlsx")
    tr = train[train['code'].isin([code])]
    s = tr['seller']
    return s


def te_b(code):
    test = pd.read_excel("C:\\3-f\\excel_data\\test.xlsx")
    te = test[test['code'].isin([code])]
    b = te['buyer']
    return b


def te_s(code):
    test = pd.read_excel("C:\\3-f\\excel_data\\test.xlsx")
    te = test[test['code'].isin([code])]
    s = te['seller']
    return s


plt.scatter(te_b(index[0]), te_s(index[0]), marker='^', color='darkseagreen', label='%d' %index[0])
plt.scatter(tr_b(index[0]), tr_s(index[0]), marker='.', color='darkslateblue', label='%d' %index[0])
plt.scatter(te_b(index[1]), te_s(index[1]), marker='^', color='aqua', label='%d' %index[1])
plt.scatter(tr_b(index[1]), tr_s(index[1]), marker='.', color='aquamarine', label='%d' %index[1])
plt.scatter(te_b(index[2]), te_s(index[2]), marker='^', color='darkslategray', label='%d' %index[2])
plt.scatter(tr_b(index[2]), tr_s(index[2]), marker='.', color='darkturquoise', label='%d' %index[2])
plt.scatter(te_b(index[3]), te_s(index[3]), marker='^', color='bisque', label='%d' %index[3])
plt.scatter(tr_b(index[3]), tr_s(index[3]), marker='.', color='black', label='%d' %index[3])
plt.scatter(te_b(index[4]), te_s(index[4]), marker='^', color='blanchedalmond', label='%d' %index[4])
plt.scatter(tr_b(index[4]), tr_s(index[4]), marker='.', color='blue', label='%d' %index[4])
plt.scatter(te_b(index[5]), te_s(index[5]), marker='^', color='blueviolet', label='%d' %index[5])
plt.scatter(tr_b(index[5]), tr_s(index[5]), marker='.', color='brown', label='%d' %index[5])
plt.scatter(te_b(index[6]), te_s(index[6]), marker='^', color='burlywood', label='%d' %index[6])
plt.scatter(tr_b(index[6]), tr_s(index[6]), marker='.', color='cadetblue', label='%d' %index[6])
plt.scatter(te_b(index[7]), te_s(index[7]), marker='^', color='chartreuse', label='%d' %index[7])
plt.scatter(tr_b(index[7]), tr_s(index[7]), marker='.', color='chocolate', label='%d' %index[7])
plt.scatter(te_b(index[8]), te_s(index[8]), marker='^', color='coral', label='%d' %index[8])
plt.scatter(tr_b(index[8]), tr_s(index[8]), marker='.', color='cornflowerblue', label='%d' %index[8])
plt.scatter(te_b(index[9]), te_s(index[9]), marker='^', color='darkviolet', label='%d' %index[9])
plt.scatter(tr_b(index[9]), tr_s(index[9]), marker='.', color='crimson', label='%d' %index[9])
plt.scatter(te_b(index[10]), te_s(index[10]), marker='^', color='darksalmon', label='%d' %index[10])
plt.scatter(tr_b(index[10]), tr_s(index[10]), marker='.', color='darkblue', label='%d' %index[10])
plt.scatter(te_b(index[11]), te_s(index[11]), marker='^', color='darkcyan', label='%d' %index[11])
plt.scatter(tr_b(index[11]), tr_s(index[11]), marker='.', color='darkgoldenrod', label='%d' %index[11])
plt.scatter(te_b(index[12]), te_s(index[12]), marker='^', color='darkgray', label='%d' %index[12])
plt.scatter(tr_b(index[12]), tr_s(index[12]), marker='.', color='darkgreen', label='%d' %index[12])
plt.scatter(te_b(index[13]), te_s(index[13]), marker='^', color='darkkhaki', label='%d' %index[13])
plt.scatter(tr_b(index[13]), tr_s(index[13]), marker='.', color='darkmagenta', label='%d' %index[13])
plt.scatter(te_b(index[14]), te_s(index[14]), marker='^', color='darkolivegreen', label='%d' %index[14])
plt.scatter(tr_b(index[14]), tr_s(index[14]), marker='.', color='darkorange', label='%d' %index[14])
plt.scatter(te_b(index[15]), te_s(index[15]), marker='^', color='darkorchid', label='%d' %index[15])
plt.scatter(tr_b(index[15]), tr_s(index[15]), marker='.', color='darkred', label='%d' %index[15])
plt.legend()
plt.title('total')
plt.show()

'''
for i in range(len(index)):
    code = index[i]
    tr = train[train['code'].isin([code])]
    tr_b = tr['buyer']
    tr_s = tr['seller']

    te = test[test['code'].isin([code])]
    te_b = te['buyer']
    te_s = te['seller']

    plt.scatter(te_b, te_s, marker='^', label='test')
    plt.scatter(tr_b, tr_s, marker='.', label='train')
    plt.legend()
    plt.title(code)
    plt.show()




plt.scatter(test['buyer'], test['seller'], color='r', s=15, marker='<')
plt.scatter(train['buyer'], train['seller'], color='b', s=15, marker='o')
plt.show()
'''