# DSCI_522_group12

# Comparative Analysis of Egg Production: Hatching vs. Table Eggs 

**Author:** Kun Ya, Kiersten Gilber, Paolo De Lagrave-Codina, Yin Huang  

**Contributions:** We welcome all contributions, input, feedback or bug fixes to this project! For reporting a bug or feature requests, please open up an issue here. If you'd like to contribute a bug fix, you can fork our repository and submit a pull request. We will review all pull requests as soon as possible. All contributors must abide by our code of conduct.

## About

Here we attempt to use inference to determine if there is a difference in the number of eggs produced by each hen between hatching and table eggs (fertilized vs unfertilized). We did this using a permutation method on our sample to compare the observed statistics. We got a p-value of 0 which is very rare and is below our chosen 0.05 alpha so we reject the null hypothesis that the number of eggs produced by each hen between hatching and table eggs are the same.

The data used in this analysis was taken from the tidytuesday repository (TidyTuesday, 2023) and was originally sourced from the Open Science Framework project by Samara Mendez (Mendez, 2023). Each row in the dataset represents summary data for the month, reporting on the type of egg (table vs hatching), the production process (conventional, cage-free, organic), the number of hens, the number of eggs and the source of the data.


## Report

The final report can be found in the analysis file of this repo

## Dependencies

- **R version 4.3.1** and R packages:
  - infer=1.0.5
  - digest=0.6.33
  - ottr=1.4.0
  - tidyr=1.3.0
  - dplyr=1.1.2
  - forcats=1.0.0
  - purrr=1.0.2
  - readr=2.1.4
  - knitr=1.43
  - cowplot=1.1.1
  - datateachr=0.2.1
  
Note We have many more dependencies in the environment but these are the main ones for our analysis.
Here is a link to the full env https://github.com/UBC-MDS/DSCI_522_group12/blob/main/renv.lock
## License

For all project code please refer to the following license:

Copyright 2023 University of British Columbia MDS

Permission is hereby granted, free of charge, to any person obtaining a
copy of this software and associated documentation files (the
"Software"), to deal in the Software without restriction, including
without limitation the rights to use, copy, modify, merge, publish,
distribute, sublicense, and/or sell copies of the Software, and to
permit persons to whom the Software is furnished to do so, subject to
the following conditions:

The above copyright notice and this permission notice shall be included
in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS
OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY
CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

## References

- Mendez, S. (2023, April 9). *US Egg Production Data Set*. Open Science Framework. https://osf.io/z2gxn/

- TidyTuesday. (2023, April). *US Egg Production*. rfordatascience/tidytuesday. https://github.com/rfordatascience/tidytuesday/blob/master/data/2023/2023-04-11/readme.md


