source("R/no_na.R")
library(readr)
library(palmerpenguins)

data <- penguins

data <- no_na(data)

write_csv(data, "data/penguins.csv")
