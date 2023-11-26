# function inputs
two_group_input <- data.frame(group = c("A", "A","B"),
                              value = c(1, 3, 1))

three_group_input <- data.frame(group = c("A", "B", "C"),
                                value = c(1, 2, 3))

one_group_input <- data.frame(group = c("A"),
                              value = c(1))

empty_input <- data.frame(group = character(0),
                          value = numeric(0))



#function outputs from data_wrangling
two_group_output <- data.frame(group = c("A", "B"),
                               n = as.integer(c(2, 1)),
                               value = c(2, 1))

three_group_output <- data.frame(group = c("A", "B", "C"),
                                 n = as.integer(c(1, 1, 1)),
                                 value = c(1, 2, 3))

one_group_output <- data.frame(group = c("A"),
                               n = as.integer(c(1)),
                               value = 1)

empty_output <- data.frame(group = character(0),
                           n = numeric(0),
                           value = numeric(0))


#error testing
error_input <- data.frame(group = c("A"),
                          value = c("1"))