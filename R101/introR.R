# sum of 20 + 20
print(20 + 20)


#create variable
name <- "Thiraphat boaty"
age <- 20


#remove variable
rm(age)

#vector
seq(5, 100, 5)
seq(5, 50, 2)
my_vector <- c("Thiraphat", "Hello", "testCase")


ages <- c(20, 30, 40, 47)
# sum of ages
sum_ages = sum(ages)
#mean
mean_ages = mean(ages)
#median
median_ages = median(ages)
#var
var_ages = var(ages)
#sd
sd_ages = sd(ages)

#function 
showName <- function()
{
  
  print("HAHAHAH")
}

addTwoNum <- function(num1, num2){
  return (num1 ** num2);
  
  
}

rm(my_vector)
rm(age)

#oneline function

multiply <- function(x,y) x*y
result <- multiply(20, 30)

grade <- c(seq(7, 100, 4))

if(grade >= 100) {
  
  print("passed")
}else {
  print("failed")
}

#for loop

show_grade <- function(score) {
  for(score in grade) {
    if(score > 70){
      print("Hello")
    }
    else if(score > 50) {
      print("Yeah > 50")
    }
  }
}


rm(show_grade)
rm(result_grade)
#sapply
result_grade <- sapply(grade, show_grade)


#while loop

count <- 0
while(count < 3) {
  print("Less 3")
  count <- count + 1
  print(count)
}


is.array(ages)
is.numeric(count)
movie <- TRUE
is.logical(movie)

#concase datatype
casecade <- as.character(median_ages)


#dataFrame
id <- c(001, 002, 003)
name  <- c("Thiraphat", "hello", "test")
city  <- c("bangkok", "buriram", "nangrong")

customers = data.frame(id, name, city)
rm(data_frame)

View(customers)
members  <- data.frame(
  id = 1:3,
  member_tier = c("gold", "silver", "bronze")
)

#join table customers feat.members
join_table <- merge(customers, members, by="id")

#read csv
stores = read.csv("samsple_store.csv")
#print column
head(stores)
#print every row
view_row_100 <- View(tail(stores[100, ]))
#print some column
columns_customer_name <- View(tail(stores[100,c("Customer.ID", "Customer.Name", "Country") ]))

#install sqlite
install.packages("RSQLite")
library(RSQLite)

conn <- dbConnect(SQLite(), "chinook.db")

table_of_chinook <- dbListTables(conn)
View(table_of_chinook)
query_db_usa <- dbGetQuery(conn, "SELECT firstname, lastname, country  from customers WHERE country IN('USA')  limit 5")
View(query_db_usa)
rm(query_db)
#write csv
write.csv(query_db_usa, "customer_usa.csv")
dbDisconnect(conn)
