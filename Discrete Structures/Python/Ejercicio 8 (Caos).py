def main():
	print ("Función Caos")
	x=eval(input("Ingrese un número real del 0 al 1: "))
	#input() devuelve un string, eval(input()) devuelve un número
	
	i=1
	for i in range(10): #de i=1 hasta 10
		x=3.9*x*(i-x)
		print (x)
		print (i)