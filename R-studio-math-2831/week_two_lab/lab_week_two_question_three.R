## Question 3 week 2 
## Q1
plot(firearms$year, firearms$rate, main="firems in Australia", xlab = "Year", ylab = "Rate (per 10,000)")
# 
simple_regression_fireams <- lm(firearms$rate ~ firearms$year)
summary(simple_regression_fireams)
abline(simple_regression_fireams)

# (d)
# from results is shows under hypotehsis testing H0 : B1 = 0
# the results show t-value -10.14 pvalue : 1.53e-07 ***, thats mean 
# there us strong evidences against the and the t-value shows how many stadnard deviations it is away from b1 = 0 
# this we can say trhat ere "strong evidence that the rate od deaths from firemas in australia have a linear trend over the period collect"


# (e)
# for ever one unit of changes in the predictor value (year) there is a decrease in
# 10,000(-0.1521) up or down depedning if year increases of decreases 



# (f)
# coefficient determinant R^2 = 0.8878  
#
#
#
