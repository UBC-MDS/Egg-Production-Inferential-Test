# The sample from demo to take place

#' Calculates mean of grouped columns
#'
#' Creates a two column dataframe, adding the number of observations per
#' group and calculates the mean of a specified value_col for each group.
#'
#' @param data_frame A data frame or a tibble.
#' @param filter_col the column to filter by
#' @param filter_value string value to filter for
#' @param numerator_col unquoted column name of the column to be divided by the
#'        denominaotor column
#' @param denominator_col unquoted column name that the numerator_col will be
#'        divided by
#' @param grouping_col unquoted column name of the column to be grouped by
#'
#' @return A dataframe with two columns
#'  The first is the number of observations in each group
#'  The second is the summarized value of the groups
#'
#' @examples
#' data_wrangling(egg_prod, prod_process, "all", n_eggs, n_hens, prod_type)
# 
data_wrangling <- function(data_frame, filter_col, filter_value, numerator_col, denominator_col, grouping_col){
  # if(!is.numeric(numerator_col)) {
  #   stop("`numerator_col` expects a vector of numeric values")
  # }
  # if(!is.numeric(denominator_col)) {
  #   stop("`denominator_col` expects a vector of numeric values")
  # }
  data_frame |>
    dplyr::filter({{ filter_col }} == filter_value) |>
    dplyr::mutate(value := {{ numerator_col }} / {{ denominator_col }}) |>
    dplyr::group_by({{ grouping_col }}) |>
    dplyr::summarise(n = dplyr::n(),
                     mean_of_group = mean(value, na.rm = TRUE))
}
