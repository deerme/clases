# -*- coding: utf-8 -*-
"""
Created on Wed Sep 24 10:16:26 2014

@author: 11111042
"""

import math

class Punto:
    def __init__(self,x,y): #define el constructor
        self.x = x #el valor de x se manda al atributo self.x
        self.y = y #el valor de y se manda al atributo self.y
        
    #METODOS DE ACCESO
    #innecesarios porque Python usa variables publicas
        
    def getX(self): #define el metodo de acceso get
        return self.x #retorna el valor de x
        
    #si ponemos P1.getX() nos retorna el valor de x (3)
        
    def setX(self,x): #define el metodo de acceso set
        self.x = x #el valor de x se manda al atributo self.x
        
    #si ponemos P1.setX(6) le asignamos 6 al valor de x
        
    #-------------------------------------------------
        
    def imprimir(self):
        print "(",self.x,",",self.y,")"
        
    #si ponemos P1.imprimir() nos retorna ( 3 , 5 )
        
    def distanciaOrigen(self):
        dx = self.x**2
        dy = self.y**2
        d = math.sqrt(dx+dy)
        return d
        
    #ponemos P1.distanciaOrigen()
        
    def distanciaDosPuntos(self,punto):
        dx = (self.x - punto.x)**2
        dy = (self.y - punto.y)**2
        d = math.sqrt(dx+dy)
        return d
    #ponemos P1.distanciaDosPuntos(P2)
        
P1 = Punto(3,5) #crea un punto P1 en el (3,5)
P2 = Punto(4,6) #crea un punto P2 en el (4,6)
P3 = Punto(7,8) #crea un punto P3 en el (7,8)

#si ponemos P1.x nos retorna el valor de x (3)
#si ponemos P1.y nos retorna el valor de y (5)

#si ponemos P1.x = 6 le asignamos 6 al valor de x
#si ponemos P1.y = 4 le asignamos 4 al valor de y

lista=[] #creamos una lista vacia

lista.append(P1) #le añadimos el punto P1 como elemento
lista.append(P2) #le añadimos el punto P2 como elemento
lista.append(P3) #le añadimos el punto P3 como elemento

for i in range(0,len(lista)): #recorre todos los elementos de lista
    lista[i].imprimir() #imprime cada elemento de la lista

