# -*- coding: cp1252 -*-

set1 = set(["mouse","dog","cat"]) #definimos set1 con tres elementos
print set1 #lo imprimimos

#en algunas versiones de Python, print funciona solo con paréntesis

set2 = set(["cat","cow","ox","cow"]) #repetimos cow
print set2 #cow solo saldrá una vez

#usar sets sirve para ingresar información que no quieres que se repita

set3 = set1 & set2 #intersección, representa el Y
print set3 #sale el elemento común "cat"

set4 = set1 | set2 #unión, representa el O
print set4 #salen todos los elementos de ambos conjuntos

set5 = set1 - set2 #diferencia
print set5 #salen los elementos que pertenecen a set1 y no a set2

set6 = set1 ^ set2 #diferencia simétrica
print set6 #sale todo menos la intersección

isSubset = set1 <= set2 #bool que pregunta si set1 es subconjunto de set2
print isSubset #false

set7 = set(["mouse"]) #definimos un set con un solo elemento

isSubset = set7 <= set1 #preguntamos si es subconjunto de set1
print isSubset #true

isSuperset = set1 >= set7 #preguntamos si set1 es superconjunto de set7
print isSuperset #true
#esto es equivalente a evaluar si set7 es subconjunto de set1

set8 = set(["turtle"]) #nuevo set8 con un elemento
set7 = set8.copy() #le copiamos este nuevo set al set7
print set7 #se le borra lo anterior y se vuelve set8 (se copia)

set8.clear() #borra el set8
print set8 #imprime el conjunto vacío
print len(set8) #imprime el número de elementos, 0

set9 = set("letters") #creo un set sin corcheas ["letters"]
#al hacer esto toma cada letra como un elemento
print set9 #imprime el conjunto no ordenado en un orden aleatorio