#' Remove Rows with Missing Values
#'
#' This function removes any rows in a data frame that contain `NA` values.
#'
#' @param data A data frame or tibble.
#'
#' @return A data frame with all rows containing any `NA` values removed.
#' 
#' @import dplyr 
#' 
#' @export
#'
#' @examples
#' df <- data.frame(a = c(1, NA, 3, 4), b = c("x", "y", NA, "z"))
#' no_na(df)
no_na <- function(data) {
  tidyr::drop_na(data)
}