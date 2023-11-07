# Question One week 7 Lab 
# Shahid Hussain

install.packages("leaps")
library(leaps)

# Assuming 'biomass' is your data frame
model <- lm(y ~ x1 + x3 + x2 + x4, data = biomass)
model_p <- lm(y ~ x1 + x2, data=biomass)

Cp <- leaps(
  x = biomass[, 2:5],
  y = biomass$y,
  names = names(biomass)[2:5],
  method = "Cp"


r2 <- leaps(
  x = biomass[, 2:5],
  y = biomass$y,
  method = "r2"
)

adjr2 <- leaps(
  x = biomass[, 2:5],
  y = biomass$y,
  method = "adjr2"
)

result <- cbind(
  Cp$which,
  R2 = r2$r2,
  AdjR2 = adjr2$adjr2,
  MallowCp = Cp$Cp,
  p = Cp$size
)
result

# (A) Cp = sum(var()/sigma^2) 
# model with y = b0 + b1x1 + b4x4

# (b) Manually calculating Cp
# finding variance of full model 
variance.full.model <- (summary(model)$sigma)*(summary(model)$sigma))
# SS(reg)
anova(model)$"Sum Sq"[5]
n = 10
# colum vectors of p
p = Cp$size
p[1] - 1
# takes a model from the output then find the SS(res)
i = 1
while(i <= 10) {
  predictor.numb <- p[i] - 1
  # finds many which predictor it is
  while(k <= predictor.numb) {
    # loop results row from 
    
  }
    
  # creates a linear regression mdoel
  # using anove find the SS(res)
  # saves the SS(res) into the new model 
  i++;
}

# calculates the Cp using the SS(res) saved

# (iii)
# (1) y = x1+ x4 Cp -> 3.160927
# (2) y = x1 + x2 + x4 Cp ->  3.308143
# Conducting a sequential F-test
# Ho : x4 = 0 and Ha : x4 =/ 0 
model.x4.zero <- lm(y ~ x1 + x4, data=biomass)
model.x4.not.zero <- lm(y ~ x1+x2+x4, data=biomass)
anova(model.x4.zero, model.x4.not.zero)
# output F-statistic : 2.0943 p-value :   0.198 
# conclusion probability is high therefore we accept H0 so the better model is y = x1+x2+x4

# (iv)
# PRESS statistic
# 
PRESS <- function(linear.model) {
  pr <- residuals(linear.model)/(1 - lm.influence(linear.model)$hat)
  sum(pr^2)
}
press_value_zero <- PRESS(model.x4.zero)
press_value_not_zero <- PRESS(model.x4.not.zero)
# press_value_not_zero : [1] 447884.3
# press_value_zero : [1] 488928.9
# the smaller then press residual the better therefore press_value_not_zero  is a beteter tool overall we should use 

# b 
# (i)when adjusted R^2 < 0 then overfitting based y = x1 + x2 + x4 0.94042656
# (ii) adjusted r^2 is negative becasue of overfitting since 1 - (1-R^2)(n-1)/(n-k-1).. (1-R^2)(n-1)/(n-k-1) can be
# bigger then 1 since n - k - 1 can be a small number 

