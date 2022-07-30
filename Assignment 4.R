
?cars                #description of data set
str(cars)
summary(cars)
head(cars)

car_data <- cars
plot(car_data)

library('ggplot2')
g <- ggplot(aes(x=speed, y=dist), data=car_data)
g

g1 <- g + geom_point(col='red')
g1

df = data.frame(beta_0=seq(0,1,length.out=10),beta_1=seq(0,5,length.out=10))
df

#fit a line to data using abline function with randomly selected b0 & b1
for (i in 0:10) {
  g1 = g1 + geom_abline(intercept = df$beta_0[i], slope = df$beta_1[i], col=i)
}
g1

#generate RSS (residual sum of squares) vector for each of the 10 lines generated above
RSS <- vector(mode='numeric')

for (i in 0:10) {
  RSS[i] <- sum(((df$beta_1[i]*car_data$speed+df$beta_0[i]) - car_data$dist)**2)
}
RSS

df$RSS = RSS
head(df)
ggplot(aes(x=beta_0, y=RSS), data = df) + geom_point() + geom_line()
ggplot(aes(x=beta_1, y=RSS), data = df) + geom_point() + geom_line()

i = which(df$RSS == min(df$RSS))           #select index of row containing minimum RSS
min_beta = c(df$beta_0[i], df$beta_1[i])
min_beta

g2 = ggplot(aes(x=speed, y=dist), data=car_data) + geom_point(col='red') + geom_abline(intercept = min_beta[1], slope = min_beta[2], col='green')
g2

#fitting linear model using lm() function
l_model <- lm(dist~speed, data=car_data)
l_model                      #model coefficients
summary(l_model)             #residual : diff. betn predicted & actual data

car_data$y_pred = predict(l_model, data=car_data$speed)
View(car_data)

#plot the regression line using base plot function
plot(car_data$speed, car_data$dist, xlab = 'speed', ylab = 'Distance', main = 'Simple Linear Regression')
abline(l_model, col='blue', lwd=2)

#plot the regression line using ggplot2
ggplot(aes(x=speed, y=dist), data=car_data) + geom_point(col='red') +
  geom_line(aes(car_data$`speed`, car_data$`y_pred`), col='green') +
  ylab('Distance') + ggtitle('Simple Linear Regression')
