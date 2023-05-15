library(datasets)
head(iris)


plot(iris$Species)
plot(iris$Sepal.Length)
plot(iris$Sepal.Length, iris$Sepal.Width)
plot(iris$Petal.Width)
plot(iris)
plot(iris$Sepal.Length, iris$Sepal.Width, 
     col = "#cc0000", 
     pch = 19,
     main = "Iris: Petal Length vs. Petal Width",
     xlab = "Petal Length",
     ylab = "Petal Width")

