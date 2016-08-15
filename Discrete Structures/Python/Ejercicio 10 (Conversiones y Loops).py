
## CONVERSIONES ##

int(-2)
#-2
int(-2.5)
#-2
float(2)
#2.0
int("123")
#123
bool(0)
#False
bool()
#False
bool(1)
#True
bool(2)
#True
str(123)
#'123'

## PRINT ##

def hola(): #define la función hola que no toma valores
    print ("Hola")
    
hola() #llama a la función hola

## WHILE ##

i=1

# i empieza en 1 por default, pero cuando el programa corre
# termina siendo i = 32
# por eso es necesario redefinir i en 1

while i*i<1000: #mientras que i*i es menor que 1000
    print ("Cuadrado de ",i," es ",i*i)
    i=i+1 #aumenta el valor en 1

## FOR ##
	
sum=0

for i in [0,1,2,3,4]: #repite el loop con los valores de la lista
	sum=sum+i
	print (sum)