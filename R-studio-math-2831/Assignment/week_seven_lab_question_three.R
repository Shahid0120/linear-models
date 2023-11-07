
library(leaps)
x=model.matrix(risk~.,data=risk)[,-1]
y=risk$risk
set.seed(1)
train = sample(1:nrow(x),nrow(x)/2)
test = (-train)
y.test = y[test]
y.train = y[train]
risk[train,] #training set
risk[test,] #test set
# test error

# # model One
# model.one <- lm(risk ~ Leverage, data=risk)
# predictions.one <- predict(model.one, newdata =risk.test)
# test.error.one <- sqrt(mean((predictions.one- risk.test$risk)^2))
# 
# # model two 
# model.two <- lm(risk ~ Leverage + Size, data=risk)
# predictions.two <- predict(model.two, newdata =risk.test)
# test.error.two <- sqrt(mean((predictions.two- risk.test$risk)^2))
# 
# # model three
# model.three <- lm(risk ~ Leverage + Size + Div, data=risk)
# predictions.three <- predict(model.three, newdata =risk.test)
# test.error.three <- sqrt(mean((predictions.three - risk.test$risk)^2))
# 
# # model four
# model.four <- lm(risk ~ Leverage + Size + Div + Earn2, data=risk)
# predictions.four <- predict(model.four, newdata =risk.test)
# test.error.four<- sqrt(mean((predictions.four- risk.test$risk)^2))
# 
# # model five
# model.five <- lm(risk ~ Leverage + Size + Div + Earn2 + Ratio, data=risk)
# predictions.five <- predict(model.five, newdata =risk.test)
# test.error.five <- sqrt(mean((predictions.five - risk.test$risk)^2))
# 
# # model six 
# model.six <- lm(risk ~ Leverage + Size + Div + Earn2 + Growth, data=risk)
# predictions.six <- predict(model.six, newdata =risk.test)
# test.error.six  <- sqrt(mean((predictions.six  - risk.test$risk)^2))
# 
# # model seven 
# model.seven <- lm(risk ~ Leverage + Size + Div + Earn2 + Growth + Earn1, data=risk)
# predictions.seven <- predict(model.seven, newdata =risk.test)
# test.error.seven <- sqrt(mean((predictions.seven - risk.test$risk)^2))
# 
# combined_errors <- cbind(test.error.one,test.error.two,test.error.three,test.error.four,test.error.five,test.error.six,test.error.seven)
# 
# combined_errors
# 
# # test.error.one test.error.two test.error.three test.error.four test.error.five test.error.six test.error.seven
# # [1,]       1.609351       1.410996         1.072178        1.062816        1.027099       1.031485        0.9366569
# 

library(leaps)
risk.best.subsets <- regsubsets(risk~.,data=risk[train,],nvmax=6)
summary(risk.best.subsets)

# Compute the test error (sum of the squared prediction errors) for the best subsets of each size
test.mse = rep(NA,6)
test.mse[1] = mean((y[test] - predict(lm(risk~Div, data=risk[test,])))^2)
test.mse[2] = mean((y[test] - predict(lm(risk~Div+Size, data=risk[test,])))^2)
test.mse[3] = mean((y[test] - predict(lm(risk~Div+Ratio+Leverage, data=risk[test,])))^2)
test.mse[4] = mean((y[test] - predict(lm(risk~Div+Ratio+Leverage+Earn2, data=risk[test,])))^2)
test.mse[5] = mean((y[test] - predict(lm(risk~Div+Ratio+Size+Leverage+Earn2, data=risk[test,])))^2)
test.mse[6] = mean((y[test] - predict(lm(risk~Div+Ratio+Size+Growth+Leverage+Earn2, data=risk[test,])))^2)
test.mse

# plot 
plot(test.mse,type='b')

which.min(test.mse)
#The best model contains 6 predictors

# perform best subset selection on the full data set, and select the best 6-variable model
risk.best.subsets.full <- regsubsets(risk~.,data=risk,nvmax=6)
coef(risk.best.subsets.full,6)



library(glmnet)
lasso.mod = glmnet(x[train,],y[train])
plot(lasso.mod,xvar="lambda")

set.seed(1)
path_cv=cv.glmnet(x[train,],y[train],nfolds=3)
plot(path_cv)

#Report the test error obtained, along with the number of non-zero coefficient estimates
bestlam=path_cv$lambda.min
lasso.pred  = predict(lasso.mod,s=bestlam, newx=x[test,])
mean((lasso.pred - y.test)^2)


# Refit lasso model to the full data set with chosen by cross-validation.
lasso_risk=glmnet(x,y,lambda=path_cv$lambda.min)
coef(lasso_risk)

# (d) 
# from Lasso we found the best model is all wihtout grwoth with MSE = 2.324801
# for using subset selection we found  the best model is wihtout Earn1 with MSE = 0.6802574
# Are you looking for a model with the best predictive performance, or are you prioritizing model simplicity and interpretability?(Complexity vs predictive performacne)
# complexity ... what we think will be best... Evaluation Metrics: While MSE is a commonly used metric, you can consider other evaluation metrics 
# such as R-squared (R^2), Root Mean Squared Error (RMSE), or Mean Absolute Error (MAE). Each metric provides different insights into model performance.

plot()