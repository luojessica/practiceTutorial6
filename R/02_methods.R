library(tidyverse)
library(tidymodels)

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
data <- data %>%
  select(species, bill_length_mm, bill_depth_mm, flipper_length_mm, body_mass_g) %>%
  mutate(species = as.factor(species))

write_rds(data, "data/penguins_clean.csv")
