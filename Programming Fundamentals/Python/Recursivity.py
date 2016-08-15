# -*- coding: utf-8 -*-
"""
Created on Wed Oct 15 10:20:52 2014

@author: 11111042
"""

def buscarSecuencial(lista, n):
    listaAuxiliar = []
    for i in range(0,len(lista)):
        if lista[i] == n:
            listaAuxiliar.append(i)
    return listaAuxiliar
    
def buscarRecursivo(lista, n, indice):
    if indice == 1:
        return -1
    else:
        if lista[indice] == n:
            return indice
        else:
            return buscarRecursivo(lista, n, indice-1)
            
def main():
    lista = [10,15,8,4,8]
    print buscarSecuencial(lista, 8)
    #indice = len(lista)-1
    #print buscarRecursivo(lista, 1, indice)
    
if __name__=="__main__":
    main()