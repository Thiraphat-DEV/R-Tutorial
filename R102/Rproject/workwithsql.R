library(sqldf)
library(readr)


school <- read_csv('school.csv')


sqldf("SELECT * FROM school;")

sqldf("SELECT * FROM school WHERE country = 'UK';")


sqldf("SELECT AVG(student), SUM(student) FROM school;")


student_uk <- "SELECT * FROM school WHERE LOWER(country) = 'uk'"

sqldf(student_uk)
