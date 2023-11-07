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



