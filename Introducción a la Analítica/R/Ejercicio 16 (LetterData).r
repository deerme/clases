library(e1071)

letras <- read.csv("letterdata.csv")
str(letras)

letras_train <- letras[1:16000,]
letras_test <- letras[16001:20000,]

clasificador <- svm(letter ~., data = letras_train, kernel = "linear")
plot(clasificador, data = letras, xbox ~ onpix)

print(clasificador)
summary(clasificador)

predicciones <- predict (clasificador, letras_test)
tab <- table(predicciones, letras_test$letter)

length(predicciones)
length(clasificador)

#imprimir matriz de confusión
tab

aciertos <- predicciones == letras_test$letter
table(aciertos)
prop.table(table(aciertos))

#cambiamos a radial

clasificador <- svm(letter ~., data = letras_train, kernel = "radial")
predicciones <- predict (clasificador, letras_test)
tab <- table(predicciones, letras_test$letter)
aciertos <- predicciones == letras_test$letter
table(aciertos)
prop.table(table(aciertos))
