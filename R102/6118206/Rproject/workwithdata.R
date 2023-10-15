install.packages(c("readr", 
                   "readxl", 
                   "googlesheets4",
                   "jsonlite",
                   "dplyr",
                   "sqldf",
                   "RSQLite"))

# load library
## Read Excel
econ <- read_excel('students.xlsx', sheet = 1)
bussiness <- read_excel('students.xlsx', sheet = 2)
data <- read_excel('students.xlsx', sheet = 3)

## bind_rows == UNION ALL in SQL datatype&count of column are same data
# traditional bind_rows
traditional_bind <- bind_rows(econ, bussiness, data)

#modern bind_rows 
list_union <- list(econ, bussiness, data)
modern_bind <- bind_rows(list_union)
## Read Textfile
#student <- read_table('student.txt')

View(student)
## Read JSON file format
library(jsonlite)
gamer <- data.frame(fromJSON('gamer.json'))

library(readxl)

result <- list()
for (i in 1:3) {
  result[[i]] <- read_excel('students.xlsx', sheet = i)  
}
library(googlesheets4)

#gs4_deauth() is no authenticate 
# สามารถใช้ลิ้งค์จากข้างนอกได้โดยไม่ต้อง Login