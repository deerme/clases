# -*- coding: utf-8 -*-
"""
Created on Fri Oct 31 10:32:08 2014

@author: 11111042
"""

class Vertice:
    def __init__(self, key):
        self.id = key
        self.adyacente = {} #diccionario
        
    def agregarVecino(self, vecino, peso = 0):
        self.adyacente[vecino] = peso
        
    def getConexiones(self):
        return self.adyacente.keys()
        
    def getId(self):
        return self.id
    
    def getPeso(self, vecino):
        return self.adyacente[vecino]
        
class Grafo:
    def __init__(self):
        self.listaVertices = {}
        self.numeroVertices = 0
        
    def agregarVertice(self, key):
        self.numeroVertices = self.numeroVertices + 1
        nuevoVertice = Vertice(key)
        self.listaVertices[key] = nuevoVertice
        
    def getVertice(self, n):
        if n in self.listaVertices: #revisa si n esta en la lista de vertices
            return self.listaVertices[n]
        else:
            return None
            
    def agregarLado(self, f, t, peso = 0):
        #donde f = vertice de origen, t = vertice de destino
        if f not in self.listaVertices:
            self.agregarVertice(f)
        self.listaVertices[f].agregarVecino(self.listaVertices[t], peso)
        self.listaVertices[t].agregarVecino(self.listaVertices[f], peso)
        
    def __iter__(self):
        return iter(self.listaVertices.values())

def main():
    g = Grafo()
    
    for i in range(6):
        g.agregarVertice(i)
    
    g.agregarLado(0,1,5)
    g.agregarLado(0,2,4)
    g.agregarLado(2,3,9)
    g.agregarLado(3,4,5)
    
    for v in g:
        for w in v.getConexiones():
            v.getId(), ",", w.getId(), ",", v.getPeso(w)
        
if __name__=="__main__":
    main()