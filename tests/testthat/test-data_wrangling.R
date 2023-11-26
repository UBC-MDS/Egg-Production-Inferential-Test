# The sample from demo to take place
library(testthat)
source("../../R/data_wrangling.R")


test_that("data_wrangling should return a data frame", {
 expect_true(is.data.frame(data_wrangling(two_group_input, group, value, mean)))
})


test_that("data_wrangling values are not correct", {
  expect_equivalent(data_wrangling(two_group_input, group, value, mean), two_group_output)
  expect_equivalent(data_wrangling(three_group_input, group, value, mean), three_group_output)
  expect_equivalent(data_wrangling(one_group_input, group, value, mean), one_group_output)
  expect_equivalent(data_wrangling(empty_input, group, value, mean), empty_output)
 })

test_that("value_col should be numeric", {
  expect_error(data_wrangling(error_input, group, value, mean))
})