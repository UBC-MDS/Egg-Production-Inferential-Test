"This script calculates the test statistic and saves it as an RDS file.

Usage:
  calc_test_stat.R <data_path> <column_name>
" -> doc

library(readr)
library(docopt)

opt <- docopt(doc)

main <- function(data_path, column_name) {
  data <- read_csv(data_path, show_col_types = FALSE)

  test_stat <- diff(data[[column_name]])
  
  saveRDS(test_stat, file = "results/test_stat.rds")
  print(paste("test statistic is:", test_stat))
  print("test_stat was successfully created, which can be found in results folder.")
}

main(opt$data_path, opt$column_name)