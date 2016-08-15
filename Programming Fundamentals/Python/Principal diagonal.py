# -*- coding: utf-8 -*-
"""
Created on Wed Sep 17 10:08:43 2014

@author: 11111042
"""

from numpy import *
#importa la biblioteca numpy
#numpy viene con WinPython
#Python normal viene con scipy

a = arange(15).reshape(3,5)
#matriz del 0 al 15, armada de 3x5

#  0  1  2  3  4
#  5  6  7  8  9
# 10 11 12 13 14

b = arange(1,10).reshape(3,3)
#matriz del 1 al 10, armada de 3x3

# 1 2 3
# 4 5 6
# 7 8 9

def diagonal(x):
    #toma como argumento una variable x
    #puedes ingresar la matriz que quieras eg. diagonal(a)
    suma = 0
    
    for i in range(len(x)): 
        
    #len(b) = numero de filas de b
    #len(b[0]) = numero de columnas de b
    
    #la diagonal principal solo existe en matrices cuadradas
    #trabaja con el numero de filas
    
        suma = suma + x[i,i]
        #acumula en la variable suma los valores de los indices principales
        
    return suma
        
def sumatotal(x):
    
    suma = 0    
    
    for filas in range(0,len(x)):
    #trabaja con el numero de filas        
        
        for columnas in range(0,(len(x[0]))):
            #trabaja con el numero de columnas
        
            suma = suma + x[filas,columnas]
            #acumula en la variable suma los valores que van saliendo
            
    return suma