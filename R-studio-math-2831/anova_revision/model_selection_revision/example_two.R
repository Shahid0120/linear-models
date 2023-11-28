
cheese <- read.table("../data/cheese.txt", header = T)
cheese_mod=lm(taste~H2S+Lactic,data=cheese)
pr <- residuals(cheese_mod)/(1-hatvalues(cheese_mod))
pr

PRESS <- sum(pr^2)
PRESS
summary(chess)