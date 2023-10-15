library(RSQLite)

## 1.connect SQLite

conn <- dbConnect(SQLite(), "chinook.db")

## 2.get data
query_usa <- "SELECT * FROM customers WHERE Country = 'USA'"
dbListTables(conn)
dbListFields(conn, "albums")
dbListFields(conn, 'customers')

df_tracks <- dbGetQuery(conn, "SELECT * FROM tracks")

customer_usa <- dbGetQuery(conn, query_usa)
View(customer_usa)
View(df_tracks)
## 3.close connection
dbDisconnect(conn)

rm(list = ls())


