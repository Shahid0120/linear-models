# Lab Week 4 
# Question 1 
head(firearms)
X <- as.matrix(cbind(1,firearms[1]))
leftside <- t(X)%*% X
rightside <- t(X) %*% firearms$rate
solve(leftside,rightside)
b.least.sqaure.estimate <- solve(leftside,rightside)
b.least.sqaure.estimate

# proof numerically
y <- firearms$rate
x <- firearms$X
mean.y <- mean(y)
mean.x <- mean(x)
b0 <- mean.y - (mean.x* b.least.sqaure.estimate[2])
Sxy <- sum((y - mean.y) * (x - mean.x))
Sxx <- sum((x - mean.x)^2)
b1 <- Sxy / Sxx
b <- c(b0 , b1)
b


# (b)
# equation (1)
Sxx <- sum((x - mean.x)^2)
Syy <- sum((y - mean.y)^2)
variacne_estimated <- (Syy - b1^2*Sxx) / (length(firearms$year) - 2)
variacne_estimated

# equation 2
dim(X %*% solve(t(X) %*% X, t(X)))
A <- diag(15) - X %*% solve(t(X) %*% X, t(X))
variance_estimated_two <- (1/(length(x) - 2)) * t(y) %*% A %*% y
variance_estimated_two



