setwd("C:/Users/Jose/Documents/Workspaces/RStudio")

# 1 # Leer el CSV
credito = read.csv("credit.csv")

# 2 # Mostrar la estructura del objeto credito
str(credito)

# 3 # Examinar el historial de ahorros
table(credito$checking_balance)

# 4 # Examinar el historial de créditos
table(credito$savings_balance)

# 5 # Obtener las MTC de las hipotecas mensuales
summary(credito$months_loan_duration)

# 6 # Obtener las MTC resumen de los montos
summary(credito$amount)

# 7 # Examinar el resumen de historiales
table(credito$default)

# 8 # Crear una semilla para los datos aleatorios
set.seed(12345)

# 9 # Crear 1000 datos aleatorios en credito_rand
credito_rand = credito[order(runif(1000)),]

# 10 # Obtener las MTC de los montos de credito_rand
summary(credito_rand$amount)

# 11 # Comparar los 10 primeros datos de amount
head(credito$amount, 10)
head(credito_rand$amount, 10)

# 12 # Dividir los datos en entrenamiento y prueba
credito_entr = credito_rand[1:900,]
credito_test = credito_rand[901:1000,]

# 13 # Ver la proporción del resumen de historiales
prop.table(table(credito_entr$default))
prop.table(table(credito_test$default))

# 14 # Instalar el paquete de árboles de decisión
install.packages("C50")

# 15 # Cargar la biblioteca
library(C50)

# 16 # Crear el árbol de decisión sin la columna 21
credito_tree = C5.0(credito_entr[,-21], as.factor(credito_entr$default))

# 17 # Ver un resumen del árbol
summary(credito_tree)

# 18 # Instalar el paquete gmodels
install.packages("gmodels")

# 19 # Cargar la biblioteca
library(gmodels)

# 20 # Crear una predicción usando el árbol y los datos de testeo
credito_pred = predict(credito_tree, credito_test)

# 21 # Crear un crosstable
CrossTable(credito_test$default, credito_pred, prop.chisq = FALSE, prop.c = FALSE, prop.r = FALSE, dnn = c('resumen real', 'resumen predicho'))

# 22 # Optimizar el modelo con boosting
credito_boost = C5.0(credito_entr[,-21], as.factor(credito_entr$default), trials = 10)

# 23 # Ver un resumen del boost
summary(credito_boost)

# 24 # Crear una nueva predicción
credito_boost_pred = predict(credito_boost, credito_test)

# 25 # Crear un nuevo crosstable
CrossTable(credito_test$default, credito_boost_pred, prop.chisq = FALSE, prop.c = FALSE, prop.r = FALSE, dnn = c('resumen real', 'resumen predicho'))
