## Playing Around with function focusing on standard normal, nomal distribution, chisquare, t-distribution, f-distribution 
## 16 september 2023

# This is the standard normal 
x <- seq(-3,3, length=100)
y <- dnorm(x, mean=0, sd=1)
y_squared <- y^2
plot(x, y, type="l", lwd=2, col="blue", xlab="X", ylab="Density", main="Standard Normal Distribution")

# plot Z^2
x <- seq(-3, 3, by = 0.1)
Z_squared <- dnorm(x, mean = 0, sd = 1)^2
plot(x, Z_squared, type = "l", col = "blue", xlab = "X", ylab = "Z^2",
     main = "Square of Normal Distribution")

# plot Z^2 + Z^2
x <- seq(-3, 3, by = 0.1)
two_sum_Z <- Z_squared +  Z_squared +  Z_squared +  Z_squared +  Z_squared + Z_squared
plot(x,two_sum_Z, type = "l", col = "blue", xlab = "X", ylab = "Sum Z^2",
     main = "Square of Normal Distribution")

# chi sqaure
degree_of_freedom = 1 
x <- seq(0, 300, by = 0.1)
chi_square_pdf <- dchisq(x, degree_of_freedom)
plot(x, chi_square_pdf, type = "l", col = "blue", 
     xlab = "X", ylab = "PDF", main = "Chi-Square Distribution")

# two degree of freedom 
degree_of_freedom = 10
x <- seq(0, 100, by = 0.1)
chi_square_pdf <- dchisq(x, degree_of_freedom)
plot(x, chi_square_pdf, type = "l", col = "blue", 
     xlab = "X", ylab = "PDF", main = "Chi-Square Distribution")

# t distribution
x <- seq(0, 100, by = 0.1)
Z <- dnorm(x, mean = 0, sd = 1)
degree_of_freedom = 10
chi_square_pdf <- dchisq(x, degree_of_freedom)
t_distribution <- Z / sqrt((chi_square_pdf/degree_of_freedom))
plot(x, t_distribution, type = "l", col = "blue", 
     xlab = "X", ylab = "PDF", main = "T-distribution")

# Define a range of x-values
x <- seq(-3, 3, by = 0.1)  # Adjust the range and granularity as needed
df_values <- c(1, 2, 5, 10)  
plot(x, rep(NA, length(x)), type = "n", xlim = c(-3, 3), ylim = c(0, 0.5),
     xlab = "X", ylab = "PDF", main = "T-Distributions")
for (df in df_values) {
  t_pdf <- dt(x, df)
  lines(x, t_pdf, col = rainbow(length(df_values))[df_values == df], lwd = 2)
}
legend("topright", legend = paste("df =", df_values), col = rainbow(length(df_values)),
       lwd = 2)


