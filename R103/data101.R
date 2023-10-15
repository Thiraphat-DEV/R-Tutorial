# install.packages('dplyr')

library(dplyr)


# load data with read.csv
imdb_data <- read.csv('imdb.csv', stringsAsFactors = FALSE)

View(imdb_data)

# review data structure
glimpse(imdb_data)


# print head and tail
head(imdb_data, 20)

tail(imdb_data, 20)

# select column
select(imdb_data, MOVIE_NAME, RATING)
select(imdb_data, 1, 5)

#rename column
rename_df <- select(imdb_data, movie_name = MOVIE_NAME, release_year = YEAR)
names(rename_df)

# %>% or pipe operator can combine other function 
pipe_rename <- imdb_data %>% 
  select(movie_name = MOVIE_NAME, release_year = YEAR) %>% head(20)
View(pipe_rename)
