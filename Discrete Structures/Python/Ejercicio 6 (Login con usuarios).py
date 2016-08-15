# -*- coding: cp1252 -*-

def main():

	nombre = input("Ingrese su nombre: ")
	password = input("Ingrese su clave: ")
	
	if nombre == "Andrea" and password == "12345":
		print ("Bienvenida", nombre)
	
	elif nombre == "Fred" and password == "Rock": #else_ if es lo mismo que elif
		print ("Bienvenido", nombre)
	
	else:
		print ("No está en lista")		

if __name__=="__main__":
	main()