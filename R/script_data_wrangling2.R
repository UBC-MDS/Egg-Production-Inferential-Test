"This script does the data wrangling for the egg production inference test

Usage: group_summarise.R <data_csv>
" -> doc

library(dplyr)
library(docopt)

opt <- docopt(doc)

group_summarise <- function(data_csv){
  result2 <- read.csv(data_csv) |>
    dplyr::filter(prod_process == 'all') |>
    dplyr::mutate(n_egg_by_hen = n_eggs / n_hens) |>
    dplyr::group_by(prod_type) |>
    dplyr::summarise(n = dplyr::n(),
                     n_egg_by_hen := mean(n_egg_by_hen))
  print(result2)
  return(result2)
}

group_summarise(opt$data_csv)
