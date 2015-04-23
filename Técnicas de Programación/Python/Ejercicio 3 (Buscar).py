# -*- coding: utf-8 -*-
"""
Created on Fri Aug 29 10:11:50 2014

@author: 11111042
"""

def buscar(n):

    list1 = ["Life","The Universe","Everything","Jack","Jill","Life","Jill"]
    count = 0

    for i in range(1,len(list1)):
        
        if count<len(list1) and list1[count]!=n:
            count = count + 1
        
        if count<len(list1):
            print list[count]
        else:
            print "Not found"
