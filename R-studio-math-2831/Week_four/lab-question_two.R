# Question two 

attach(cheese)
model<-lm(taste~H2S + Lactic + Acetic, data= cheese)
anova(model)
# (a)


#(b)
SStotal <- sum(anova(model)[2])

# (c) 
summary(model)
# F-value 16.22 under H0

