test_that("split_data returns a list with train and test", {
  df <- data.frame(
    species = rep(c("Adelie", "Gentoo"), each = 10),
    bill_length_mm = rnorm(20, 45, 5)
  )
  
  result <- split_data(df)
  
  expect_type(result, "list")
  expect_named(result, c("train", "test"))
  expect_s3_class(result$train, "data.frame")
  expect_s3_class(result$test, "data.frame")
})

test_that("split_data preserves species levels in both sets", {
  df <- data.frame(
    species = rep(c("Adelie", "Chinstrap", "Gentoo"), each = 10),
    bill_length_mm = rnorm(30, 45, 5)
  )
  
  result <- split_data(df)
  
  expect_true(all(levels(factor(result$train$species)) %in% c("Adelie", "Chinstrap", "Gentoo")))
  expect_true(all(levels(factor(result$test$species)) %in% c("Adelie", "Chinstrap", "Gentoo")))
})

test_that("split_data is reproducible with same seed", {
  df <- data.frame(
    species = rep(c("Adelie", "Gentoo"), each = 10),
    bill_length_mm = rnorm(20, 45, 5)
  )
  
  split1 <- split_data(df, seed = 42)
  split2 <- split_data(df, seed = 42)
  
  expect_equal(split1$train, split2$train)
  expect_equal(split1$test, split2$test)
})
