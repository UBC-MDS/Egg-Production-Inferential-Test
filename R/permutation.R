"This script performs a hypothesis test using permutation on egg production data.

Usage:
  permutation.R <data_path> <response> <category_compare> <order_values> <test_stat_path> <seed>
" -> doc

library(readr)
library(dplyr)
library(infer)
library(docopt)

opt <- docopt(doc)

main <- function(data_path, response, category_compare, order_values, test_stat_path, seed=522) {
  
  # read data
  data <- read_csv(data_path, show_col_types = FALSE)
  data <- data |>
    mutate(!!sym(category_compare) := factor(!!sym(category_compare)))
  
  # set seed
  set.seed(as.numeric(seed))
  
  # implement hypotheses test using permutation
  formula_str <- paste(response, "~", category_compare)
  formula <- as.formula(formula_str)
  null_distribution <- data |>
    specify(formula = formula) |>
    hypothesize(null = "independence") |>
    generate(reps = 1000, type = "permute") |>
    calculate(stat = "diff in means", order = unlist(strsplit(order_values, ",")))
  write.csv(null_distribution, 'results/null_distribution.csv')
  
  # read test_stat from rds file
  test_stat <- readRDS(test_stat_path)
  
  # calculate p-value
  p_value <- null_distribution |>
    get_pvalue(obs_stat = as.numeric(test_stat), direction = "both")
  saveRDS(p_value, 'results/p_value.rds')
  
  print(paste("p-value is:", p_value))
  print("null_distribution and p_value were successfully created, which can be found in results folder.")
}

main(opt$data_path, opt$response, opt$category_compare, opt$order_values, opt$test_stat_path, opt$seed)
