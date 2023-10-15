x_func <- c(10, 25, 40, 100)

sum(x_func)
mean(x_func)
max(x_func)
sd(x_func)


# create function
hello <-  function(name = "boaty", movie = 'bad guy') {
  print(paste("Hello World", name, movie))
}

func <- function() {
  hello()
  hello("Thiraphat")
}

add_two_num <- function(num1, num2) {
  return(num1 + num2)
}

cube <- function(val1, power = 3) {
  return(val1 ** power)
}

balls <- c('cyan', 'pink', 'red', 'green', 'red', 'blue', 'pink')
count_ball <- function(balls, color) {
  sum(balls == color)
}


#loop over in dataframe
data()

nrow(USArrests)
ncol(USArrests)

cal_mean <- function(df) {
  col_name <- names(df)
  
  for(i in 1:ncol(df)) {
    avg_col <- mean(df[[i]])
    print(paste(col_name[i], ":", avg_col))
    
  }
}


## apply() function is loop row&col for everyone
# MARGIN = 1 is lookup by row
# MARGIN = 2 is lookup by column

avg_by_col <- apply(mtcars, MARGIN = 2, mean)


avg_by_row <- apply(mtcars, MARGIN = 1, mean)


sum_by_col <- apply(mtcars, MARGIN = 2, sum)


sum_by_row <- apply(mtcars, MARGIN = 1, sum)
