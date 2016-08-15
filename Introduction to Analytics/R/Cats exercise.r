#install.packages("e1071")

library(e1071)
library(MASS)
data(cats)

cats

model <- svm(Sex ~ Bwt+Hwt, data = cats)

plot(model, cats)

index <- 1:nrow(cats)
testindex <- sample(index, trunc(length(index)/3))

testset <- cats[testindex,]
trainset <- cats[-testindex,]

testset
dim(testset)

trainset
dim(trainset)

model <- svm(Sex ~., data = trainset)
#~. sirve para tomar todos los datos

prediction <- predict(model, testset [,-1])

tab <- table(pred = prediction, true = testset[,1])
tab
