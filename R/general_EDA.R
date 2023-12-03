"This script performs EDA on egg production data.
Usage:
  permutation.R <data_path>
" -> doc

library(readr)
library(dplyr)
library(infer)
library(docopt)

opt <- docopt(doc)

general_EDA <- function(data_path) {
  
  # read data
  data <- read_csv(data_path)
  
  
  # summary
  summary_data <- summary(data)
  saveRDS(summary_data, 'results/summary.rds')
  
  # check str
  str_data <- str(data)
  saveRDS(str_data, 'results/str.rds')
  
  # check head
  head_data <- head(data)
  saveRDS(head_data, 'results/head.rds')

  # check tail
  tail_data <- tail(data)
  saveRDS(tail_data, 'results/tail.rds')

  # nrow
  nrow_data <- nrow(data)
  saveRDS(nrow_data, 'results/nrow.rds')
  
  
}

general_EDA(opt$data_path)