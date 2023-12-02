FROM rocker/tidyverse:4.3.2

LABEL org.opencontainers.image.licenses="GPL-2.0-or-later" \
      org.opencontainers.image.source="https://github.com/rocker-org/rocker-versioned2" \
      org.opencontainers.image.vendor="Rocker Project" \
      org.opencontainers.image.authors="Carl Boettiger <cboettig@ropensci.org>"
#install the infer package
RUN R -e "install.packages('infer', version = '1.0.5', dependencies=TRUE)"

#install the infer package
RUN R -e "install.packages('testthat', version = '3.2.0', dependencies=TRUE)"

RUN R -e "install.packages('docopt', version = '0.7.1', dependencies=TRUE)"

ENV CTAN_REPO=https://mirror.ctan.org/systems/texlive/tlnet
ENV PATH=$PATH:/usr/local/texlive/bin/linux

RUN /rocker_scripts/install_verse.sh
