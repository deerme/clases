# -*- coding: cp1252 -*-

from logic import * #importa logic.py
#es una biblioteca que simula circuitos eléctricos
#viene con clases de compuertas lógicas

def main():

#And tiene dos inputs A y B y un output C

	a = And('AA') #define 'a' como un And llamado AA
	a.C.monitor = 1 #activa la salida de 'a'
	a.A.set(1) #entrada A verdadero (a)
	a.B.set(1) #entrada B verdadero (a)
	
#Or tiene dos inputs A y B y un output C	
	
	b = Or('BB') #define 'b' como un Or llamado BB
	b.C.monitor = 1 #activa la salida de 'b'
	b.A.set(0) #entrada A falso (b)
	b.B.set(0) #entrada B falso (b)
	
#Not tiene un input A y un output B
	
	n = Not('NN') #define 'n' como un Not llamado NN

	a.C.connect(n.A) #conecta 'a' con 'n' en su input
	n.B.monitor = 1 #activa la salida de 'n'
	a.B.set(0) #entrada B falso (a)
	
if __name__=="__main__":
	main()
