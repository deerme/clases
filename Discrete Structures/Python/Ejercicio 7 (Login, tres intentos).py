# -*- coding: cp1252 -*-

def main():

	nombre = input("Ingrese su nombre: ")
	counter = 0
	
	while counter < 3:
		password = input("Ingrese su clave: ") #la clave es 123
		
		if password != "123":
			counter = counter + 1
			print("Error (",counter,")")
			
			if counter == 3:
				print("Goodbye.")
			
		else:
			print("Bienvenido", nombre)
			break
	
if __name__=="__main__":
	main()