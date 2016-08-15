# -*- coding: utf-8 -*-
"""
Created on Wed Aug 27 10:22:47 2014

@author: 11111042
"""

def verifica1(a,b,c):
    
    valido = 0
    
    if (a+b)>c:
        if (b+c)>a:
            if (a+c)>b:
                valido = 1
    
    if valido == 1:
        print "Valido"
    else:
        print "Invalido"    
    
def verifica2(a,b,c):
    
    if (a+b)>c and (b+c)>a and (a+c)>b:
        print "Valido"
    else:
        print "Invalido"
    