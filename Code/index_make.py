def index_make(train, test):
    data = pd.read_csv(train, header=None)
    data2 = pd.read_csv(test, header=None)
    train_flat = data[[0]].values.ravel()
    test_flat = data2[[0]].values.ravel()
    total = np.append(train_flat, test_flat)
    index = np.unique(total)
    return index
