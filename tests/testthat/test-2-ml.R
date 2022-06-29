test_that("all arguments must be valid in order to the function return a list of train objects", {
  # load data
  # table available in caret package database
  library(mlbench)
  data(PimaIndiansDiabetes)
  # rename dataset to keep code below generic
  my_df <- PimaIndiansDiabetes
  # now we're going to define our train set
  my_training_sample <- ml.trainset(my_df, 0.8, seed = 42)
  # and now we're able to train our data
  my_models <- ml.trainlist(train_sample = my_training_sample, algorithm = c("rf", "lda", "glm", "knn"),
                            metric = "Accuracy", seed = 42, resampling = "cv")
  expect_type(my_models, "list")
})
