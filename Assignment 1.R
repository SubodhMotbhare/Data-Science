
setwd("D:Data Science Program")

#Exercise-1
data = read.csv("germination_csv.csv",header=TRUE)

# Q.1)
mean(data$germinated[data$Box=="Uncovered" & data$water_amt==4])

# Q.2)
median(data$germinated[data$Box=="Covered"])

# Q.3)
# a)
plot(data$water_amt, data$germinated, main="Germinated seeds vs Level of watering", xlab="Level of watering", ylab="Germinated seeds")
# b)
data$Box = factor(data$Box)
data$Box
plot(data$Box, data$germinated, main="Germinated seeds vs Covered or Uncovered", xlab="Box Types", ylab="Germinated seeds")

#Exercise-2
library(readxl)
wheat <- read_excel("wheat.xlsx")
wheat

wheat$State = factor(wheat$State)

plot(wheat$State, wheat$`2015 (Th. Tonnes)`, main="Wheat produced per State in 2015", xlab="States", ylab="Wheat produced")
plot(wheat$State, data$`2016 (th. Tonnes)`, main="Wheat produced per State in 2016", xlab="States", ylab="Wheat produced")

#Exercise-3
library(readxl)
iris = read_excel("iris data.xlsx")
iris

plot(x=iris$`sepal length`, y=iris$`sepal width`, main='Iris Plot', xlab='Sepal Length', ylab='Sepal Width', xlim=c(4,8), ylim=c(2,4.7))

