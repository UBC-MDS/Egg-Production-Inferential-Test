# The sample from demo to take place
library(testthat)
source("../../R/data_wrangling.R")


test_that("data_wrangling should return a data frame", {
 expect_true(is.data.frame(data_wrangling(two_group_input, filter, filter_value="Z", numerator, denominator, group)))
})


test_that("data_wrangling values are not correct", {
  expect_equivalent(data_wrangling(two_group_input, filter, "Z", numerator, denominator, group), two_group_output)
  expect_equivalent(data_wrangling(three_group_input, filter, "Z", numerator, denominator, group), three_group_output)
  expect_equivalent(data_wrangling(one_group_input, filter, "Z", numerator, denominator, group), one_group_output)
  expect_equivalent(data_wrangling(empty_input, filter, "Z", numerator, denominator, group), empty_output)
 })

test_that("data_wrangling should throw an error when incorrect types are passed in numerator_col and denominator_col ", {
  expect_error(data_wrangling(numerator_error, filter, "Z", numerator, denominator, group))
  expect_error(data_wrangling(denominator_error, filter, "Z", numerator, denominator, group))
})
