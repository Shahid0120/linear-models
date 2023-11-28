Town=c(1,2,3,4,5,6,7,8,9,10,11,12)
Robberies=c(643,754,582,700,518,668,630,510,801,564,570,511)
Police=c(59,55,64,53,79,66,63,90,50,80,89,68)
TownData=data.frame(Town, Police, Robberies)

model <- lm(Robberies~Police, data=TownData)
summary(model)

# (a) b1 = -5.735  b0 = 1010.897 , simga^2 = (58.83)^2

# (b) -57.35
# CI 

10*confint(model, level = 0.98)
df = 10
prob = -4.397
pt(-4.397,10, lower.tail = T)
