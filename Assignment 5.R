
library(ggplot2)

x = c(0.8, 1, 1.2, 0.8, 1.2, 4.3, 3.8, 4.8, 3.8, 4.2, 4.4, 4.4, 3.2, 3.2, 3.8, 3.5, 4, 4)
y = c(0.8, 1, 0.8, 1.2, 1.2, 2, 2.8, 2.8, 3.2, 3.2, 2.8, 3.2, 0.4, 0.7, 0.5, 1, 1, 0.7)
z = c(1, 1, 1, 1, 1, 0, 2, 2, 2, 2, 2, 2, 3, 3, 3, 3, 3, 3)

dataset = data.frame(x,y,z)
head(dataset)

plot(dataset$x, dataset$y, col=c("red", "blue", "yellow", "green")[dataset$z])
qplot(x, y, color=factor(z), data = dataset) + scale_color_manual(values = c("yellow", "blue", "red", "green"))

test_pt = c(3,2)

for (i in 1:18) {
  ed = sqrt((test_pt[2] - dataset[i,2])^2 + (test_pt[1] - dataset[i,1])^2)
  dataset$dist_test_pt[i] = ed
}

minimum = min(dataset$dist_test_pt)

point_idx = which(dataset$dist_test_pt == minimum)

class = dataset[point_idx,3]

print(paste0("As test point", " is close to point ", point_idx, " with distance ", minimum, ". Therefore, test point belongs to class ", class))

