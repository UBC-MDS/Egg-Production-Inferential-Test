# DSCI_522_group12

# Comparative Analysis of Egg Production: Hatching vs. Table Eggs 

**Author:** Kun Ya, Kiersten Gilberg, Paolo De Lagrave-Codina  

**Contributions:** We welcome all contributions, input, feedback or bug fixes to this project! For reporting a bug or feature requests, please open up an issue here. If you'd like to contribute a bug fix, you can fork our repository and submit a pull request. We will review all pull requests as soon as possible. All contributors must abide by our code of conduct.

## About

Here we attempt to use inference to determine if there is a difference in the number of eggs produced by each hen between hatching and table eggs (fertilized vs unfertilized). We did this using a permutation method on our sample to compare the observed statistics. We got a p-value of 0 which is very rare and is below our chosen 0.05 alpha so we reject the null hypothesis that the number of eggs produced by each hen between hatching and table eggs are the same.

The data used in this analysis was taken from the tidytuesday repository (TidyTuesday, 2023) and was originally sourced from the Open Science Framework project by Samara Mendez (Mendez, 2023). Each row in the dataset represents summary data for the month, reporting on the type of egg (table vs hatching), the production process (conventional, cage-free, organic), the number of hens, the number of eggs and the source of the data.


## Report

The final report can be found [here](https://ubc-mds.github.io/Egg-Production-Inferential-Test/egg_production_inferential_report.html).

## Usage  

#### Setup

1. [Install](https://www.docker.com/get-started/) 
and launch Docker on your computer.

2. Clone this GitHub repository.

#### Running the analysis

1. Navigate to the root of this project on your computer using the
   command line and enter the following command:

``` 
docker compose up
```

2. Then visit a web browser on your computer and type: http://localhost:8787
If it worked, then you should be at an RStudio Sign In page. To sign in, use the following credentials:

- *username: rstudio*

- *password: password*

3. To run the analysis,
open `notebooks/egg_production_inferential_report.qmd` in RStudio you just launched
and under the "Run" menu click "Restart R and Run All Chunks".

#### Clean up

1. To shut down the container and clean up the resources, 
type `Ctrl` + `C` in the terminal
where you launched the container, and then type `docker compose rm`

## Dependencies

- **R version 4.3.1** and R packages:
  - infer=1.0.5
  - tidyr=1.3.0
  - dplyr=1.1.2
  - readr=2.1.4
  - ggplot2=3.4.3
  - testthat=3.2.0
    
Here is a link to the full env https://github.com/UBC-MDS/DSCI_522_group12/blob/main/renv.lock  

## License

For all project code please refer to the [MIT license](https://opensource.org/license/mit/). Please refer to the LICENSE.md file for more details.

For the project report please refer to the [Creative Commons license](https://creativecommons.org/licenses/by-nc-nd/4.0/).

## References

- Mendez, S. (2023, April 9). *US Egg Production Data Set*. Open Science Framework. https://osf.io/z2gxn/

- TidyTuesday. (2023, April). *US Egg Production*. rfordatascience/tidytuesday. https://github.com/rfordatascience/tidytuesday/blob/master/data/2023/2023-04-11/readme.md


