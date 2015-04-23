# -*- coding: utf-8 -*-
"""
Created on Wed Aug 27 10:38:30 2014

@author: 11111042
"""
    
def estaturas(a,b,c):
    
    minimo = 0    
    medio  = 0
    maximo = 0
    
    if (a<b<c):
        minimo = a
    elif (b<a<c):
        minimo = b
    else:
        minimo = c
        
    if (a>b>c):
        maximo = a
    elif (b>a>c):
        maximo = b
    else:
        maximo = c
        
    medio = (a+b+c) - (minimo+maximo)
    
    print "Maximo: ", maximo
    print "Medio:  ", medio
    print "Minimo: ", minimo
    