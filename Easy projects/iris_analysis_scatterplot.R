library(ggplot2)
library(GGally)
library(RColorBrewer)

library(plyr)


iris.uci = read.csv(url("http://archive.ics.uci.edu/ml/machine-learning-databases/iris/iris.data"),
                    header=FALSE,
                    col.names = c("sepal.length","sepal.width","petal.length","petal.width", "species")
)


iris.uci$species = mapvalues(iris.uci$species,from = c("Iris-setosa","Iris-versicolor", "Iris-virginica"), to = 
                               c("setosa", "versicolor", "virginica"))


ggpairs(iris.uci,aes(color=species))
