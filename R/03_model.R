library(tidyverse)
library(tidymodels)
source("R/split_data.R")

data <- read_rds("data/penguins_clean.rds")

# Split data
splits <- split_data(data)  # Use your function here!
train_data <- splits$train
test_data <- splits$test

write_rds(test_data, "data/penguins_test.rds")

# Define model
penguin_model <- nearest_neighbor(mode = "classification", neighbors = 5) %>%
  set_engine("kknn")

# Create workflow
penguin_workflow <- workflow() %>%
  add_model(penguin_model) %>%
  add_formula(species ~ .)

# Fit model
penguin_fit <- penguin_workflow %>%
  fit(data = train_data)

write_rds(penguin_fit, "output/model.rds")
