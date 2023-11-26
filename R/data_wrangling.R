library(tibble)
library(dplyr)
# The sample from demo to take place

#' Calculates summary function of grouped columns
#'
#' Creates a two column dataframe, adding the number of observations per
#' group and calculates the summary of a specified value_col for each group.
#'
#' @param data_frame A data frame or a tibble.
#' @param grouping_col unquoted column name of the column to be grouped by
#' @param value_col unquoted column name of the column containing the values to be summarised
#' @param fun a function to summarise by
#'
#' @return A dataframe with two columns
#'  The first is the number of observations in each group
#'  The second is the summarized value of the groups
#'
#' @examples
#' data_wrangling(egg_prod, prod_type, mean)
# 
data_wrangling <- function(data_frame, grouping_col, value_col, fun){
  if (!is.numeric(data_frame |> pull({{ value_col }}))) {
    stop('value_col must be numeric')
  }
  data_frame |>
    dplyr::group_by({{ grouping_col }}) |>
    dplyr::summarise(n = dplyr::n(),
                     {{ value_col }} := fun({{ value_col }}))
}

