
pain_score <- read.table("../data/blonds.txt", header = TRUE)
pain_score

# create 3 dummy variables
# 0 0 0 light blonde
# 1 0 0 drake blonde
# 0 1 0 light brunette 
# 0 0 1 dark brunette

y <- pain_score[,2]

model <- lm(Pain ~ DarkBlond + LightBrunette + DarkBrunette , data=pain_score)
summary(model)
anova(model)

# b
install.packages("car")
library("car")
my_matrix <- matrix(c(0,1,-1,0,0,0,1,-1), nrow = 2, ncol = 4)
linearHypothesis(model, my_matrix)