
# Question One
eps <- read.table("../data/eps.txt", header = TRUE)
plot(eps$year, eps$EPS)
model <- lm(eps$EPS ~ eps$year)
abline(model)
summary(model)
par(mfrow = c(2,2))
plot(model)
# (c) b1 = 0.090833 || sigma^ = 0.05466 || Multiple R-squared:  0.9595
#(d) T-statistic = 12.87 || p-value = 3.97e-06 
# (e) F = T^2 =  (12.87)^2
# (f) U shape, normaly distribtion, but low data poitns need more!

# Question 2 

forbes = read.table("../data/forbes.txt", header = TRUE)
forbesfullmodel <- lm(savings ~ tax, data=forbes)
summary(forbesfullmodel)

#(a) looks like a linear relationship, but we require more data poitns
# (b) F-test = 12.43 || p-value = 0.007787 < 0.05 so at a yes there is reject Ho 

# Question 3 
firearms <- read.csv("../data/firearms.csv", header = TRUE)
firearms
plot(firearms$year, firearms$rate)
firearmsmodel <- lm(rate ~ X, data=firearms)
summary(firearmsmodel)
# yes strong evidence! F-test 

# mean response change :  -0.1521 
# R^2 change : 0.8878

