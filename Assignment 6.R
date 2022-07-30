

#install.packages("ISLR")
#install.packages("caTools")
#install.packages("class")

library(ISLR)
library(caTools)
library(class)

?Smarket

df<-Smarket
View(df)
df = df[,2:9]
head(df)
str(df)
summary(df)

#scaling the input variables
df_scaled = as.data.frame(scale(df[,1:7]))
df_scaled$Direction = df$Direction
head(df_scaled)
head(df)

set.seed(100)
split<-sample.split(df_scaled$Direction, SplitRatio = 0.7)
table(split)
tr_data<-subset(df_scaled,split == T)
ts_data<-subset(df_scaled,split == F)

#KNN
pred<-knn(tr_data[,1:7],ts_data[,1:7],tr_data$Direction, k = 3)
pred
head(pred)
ts_data$pred = pred
View(ts_data)

con_matrix_knn<-table(Actual = ts_data$Direction,predicted = pred)
print(con_matrix_knn)

#performance of knn
acc_knn<-sum(diag(con_matrix_knn))/sum(con_matrix_knn)
print(acc_knn)
sens_knn<-sum(con_matrix_knn[1,1])/sum(con_matrix_knn[1,])
print(sens_knn)

specificity_knn<-sum(con_matrix_knn[1,1])/sum(con_matrix_knn[,1])
print(specificity_knn)

precision<-(con_matrix_knn[2,2])/sum(con_matrix_knn[,2])
print(precision)

cat("The accuracy of knn is : ",acc_knn)
cat("The sensitivity of knn is : ",sens_knn)
cat("The specitivity of knn is : ",specificity_knn)
cat("The precision of knn is : ",precision)