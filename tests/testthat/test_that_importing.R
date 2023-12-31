library(testthat)
source("../../R/importing_test.R")

test_that("importing() returns a data frame", {
  file_path <- "../../data/egg-production.csv"
  
  imported_data <- importing(file_path)
  
  # Check if the returned object is a data frame
  expect_true(is.data.frame(imported_data))
})


test_that("importing() returns data frame with correct column names", {
  file_path <- "../../data/egg-production.csv" # adjust this to the path
  expected_col_names <- c("observed_month", "prod_type", "prod_process", "n_hens", "n_eggs", "source")

  imported_data <- importing(file_path)
  actual_col_names <- names(imported_data)

  expect_equal(actual_col_names, expected_col_names)
})


test_that("importing() returns correct number of rows", {
  file_path <- "../../data/egg-production.csv"
  imported_data <- importing(file_path)
  expect_true(nrow(imported_data) == 320)
})

test_that("importing() returns NULL if the file does not exist", {
  file_path <- "fake path"
  imported_data <- importing(file_path)
  expect_true(is.null(imported_data))
})



