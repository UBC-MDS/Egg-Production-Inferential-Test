"This script generates a null distribution plot using ggplot2.

Usage:
  plot_null_distribution.R <null_dist_path> <test_stat_path> <alpha> 
" -> doc

library(readr)
library(ggplot2)
library(docopt)

opt <- docopt(doc)

generate_null_dist_plot <- function(null_distribution, test_stat, alpha = 0.05) {
  
  if (!"stat" %in% colnames(null_distribution)) {
    stop("Input data frame must contain a 'stat' column.")
  }
  
  alpha_threshold_lower <- quantile(null_distribution$stat, alpha / 2)
  alpha_threshold_upper <- quantile(null_distribution$stat, 1 - alpha / 2)
  
  null_dist_plot <- ggplot(null_distribution, aes(x = stat)) +
    geom_histogram(aes(y = after_stat(density)), 
                   bins = 30, colour = 1, 
                   fill = "lightblue") +
    geom_density() +
    geom_vline(xintercept = test_stat, color = "red", linewidth = 1) +
    geom_vline(xintercept = c(alpha_threshold_lower, alpha_threshold_upper), linetype = "dashed", color = "blue") +
    labs(
      title = "Null Distribution of the difference in means",
      x = "Difference of the means",
      y = "Count"
    )
  null_dist_plot
}

main <- function(null_dist_path, test_stat_path, alpha = 0.05) {
  null_distribution <- read_csv(null_dist_path, show_col_types = FALSE)
  test_stat <- readRDS(test_stat_path)
  alpha <- as.numeric(alpha)

  plot <- generate_null_dist_plot(null_distribution, test_stat, alpha)
  ggsave(plot, filename='results/results_viz.png', width=8, height=5)
  print("Plot was successfully created, which can be found in results folder.")
}

main(opt$null_dist_path, opt$test_stat_path, opt$alpha)