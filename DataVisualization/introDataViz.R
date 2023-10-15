install.packages('tidyverse')

library(tidyverse)

#base R plot

hist(mtcars$mpg)
hist(mtcars$hp)

mean(mtcars$hp)
#review structure
str(mtcars)


#change data from num to factor
mtcars$am <- factor(mtcars$am, levels = c(0, 1), labels = c('Auto', 'Manual'))

#barplot one-quantitative variable
# เชิงคุณภาพ = categorical data
# table = ใช้นับความถี่ของข้อมูล
barplot(table(mtcars$am))

# boxplot = identify outlier 
#one or two quantitative variable
boxplot(mtcars$hp)

 
# get five number from mtcars$hp
fivenum(mtcars$hp)
#52  96 123    180   335
#min q1 median q3    max
min(mtcars$hp)
quantile(mtcars$hp, probs = c(.25, .5, .75))
min(mtcars$hp)

#whisker calculations
q3 <- quantile(mtcars$hp, probs = .75)
q1 <- quantile(mtcars$hp, probs = .25)

iqr_hp <- q3 - q1

q3 + 1.5 * iqr_hp
q1 - 1.5 * iqr_hp

boxplot.stats(mtcars$hp, coef = 1.5)


#filter outlier
mtcars_no_out <- mtcars %>% filter(hp < 335)

boxplot(mtcars_no_out$hp)


#boxplot 2 variable
#quanlitative(catergorical) x quantitative(numeric)
boxplot(mpg ~ am, data = mtcars, col = c("cyan", "salmon"))

mtcars %>% boxplot(mpg ~ am)

#scatter plot
# 2 x quantitative numeric
plot(mtcars$hp, mtcars$mpg, pch = 17, col = "salmon",
     main = "Intro Scatterplot", 
     xlab = "เเรงม้า",
     ylab = "Mile per Gallon")
#correlation of data 
cor(mtcars$hp, mtcars$mpg)

#Linear regression
lm(mpg ~ hp, data = mtcars)
