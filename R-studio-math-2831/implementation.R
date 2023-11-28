cheese <- read.table("../data/cheese.txt", header = T)
cheese

### PRESS
model <- lm(taste ~ Acetic + H2S +Lactic, data=cheese)
pr <- residuals(model) / (1- hatvalues(model))
PRESS <- sum(pr^2)

### CROSS validation
install.packages("cvTools")
library(cvTools)
cheese_mod <- lm(taste~H2S+Lactic,data=cheese)
CVC <- cvFit(cheese_mod,data=cheese,y=cheese$taste,K=5,seed=1) 
CVC$cv
# uses CV(k) = 1/k sum(MSE)

### Mallow CP
library(leaps)
cp <- leaps( x=cheese[,2:4], y=cheese$taste, names=names(cheese)[2:4], method="Cp")
summary_cheese <- summary(model)
### Using Regsubsets Mallow Cp 
library(leaps)
cheese.best.subsets <- regsubsets(taste~., data=cheese)
summary(cheese.best.subsets)
sum.cheese <- summary(cheese.best.subsets)
sum.cheese$cp

### AIC
## Method 1
AIC(model)
## Method 2
library(MASS)
step <- stepAIC(model, direction="backward")

### MSE -> Predicted performance 
MSE <- mean((y ‐ predict(lm(risk~Div, data=risk[test,])))^2)

### Lasso
library(glmnet)
x=as.matrix(cheese[,-1])
y=cheese$taste
#cross validation path
path_cv=cv.glmnet(x,y)
plot(path_cv)
cheese_mod=glmnet(x,y,lambda=path_cv$lambda.min)
coef(cheese_mod)

