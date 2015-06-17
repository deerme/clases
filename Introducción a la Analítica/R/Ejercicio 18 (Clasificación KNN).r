### CLASIFICACIÓN KNN ###

# https://archive.ics.uci.edu/ml/datasets/Breast+Cancer+Wisconsin+%28Diagnostic%29

# 1 # Leer el CSV considerando a los valores como no categóricos
wbcd = read.csv("wisc_bc_data.csv", stringsAsFactors = FALSE)

# 2 # Convertir a un dataframe
str(wbcd)

# 3 # Eliminar la primera columna que corresponde al identificador
wbcd = wbcd[-1]

# 4 # Imprimir cuántos datos son benignos y cuántos malignos
table(wbcd$diagnosis)

# 5 # Clasificar (con factores) el diagnóstico y ponerle etiquetas
wbcd$diagnosis = factor(wbcd$diagnosis, levels = c("B", "M"), labels = c("Benigno", "Maligno"))

# 6 # Hallar el porcentaje de cada diagnóstico, redondeando
round(prop.table(table(wbcd$diagnosis))*100, digits = 1)

# 7 # Imprimir un resumen de las MDTC de tres columnas
summary(wbcd[c("radius_mean", "area_mean", "smoothness_mean")])
# Decidimos normalizar los datos por la diferencia de rangos

# 8 # Crear una función de normalización por rangos
normalize = function(x){return ((x-min(x))/(max(x)-min(x)))}

# 9 # Aplicar la normalización a los datos (columna 2 a 31)
wbcd_n = as.data.frame(lapply(wbcd[2:31], normalize))
# Ahora los datos quedan entre 0 y 1, normalizados
# lapply aplica funciones a dataframes

# 10 # Crear nuestros datos de entrenamiento
wbcd_train = wbcd_n[1:469,]

# 11 # Crear los datos de prueba
wbcd_test = wbcd_n[470:569,]

# 12 # Separar las etiquetas de los datos de entrenamiento
wbcd_train_labels = wbcd[1:469,1]

# 13 # Separar las etiquetas de los datos de prueba
wbcd_test_labels = wbcd[470:569,1]

# 14 # Instalar la biblioteca de kNN (class)
install.packages("class")

# 15 # Cargar la biblioteca class
library(class)

# 16 # Realizar la predicción del vecino más cercano con k = 21
wbcd_test_pred = knn(train = wbcd_train, test = wbcd_test, cl = wbcd_train_labels, k = 21)

# 17 # Instalar la biblioteca gmodels
install.packages("gmodels")

# 18 # Cargar la biblioteca gmodels
library(gmodels)

# 19 # Crear un CrossTable de la predicción y el testeo, sin chi-cuadrado
CrossTable(x = wbcd_test_labels, y = wbcd_test_pred, prop.chisq = FALSE)

# 20 # Optimizar la función de normalización con Z-Score
normalizeZ = function(x){return ((x-mean(x))/(sd(x)))}
wbcd_nZ = as.data.frame(lapply(wbcd[2:31], normalizeZ))
wbcd_train = wbcd_nZ[1:469,]
wbcd_test = wbcd_nZ[470:569,]
wbcd_test_pred = knn(train = wbcd_train, test = wbcd_test, cl = wbcd_train_labels, k = 21)
CrossTable(x = wbcd_test_labels, y = wbcd_test_pred, prop.chisq = FALSE)
