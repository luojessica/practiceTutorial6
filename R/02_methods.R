library(tidyverse)
library(tidymodels)
source("R/prepare_data.R")

data <- read_csv("data/penguins.csv")

# Summary statistics
glimpse(data)
summarise(data, mean_bill_length = mean(bill_length_mm), mean_bill_depth = mean(bill_depth_mm))

# Visualizations
plot <- ggplot(data, aes(x = species, y = bill_length_mm, fill = species)) +
  geom_boxplot() +
  theme_minimal()

ggsave("output/plot.png", plot)

# Prepare data for modeling
data <- prepare_data(data)

write_rds(data, "data/penguins_clean.rds")
