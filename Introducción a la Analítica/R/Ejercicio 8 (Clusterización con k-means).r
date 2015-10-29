irisTemp = iris
irisTemp$Species = NULL

kmeans.res = kmeans(irisTemp,3)
table(iris$Species, kmeans.res$cluster)

col = kmeans.res$cluster

c("Sepal.Length","Sepal.Width")
irisTemp[c("Sepal.Length","Sepal.Width")]
plot(irisTemp[c("Sepal.Length","Sepal.Width")],col=kmeans.res$cluster)
points(kmeans.res$centers[,c("Sepal.Length","Sepal.Width")], col = 1:3, pch = 8, cex = 2)
