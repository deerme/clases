# -*- coding: utf-8 -*-
"""
Created on Fri Oct 31 10:09:06 2014

@author: 11111042
"""

import Queue

def ejemploCola():
    q = Queue.Queue()
    while True:
        n = input("Ingrese numero:")
        if n == 0:
            break
        else:
            q.put(n)
            print n
            
    #descolando
    print("Eliminando elementos...")
    while not q.empty():
        print q.get()
        
def main():
    ejemploCola()        

if __name__=="__main__":
    main()