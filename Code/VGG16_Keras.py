from keras import layers, models
from keras.applications import VGG16
from keras import Input
from keras.models import Model
from keras.preprocessing.image import ImageDataGenerator
from keras import optimizers, initializers, regularizers, metrics
from keras.callbacks import ModelCheckpoint
import os
from glob import glob
from PIL import Image
import matplotlib.pyplot as plt
import numpy as np



Img_Path = "C:\\3-f\\NewData\\img_file\\"
labels_val = []

def dataset(images):
    #data = pd.read_csv(PATH, header=None)
    #images = data.iloc[:, :].values
    images = images.astype(np.float)
    images = images.reshape(28, 28, 1)
    images = np.multiply(images, 1.0 / 255.0)
    return images


def data_set_fun(path, set_size):

    train = True
    filename_list = os.listdir(path)
    if set_size == 0 :
        set_size = len(filename_list)
        train = False

    X_set = np.empty((set_size, 28, 28, 1), dtype=np.float32)
    Y_set = np.empty((set_size), dtype=np.float32)
    name = []

    np.random.shuffle(filename_list)
    result = dict()

    for i, filename in enumerate(filename_list):
        if i >= set_size :
            break
        name.append(filename)
        label = filename.split('.')[0]
        label = label.split('_')[2]
        result[label] = result.setdefault(label,0)+1
        #print("label",label)
        Y_set[i] = int(label)

        file_path = os.path.join(path, filename)
        img = Image.open(file_path)
        imgarray = np.array(img)
        imgarray = imgarray.flatten()
        #print(imgarray)

        images = dataset(imgarray)

        X_set[i] = images

        labels_val.append(int(label))

    #if train:
    #    return X_set, Y_set, result
    return X_set, Y_set



def dence_to_one_hot(labels_dence, num_classes):
    #print(labels_dence)
    num_labes = labels_dence.shape[0]
    #print(num_labes)
    index_offset = np.arange(num_labes) * num_classes
    #print(index_offset)
    labels_one_hot = np.zeros((num_labes, num_classes))
    #print(labels_dence.ravel())
    labels_one_hot.flat[index_offset + labels_dence.ravel()] = 1 #flat - 배열을 1차원으로 두고 인덱스를 이용해 값 확인
    return labels_one_hot

def index_label(label):
    #print(label)
    list = []
    for j in range(len(label)):
        for i in range(len(labels_val)):
            if int(label[j]) == int(labels_val[i]):
                list.append(i)
                break
    return np.asarray(list)

trX, trY = data_set_fun(Img_Path + 'train_img_new', 0)
#print('train_분포 : ', result)
teX, teY = data_set_fun(Img_Path + 'test_img_new', 0)
#print('test_분포 : ', result)

labels_val = list(set(labels_val))
labels_val.sort()
print(labels_val)
labels_count = len(labels_val)

trY = index_label(trY)
teY = index_label(teY)

#print(len(teY), len(trY))
trY = dence_to_one_hot(trY, labels_count)
teY = dence_to_one_hot(teY, labels_count)

EPOCH = 200
BATCH_SIZE = 100
VERBOSE = 2
# data_list = glob('blood-cells/dataset2-master/images/TRAIN/**/*.jpeg')
# print(data_list[-1])
'''
train_datagen = ImageDataGenerator(rescale=1. / 255)
val_datagen = ImageDataGenerator(rescale=1. / 255)
test_datagen = ImageDataGenerator(rescale=1. / 255)

train_dir = os.path.join('./dataset/1/images/train')
val_dir = os.path.join('./dataset/1/images/val')
test_dir = os.path.join('./dataset/1/images/test')

# train_dir = os.path.join('./dataset/cats_and_dogs_small/train')
# val_dir = os.path.join('./dataset/cats_and_dogs_small/val')
# test_dir = os.path.join('./dataset/cats_and_dogs_small/test')

train_generator = train_datagen.flow_from_directory(train_dir, batch_size=16, target_size=(220, 200), color_mode='rgb')
val_generator = val_datagen.flow_from_directory(val_dir, batch_size=16, target_size=(220, 200), color_mode='rgb')
'''
input_tensor = Input(shape=(28, 28, 1), dtype='float32', name='input')

x = layers.Conv2D(64, (3, 3), activation='relu', padding='same', kernel_initializer='he_normal',
                  kernel_regularizer=regularizers.l2(0.01))(input_tensor)
x = layers.Conv2D(64, (3, 3), activation='relu', padding='same', kernel_initializer='he_normal',
                  kernel_regularizer=regularizers.l2(0.01))(x)
x = layers.MaxPooling2D((2, 2))(x)

x = layers.Conv2D(128, (3, 3), activation='relu', padding='same', kernel_initializer='he_normal',
                  kernel_regularizer=regularizers.l2(0.01))(x)
x = layers.Conv2D(128, (3, 3), activation='relu', padding='same', kernel_initializer='he_normal',
                  kernel_regularizer=regularizers.l2(0.01))(x)
x = layers.MaxPooling2D((2, 2))(x)
'''
x = layers.Conv2D(256, (3, 3), activation='relu', padding='same', kernel_initializer='he_normal',
                  kernel_regularizer=regularizers.l2(0.01))(x)
x = layers.Conv2D(256, (3, 3), activation='relu', padding='same', kernel_initializer='he_normal',
                  kernel_regularizer=regularizers.l2(0.01))(x)
x = layers.Conv2D(256, (3, 3), activation='relu', padding='same', kernel_initializer='he_normal',
                  kernel_regularizer=regularizers.l2(0.01))(x)
x = layers.MaxPooling2D((2, 2))(x)

x = layers.Conv2D(512, (3, 3), activation='relu', padding='same', kernel_initializer='he_normal',
                  kernel_regularizer=regularizers.l2(0.01))(x)
x = layers.Conv2D(512, (3, 3), activation='relu', padding='same', kernel_initializer='he_normal',
                  kernel_regularizer=regularizers.l2(0.01))(x)
x = layers.Conv2D(512, (3, 3), activation='relu', padding='same', kernel_initializer='he_normal',
                  kernel_regularizer=regularizers.l2(0.01))(x)
x = layers.MaxPooling2D((2, 2))(x)

x = layers.Conv2D(512, (3, 3), activation='relu', padding='same', kernel_initializer='he_normal',
                  kernel_regularizer=regularizers.l2(0.01))(x)
x = layers.Conv2D(512, (3, 3), activation='relu', padding='same', kernel_initializer='he_normal',
                  kernel_regularizer=regularizers.l2(0.01))(x)
x = layers.Conv2D(512, (3, 3), activation='relu', padding='same', kernel_initializer='he_normal',
                  kernel_regularizer=regularizers.l2(0.01))(x)
x = layers.MaxPooling2D((2, 2))(x)
'''
x = layers.Flatten()(x)
#x = layers.Dense(4096, kernel_initializer='he_normal')(x)
x = layers.Dense(2048, kernel_initializer='he_normal')(x)
x = layers.Dense(1024, kernel_initializer='he_normal')(x)
output_tensor = layers.Dense(40, activation='softmax')(x)

myvgg = Model(input_tensor, output_tensor)
myvgg.summary()

# checkpoint = ModelCheckpoint(filepath='My_VGG_{epoch:03d}_{val_loss:.7f}.hdf5',monitor='loss', mode='min', save_best_only=True)
checkpoint = ModelCheckpoint(filepath='My_VGG_weight.hdf5',
                             monitor='loss',
                             mode='min',
                             save_best_only=True)

myvgg.compile(loss='categorical_crossentropy', optimizer=optimizers.RMSprop(lr=2e-5), metrics=['acc'])
'''
history = myvgg.fit_generator(trX, trY,
                              steps_per_epoch=25,
                              epochs=EPOCH,
                              validation_data=(teX, teY),
                              validation_steps=16,
                              callbacks=[checkpoint],
                              verbose=VERBOSE)
'''

history = myvgg.fit(trX, trY, validation_data=(teX, teY),
                          epochs=EPOCH, batch_size=BATCH_SIZE, shuffle = True,verbose=VERBOSE)
acc = history.history['acc']
val_acc = history.history['val_acc']
loss = history.history['loss']
val_loss = history.history['val_loss']

epochs = range(1, len(acc) + 1)

plt.plot(epochs, acc, 'r', label='Training acc')
plt.plot(epochs, val_acc, 'b', label='Validation acc')
plt.title('Accuracy')
plt.legend()
plt.figure()

plt.plot(epochs, loss, 'r', label='Training loss')
plt.plot(epochs, val_loss, 'b', label='Validation loss')
plt.title('Loss')
plt.legend()

plt.show()
