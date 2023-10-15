#install.packages('tidyverse')
# tidyverse have dplyr tidyr ggplot2
library(tidyverse)

# dataFrame vs tibble 

df_tibble <- tibble(id = 1:3, name = c("boaty", "franky", "onin"))

df_org <- data.frame(id = 1:3, name = c("boaty", "franky", "onin"))

# convert dataFrame  to tibble
mtcars
mtcars_tibble = tibble(mtcars)

View(mtcars)

#sample data
set.seed(42) # ล็อกผลลัพธ์ให้เหมือนเดิมตลอดเเม้เราจะเปลี่ยนเลขใน seed
#sample_n สุ่มตามจำนวนที่ใส่
sample_n(mtcars_tibble, size = 5)
#sample_frac สุ่มเป็นเปอร์เซ็น default คือโอกาสในการสุ่มจะไม่ซ้ำกัน 
#เเต่ถ้าใส่ replace เข้าไปโอกาสในการสุ่มได้ data เดิมจะซ้ำกันได้
sample_frac(mtcars_tibble, size = 0.20, replace = TRUE)

mtcars_tibble %>%
  sample_n(5:9)
#slice

mtcars_tibble %>% 
  slice(1:5)

mtcars %>%
  slice(c(1, 5, 7, 10))

mtcars_tibble %>%
  slice(sample(nrow(mtcars_tibble), 20))
