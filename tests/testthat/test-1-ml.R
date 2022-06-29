test_that("arguments are valid and the function returns an object of class train", {
  # load data
  # table available in caret package database
  library(mlbench)
  data(PimaIndiansDiabetes)
  # rename dataset to keep code below generic
  my_df <- PimaIndiansDiabetes
  # now you're able to train your data
  my_model <- ml.train(train_sample = my_training_sample, algorithm = "lda", metric = "Accuracy", seed = 42, resampling = "cv")
  expect_s3_class(my_model, "train")
})
