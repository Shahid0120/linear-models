## Lab Week 4
# question 1
head(firearms)
X<- as.matrix(cbind(1,firearms[1]))
leftside <- t(X)%*% X
rightside <- t(X) %*% firearms$rate
solve(leftside,rightside)
