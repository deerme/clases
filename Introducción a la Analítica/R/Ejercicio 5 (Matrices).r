#------------------------------------------------------
# Matrices
#------------------------------------------------------

a <- 1:9
a

# La funci�n matrix() sirve para crear una matriz
# el llenado es columna por columna

m <- matrix(a, nrow = 3)
m

# aunque tambien se puede hacer fila por fila

n <- matrix(a, nrow = 3, byrow = T)
n

# Matriz de 2 x 3 con todos sus elementos igual a cero

matrix(0, 2, 3)

# Use dim para obtener la dimension de una matriz

dim(m)

# Los �ndices se usan como en cualquier lenguaje de programaci�n

m[2, 1]

# Se pueden sacar filas y columnas completas

m[2, ]
m[ , 3]

# O incluso una parte de la matriz

m
m[c(1, 2), c(2, 3)]

# Se pueden remover valores con �ndices negativos
m[-1,-1]
m[,-1]

# Combinacion con rbind y cbind

v <- 1:4
w <- 5:8
a <- rbind(v, w)
b <- cbind(v, w)
a
b

# Indexaci�n por nombre

a
a["v", ]

# Se pueden etiquetar los �ndices

rownames(a)
colnames(a)

colnames(a) <- c("alpha", "beta", "gamma", "delta")
a
a["v","alpha"]

#------------------------------
# Operaciones con matrices
#------------------------------

1 / a


# Multiplicaci�n de matrices

a %*% b

#----------------------------------------------
# apply para operaciones en filas o columnas
#----------------------------------------------

m
apply(m, 1, sum) # suma por filas
apply(m, 2, sum) # suma por columnas

