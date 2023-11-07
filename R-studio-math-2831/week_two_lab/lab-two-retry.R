eps <- c(0.27, 0.42,0.39,0.50,0.57,0.64,0.76,0.93,1.03)
coded.year <- c(1,2,3,4,5,6,7,8,9)
plot(coded.year,eps)
reg.eps.coded <- lm(eps ~ coded.year)
abline(reg.eps.coded)
summary(reg.eps.coded)

# (c) estimates : (1) intercept 0.158056 (2) predictor: 0.090833 (3) Se(e) = 0.05466 (4) R^2 = 0.9595

# (d) t-value = 12.87 , p-value : P(T > 12.87) = 3.97e-06, as it two way?

# (e) f-statistic = 165.7 now T^2 = F so, sqrt(165.7) = 12.87 = t-value 

# (f) assumption e ~ N(0,sigma^2), yi independent
res.fit <- plot(reg.eps.coded, which = 1)
# residuals follow a U pattern this means there is “Violation of linearity assumption" is residuals are not centred around 0. For sigma^2 we can cleary see the dsitribtion varies constantly scatted random and dollow now uperwards fanshape! 
qqplot.reg <- plot(reg.eps.coded, which =2)
# is it normall ditributed ? As it follows a S-shape particualry in the tails, (1) Right Hands tail (botton) (bigger tail!) (2) Left hand tail (fatter tails)



# Question 2 
personal.saving.rate <- c(23.1,21.5,17.2,14.5,12.2,10.3,9.1,6.3)
investment.income.tax.liability <- c(6.4,14.4,7.3,11.8,32.5,30.0,52.7,33.5)
plot(personal.saving.rate, investment.income.tax.liability)
#(a) does look linear how can we check?
reg.savings.invesment <- lm(investment.income.tax.liability ~ personal.saving.rate)
abline(reg.savings.invesment)
res.fit <- plot(reg.savings.invesment, which=1)
# variacne seems constant 
# Ei is not around the mean :(
qqplot.reg.personal.invesment <- plot(reg.savings.invesment, which=2)
# normally distributed. why? as it is 
#(b) 
summary(reg.savings.invesment)
# as there is only 1 predictor in this cas T^2 = F, so clearly using a hypothesis B1 = 0 of t-value(t-obs) : -3.247
# p-value: 0.0175 which is between 0.01 - 0.1, thus signifanct thus we have "some evidence" to reject the null hypothesis!

# Question 3 
# Alternatively, enter data
firearms=data.frame(year=1983:1997, rate=c(4.31,4.42,4.52,4.35,4.39,4.21,3.40,3.61,3.67,3.61,2.98,2.95,2.72,2.96,2.3))
reg.firearms <- lm(firearms$rate~firearms$year)
plot.firearms <- plot(firearms$rate~firearms$year)
abline(reg.firearms)
summary(reg.firearms)
