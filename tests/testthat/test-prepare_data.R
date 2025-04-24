# test 1

test_that("prepare_data returns expected columns", {
  df <- data.frame(
    species = c("Adelie", "Chinstrap"),
    bill_length_mm = c(39.1, 46.5),
    bill_depth_mm = c(18.7, 17.9),
    flipper_length_mm = c(181, 195),
    body_mass_g = c(3750, 3800),
    island = c("Torgersen", "Dream") # extra column
  )
  
  result <- prepare_data(df)
  
  expect_named(result, c("species", "bill_length_mm", "bill_depth_mm", "flipper_length_mm", "body_mass_g"))
})

# test 2

test_that("species column is converted to factor", {
  df <- data.frame(
    species = c("Adelie", "Gentoo"),
    bill_length_mm = c(40, 45),
    bill_depth_mm = c(19, 18),
    flipper_length_mm = c(200, 210),
    body_mass_g = c(4000, 4200)
  )
  
  result <- prepare_data(df)
  
  expect_true(is.factor(result$species))
})

# test 3 & 4

test_that("prepare_data drops unrelated columns", {
  df <- data.frame(
    species = c("Adelie", "Chinstrap"),
    bill_length_mm = c(38, 45),
    bill_depth_mm = c(18, 17),
    flipper_length_mm = c(180, 190),
    body_mass_g = c(3700, 3900),
    sex = c("male", "female"),
    year = c(2007, 2008)
  )
  
  result <- prepare_data(df)
  
  expect_false("sex" %in% names(result))
  expect_false("year" %in% names(result))
})