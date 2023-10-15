library(nycflights13)
install.packages('nycflights13')
View(flights)


# review data structure
glimpse(flights)

flights %>%
  filter(month == 2)%>%
  count(carrier)%>%
  arrange(-n)%>%
  head(5)

# 
flights %>%
  filter(air_time > 150, arr_delay > 10) %>%
  count(carrier)%>%
  arrange(-n)%>%
  head(10)%>%
  left_join(airlines, by = 'carrier')
