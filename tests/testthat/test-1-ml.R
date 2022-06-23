test_that("arguments are valid and the function returns an object of class train", {
  # load data
  # table available in caret package database
  data(PimaIndiansDiabetes)
  # rename dataset to keep code below generic
  my_df <- PimaIndiansDiabetes
  # now you're able to train your data
  my_model <- ml.train(my_df, 0.8, "lda", "Accuracy", 42, "repeatedcv")
  expect_s3_class(my_model, "train")
})
