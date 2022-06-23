test_that("all arguments must be valid in order to the function return a list of train objects", {
  # load data
  # table available in caret package database
  data(PimaIndiansDiabetes)
  # rename dataset to keep code below generic
  my_df <- PimaIndiansDiabetes
  # now you're able to train your data
  my_models <- ml.trainlist(my_df, 0.8, algorithm = c("rf", "lda", "glm", "knn"), metric = "Accuracy", seed = 42, resampling = "repeatedcv")
  expect_type(my_models, "list")
})
