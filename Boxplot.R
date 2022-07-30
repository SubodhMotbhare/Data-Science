
setwd("D:/Data Science Program")


boxplot(wheat$`2015 (Th. Tonnes)`,wheat$`2016 (th. Tonnes)`,ylab = 'Tonnes',
        names = c('2015','2016'), col = c("yellow","gray"), 
        main='Boxplot of Wheat production in India')
