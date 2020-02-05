age <- c(1,2,3,3,3,5,9,9,11,12)
weight <- c(4.4, 5.2, 5.3, 6.0, 6.1, 7.2, 10.4, 7.3, 8.5, 10.2)
# 평균
mean(weight)
# 표준편차
sd(weight)
# 선형관계(상관관계=0.91)
cor(age, weight)
plot(age, weight)