"This script does the data wrangling for the null distribution permutation

Usage: filter_mutate.R <data_csv>
" -> doc

library(dplyr)
library(readr)
library(docopt)

opt <- docopt(doc)

filter_mutate <- function(data_csv){
  result <- read.csv(data_csv) |>
    dplyr::filter(prod_process == 'all') |>
    dplyr::mutate(n_egg_by_hen = n_eggs / n_hens)
  write_csv(result, 'results/egg_prod.csv')
}
filter_mutate(opt$data_csv)

