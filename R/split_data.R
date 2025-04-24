#' Split Data into Training and Testing Sets
#'
#' This function splits a data frame into training and testing sets using stratified sampling on the `species` column.
#'
#' @param data A data frame containing a `species` column for stratification.
#' @param seed An integer used to set the random seed for reproducibility. Default is 123.
#'
#' @return A list with two elements: `train` and `test`, each a data frame.
#' @export
#'
#' @examples
#' library(palmerpenguins)
#' data <- na.omit(penguins)
#' data <- prepare_data(data)
#' splits <- split_data(data)
#' train <- splits$train
#' test <- splits$test
split_data <- function(data, seed = 123) {
  set.seed(seed)
  split <- rsample::initial_split(data, strata = species)
  list(
    train = rsample::training(split),
    test = rsample::testing(split)
  )
}