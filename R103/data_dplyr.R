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

#filter data
filter_data <- filter(imdb_data, SCORE >= 9.0)
imdb_data %>% filter(SCORE >= 8.0)

names(imdb_data) <- tolower(names(imdb_data))
names(imdb_data)

# select & filter with pipe
filter_with_pipe <- imdb_data %>% select(movie_name, year, score) %>% filter(score >= 9.0 & year > 2000)

imdb_data %>%
  select(movie_name, length, score) %>%
  filter(score == 8.8 | score == 8.3 | score == 9.0)


imdb_data %>% 
  select(movie_name, length, score) %>%
  filter(score %in% c(8.3, 8.8, 9.0))

# filter string 
imdb_data %>% 
    select(movie_name, genre, rating) %>%
    filter(grepl("Drama", imdb_data$genre))

imdb_data$genre

grepl("Drama", imdb_data$genre)
# grepl is case-sensitive
imdb_data %>% 
  select(movie_name)%>%
  filter(grepl("King", imdb_data$movie_name))

# create new columns if_else(condition), mutate(newcolumn = condition)
check_score <- imdb_data %>%
  select(movie_name, score, rating, length) %>%
  group_by(rating) %>%
  mutate(score_group = if_else(score >= 9.0, "High rating", "Low rating"),
         length_group = if_else(length >= 120, "Long flim", "Short flim"))

#write csv
write.csv(check_score, "check_score.csv", row.names = FALSE)
imdb_data %>%
  select(movie_name, score) %>%
  mutate(score = score + 0.1) %>%
  head(10)


# arrange ASC data    
imdb_data %>%
  arrange(length) %>%
  head(10)

# arrange DESC data
imdb_data %>%
  arrange(desc(length)) %>%
  head(10)

imdb_data %>%
  select(rating, length) %>%
  arrange(rating, desc(length)) %>%
  head(10)

# summarize is report of statistic
imdb_data %>%
  summarize(mean_length = mean(length), 
            sd_length = sd(length),
            min_length = min(length),
            n = n())
# group_by is group follow your column
imdb_data %>%
  filter(rating != "") %>%
  group_by(rating) %>%
  summarize(max_length = max(length), min_length = min(length), total_row = n())  
  
# join data

favourite_film <- data.frame(id = c(20, 30, 50, 1, 2))

favourite_film %>%
  inner_join(imdb_data, by = c("id" = "no") )













