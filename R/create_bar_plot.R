"This script generates bar plots for EDA plot using ggplot2.
Usage:
  create_bar_plot.R <data> <column_name> <title_description> <filenames>
" -> doc
library(ggplot2)
library(docopt)

opt = docopt(doc)
#' Create Bar Plot
#'
#' This function creates a bar plot.
#' @param data Data frame.
#' @param column_name The name of the column to create the plot.
#' @param title_description A description for the title/column name to use.
#' @return A ggplot object of a bar plot.
#' @examples
#' create_bar_plot(mpg, 'class', 'Distribution of car classes')
create_bar_plot <- function(data, column_name, title_description, filenames) {
  # Construct the bar plot using ggplot
  p <- ggplot(read.csv(data), aes_string(x = column_name)) +
    geom_bar() +
    labs(title = paste("Distribution of", title_description),
         x = title_description,
         y = "Count") +
    theme_minimal()
  ggsave(p, filename = filenames, width=8, height=5)
}

create_bar_plot(opt$data, opt$column_name, opt$title_description, opt$filenames)
