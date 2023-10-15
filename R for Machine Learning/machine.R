install.packages("tidyverse")
install.packages("caret")

library(tidyverse)
library(caret)


#classification and Regression Tree => caret

#Simple Model
# 0.Prep data
# 1.Split Data
# 2.Train Data
# 3.Prediction Model
# 4.Evaluate Model

View(mtcars)

# Data Frame
full_df <- mtcars

# Check Missing Value if mean was 1 -> not-null
full_df %>% complete.cases() %>%
  mean()

# Drop missing Value

clean_df <- full_df %>%
  drop_na()

# Count of Df
n <- nrow(clean_df)

# Split Data otherwise train 70% and test 30%
split_data <- function(df) {
  set.seed(42)
  train_id <- sample(1:n, size = 0.7 * n)
  train_df <- df[train_id, ]
  test_df <- df[-train_id, ]
  #return train and test
  return(list(train = train_df, test = test_df))
}

# Prep data
prep_data <- split_data(clean_df)
train_df <- prep_data[[1]]
test_df <- prep_data[[2]]
# train model
lm_model <-  train(mpg ~ ., 
                   data = train_df,
                   method = 'ranger')

# prediction model
model <- predict(lm_model, newdata = test_df)

# Evaluate Model

#mean absolute error
mae <- mean(abs(model - test_df$mpg))

#root mean absolute error
rmse <- sqrt(mean((model - test_df$mpg) ** 2))
