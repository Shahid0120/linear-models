Weight=c(1.94,3.03,.69,.48,.77,1.28,.42,1.73,.67,1.61,2.02,2.64,8.95,4.42,9.36,6.32,7.30,6.34,7.49,7.62,10.32,6.71)
Rostal=c(1.31,1.58,.98,.92,.99,1.10,.96,1.23,1.00,1.25,1.31,1.48,1.94,1.57,2.14,1.83,1.70,1.72,1.65,1.72,2.22,1.70)
Wing=c(1.07,1.52,.83,.76,.84,.94,.78,1.04,.86,1.04,1.11,1.25,1.55,1.33,1.76,1.59,1.53,1.43,1.54,1.56,1.89,1.64)
RostalNotch=c(.44,.55,.34,.30,.32,.43,.33,.42,.36,.39,.45,.57,.65,.51,.77,.68,.60,.64,.70,.66,.77,.62)
NotchWing=c(.75,.92,.57,.50,.60,.62,.44,.75,.56,.71,.76,.86,1.06,.94,1.30,1.04,1.06,1.02,.94,1.06,1.26,1.12)
Width=c(.35,.48,.32,.24,.27,.32,.26,.32,.29,.33,.38,.44,.68,.49,.66,.60,.57,.63,.67,.61,.73,.54)
squid=data.frame(Weight,Rostal,Wing,RostalNotch,NotchWing,Width)

# A1/A2
library(leaps)
weight.best.subset <- regsubsets(Weight ~., data=squid)
sum.weight <- summary(weight.best.subset)

# A3
# Mallows' Cp
sum.weight$cp
sum.weight$which

# one variable 
one.model <- lm(Weight ~ Width, data=squid)
press.residual.one <- residuals(one.model) / (1 - hatvalues(one.model))
PRESS.one <- sum((press.residual)^2);PRESS.one

# two model
two.model <- lm(Weight ~ Width + NotchWing, data=squid)
press.residual.two <- residuals(two.model) / (1 - hatvalues(two.model))
PRESS.two <- sum((press.residual.two)^2); PRESS.two

# three model 
three.model <- lm(Weight ~ Width + NotchWing + Wing, data=squid)
press.residual.three <- residuals(three.model) / (1 - hatvalues(three.model))
PRESS.three <- sum((press.residual.three)^2); PRESS.three

# Four Model 
four.model <- lm(Weight~Width + NotchWing + Wing + RostalNotch, data=squid)
press.residual.four <- residuals(four.model) / (1 - hatvalues(four.model))
PRESS.four <- sum((press.residual.four)^2); PRESS.four

# Five Model 
five.model <- lm(Weight~Width + NotchWing + Wing + RostalNotch + Rostal, data=squid)
press.residual.five <- residuals(five.model) / (1- hatvalues(five.model))
PRESS.five <- sum((press.residual.five)^2); PRESS.five

# B 
library(MASS)
intercept.only.model <- lm(Weight~1, data=squid)
full.model <- lm(Weight~., data=squid)
# forward model selection with inital model just intercept.
step.forwards <- stepAIC(intercept.only.model, scope=list(lower = intercept.only.model, upper =full.model) , direction = c("forward"))
foward.final.model <- lm(Weight ~ Width + NotchWing, data=squid)
summary(foward.final.model)

# backwards selection with full model selection 
step.backwards <- stepAIC(full.model, scope=list(lower=intercept.only.model, upper=full.model), direction=c("backward"))
# same model as foward

# C
# optimal in A
## Weight ~ Width + NotchWing
# optimal in B 
## Weight ~ Width + NotchWing
# voilations? non-Linearity or homoseninity 
foward.final.model <- lm(Weight ~ Width + NotchWing, data=squid)
plot(foward.final.model, which=1)
plot(foward.final.model, which=2)
plot(foward.final.model, which=3)