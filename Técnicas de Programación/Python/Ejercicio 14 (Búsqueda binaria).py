# -*- coding: utf-8 -*-
"""
Created on Wed Oct 15 10:25:08 2014
BUSQUEDAS BINARIAS, ITERATIVA Y RECURSIVA
@author: 11111042
"""

def binariaIterativa(lista, valor):
    
    inicio = 0
    fin = len(lista)-1
    
    while inicio <= fin:
        medio = (inicio+fin)/2
        
        if valor == lista[medio]:
            posicion = medio
            return posicion
        else:
            if valor < lista[medio]:
                fin = medio - 1
            else:
                inicio = medio + 1
    return -1
    
def binariaRecursiva(lista, inicio, fin, valor):
    
    if inicio > fin:
        return -1
        
    else:
        medio = (inicio+fin)/2
        if valor == lista[medio]:
            return medio
            
        else:
            if valor < lista[medio]:
                return binariaRecursiva(lista, inicio, medio-1, valor)
            else:
                return binariaRecursiva(lista, medio+1, fin, valor)

def main():
    lista = [1,15,8,4,3]
    lista.sort()
    
    print lista
    print binariaIterativa(lista, 15)            
    print binariaRecursiva(lista, 0, len(lista)-1, 15)            
                
if __name__=="__main__":
    main()
            