#' Generate a null distribution plot
#'
#' This function generates a null distribution plot with null distribution generated from bootstrap using ggplot2.
#'
#' @param null_distribution A data frame containing the null distribution values generated from bootstrap with a "stat column".
#' @param test_stat The test statistic value.
#' @param alpha The significance level (default is 0.05).
#' @param bins The number of bins for the histogram (default is 30).
#'
#' @return A ggplot object representing the null distribution plot.
#'
#' @examples
#' generate_null_dist_plot(null_distribution, 0.023, alpha = 0.1)
generate_null_dist_plot <- function(null_distribution, test_stat, alpha = 0.05, bins = 30) {
  
  if (!"stat" %in% colnames(null_distribution)) {
    stop("Input data frame must contain a 'stat' column.")
  }
  
  alpha_threshold_lower <- quantile(null_distribution$stat, alpha / 2)
  alpha_threshold_upper <- quantile(null_distribution$stat, 1 - alpha / 2)
  
  null_dist_plot <- ggplot(null_distribution, aes(x = stat)) +
    geom_histogram(aes(y = after_stat(density)), 
                   bins = bins, colour = 1, 
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
