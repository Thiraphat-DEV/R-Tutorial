library(tidyverse)
library(caret)
library(mlbench)

## ML = Experimentations
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
# K-fold Cross Validation 
ctrl <- trainControl(
  method = "cv", 
  number = 10,
  verboseIter = TRUE
)

# Better for K-fold is repeated K-fold, which all train = 25 round
ctrl <- trainControl(
  method = "cv", 
  number = 5,
  repeats = 5,
  verboseIter = TRUE
)

## Tune Hyperparameter using k = 5
model <-  train(medv ~ rm + b + crim + lstat + age, 
                data = train_data,
                #method = 'lm', ## linearRegression
                method = 'knn',
                tuneLength = 5,
                preProcess = c("range", "nzv", "zv"), ## Normalization
                # preProcess = c("center", "scale"), ## standardization(z-score)
                trControl = ctrl)

## Train Final Model using k =11
model_k11 <-  train(medv ~ rm + b + crim + lstat + age, 
                data = train_data,
                #method = 'lm', ## linearRegression
                method = 'knn',
                tuneGrid = data.frame(k = 11),
                preProcess = c("range", "nzv", "zv"), ## Normalization
                # preProcess = c("center", "scale"), ## standardization(z-score)
                trControl = trainControl(method = 'none'))

## Train Multi Model using k = 5, 7, 11
multi_model <-  train(medv ~ rm + b + crim + lstat + age, 
                    data = train_data,
                    #method = 'lm', ## linearRegression
                    method = 'knn',
                    tuneGrid = data.frame(k = c(5, 7, 11)),
                    preProcess = c("range", "nzv", "zv"), ## Normalization
                    # preProcess = c("center", "scale"), ## standardization(z-score)
                    trControl = ctrl)

## Select Metric or Every for Decision to Tune Hyperparameter for impress model
multi_model <-  train(medv ~ rm + b + crim + lstat + age, 
                      data = train_data,
                      #method = 'lm', ## linearRegression
                      method = 'knn',
                      metric = "RMSE",
                      tuneGrid = data.frame(k = c(5, 7, 11)),
                      preProcess = c("range", "nzv", "zv"), ## Normalization
                      # preProcess = c("center", "scale"), ## standardization(z-score)
                      trControl = ctrl)

#predict new data
pred_train <- predict(model_k11)
prediction <- predict(model_k11, newdata = test_data)

##rmse train
rmse_train <- cal_rmse(actual = test_data$medv, pred_train)
##mse train
mse_train <-  cal_mse(actual = test_data$medv, pred_train)
##mae train
mae_train <- cal_mae(actual = test_data$medv, pred_train)

#rmse test
rmse_test <- cal_rmse(actual = test_data$medv, prediction)
#mse test
mse_tes <- cal_mse(actual = test_data$medv, prediction)
#mae test
mae_test <- cal_mae(actual = test_data$medv, prediction)


# Variable Importance
varImp(model)