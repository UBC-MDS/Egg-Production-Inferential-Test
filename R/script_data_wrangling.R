"This script does the data wrangling for the egg production inference test

Usage: filter_mutate.R <data_csv>
" -> doc

library(dplyr)
library(docopt)

opt <- docopt(doc)

read_data <- function(data_csv){
    data <- read.csv(data_csv)
    return(data_csv)
}
read_data(opt$data_csv)

filter_mutate <- function(data_csv){
  result <- data |>
    dplyr::filter(prod_process == 'all') |>
    dplyr::mutate(n_eggs_by_hen = n_eggs / n_hens)
  return(result)
}
filter_mutate(opt$data_csv)

group_summarise <- function(data_csv){
  result2 <- result |>
    dplyr::group_by(prod_type) |>
    dplyr::summarise(n = dplyr::n(),
                     n_egg_by_hen := mean(n_egg_by_hen))
  print(result2)
  return(result2)
}

group_summarise(opt$data_csv)
