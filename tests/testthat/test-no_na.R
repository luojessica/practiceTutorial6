test_that("no_na removes rows with any NAs", {
  df <- data.frame(a = c(1, NA, 3), b = c("x", "y", NA))
  result <- no_na(df)
  expected <- data.frame(a = 1, b = "x")
  expect_equal(result, expected)
})

test_that("no_na returns same data if no NAs", {
  df <- data.frame(a = 1:3, b = c("x", "y", "z"))
  result <- no_na(df)
  expect_equal(result, df)
})

test_that("no_na returns empty data frame if all rows contain NA", {
  df <- data.frame(a = c(NA, NA), b = c(NA, NA))
  result <- no_na(df)
  expect_equal(nrow(result), 0)
})