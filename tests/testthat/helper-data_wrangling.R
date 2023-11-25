# function inputs
two_group_input <- data.frame(filter = c("Z", "Z"),
                               numerator = c(1, 2),
                               denominator = c(1, 2),
                               group = c("A", "B"))

three_group_input <- data.frame(filter = c("Z", "Z", "Z"),
                               numerator = c(1, 2, 3),
                               denominator = c(1, 1, 1),
                               group = c("A", "B", "C"))

one_group_input <- data.frame(filter = c("Z"),
                               numerator = c(1),
                               denominator = c(1),
                               group = c("A"))

empty_input <- data.frame(filter = character(0),
                               numerator = numeric(0),
                               denominator = numeric(0),
                               group = character(0))



#function outputs from data_wrangling
two_group_output <- data.frame(group = c("A", "B"),
                         n = c(1, 1),
                         mean_of_group = c(1, 1))

three_group_output <- data.frame(group = c("A", "B", "C"),
                           n = c(1, 1, 1),
                           mean_of_group = c(1, 2, 3))

one_group_output <- data.frame(group = c("A"),
                           n = c(1),
                           mean_of_group = 1)

empty_output <- data.frame(group = character(0),
                       n = numeric(0),
                       mean_of_group = numeric(0))

#error outputs
numerator_error <- data.frame(filter = c("Z", "Z"),
                              numerator = c("a", "a"),
                              denominator = c(1, 2),
                              group = c("A", "B"))

denominator_error <- data.frame(filter = c("Z", "Z"),
                                numerator = c(1, 2),
                                denominator = c("a", "b"),
                                group = c("A", "B"))

