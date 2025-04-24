#' Prepare Data
#'
#' This function selects key columns from a penguin dataset and converts
#' the `species` column to a factor.
#'
#' @param data A data frame containing penguin measurements, such as from the `palmerpenguins` package.
#'
#' @return A data frame with selected numeric columns and a factor `species` column.
#' @export
#'
#' @examples
#' library(palmerpenguins)
#' data <- penguins
#' data <- data[complete.cases(data), ]  # remove NAs
#' prepare_data(data)
prepare_data <- function(data) {
  data %>%
    dplyr::select(species, bill_length_mm, bill_depth_mm, flipper_length_mm, body_mass_g) %>%
    dplyr::mutate(species = as.factor(species))
}
