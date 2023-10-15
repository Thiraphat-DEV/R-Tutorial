library(RSQLite)
#  connect db
conn <- dbConnect(SQLite(), "chinook.db")

# show all table
dbListTables(conn)

# list field
dbListFields(conn, "customers")


# query
df1 <-  dbGetQuery(conn, "SELECT * FROM customers")
#canada user
cannada_df <- dbGetQuery(conn, "SELECT * FROM customers 
                         WHERE Country = 'Canada' ")
# clean company with COALESCE
clean_company <- dbGetQuery(conn, 
                            "SELECT *, COALESCE(Company, 'boaty com' ) FROM customers")
View(clean_company)

# change missing with replace_na()
df1 %>%
  mutate(Company = replace_na(Company, "Franky Company"))

# change missing with ifelse
df1%>%
  mutate(Company = ifelse(is.na(Company), "Franky Company", Company))

## write table
my_jobs <-  data.frame(id = 1:5,
                        jobs = c('ux', 'data engineer', 'ml engineer', 'data science', 'data analyze'))

dbWriteTable(conn, "my_jobs", my_jobs)

## remove table in database
dbRemoveTable(conn, 'my_jobs')


## disconnect
dbDisconnect(conn)

#connect to postgresql

install.packages("RPostgreSQL")
library(RPostgreSQL)
library(tidyverse)

con <- dbConnect(PostgreSQL(), 
                 host = "arjuna.db.elephantsql.com",
                 port = 5432, 
                 user = "quvvzazt",
                 password = "a5x7KjVWNdb0PI6fi2CXeIl_O4CVDJTD",
                 dbname = "quvvzazt")

dbListTables(con)


jobs <- data.frame(id = 1:5,
                   my_jobs = c('ux', 'ui', 'ml engineer', 'data engineer', 'data science'))
# write table
dbWriteTable(con, 'jobs', jobs)
# list table
dbListTables(con)

#query
dbGetQuery(con, "SELECT * FROM jobs")
# remove table
dbRemoveTable(con, "jobs")

# close connection
dbDisconnect(con)

# pizza menu
pizza <- data.frame(id = 1:5,
                    menus = c('haveion', 'peper', 'hoyza', 'colab', 'highgen'))

con <- dbConnect(PostgreSQL(), 
                 host = "arjuna.db.elephantsql.com",
                 port = 5432, 
                 user = "quvvzazt",
                 password = "a5x7KjVWNdb0PI6fi2CXeIl_O4CVDJTD",
                 dbname = "quvvzazt")


dbWriteTable(con, "pizza", pizza)
dbGetQuery(con, "SELECT * FROM pizza")
dbRemoveTable(con, 'pizza')
dbDisconnect(con)
