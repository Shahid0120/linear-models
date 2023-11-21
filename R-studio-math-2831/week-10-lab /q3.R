
sleep <- read.table("../data/sleep.txt",  header = TRUE)

sleep
# 1, 0 -> 20 hours sleep dep 
# 0 , 1 -> 24 hours sleep dep 
# 0 , 0 -> 16 hours sleep dep 

sleep.model <- lm(Score ~ Group2 + Group3, data=sleep)
summary(sleep.model)
plot(sleep.model, which=2)
# from the F-statistics p-value =  0.02877 < 0.05 there we reject H0 and 
# state that at least one of B0, B1, B2 are not zero.
# error ~ N(0,sigma^2) from plots
# henceforth, sleep is related to performance

# is there evidence that 