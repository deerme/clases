### CLASIFICADORES BAYESIANOS ###

# https://raw.githubusercontent.com/brenden17/sklearnlab/master/spam/sms_spam.csv

# 1 # Leer el CSV considerando a los valores como no categóricos
sms_raw = read.csv("sms_spam.csv", stringsAsFactors = FALSE)

# 2 # Convertir a un dataframe
str(sms_raw)

# 3 # Instalar el paquete de minería de datos
install.packages("tm")

# 4 # Cargar la biblioteca tm
library(tm)

# 5 # Categorizar la columna type por factores en una tabla
sms_raw$type = factor(sms_raw$type)

# 6 # Imprimir una tabla de frecuencia
table(sms_raw$type)

# 7 # Crear un corpus a partir del vector text
sms_corpus = Corpus(VectorSource(sms_raw$text))

# 8 # Crear el mapa corpus_clean y convertir a minúsculas
corpus_clean = tm_map(sms_corpus, content_transformer(tolower))

# 9 # Remover los números
corpus_clean = tm_map(corpus_clean, removeNumbers)

# 10 # Remover los stopwords
corpus_clean = tm_map(corpus_clean, removeWords, stopwords())

# 11 # Remover los espacios en blanco innecesarios
corpus_clean = tm_map(corpus_clean, stripWhitespace)

# 12 # Crear una matriz con la frecuencia de cada una de las palabras
sms_dtm = DocumentTermMatrix(corpus_clean)

# 13 # Crear una matriz para entrenamiento y otra para testeo de sms_raw
sms_raw_train = sms_raw[1:4169,]
sms_raw_test = sms_raw[4170:5559,]

# 14 # Crear una matriz para entrenamiento y otra para testeo de sms_dtm
sms_dtm_train = sms_dtm[1:4169,]
sms_dtm_test = sms_dtm[4170:5559,]

# 15 # Crear un vector para entrenamiento y otro para testeo de corpus_clean
sms_corpus_train = corpus_clean[1:4169]
sms_corpus_test = corpus_clean[4170:5559]

# 16 # Crear una matriz de confusión de las probabilidades de los datos correctos de entrenamiento y testeo
prop.table(table(sms_raw_train$type))
prop.table(table(sms_raw_test$type))

# 17 # Instalar el paquete wordcloud
install.packages("wordcloud")

# 18 # Cargar la biblioteca wordcloud
library(wordcloud)

# 19 # Crear una nube de palabras de las palabras más frecuentes (mínimo 40) y no al azar de los datos de entrenamiento
wordcloud(sms_corpus_train, min.freq = 40, random.order = FALSE)

# 20 # Crear un subconjunto de datos de los datos de entrenamiento clasificados como spam y otro para ham
spam = subset(sms_raw_train, type == "spam")
ham = subset(sms_raw_train, type == "ham")

# 21 # Crear una nube de palabras del subconjunto spam, máximo 40 palabras y una escala 3, 0.5
wordcloud(spam$text, max.words = 40, scale = c(3,0.5))

# 22 # Crear una nube de palabras del subconjunto ham, máximo 40 palabras y una escala 3, 0.5
wordcloud(ham$text, max.words = 40, scale = c(3,0.5))

# 23 # Hallar la frecuencia (mínimo 5) de la matriz de datos de entrenamiento
findFreqTerms(sms_dtm_train, 5)

# 24 # Crear un diccionario con las palabras que tengan una frecuencia mínima de 5 en los datos de entrenamiento
sms_dict = findFreqTerms(sms_dtm_train, 5)

# 25 # Crear una matriz sparsa de los datos de entrenamiento del corpus que pertenezcan al diccionario
sms_train = DocumentTermMatrix(sms_corpus_train, list(dictionary = sms_dict))

# 26 # Crear una matriz sparse de los datos de testeo del corpus que pertenezcan al diccionario
sms_test = DocumentTermMatrix(sms_corpus_test, list(dictionary = sms_dict))

# 27 # Categorizar los resultados a través de una función de clasificación, x > 0 será 1, 0 = No, 1 = Yes
convert_counts = function(x){
  x = ifelse(x > 0, 1, 0)
  x = factor(x, levels = c(0,1), labels = c("No", "Yes"))
  return(x)
}

# 28 # Aplicar la función a cada columna (margin = 2) de entrenamiento y testeo
sms_train = apply(sms_train, MARGIN = 2, convert_counts)
sms_test = apply(sms_test, MARGIN = 2, convert_counts)

# 29 # Instalar el paquete e1071 (de máquina de soporte vectorial, para clasificar)
install.packages("e1071")

# 30 # Cargar la biblioteca e1071
library(e1071)

# 31 # Clasificar los datos de entrenamiento de sms_train con sms_raw_train usando naiveBayes
sms_classifier = naiveBayes(sms_train, sms_raw_train$type)

# 32 # Predecir a partir del clasificador usando los datos de testeo
sms_test_pred = predict(sms_classifier, sms_test)

# 33 # Instalar el paquete gmodels
install.packages("gmodels")

# 34 # Cargar la biblioteca gmodels
library(gmodels)

# 35 # Crear una matriz de confusión (CrossTable) de la predicción y los datos de testeo, sin prueba de chi-cuadrado o T, y etiquetas
CrossTable(sms_test_pred, sms_raw_test$type, prop.chisq = FALSE, prop.t = FALSE, dnn = c('predicted', 'actual'))

# 36 # Optimizar el clasificador a través de un laplace de 1
sms_classifier = naiveBayes(sms_train, sms_raw_train$type, laplace = 1)

# 37 # Predecir de nuevo y crear la matriz de confusión
sms_test_pred = predict(sms_classifier, sms_test)
CrossTable(sms_test_pred, sms_raw_test$type, prop.chisq = FALSE, prop.t = FALSE, dnn = c('predicted', 'actual'))
