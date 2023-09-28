## Assignment 1 Question 1
## Shahid Hussain 
Town=c(1,2,3,4,5,6,7,8,9,10,11,12)
Robberies=c(643,754,582,700,518,668,630,510,801,564,570,511)
Police=c(59,55,64,53,79,66,63,90,50,80,89,68)
TownData=data.frame(Town, Police, Robberies)

## (a) What are the least squares estimates of the intercept and slope, and what is the estimated error variance for the fitted model?
y_axis_response <- TownData$Robberies
x_aix_predictor <- TownData$Police
plot(x_aix_predictor, y_axis_response, xlab = "Police", ylab = 'Robberies', main="Police vs Robberies")
robberies_vs_police_least_square_estimate <- lm(y_axis_response ~ x_aix_predictor, data = TownData)
abline(robberies_vs_police_least_square_estimate, col='blue')
summary(robberies_vs_police_least_square_estimate)
# calculating estimated error variacne
# from summary Residual standard error: 58.83 on 10 degrees of freedom
# 58.83^2

#3 (b) 
# esitmated chnages if delta(robberies) = Robberies(final) - Robberies(initial)
# intially 0 police : 1010.897 
# final : 1010.897 - 5.735(10)
# first need to find Sxx
b1 <- -5.735  
se_b1 <- 1.304
N = dim(y_axis_response)[1]
ci <- c(b1 - qt())
