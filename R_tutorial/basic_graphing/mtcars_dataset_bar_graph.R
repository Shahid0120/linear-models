library(datasets)
head(mtcars)

# table of frequencies
cylinders <- table(mtcars$cyl)
barplot(cylinders)
plot(cylinders)

# Clear environment 
rm(list = ls())
