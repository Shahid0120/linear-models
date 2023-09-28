## Livestock workthoruhg whole course
## Shahid Hussain 20th September

# initial simple linear regression 
# is there any simple relationships between response (expense) vs animals?

## expense = b0 + b1*calves?
plot(livestock$calves, livestock$expense)
calve_expense <- lm(livestock$expense ~ livestock$calves)
abline(calve_expense, col = "red")

# check 
summary(calve_expense)
for (residual in livestock$calves) {
  print(residual)
}