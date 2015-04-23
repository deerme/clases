#---------------
# Funciones
#---------------

# Se pueden definir funciones como en cualquier
# otro lenguaje de programaci�n
# forma general
# nombre funcion<-function(par�metros) instrucciones
# ejemplo: logistic map
# f�rmula x(n+1)=g(xn)
#         g(x)=rx(1-x)

logistic<-function(r,x) r*x*(1-x)
logistic(3,0.4)

# se puede pasar cualquier tipo de par�metro
# para el caso siguiente tener cuidado del espacio en blanco despu�s
# del primer argumento num�rico
logistic(3.5, seq(0,1,length=5))

# para crear funciones con mayor n�mero de instrucciones
# utilizar los operadores de agrupamiento {}

lmap<-function(r)
{
	temp<-logistic(r, 0.6)
	logistic(r, temp)
}
lmap(1)

# incluso combinarlos con gr�ficos
logisticplot<-function(r,low,up,npuntos)
{
	x<-seq(low,up,length=npuntos)
	plot(x,logistic(r,x),type="l")
}

logisticplot(3,0,1,100)
