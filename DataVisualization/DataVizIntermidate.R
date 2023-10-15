library(tidyverse)

head(mtcars)

row(mtcars)

View(mtcars)

ggplot(data = mtcars,  mapping = aes(x = mpg)) + 
  geom_histogram(bins = 15, fill = 'salmon')


mtcars %>%
  ggplot(aes(mpg)) + geom_density()

mtcars %>%
  ggplot(aes(mpg)) + geom_freqpoly(bins = 5)



mtcars %>%
  ggplot(aes(am)) + geom_bar()


mtcars %>%
  ggplot(aes(hp, mpg)) + 
  geom_point(col = 'red', alpha = 0.7) + 
  geom_smooth(method = 'lm', col = 'lightgreen', fill = 'blue') + 
  geom_rug() + 
  theme_minimal()

diamonds %>% 
  ggplot(aes(x = cut, y = price)) + 
  geom_boxplot() 
  


diamonds %>%
  ggplot(aes(price)) + 
  geom_boxplot() + 
  coord_flip()


diamonds %>%
  ggplot(aes(x = cut, y = carat)) + 
  geom_boxplot()


diamonds %>%
  ggplot(aes(x = cut, y = price)) + 
  geom_violin()


plot_medprice <- diamonds %>%
  group_by(cut) %>%
  summarize(
    med_price = median(price)
  ) %>%
  ggplot(aes(cut, med_price)) + 
  geom_col() + 
  theme_minimal()

View(plot_medprice)
ggplot(agg_median_cut, aes(cut, med_price)) + 
  geom_col()


## qplot = quick plot

p1 <- diamonds %>%
  qplot(x = price,data = ., geom = "freqpoly", bins = 10)


diamonds %>%
  qplot(carat, price, data = ., geom = "point")


p2 <- diamonds %>%
  qplot(x = cut, data = ., geom = "bar")

sample_diamond <- sample_frac(diamonds, 0.09)
set.seed(42)
ggplot(sample_diamond, 
       aes(carat, price, col = cut)) + 
  geom_point(alpha = 0.7) + 
  theme_minimal() + 
  scale_color_brewer(type = 'div', palette = 3)
  #  scale_color_manual(
   # values = c("salmon", 'green', 'gold', 'blue', 'cyan')
  #)

# overplotting
set.seed(42)
ggplot(sample_diamond, 
       aes(carat, price, col = price)) + 
  geom_point(alpha = 0.7) + 
  theme_minimal() + 
  scale_color_gradient(low = 'salmon',
                       high = 'gold') + 
  facet_wrap(~cut, ncol = 3)


set.seed(42)
ggplot(sample_diamond, 
       aes(carat, price, col = price)) + 
  geom_point(alpha = 0.7) + 
  geom_smooth() +
  theme_minimal() + 
  scale_color_gradient(low = 'salmon',
                       high = 'gold') + 
  facet_grid(cut ~ clarity) 


#label

mtcars %>%
  ggplot(aes(hp, mpg)) + 
  geom_point() + 
  labs (
    title = "First Scatterplot", 
    subtitle = "HP vs MPG",
    x = "Horse power",
    y = "Mile per gallon",
    caption = "R plot with ggplot2"
  ) + 
  theme_solarized()

library(ggthemes)

#install more theme for ggplot

