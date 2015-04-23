#-------------------------------------------
# Vectores
#-------------------------------------------

# Para la creación de vectores use la palabra reservada c
v<-c(2,3,4,5,6.2)
v

# Se pueden unir vectores con otros mediante c
c(v,v,0)

# Mayormente se usa para ingresar vectores pequeños
# También se puede usar el scan()

vv<-scan()
3 4.5 6 8

vv

# Vectores lógicos
c(T,F,T,F)

# Operadores de comparación y vectores
v>5

# Operadores relacionales >,<,>=,<=,==,!=

# Cadenas y vectores
datosV<-c("label1","label2","label3","label4")
datosV

# Indices
v[2]

v

# Se pueden obtener distintas los elementos de distintas posiciones

v[c(5, 1)]

# También reemplazarlos por otros valores

v
v[c(2,3)] <- c(4,5)
v

# El valor del índice puede ser almacenado en una variable

ind <- c(2, 3)
v[ind]

#Indices negativos
#No visualizan los elementos de las posiciones dadas
v
v[-3]
v[-c(3, 4)]

# Indexamiento con valores lógicos
# Toma aquellos valores que tienen un valor igual a true
v
v > 2.5
v[v > 2.5]

# Se puede utilizar la función as.numeric para convertir los datos
# a números (0 y 1 dependiendo del valor de verdadero o falso)
v>2.5
as.numeric(v>2.5)

# El indexamiento puede darse también con un vector de nombres
colores<-c("amarillo","rojo","verde","azul")
colores
names(v)
names(v)<-colores
v
v["azul"]

# para removerlos se utiliza NULL
names(v)<-NULL
v

# Otra forma de indexamiento con nombres
e<-c(a=1, b=2, c=3, d=4, e=5)
names(e)
e['b']

# Incluso asignar las anteriores etiquetas a otro vector
names(v)<-e
v

# El operador de asignación copia un vector y sus indices

w <- v
w
v[] <- 5 # Componentes reemplazados por 5
v

v <- 3   # Valores escalares
v

v <- w   # Se retorna al vector original
v

# Construcción de vectores con seq() y rep()
a<-seq(10)
a

b<-seq(0,1,length=20)
b

c<-seq(0,1,by=0.1)
c

d<-rep(1,4)
d

e<-rep("indice",3)
e

f<-rep(c("alto","bajo"),3)
f

#---------------------------------
# Operaciones con vectores
#---------------------------------

# Se realizan elemento por elemento
# Extraigamos las etiquetas primero
names(w)<-NULL
w
v
w <- 2 * v + 5
w

log(v)

v * w

1 / v

# Otros operadores
length(v)
sum(v)
v<-c(4.5,6,9.2,1.5)
sort(v)
v
order(v)
v[order(v)]
sort(v)

# Funciones estadísticas con vectores

mean(v) # media aritmética
var(v)  # varianza
sd(v)   # desviación estandard


#---------------------------
# Inicialización de vectores
#---------------------------

# Se utiliza la función numeric
e<-4
z<-numeric(e)
z

# Se puede modificar para otros valores

z[] <- 1
z

#------------------------------------
# Valores faltantes NA
#------------------------------------

d <- c(v, NA)
d

# Representa valores nulos o faltantes
is.na(d)

d[is.na(d)] <- 4
d




