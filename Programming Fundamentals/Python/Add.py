# -*- coding: utf-8 -*-
"""
Created on Fri Aug 29 10:58:44 2014

@author: 11111042
"""

list1 = []

def agregarElemento(n):
    list1.append(n)
    
def agregarElementos(): 
    list2 = []
    
    n = input(":")    
    print list2
    while n != 0:
        list2.append(n)
        n = input(":")
        
        print list2