#' Read in Data
#'
#' Reads data from a CSV file into a data frame.
#'
#' @param file_path The path to the CSV file containing data.
#'
#' @return A data frame.
#'
#' @examples
#' egg_prod <- read_egg_production_data("../data/egg-production.csv")
#' egg_prod
read_egg_production_data <- function(file_path){
  readr::read_csv(file_path)
}
