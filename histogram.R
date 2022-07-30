setwd("D:/Data Science Program")

hist (AirPassengers, xlim=c (150,600), ylim=c (0,35))

hist (AirPassengers,
      main="Histogram with more Arg",
      xlab="Name List",
      border="blue",
      #col="Orange",
      col = c("pink", "red"),
      xlim=c (100,600),
      ylim=c(0,40),
      breaks=10)
