
# Define the degrees of freedom for the chi-square distribution
df <- 5
# Create a sequence of x values for the plot
x <- seq(0, 20, by = 0.1)  # Adjust the range and step size as needed
# Calculate the PDF values for the chi-square distribution
pdf_values <- dchisq(x, df)
# Plot the chi-square distribution
plot(x, pdf_values, type = "l", lwd = 2, col = "blue", 
     main = paste("Chi-Square Distribution (df =", df, ")"),
     xlab = "X", ylab = "Probability Density", xlim = c(0, 20), ylim = c(0, 0.25))
# Add gridlines for clarity
grid()
# Sum of chi-squr
sum_two <- x + x 
plot(sum_two, pdf_values, type = "l", lwd = 2, col = "blue", 
     main = paste("Chi-Square Distribution (df =", df, ")"),
     xlab = "X", ylab = "Probability Density", xlim = c(0, 20), ylim = c(0, 0.25))
# Add gridlines for clarity
grid()

sum_three <- x + x + x
plot(sum_three, pdf_values, type = "l", lwd = 2, col = "blue", 
     main = paste("Chi-Square Distribution (df =", df, ")"),
     xlab = "X", ylab = "Probability Density", xlim = c(0, 20), ylim = c(0, 0.25))
# Add gridlines for clarity
grid()

sum_four <- x + x + x + x
plot(sum_four, pdf_values, type = "l", lwd = 2, col = "blue", 
     main = paste("Chi-Square Distribution (df =", df, ")"),
     xlab = "X", ylab = "Probability Density", xlim = c(0, 20), ylim = c(0, 0.25))
# Add gridlines for clarity
grid()
 
# Set the degrees of freedom and the number of random variables
df <- 2  # Degrees of freedom
n <- 1000  # Number of random variables to sum

# Generate 1000 independent chi-square random variables
random_variables <- rchisq(n = n, df = df)

# Calculate the sum of these random variables
sum_of_chi_square <- sum(random_variables)

# Print the result
plot(sum_of_chi_square, pdf_values, type = "l", lwd = 2, col = "blue", 
     main = paste("Chi-Square Distribution (df =", df, ")"),
     xlab = "X", ylab = "Probability Density", xlim = c(0, 100000), ylim = c(0, 1000000))
# Add gridlines for clarity
grid()