library(datasets)
head(iris)

?iris

# basic histogram 
hist(iris$Sepal.Length)
hist(iris$Sepal.Width)
hist(iris$Petal.Length)

# histogram by groups
par(mfrow = c(3,1))

# histogram for each species

hist(iris$Petal.Width [iris$Species == "setosa"],
     xlim = c(0,3),
     breaks = 9,
     main = "Petal Width for Setosa",
     xlab = "",
     col = "red")

hist(iris$Petal.Width [iris$Species == "versicolor"],
     xlim = c(0,3),
     breaks = 9,
     main = "Petal Width for Versicolor",
     xlab = "",
     col = "green")

hist(iris$Petal.Width [iris$Species == "virginica"],
     xlim = c(0,3),
     breaks = 9,
     main = "Petal Width for Virginica",
     xlab = "",
     col = "blue")




