# -*- coding: utf-8 -*-
"""
Created on Wed Sep 17 09:57:17 2014

@author: 11111042
"""

from numpy import *

a = arange(15).reshape(3,5)
print a

#la matriz resultante es
#0 1 2 3 4
#5 6 7 8 9
#10 11 12 13 14

#para imprimir 2 diriamos
#print matriz[fila,columna]
print a[0,2]

b = arange(1,10).reshape(3,3)
print b

#1 2 3
#4 5 6
#7 8 9

#para imprimir 9 diriamos
print b[2,2]

#para imprimir una fila usamos matriz[fila]
#para imprimir una columna usamos matriz[:,columna]