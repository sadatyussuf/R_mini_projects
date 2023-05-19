
library(plyr)

iris.uci = read.csv(url("http://archive.ics.uci.edu/ml/machine-learning-databases/iris/iris.data"),
                     header=FALSE,
                     col.names = c("sepal.length","sepal.width","petal.length","petal.width", "species")
                     )


iris.uci$species = mapvalues(iris.uci$species,from = c("Iris-setosa","Iris-versicolor", "Iris-virginica"), to = 
                               c("setosa", "versicolor", "virginica"))

summary(iris.uci)

par(mfrow=c(2,2))
for(i in 1:4){
  hist(iris.uci[,i],freq=FALSE,
       xlab=colnames(iris.uci[i]), 
       cex.lab=1.2, main="")
  density_iris = density(iris.uci[,i])
  lines(density_iris,lwd=2,col='grey40')
  }
