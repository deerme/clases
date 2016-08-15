# -*- coding: utf-8 -*-
"""
Created on Fri Aug 29 10:11:50 2014

@author: 11111042
"""

def buscarPosicion(n):

    list1 = ["Life","The Universe","Everything","Jack","Jill","Life","Jill"]
    count = 0

    if n <= len(list1)-1:
        word = list1[n]
    
        for i in range(0,len(list1)):
        
            if count<len(list1) and list1[count]!=word:
                count = count + 1
        
        if count<len(list1):
            print list1[count]
        else:
            print "Not found"
        
    else:
        print "Number out of range."
        
def buscarPalabra(w):

    list1 = ["Life","The Universe","Everything","Jack","Jill","Life","Jill"]
    count = 0

    for i in range(0,len(list1)):
        
        if count<len(list1) and list1[count]!=w:
            count = count + 1
        
    if count<len(list1):
        print count
    else:
        print "Not found"
    