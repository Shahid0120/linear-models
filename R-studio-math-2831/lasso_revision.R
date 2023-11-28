
risk <- read.table("../data/risk.txt", header = T)
risk
library(MASS)
null_model <- lm(risk ~ 1, data=risk)
full_model <- lm(risk ~., data=risk)
stepAIC(null_model, scope = list(upper=full_model, lower=null_model),direction = c('forward'))

# backwards
step(full_model,scope = list(upper=full_model, lower=null_model), direction=c('backward'))

# lasso 
library(glmnet)
x = as.matrix(risk[,-8])
y = risk$risk
set.seed(1)
path_cv = cv.glmnet(x,y, nfold=5)
plot(path_cv)
path_cv$lambda.min
lasso <- glmnet(x,y,lambda = path_cv$lambda.min)
coef(lasso)

# lasso
set.seed(1)
x <- as.matrix(risk[,-8])
y <- risk$risk

train <- as.matrix(1:nrow(x), nrow(x)/2)
test <- (-train)

y.test <- y[test]
y.train <- y[train]

library(leaps)
model <- lm(y[train] ~ train, data=risk)
best_subset <- regsubsets(model)
best.subset <- regsubsets(risk~., ,data=risk[train,],nvmax=6)

