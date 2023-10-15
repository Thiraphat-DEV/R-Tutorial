library(tidyverse)

# geom_point = scatter plot
# geom_smooth = smooth curve
# geom_rug = dash of data
ggplot(data = mtcars, mapping = aes(x = hp, y = mpg)) + 
  geom_point() + geom_smooth() + geom_rug()

#change size and alpha
ggplot(mtcars, aes(hp, mpg)) + 
  geom_point(size = 3, col = "cyan", alpha = 0.7)

#histogram
ggplot(mtcars, aes(hp)) + geom_histogram(bins = 10, fill = "green", alpha = 0.7)

#geom_boxplot = boxplot 
ggplot(mtcars, aes(hp)) + 
  geom_boxplot()

# defined base layer of data then add geometry
p <- ggplot(mtcars, aes(hp))
# 1 x quantitative variable
p + geom_histogram()
p + geom_density() #same linear regression
# 2 x quantitative variable
p + geom_boxplot()


# boxplot by group (2 variable)
diamonds %>%
  count(cut)

#ordinal factor = เรียงสูงกลางต่ำได้
ggplot(diamonds, aes(cut)) + 
  # factor column or ordinal factor
    geom_bar(fill = "salmon")

#unique color for bar chart
ggplot(diamonds, aes(cut, fill = color)) + 
  # factor column or ordinal factor
  geom_bar(position = 'dodge')


set.seed(42)

small_dia <- sample_n(diamonds, 4999)

ggplot(small_dia, aes(carat, price)) +
  geom_point()


#facet wrap = small multiple graphs
ggplot(small_dia, aes(carat, price, col = cut)) +
  geom_point() +
  geom_smooth(method = 'lm', col = "red") + 
  facet_wrap(~color, ncol = 3) + 
  theme_minimal() + 
  labs(title = "Relations of carat & price",
       x = "Carat",
       y = "Price",
       caption = "Diamond ggplot2")
