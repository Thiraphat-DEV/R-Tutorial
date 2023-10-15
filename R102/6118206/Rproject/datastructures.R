## 1.Vector get 1 datatype
1:20
seq(from = 1, to = 100, by = 3)
help('seq')

names <- c("bias", "cnn", "object", "testing")
class(names)
ages <- c(20, 30, 40, 100, 23)
ls_male <- c(TRUE, FALSE, TRUE, FALSE)
class(ls_male)
languages <- factor(c("english", "fresh", "pytorch", "rust"))
class(languages)
## 2.matrix get 1 datatype
x_number <- 1:36
length(x_number)
dim(x_number) <- c(6, 6)
m1 <- matrix(1:36, ncol = 6, byrow = TRUE) #or byrow = T 
#m1 + Real number is element wise computation
m1_tax <- m1 * 1.07

## 3.List multi Data Types
mylist <- list(
  name = "boaty",  
  friend1 = "name", 
  friend2 = "wave", 
  m1 = matrix(1:30, ncol = 6, byrow = T), 
  logics = FALSE)
mylist$name
mylist$friend1
class(mylist)
## 4.DataFrame
friends <- c('name', 'earn', 'pong', 'pang', 'four', 'com')
age_f <- c(21, 22, 23, 21, 23, 22)
locations <- c('buriram', "bangkok", 'chonburi', 'nangrong', 'korat', 'swaysor')
movie_lover <- c('fastX', "transformers", "Startup", "hacker2", "yongpat", "badguy")


all_frames <- data.frame(friends, age_f, locations, movie_lover)

View(all_frames)

#create dataframes from list
my_frame_list <- list(f = friends, 
                      age = age_f, 
                      local = locations, 
                      movie = movie_lover)
new_frames <- data.frame(my_frame_list)

View(new_frames)

## 6.subset data
