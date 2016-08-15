# -*- coding: utf-8 -*-
"""
Created on Wed Sep 17 10:37:07 2014

@author: 11111042
"""

from numpy import *

a = zeros((3,3))
#crea una matriz llena de ceros de 3x3

b = zeros(5)
#crea un vector lleno de ceros de longitud 5

c = random.random((3,3))
#crea una matriz con valores aleatorios de 3x3
#los valores aleatorios van de 0 a 1

def rellenarMatriz(x):
    for filas in range(0,len(x)):
    #trabaja con las filas
    
        for columnas in range(0,len(x[0])):
        #trabaja con las columnas
        
            x[filas][columnas] = random.randint(1,100)
            #llena cada posicion con enteros aleatorios del 1 al 100
            
    return x
            
def rellenarVector(x):
    for i in range(0,len(x)):
    #va del 0 al len(b)
    
        x[i]=random.randint(1,10)
        #llena cada posicion con enteros aleatorios del 1 al 10
        
    return x