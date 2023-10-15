## 1.numeric
age <- 21
print(age)
class(age)

## 2.character
my_name <- "Thiraphat Chorakhe"
my_university <- 'Boaty university'

print(my_name);print(my_university)
class(my_name);class(my_university)


## 3.logical
result <- 2+1 != 2
print(result);class(result)

## 4.factor
my_animal <- c("franky", "uta", "chopper")
class(my_animal)

my_animal <- factor(my_animal)
class(my_animal)

## 5.date

time_now <- Sys.time()
class(time_now)

# Convert Data Types
x <- 20000
class(x)
t_x <- 1
f_x <- 0
## main function

##  as.numeric()
as.numeric(x)
as.numeric(TRUE)
as.numeric(FALSE)
## as.character
as.character(x)
## as.logical
as.logical(t_x)
as.logical(f_x)

