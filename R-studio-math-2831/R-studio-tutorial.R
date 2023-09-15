## R-studio for tutorial by MarinstatsLectures
## 15 Sep 2023


x2 <- seq(from=1, to=-7, by=-1)
x2

x3 <- rep(1, times=7)
x3

x4 <- rep(c("maria", "shahid"), times=10)
x4 
x2/2
mat <- matrix(c(1,2,3,4,5,6,7,8,9), nrow=3, byrow=TRUE)
mat
mat[,1]
mat[1,]

abalone <- read.table(file="~/Downloads/data/abalone.txt", header=TRUE, sep="\t")
abalone$length
dim(abalone)
head(abalone)
tail(abalone)
names(abalone)
mean(abalone$length)
detach(abalone)
attach(abalone)
names(abalone)
class(length)
class(diameter)
class(rings)
class(weight.s)
rings_greater_10 <- as.numeric(abalone$rings > 6 & abalone$rings < 10)
rings_greater_10
summary(abalone)
getwd()
setwd("~/Github/Rstudio-Math2831/R-studio-math-2831/")
# rm(list=ls())
data2 <- read.table(file.choose(), header=TRUE, sep="\t")

# contining project from another files
# load("filename")


# pakages downloads 
help("install.packages")
install.packages("epiR")
library(epiR)
install.packages()
help("package.contents")


