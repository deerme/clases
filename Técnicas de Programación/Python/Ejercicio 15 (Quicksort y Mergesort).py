# -*- coding: utf-8 -*-
"""
Created on Wed Oct 22 10:01:03 2014

@author: 11111042
"""

def quickSort(lista):
    
    menorLista = []
    pivotLista = []
    mayorLista = []
    
    if len(lista) <= 1:
        return lista
        
    else:        
        pivot = lista[0]        
        for i in lista:
            if i < pivot:
                menorLista.append(i)
            elif i > pivot:
                mayorLista.append(i)
            else:
                pivotLista.append(i)
                
        menorLista = quickSort(menorLista)
        mayorLista = quickSort(mayorLista)
        
        return menorLista + pivotLista + mayorLista
        #no cambia la lista, sino retorna una nueva lista
        
def mergeSort(lista, inicio, fin):

    if inicio < fin:
        mitad = (inicio+fin)/2        
        mergeSort(lista, inicio, mitad)
        mergeSort(lista, mitad+1, fin)
        merge(lista, inicio, mitad, fin)
        
    #no retorna una nueva lista, sino cambia la lista
        
def merge(listaT, inicio, mitad, fin):
    
    #listaT = lista temporal
    #listaTO = lista temporal ordenada
    
    listaTO = []

    indice1 = inicio
    indice2 = mitad+1
    
    while indice1 <= mitad and indice2 <= fin:
        if listaT[indice1] < listaT[indice2]:
            listaTO.append(listaT[indice1])
            indice1 = indice1+1
        else:
            listaTO.append(listaT[indice2])
            indice2 = indice2+1
        
    while indice1 <= mitad:
        listaTO.append(listaT[indice1])
        indice1 = indice1+1
        
    while indice2 <= fin:
        listaTO.append(listaT[indice2])
        indice2 = indice2+1
        
    for i, value in enumerate(listaTO):
        listaT[inicio+i] = value
        
def main():
    
    lista1 = [4,1,2,5,3,9,7,6,8,0]
    lista2 = [9,2,6,1,7,3,8,0,5,4]
        
    print "Quick Sort :", quickSort(lista1)
    
    mergeSort(lista2, 0, len(lista2)-1)
    print "Merge Sort :", lista2
        
if __name__=="__main__":
    main()