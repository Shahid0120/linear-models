
pill=read.table("../data/pill.txt",header = TRUE)
pill
# y -> # number of colds
# 0 , 0 -> Placebo 
# 1 , 0 -> new pill
# 0 , 1 -> vitamin C
pill[1,1]
new_placebo = 0
new_pill = 0
vitamin = 0
number_of_new_pill = 0
sum_of_placebo = 0
number_of_placebo = 0  # Corrected variable name
number_of_vitamin = 0
sum_of_vitamin = 0  # Corrected variable name
sum_of_new_pill = 0 
number_of_new_pill = 0 
# Assuming 'pill' is a 2D array or some data structure
for (i in 1:45){  # Use range to iterate from 0 to 44
  # Assuming 'pill' has at least 4 columns
  if (pill[i, 2] == 0) {
    if (pill[i, 3] == 0) {
        sum_of_placebo  = sum_of_placebo+ pill[i, 1]
        number_of_placebo = number_of_placebo + 1
      } else{
        sum_of_vitamin = sum_of_vitamin + pill[i, 1]
        number_of_vitamin = number_of_vitamin+ 1
      }
  } else{
    # it's a new pill
    sum_of_new_pill = sum_of_new_pill + pill[i, 1]  # Assuming you meant 'sum_of_new_pill' here
    number_of_new_pill = number_of_new_pill + 1
  }
  
}
mean_placebo = sum_of_placebo / number_of_placebo # 10.26
mean_new_pil = sum_of_new_pill / number_of_new_pill # 8.1
mean_vitamin = sum_of_vitamin / number_of_vitamin # 6.4

# check weather means are different 
model <- lm(y ~ Dummy1 + Dummy2, data=pill)
summary(model)  
plot(model, which=4)
# normality -> QQ-plot -> check!
# 
anova(model)
