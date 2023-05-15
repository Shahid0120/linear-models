# importing cars dataset from MARK2052 UNSW
# Shahid Hussain 15 May 2023 

install.packages("rio")
library(rio)
install_formats()
cars <- import("~/Documents/github/cars_datasets_r/cars.xlsx")
head(cars)
summary(cars)
View(cars)


# # scatterplot
# plot(cars$safety, cars$power ,main = "Scatter Plot")
# 
# 
# # using hiarchical clustering
# my_dist <- dist(cars, method="euclidean")
# hc <- hclust(my_dist, method = "complete")
# plot(hc, hang = -1, labels = FALSE, main = "Hierarchical Clustering")
# subset data removing all Nan entries

sub_cars <-cars[complete.cases(cars), ]
# View(sub_cars)
# using kmeans clustering
kmeans_result <- kmeans(sub_cars, 25)
dev.new(width = 8, height = 6)
plot(sub_cars, col = kmeans_result$cluster)

rm(list = ls())



