library(ggplot2)

dummy.data <- read.csv("results.txt")

hist <- ggplot(dummy.data, aes(x=score)) + 
  geom_histogram(binwidth=1)

print(hist)