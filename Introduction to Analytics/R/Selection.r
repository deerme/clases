#-----------------------
# Selección
#-----------------------

#----------------
# sentencia if
# ---------------

# La sintaxis del if es:
# 
# if (cond) expr
#
# 
# if (cond) expr1 else expr2

# cond puede tomar dos valores: verdadero o falso 
# en caso de que cond se cumpla se ejecutará expr1
# en caso contrario se ejecutará expr2


# Ejemplo: En este caso se calculará el logaritmo de un 
# número dependiendo si este es positivo o negativo

x <- -1 

if (x > 0) {
  y <- log(x)
} else
  y <- 0

y

# Solamente evalúa expresiones escalares, si se quiere colocar,
# por ejemplo, un vector éste evaluará sólo el primer elemento 

x <- c(-2, 10)
x

# Se pueden agrupar varias sentencias después del if o del else
# usando { }

if (x > 0) {
  y <- log(x)
} else {
  y <- 0
}


#------------------------------------------------------------
# Operadores Lógicos AND '&&' y OR '||'
#------------------------------------------------------------

x <- 10^6 
x

dato<- FALSE
if (x > 0)
  if (log(x) > 100) dato <- TRUE
dato

# Se pueden agrupar las sentencias mediante el operador lógico &

dato<-FALSE
if (x > 0 & log(x) > 100)  dato <- TRUE
dato

# probar el código anterior con x<- -2
x<- -2
if (x > 0 & log(x) > 100)  dato <- TRUE
dato


# cuando se utiliza el AND lógico este evaluará
# la expresión de izquierda a derecha

dato<-FALSE
if (x > 0 && log(x) > 100) dato <- TRUE
dato

# se tiene también el operador | y su correspondiente
# or lógico ||
# && y || pueden ser considerados como operadores bitwise


#-------------------------
# ifelse 
#-------------------------

# Se utiliza para usar vectores y no escalares en la condicion
# su forma es: 
# ifelse(test, yes, no)

?ifelse

# One implementation for the sinc function.

sinc <- function (x) ifelse(x == 0, 1, sin(x) / x)

sinc(-2:2) #o sea puedes meter vectores como si fueran valores unicos

# ejemplo anterior de log(x) con vector

x <- c(-2, 0, 1, 2)
ifelse(x > 0, log(abs(x)), 0)


