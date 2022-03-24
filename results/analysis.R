dummy.data <- read.csv("basic_results.txt")

print(hist)

mean(dummy.data$score)
sd(dummy.data$score)

boxplot(dummy.data$score)

hist(dummy.data$score, breaks=15)
