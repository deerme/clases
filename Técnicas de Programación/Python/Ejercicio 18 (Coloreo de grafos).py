# -*- coding: utf-8 -*-
"""
Created on Wed Nov 05 10:32:36 2014

@author: 11111042
"""

import Queue

class Vertice:

    """ CONSTRUCTOR """
    
    def __init__(self, key):
        self.id = key
        self.adyacente = {}
        self.color = "white"
        self.nivel = 0
        self.previo = None

    """ AGREGAR """
        
    def agregarVecino(self, vecino, peso = 0):
        self.adyacente[vecino] = peso
        
    """ GET """
    
    def getConexiones(self):
        return self.adyacente.keys()
        
    def getId(self):
        return self.id
    
    def getPeso(self, vecino):
        return self.adyacente[vecino]
        
    def getColor(self):
        return self.color
        
    def getNivel(self):
        return self.nivel
    
    """ SET """
    
    def setColor(self, color):
        self.color = color
        
    def setNivel(self, nivel): #setDistance
        self.nivel = nivel #distance = n
        
    def setPrevio(self, vertice): #vertex
        self.previo = vertice
              
class Grafo:
    
    """ CONSTRUCTOR """
    
    def __init__(self):
        self.listaVertices = {}
        self.numeroVertices = 0
        
    """ AGREGAR """
    
    def agregarVertice(self, key):
        self.numeroVertices = self.numeroVertices + 1
        nuevoVertice = Vertice(key)
        self.listaVertices[key] = nuevoVertice
        
    def agregarLado(self, f, t, peso = 0):
        if f not in self.listaVertices:
            self.agregarVertice(f)
        self.listaVertices[f].agregarVecino(self.listaVertices[t], peso)
        self.listaVertices[t].agregarVecino(self.listaVertices[f], peso)
        
    """ GET """

    def getVertice(self, n):
        if n in self.listaVertices:
            return self.listaVertices[n]
        else:
            return None

    """ ITERADOR """
    
    def __iter__(self):
        return iter(self.listaVertices.values())
        
def breathFirst(g, s):
    colaVertices = Queue.Queue()
    colaVertices.put(s)
    listaVertices = []
    
    while not colaVertices.empty():
        verticeActual = colaVertices.get()
        listaVertices.append(verticeActual.getNivel())
        
        for verticeAdyacente in verticeActual.getConexiones():
            
            if verticeAdyacente.getColor() == "white":
                
                verticeAdyacente.setColor("gray")
                verticeAdyacente.setNivel(verticeActual.getNivel()+1)
                verticeAdyacente.setPrevio(verticeActual)
                colaVertices.put(verticeAdyacente)
                
        verticeActual.setColor("black")
        
    for i in range(0, len(listaVertices)):
        print listaVertices[i]
        
def imprimirArbol(g):    
    for v in g:
        for w in v.getConexiones():
            v.getId(), ",", w.getId(), ",", v.getPeso(w)
        
def main():
    g = Grafo()
    
    for i in range(6):
        g.agregarVertice(i)
    
    g.agregarLado(0,1,5)
    g.agregarLado(0,2,4)
    g.agregarLado(2,3,9)
    g.agregarLado(3,4,5)
    
    breathFirst(g, g.getVertice(0))
            
if __name__=="__main__":
    main()