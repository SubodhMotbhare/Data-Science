setwd("D:/Data Science Program")

      plot(x =  gfg_data$sepal.length,y =  gfg_data$sepal.width,
           xlab = "length",
           ylab = "width",
           xlim = c(4,8),
           ylim = c(2,5),		 
           main = "sepallength vs sepalwidth"
      )
      
      gfg_data <- read.table("idata.csv", header = TRUE, sep = ",",
                             colClasses = c("NULL", "numeric", "numeric"))
      