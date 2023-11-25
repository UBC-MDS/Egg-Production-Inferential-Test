# The sample from demo to take place
library(testthat)
source("../../R/count_classes.R")

# Assuming your function to import data is called 'importing'
# And it takes a file path as an argument
#source("path_to_your_function/importing.R") # adjust the path to your actual function




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
importing <- function(file_path){
  readr::read_csv(file_path)
}

test_that("importing() returns a data frame", {
  file_path <- "../data/egg-production.csv"
  
  imported_data <- importing(file_path)
  
  # Check if the returned object is a data frame
  expect_true(is.data.frame(imported_data))
})

# Here's how you would test if the imported data has the right column names
test_that("importing() returns data frame with correct column names", {
  file_path <- "../data/egg-production.csv" # adjust this to the path of your actual file
  expected_col_names <- c("observed_month", "prod_type", "prod_process", "n_hens", "n_eggs", "source") # replace with your actual column names
  
  imported_data <- importing(file_path)
  actual_col_names <- names(imported_data)
  
  expect_equal(actual_col_names, expected_col_names)
})

