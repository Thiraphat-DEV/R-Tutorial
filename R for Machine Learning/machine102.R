library(tidyverse)
library(caret)
library(mlbench)


data("BostonHousing")


df <- BostonHousing
mean(complete.cases(df))
# train test split
split_data <- function(df) {
  set.seed(42)
  n <- nrow(df)
  id <- sample(1:n, size = 0.7 * n)
  train_df <- df[id, ]
  test_df <- df[-id,]
  
  return(list(train = train_df, test = test_df))
}
prep_data <- split_data(df)

train_df <- prep_data[[1]]
test_df <- prep_data[[2]]
# train model
model <- train(medv ~ rm + b + crim,
               data = train_df,
               method = 'lm')

# predict / score new data
prediction <- predict(model, newdata = test_df)

# evaluate data

cal_mae <- function(actual, pred) {
  err <- actual - pred
  return(mean(abs(err)))
}

cal_mse <- function(actual, pred) {
  err <- actual - pred
  return(mean(err ** 2))
}

cal_rmse <- function(actual, pred) {
  err <- actual - pred
  return(sqrt(mean(err ** 2)))
}


cal_mae(test_df$medv, prediction)

cal_mse(test_df$medv, prediction)

cal_rmse(test_df$medv, prediction)

#Save model

saveRDS(model, "linear_model.RDS")


#Read linear Model

lm_model <- readRDS("linear_model.RDS")lm

## Train Control
## change Resampling technique
install.packages('caret')
library("caret")
library('mlbench')

df <- BostonHousing

split_data <- function(df) {
  n <- nrow(df)
  id <- sample(1:n, size = 0.7 * n)
  
  train_data <-df[id, ]
  test_data <- df[-id, ]
  list(train = train_data, test = test_data)
}
prep_data <- split_data(df)

train_data <- prep_data[[1]]

test_data <- prep_data[[2]]

set.seed(42)
ctrl <- trainControl(
  method = "cv", 
  number = 10,
  verboseIter = TRUE
)

## add preprocess
model <-  train(medv ~ rm + b + crim, 
                data = train_data,
                method = 'lm',
                preProcess = c("range", "nzv", "zv"),
                # preProcess = c("center", "scale"), # standardization(z-score)
                trControl = ctrl)

# Variable Importance
varImp(model)