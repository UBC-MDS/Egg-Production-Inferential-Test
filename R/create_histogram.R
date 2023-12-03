"This script generates histogram for EDA plot using ggplot2.
Usage:
  create_histogram.R <data> <column_name> <title_prefix> <filenames>
" -> doc
library(ggplot2)
library(docopt)

opt = docopt(doc)
#' Create Histogram
#'
#' This function creates a histogram.
#' @param data Data frame.
#' @param column_name The name of the column to create a histogram.
#' @param title_prefix the title.
#' @param bins The number of bins to used.
#' @return A ggplot object of the histogram.
#' @examples
#' create_histogram(iris, 'Sepal.Length', 'sepal length', bins = 10)
create_histogram <- function(data, column_name, title_prefix, filenames) {
  # Construct the histogram using ggplot
  p <- ggplot(read.csv(data), aes_string(x = column_name)) +
    geom_histogram(bins = 30) + # Use specified number of bins
    labs(title = paste("Histogram of", title_prefix, "in a month"),
         x = paste("Number of", title_prefix, "per month"),
         y = "Count") +
    theme_minimal()
  ggsave(p, filename = filenames, width=8, height=5)
}

create_histogram(opt$data, opt$column_name, opt$title_prefix, opt$filenames)

