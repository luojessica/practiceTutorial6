library(tidyverse)
library(tidymodels)

penguin_fit <- read_rds("output/model.rds")
test_data <- read_rds("data/penguins_test.csv")

# Predict on test data
predictions <- predict(penguin_fit, test_data, type = "class") %>%
  bind_cols(test_data)

# Confusion matrix
conf_mat <- conf_mat(predictions, truth = species, estimate = .pred_class)
conf_mat

write_rds(conf_mat, "output/conf.rds")
