# Question One 
firearm <- read.csv("../data/firearms.csv")
modelfirearm <- lm(firearm$rate ~ firearm$X)
ones <- c(rep(1:1, each=15))
x <- firearm$X
X <- cbind(ones,x)
y <- firearm$rate
solve(t(X)%*%X, t(X)%*%y)
summary(modelfirearm)
# b
# method one
Syy <- sum(y - mean(y))^2
Sxx <- sum(x - mean(x))^2
n <- dim(firearm)[1]
b1 <- -0.1521 
sigma_squared <- (Syy - b1^2 * Sxx) / (n - 2)

# method two 
A <- (diag(15) - X%*%solve(t(X)%*%X)%*%t(X))
simga2 <- t(y)%*%A%*%y / (n-2)
simga2

# (c)
trace_A <- t(A)
trace_A_square <- t(A%*%A)
det_A <- determinant(A)
det_A[1]