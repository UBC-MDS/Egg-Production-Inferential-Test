# The sample from demo to take place
library(testthat)
library(ggplot2)
source("../../R/generate_null_dist_plot.R")

# generate a helper test data
sample_null_distribution <- data.frame(stat = rnorm(100))

# Test Case 1: Confirm that `generate_null_dist_plot` returns a valid plot
test_that("generate_null_dist_plot should return a valid plot", {
  plot <- generate_null_dist_plot(sample_null_distribution, 0.023)
  expect_true("ggplot" %in% class(plot))
})

# Test Case 2: Verify that `generate_null_dist_plot` generates a plot 
# with 'stat' column as the x-axis, and with the specified or default bin count (30)
test_that("generate_null_dist_plot should produce a histogram with 'stat' on x-axis and specified or default bin count", {
  # Generate a plot with the bin count (20)
  plot_specified_bins <- generate_null_dist_plot(sample_null_distribution, 0.023, bins = 20)
  expect_identical((colnames(plot_specified_bins$data)), "stat")
  expect_equal(plot_specified_bins$layers[[1]]$stat_params$bins, 20)
  # Generate a plot with the default bin count (30)
  plot_default_bins <- generate_null_dist_plot(sample_null_distribution, 0.023)
  expect_identical((colnames(plot_default_bins$data)), "stat")
  expect_equal(plot_default_bins$layers[[1]]$stat_params$bins, 30)
})

# Test Case 3: Verify that `generate_null_dist_plot` generates a histogram and density plot,
test_that("generate_null_dist_plot should produce a histogram and density plot", {
  plot_type <- generate_null_dist_plot(sample_null_distribution, 0.023, bins = 20)
  expect_true("GeomBar" %in% class(plot_type$layers[[1]]$geom))
  expect_true("GeomDensity" %in% class(plot_type$layers[[2]]$geom))
})

# Test Case 4: Confirm that the test statistic is calculated correctly and highlighted by a red line
test_that("The test statistic should be calculated correctly and indicated by a red line", {
  plot <- generate_null_dist_plot(sample_null_distribution, 0.023)
  expect_true(plot$layers[[3]]$data$xintercept == 0.023)
  expect_true(plot$layers[[3]]$aes_params$colour == "red")
})

# Test Case 5: Ensure that the significance level is correctly calculated
test_that("The significance level should be calculated correctly", {
  plot <- generate_null_dist_plot(sample_null_distribution, 0.023, alpha = 0.1)
  alpha_threshold_lower <- quantile(sample_null_distribution$stat, 0.05)
  alpha_threshold_upper <- quantile(sample_null_distribution$stat, 0.95)
  expect_true(all(c(plot$layers[[4]]$data$xintercept) == c(alpha_threshold_lower, alpha_threshold_upper)))
})

# Test Case 6: Ensure that the significance level is correctly indicated by a blue dashed line
test_that("The significance level should be marked by a blue dashed line", {
  plot <- generate_null_dist_plot(sample_null_distribution, 0.023, alpha = 0.1)
  expect_equal(plot$layers[[4]]$aes_params$linetype, "dashed")
  expect_equal(plot$layers[[4]]$aes_params$colour, "blue")
})

# Test Case 7: Verify the presence of a title and axis labels
test_that("A title and axis labels should be included", {
  plot <- generate_null_dist_plot(sample_null_distribution, 0.023)
  expect_true(!is.null(plot$labels$title))
  expect_true(!is.null(plot$labels$x))
  expect_true(!is.null(plot$labels$y))
})

# Test Case 8: generate_null_dist_plot` should throw an error when incorrect types 
# are passed to `null_distribution` arguments
test_that("generate_null_dist_plot should throw an error for incorrect null_distribution types", {
  incorrect_null_distribution <- c("value1", "value2", "value3")
  expect_error(generate_null_dist_plot(incorrect_null_distribution, 0.023, alpha = 0.1), 
               "Input data frame must contain a 'stat' column.")
})