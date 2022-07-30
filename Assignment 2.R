

#Exercise-1
setwd("D:Data Science Program")
library(readxl)
travel = read_excel("travelled abroad data.xlsx")




# Q.1)

p = length(travel$`Travelled abroad`[travel$`Travelled abroad`=="Y"])/nrow(travel) * 100
p

# Q.2)
x0<-dbinom(0,10,p/100)
x0

x1 <- dbinom(1,10,p/100)
x1

x2<-dbinom(2,10,p/100)
x2

x3<-dbinom(3,10,p/100)
x3

x4<-dbinom(4,10,p/100)
x4

x5<-dbinom(5,10,p/100)
x5

x6<-dbinom(6,10,p/100)
x6

x7<-dbinom(7,10,p/100)
x7

x8<-dbinom(8,10,p/100)
x8

x9<-dbinom(10,10,p/100)
x9

# Q.3)
x<-c(x0,x1,x2,x3,x4,x5,x6,x7,x8,x9)
x<-signif(x,2)
x
barplot(x, names.arg=c(0,1,2,3,4,5,6,7,8,9), xlab='Number of people chosen for probability', ylab='Probabilties', main='Binomial distribution')

sum(dbinom(59:100,100,p/100))


#Exercise-2
setwd("D:Data Science Program")

hyp = read.csv("Hypothesis_csv1.csv", header=TRUE)
hyp

# Q.1)
mean = mean(hyp$Life_Hrs)
mean
std = sd(hyp$Life_Hrs)
std

# Q.2)
SE = std/sqrt(nrow(hyp))
SE

# Q.3)
Z = (mean - 10000)/SE
Z

# Q.4)
p = pnorm(Z)
p

# Q.5)
# The p-value 0.0305 is less than the level of significance of 0.05 (5%). We reject the null hypothesis, Hence the claim made by the manufacturer is rejected.
#  The p-value 0.0305 is greater than the level of significance of 0.01 (1%). We fail to reject the null hypothesis.

