# -*- coding: utf-8 -*-
"""
Created on Wed Nov 12 10:50:30 2014
Tablas Hash 1
@author: 11111042
"""

#crea una tabla (lista) de 10 elementos con puros ceros
tabla = [0]*10 #[0,0,0,0,0,0,0,0,0,0]

def funcionHash(x):
    return x%10 #le saca mod para obfuscar un poco la data (hash)
    
def insertar(tabla, entrada, valor):
    tabla[funcionHash(entrada)] = valor #le hace hash para ingresar el dato
    
def main1():
    insertar(tabla, 41, "Manzana") #ingresa "Manzana" en 41, o sea, 1
    insertar(tabla, 93, "Naranja") #ingresa "Naranja" en 93, o sea, 3
    print tabla
    
    insertar(tabla, 103, "Pera")   #ingresa "Pera" en 103, o sea, 3 (colision)
    print tabla
    
#crea una lista de 10 elementos con listas vacías
tablaLista = [[] for x in range(10)] #[[][][][][][][][][][]]

def insertarL(tablaLista, entrada, valor):
    tablaLista[funcionHash(entrada)].append((entrada, valor))
    
def imprimir(lista):
    for item in lista:
        print item
        
def main():
    insertarL(tablaLista, 41, "Manzana") #ingresa "Manzana" en 41, o sea, 1
    insertarL(tablaLista, 93, "Naranja") #ingresa "Naranja" en 93, o sea, 3
    insertarL(tablaLista, 103, "Pera")   #ingresa "Pera" en 103, o sea, 3
    #como ya hay algo en la posicion 3, le hace append
    
    imprimir(tablaLista)

if __name__=="__main__":
    main()