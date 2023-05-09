# GaussElimin.py
'''
x = GaussElimin(A, b)
    Equiation Ax=b
'''

import numpy as np

def GaussElimin(A, b):
    n = len(b)
    
    # Elimination
    for k in range(0, n-1):
        for i in range(k+1, n):
            if A[i, k ] != 0.0:
                lam = A[i, k] / A[k, k]
                A[i, k+1:n] -= lam * A[k, k+1:n]
                b[i] -= lam *b[k]
                
    # Substition
    for k in range(n-1, -1, -1):
        b[k] = (b[k] - np.dot(A[k, k+1:n], b[k+1:n])) / A[k, k]
        
    return b