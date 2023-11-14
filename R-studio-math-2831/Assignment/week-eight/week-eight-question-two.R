
file.path <- '/Users/shahid/Github/Rstudio-Math2831/R-studio-math-2831/data/fish.txt'
fish  <- read.table(file.path, header = TRUE) 
plot(fish$weight ~fish$length)

# b 
fish.model <- lm(fish$weight~fish$length)
abline(fish.model)
plot(fish.model)

# c
plot(log(fish$weight) ~log(fish$length))
fish.model.transformed <- lm(log(fish$weight)~log(fish$length))
abline(fish.model.transformed)
plot(fish.model.transformed, which=3)

# e
summary(fish.model.transformed)

# f
weight <- exp(-13.76362 + 3.36*log(400))
weight
