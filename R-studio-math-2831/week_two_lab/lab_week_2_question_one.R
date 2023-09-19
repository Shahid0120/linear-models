## Week 2 Lab MATH2831
## Shahid Hussain 

# Q1 
# initialising data
coded_year <- c(1:9)
EPS <- c(0.27,0.42,0.39 ,0.50,0.57,0.64,0.76,0.93,1.03)

#(a) Created a scatterplot 
plot(coded_year, EPS, main="EPS between 1977 to 1985", xlab="Year", ylab="EPS", pch = 1,  # Point character (16 represents solid dots)
     col = "blue" )

# (b) created simple linear plot in the form EPS = b0 + b1*(coded_year)
simple_linear_model <- lm(EPS ~ coded_year)
abline(simple_linear_model, col = "red")
summary(simple_linear_model)

# (c) 
# intercept : b_{0} = 0.158056
# slope: b_{1} = 0.090833
# estimated of error standard deviation (aka residual sd) = 0.05466 on 7 degrees of freedom
# R^2 = 0.9595 

#(d) 
# Hypothesis testing : Ho : B0 =0
# p-value = 0.00532
# t value = 3.98
# H0 : B1 = 0
# p-value = 12.87
# t-value = 3.97e-06

#(e)
# H0 : b1 = 0
# F-statistic: 165.7 on 1 and 7 DF 
# how to check t-distribution was used? 

# (f). the assumptions is
# (1) erorrs ~ N(0,sigma^2)
#
#
#
#
#
#
#
#
plot(simple_linear_model, which=1)
