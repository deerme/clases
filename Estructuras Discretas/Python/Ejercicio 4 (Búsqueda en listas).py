# -*- coding: cp1252 -*-

def main():
	list = ["Life","The Universe","Everything","Jack","Jill","Life","Jill"]
	count = 0 #inicializado en cero
	
	buscar = list[4] #buscamos el elemento 4
	
	while count < len(list) and list[count] != buscar:
		count = count + 1
		
	if count < len(list):
		print (list[count]) #imprime la posición en la que encontró list[4]
	else:
		print ("No encontrado.")

if __name__=="__main__":
	main()