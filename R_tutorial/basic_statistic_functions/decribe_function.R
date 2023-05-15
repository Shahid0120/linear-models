# describe function 
# Shahid Hussain 15th May 2023

install.packages(pacman)
require(pacman)

library(datasets)
head(iris)
p_load(psych)
p_help(psych, web= F)

decribe(iris$Sepal.Length)
describe(iris)
