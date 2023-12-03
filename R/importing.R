"This script to import the data2.
Usage:
  importing.R <file_path>
" -> doc

library(docopt)
library(readr)
opt = docopt(doc)


#' Read in Data
#'
#' Reads data from a CSV file into a data frame.
#'
#' @param file_path The path to the CSV file containing data.
#'
#' @return A data frame.
#'
#' @examples
#' egg_prod <- importing("../data/egg-production.csv")
#' egg_prod
importing <- function(file_path){
  if (!file.exists(file_path)) {
    warning("File does not exist, returning NULL")
    return(NULL)
  }
  write.csv(readr::read_csv(file_path), file = 'results/egg-production.csv')
}

importing(opt$file_path)


