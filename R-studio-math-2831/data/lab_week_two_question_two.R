## Week 2 Questio 2 
## Shahid Hussain 

## Q1
# Scatterplot of PSR vs ITL
plot(forbes$savings, forbes$tax, main="Scatterplot of PSR vs ITL")
summary(forbes)
# not allot of data points
# can see a relationship
# linear regression vs non-linear regression 
# simple vs multiple
# check R^2 which is a measure of goodness of fit 
savings_vs_tax_regression <- lm(tax ~ savings, data = forbes)
summary(savings_vs_tax_regression)
# Multiple R-squared:  0.6084 which is high >0.5 so its good?

# Q2 ~ relationship is wrong way?
# the for saving tvalues =  -3.525 p_value = 0.007787 < 0.01 which mean we can reject the null hypothesis of B1= 0
# this is also same for the B0 which a p-value < 0.001 (strong evidence)
# that mean tax = 56 -2.2*savings
# that is everytimes saycing goes up tax decrease 
# the initial hypothesis of "Blotnick suggests that we are more inclined to save and invest if we are allowed to keep some of the rewards" is therefore true cause the more savings 

