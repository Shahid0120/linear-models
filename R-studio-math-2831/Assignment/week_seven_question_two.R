# Foward
install.packages("MASS")
library(MASS)
null <-lm(risk~1,data=risk)
full <-lm(risk~.,data=risk)
stepAIC(null, scope = list(lower = null, upper = full),
        direction = 'forward')
# Coefficients:
#   (Intercept)          Div         Size     Leverage        Ratio        Earn1        Earn2  
# 2.3531       0.4253      -0.2479       3.6742       0.8939       0.1368       1.1152 

# backwards AIC
library(MASS)
null <-lm(risk~1,data=risk)
full <-lm(risk~.,data=risk)
stepAIC(full, scope = list(lower = null, upper = full),
        direction = 'backward')
# (Intercept)          Div        Ratio         Size     Leverage        Earn1        Earn2  
# 2.3531       0.4253       0.8939      -0.2479       3.6742       0.1368       1.1152 
# lasso

install.packages("glmnet") 
library(glmnet)
x= as.matrix(risk[,-8]) 
y=risk$risk
lasso.mod = glmnet(x, y)
plot(lasso.mod,xvar="lambda")

set.seed(1)
# ensrue the random are all the same 
#cross validation path
path_cv=cv.glmnet(x,y,nfolds=5) 
plot(path_cv)
path_cv$lambda.min
lasso_risk=glmnet(x,y,lambda=path_cv$lambda.min) 
coef(lasso_risk)








