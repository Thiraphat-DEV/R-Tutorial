
#install.packages('tidyverse')
#install.packages('glue')
#install.packages('RSQLite')

library(lubridate)
library(tidyverse)
library(glue)
library(RSQLite)

#template string
myname <- "boaty"
age <- 21
city <- 'buriram'

glue("Hello my name is {myname} and i'm {age} and i live in {city}")

#working with date
date <- '2023-31-12'
d <- "14/OCT-2021"
# function in lubridate
d <- dmy(d)
mdy(d)
ymd(date)
year(d)
month(d, label = T, abbr = F)
wday(d, label = T, abbr = F)
View(mtcars)
# tidyverse 
 ## dplyr
# 1.select
select(mtcars, mpg, cyl, disp, hp, am)
select(mtcars, mile_per_gallon = mpg, weight = wt)
select(mtcars, starts_with('m'))
select(mtcars, ends_with('p'))
select(mtcars, contains('a'))
## combine row to new column
rownames_to_column(mtcars, var = "new cols")
## column of mtcars
names(mtcars)
# 2.filter
## filter with pipe
mtcars %>% filter(hp >= 100 & disp > 300 & mpg > 15)
mtcars %>% 
  select(model, mpg, am, hp)%>%
  filter(grepl('^F', mtcars$model), hp > 100 | mpg > 30) 
  
## filter without pipe
filter(mtcars, hp > 100, disp > 300, mpg > 15)
filter(mtcars, hp > 100 | disp > 300 | mpg > 15)
filter(mtcars, model == "Mazda RX4")
#filter with Regex
filter(mtcars, grepl('C$', mtcars$model))
filter(mtcars, grepl('[0-9]+', mtcars$model))


# 3.arrage() sort data default Ascending order
# ascending order 
arrange(mtcars, mpg)
#descending order -column
arrange(mtcars, -mpg)
arrange(mtcars, model, desc(mpg)) # ASC is model and desc of mpg
df1 <- mtcars %>%
  select(am, mpg) %>%
  arrange(am, desc(mpg))
# 4.mutate
df_mutate <-mtcars %>%
  select(model, mpg)%>%
  filter(mpg > 20)%>%
  mutate(model = tolower(model),
         new_mpg = mpg * 2, 
         mpg_div_2 = mpg / 2,
         mpg_log = log(mpg))

mtcars <- mtcars %>%
  mutate(ifelse(am == 0, "Auto", "Manual"))
# 5.summarise + group_by() = aggregate function in SQL
mtcars %>% 
  group_by(am) %>%
  summarise( avg_mpg = mean(mpg),
             max_mpg = max(mpg),
             count_mpg = n(), #count
             sum_mpg = sum(mpg),
             std_mpg = sd(mpg),
             median_mpg = median(mpg),
             variance_mpg = var(mpg))

## simple pipeline
mtcars %>%
  select(mpg, hp, wt, am)%>%
  filter(mpg >= 20)%>%
  group_by(am)%>%
  summarise(n = n())

# read_csv()

df <- read_csv("https://gist.githubusercontent.com/seankross/a412dfbd88b3db70b74b/raw/5f23f993cd87c283ce766e7ac6b329ee7cc2e1d1/mtcars.csv")

df %>%
  select(model, mile_per_gallon = mpg)%>%
  arrange(desc(mile_per_gallon))
# sample_n random sample
set.seed(42) # sudo random follow to second
df %>%
  select(model)%>%
  sample_n(3)
# sample % 
df %>%
  sample_frac(0.2)# 20 %

# count = create frequency table
df %>%
  mutate(ifelse(am == 0, "Auto", "Manual"))%>%
  count(am)%>%
  mutate(pct = n/sum(n))

# bind_row = UNION in SQL
df2 <- mtcars %>%
  filter(hp > 200)

df3 <- mtcars %>%
  filter(hp < 80)

df4 <- mtcars %>%
  filter(mpg > 100)

# UNION rows 
full_df <- df2 %>%
  bind_rows(df3)%>%
  bind_rows(df4)

# stack a lot of dataframe
list_df <- list(df2, df3, df4)
full_df <- bind_rows(list_df)
View(full_df)

# bind_cols() vs join()
df1 <- data.frame(id = 1:4, name= c('a','b','c','d'))
df2 <- data.frame(cid = c(3, 2, 1, 5), 
                  country = c('us', 'uk', 'bkk', 'TH'))
df3 <- data.frame(job_id = 1:4, 
                  jobs = c('data', 'ux', 'ui', 'backend'))
df4 <- data.frame(job_id = 1:5, 
                  jobs = c('data', 'ux', NA, 'backend', NA),
                  scores = c(2.0, 13.5, 40.3, 22, 11.2))

df4 <- replace_na(df3$jobs, "Data Engineer")

df4 <- df4 %>%
  mutate(jobs = replace_na(jobs, "ML Engineer"), 
         scores = replace_na(scores, mean(scores, na.rm = T)))

bind_cols(df1, df2)
# join table
inner_join(df1, df2, by = 'id')
left_join(df1, df2, by = 'id')
right_join(df1, df2, by = 'id')
full_join(df1, df2, by = 'id')


# delete missing value
df1 %>%
  full_join(df2, by = 'id') %>%
  drop_na()

# inner join differenct column names
df1 %>%
  inner_join(df2, by = c('id' = 'cid'))

df1 %>%
  inner_join(df2, by = c('id' = 'cid'))%>%
  inner_join(df3, by = c('id' = 'job_id'))



























