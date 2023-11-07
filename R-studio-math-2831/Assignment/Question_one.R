## Assignment 1 Question 1
## Shahid Hussain 
Town=c(1,2,3,4,5,6,7,8,9,10,11,12)
Robberies=c(643,754,582,700,518,668,630,510,801,564,570,511)
Police=c(59,55,64,53,79,66,63,90,50,80,89,68)
TownData=data.frame(Town, Police, Robberies)

# (a) What are the least squares estimates of the intercept and slope, and what is the estimated error variance for the fitted model?
y_axis_response <- TownData$Robberies
x_aix_predictor <- TownData$Police
plot(x_aix_predictor, y_axis_response, xlab = "Police", ylab = 'Robberies', main="Police vs Robberies")
robberies_vs_police_least_square_estimate <- lm(y_axis_response ~ x_aix_predictor, data = TownData)
abline(robberies_vs_police_least_square_estimate, col='blue')
summary(robberies_vs_police_least_square_estimate)
# calculating estimated error variance
# from summary Residual standard error: 58.83 on 10 degrees of freedom
# 58.83^2

# (b) 
# esitmated chnages if delta(robberies) = Robberies(final) - Robberies(initial)
# intially 0 police : 1010.897 
# final : 1010.897 - 5.735(10)
# first need to find Sxx
b1 = -5.735  
se_b1 = 1.304
N = dim(TownData)[1]
t_critical <- qt(0.99, N - 2) 
ci <- c(10*b1 + t_critical*se_b1, 10*b1 - t_critical*se_b1)
ci

# (c) R^2 = SS(reg)/SS(total) as there is only 1 predictor 
# r they looking for percentage or number?

# (d) observed F-test
anova(robberies_vs_police_least_square_estimate)
f_obs <- 19.331
# (e) one sided partial t-test 
t_value <- -4.397 
p_value <- pt(abs(t_value), df=10);
help("anova")
p_value

#(f)
# The forecast for the number of robberies when the town has 84 police officers
b0 <- 1010.897
b1 <- -5.735  
new_predicted_value <- 84 
eigthy_four_police <- b0 + b1*(new_predicted_value)
# as x = 84 is not part of Police data set thus we are making a prediction!
new_data <- data.frame(x_aix_predictor = 84)
# confidence interval 98%
mean_response_confidence_interval<- predict(robberies_vs_police_least_square_estimate, newdata= new_data, interval= 'confidence', level=0.98)
# prediction interval 98% 
mean_resposne_prediction_interval<- predict(robberies_vs_police_least_square_estimate, newdata= new_data, interval= 'prediction', level=0.98)

#(g) Bonferroni adjustment to compute a joint confidence interval for  β0  and  β1  with at least 98% confidence level
joint.fam <- 2 
alpha <- 0.02
joint.level <- alpha/joint.fam
bonf.int <- confint(robberies_vs_police_least_square_estimate, level=1-joint.level)
bonf.int 

#(e) diagnostic plots QQplot + residual vs fitted values
# residual vs fitted model 
res.fit <- plot(robberies_vs_police_least_square_estimate, which=1)
# QQplot vs Normal plot
qqplot.mod <- plot(robberies_vs_police_least_square_estimate, which=2) 









