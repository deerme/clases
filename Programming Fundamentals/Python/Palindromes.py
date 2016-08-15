# -*- coding: utf-8 -*-
"""
Created on Fri Oct 03 09:45:04 2014

@author: 11111042
"""

def palindromo(lista, inicio, fin, indicador):
    if inicio > (fin/2) or indicador == False:
        return indicador
    else:
        if lista[inicio] != lista[fin]:
            indicador = False
    
def potencia(n,e):
    if n == 0:
        return 1 #potencia 0 es 1
    else:
        return n * potencia(n,e-1)
        
def orejas1(conejos):
    if conejos == 0:
        return 0
    else:
        return 2 + orejas1(conejos-1)
        #se añaden 2 orejas y se quita un conejo
        
def orejas2(conejos):
    if conejos == 0:
        return 0
    else:
        if (conejos % 2 == 0):
            return 3 + orejas2(conejos-1)
            #conejo par tiene tres orejas
        else:
            return 2 + orejas2(conejos-1)
            #conejo impar tiene 2 orejas

class Nodo:
    def __init__(self, elemento = None, siguiente = None):
        self.elemento = elemento
        self.siguiente = siguiente
        
class linkedList:
    def __init__(self):
        self.longitud = 0
        self.primero = None
        self.lista = Nodo()
        
    def agregarCima(self, elemento):
        nodo = Nodo(elemento)
        nodo.siguiente = self.primero
        self.primero = nodo
        if self.longitud == 0:
            self.lista = self.primero
        self.longitud = self.longitud + 1
        
    def agregarFrente(self, elemento):
        nodo = Nodo(elemento)
        if self.longitud == 0:
            self.primero = nodo
        else:
            self.lista.siguiente = nodo
        self.lista = nodo
        self.longitud = self.longitud + 1
        
    def agregarIndice(self, elemento, indice):
        temporal = self.primero
        posicion = 1
        
        if indice < self.longitud:
            nodo = Nodo(elemento)
            while posicion < indice - 1:
                temporal = temporal.siguiente
                posicion = posicion + 1
            if indice == 1:
                self.agregarCima(elemento)
            else:
                nodo.siguiente = temporal.siguiente
                temporal.siguiente = nodo
                self.longitud = self.longitud + 1
        else:
            if indice == self.longitud:
                self.agregarFrente(elemento)
        
    def imprimir(self):
        temporal = self.primero
        while temporal != None:
            print temporal.elemento
            temporal = temporal.siguiente
            
    def borrarElemento(self, elemento):
        previo = self.primero
        actual = self.primero
        while actual != None:
            if actual.elemento == elemento:
                previo.siguiente = actual.siguiente
                self.longitud = self.longitud - 1
                break
            previo = actual
            actual = actual.siguiente
        if actual == None:
            print "No se pudo hallar el elemento"
            
    