import numpy as np

def innerVec(a,b):
    rowA = a.shape[0]
    rowB = b.shape[0]
    
    if (rowA != rowB):
        print('Wrong input data')
        return None
    
    c = 0.0
    for i in range(rowA):
        c += a[i]*b[i]
    return c

if __name__ == '__main__':
    a = np.array([1.1, 1.2, 1.3])
    b = np.array([2.1, 2.2, 2.3])
    
    c = innerVec(a, b)
    print("Inner product of vectors=", c)