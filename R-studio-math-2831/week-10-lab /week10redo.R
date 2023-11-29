# Question One
carsale <- read.table("../data/carsales.txt", header = T)
carmodel <- lm(RetailSales ~ GNP + Increase + GNP:Increase, data=carsale)
summary(carmodel)
carmodel_no_interaction <- lm(RetailSales ~ GNP + Increase , data=carsale)
summary(carmodel_no_interaction)
# Question Two 
pill <- read.table("../data/pill.txt", header = T)
pill
pillmodel <- lm(y ~ Dummy1 + Dummy2, data=pill )
summary(pillmodel)

# Question 3
sleep <- read.table("../data/sleep.txt", header = T)
sleep_model <- lm(Score ~ Group2 + Group3, data=sleep )
summary(sleep_model)

# Question 4 
haircolour <- read.table("../data/blonds.txt", header = T)
haircolour

haircolour <- lm(Pain ~ DarkBlond + LightBrunette + DarkBrunette , data=haircolour)
summary(haircolour)


# Question 5 
time <- read.table('../data/Timeformat.txt',header = T, stringsAsFactors = T) 
levels(time$Format)
time
time.model <- lm(Time ~-1+ Format, data=time)
summary(time.model)
library(car)
C <- matrix(c(0,1,-1,0, 
              0,0,1,-1),2,4, byrow=T)
data.frame(time$Format,model.matrix(time.model))
linearHypothesis(time.model,C)

help(matrix)

# Question 6
data(iris)
iris2 <- iris
iris2$versicolor <- (iris2$Species == "versicolor")*1
head(iris2)
m<-glm(versicolor~.-Species, data=iris2)
summary(m)
help(glm)
