FROM rocker/r-env:latest

# Install remotes package
RUN R -e "install.packages('remotes', dependencies = TRUE)"

# Install R packages
RUN R -e "install.packages('ggplot2', version = '3.4.3', dependencies=TRUE)" \
    && R -e "install.packages('dplyr', version = '1.1.2', dependencies=TRUE)" \
    && R -e "install.packages('tidyr', version = '1.3.0', dependencies=TRUE)"\
    && R -e "install.packages('infer', version = '1.0.5', dependencies=TRUE)" \
    && R -e "install.packages('readr', version = '2.1.4', dependencies=TRUE)"