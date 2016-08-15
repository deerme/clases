set1 = set() #crear conjunto set1
print set1 #imprimir el conjunto vacío

set1.add("cat") #añadir el elemento "cat" al set1
print set1 #imprimir el conjunto con el elemento único "cat"
#add es útil solo para agregar una entrada o empezar un set

set1.update(["dog","mouse"]) #añadir nuevos elementos sin borrar "cat"
print set1

set1.update(["dog","mouse"]) #añadir nuevos elementos (pero que ya existen)
print set1
#al imprimir, los elementos no se vuelven a repetir

#podemos analizar la pertenencia de un elemento en un conjunto

if "cat" in set1: #si "cat" está dentro de set1
	set1.remove("cat") #entonces quitar "cat"
print set1

#remove solo puede quitar 1 elemento, no más

for item in set1: #para cada item dentro de set1
	print item #imprimir ese item, iterando
print "Item count:", len(set1) #al final imprimir el item count