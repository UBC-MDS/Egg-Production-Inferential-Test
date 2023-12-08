# Define default target
all: data/egg-production.csv results/summary_egg-production.csv results/hist_n_eggs.png \
     results/hist_n_hens.png results/bar_prod.png results/bar_prod_process.png \
     results/data_wrangling.csv results/data_wrangling2.csv results/test_stat.rds \
     results/null_distribution.csv results/null_dist_plot.png notebooks/egg_production_inferential_report.html

# Rule for reading in the data
data/egg-production.csv: R/importing.R
	Rscript R/importing.R data/egg-production.csv

# Rule for basic data summaries
results/summary_egg-production.csv: R/general_EDA.R data/egg-production.csv
	Rscript R/general_EDA.R results/egg-production.csv

# Rule for EDA - Number of Eggs Histogram
results/hist_n_eggs.png: R/create_histogram.R data/egg-production.csv
	Rscript R/create_histogram.R data/egg-production.csv n_eggs "number of eggs" results/hist_n_eggs.png

# Rule for EDA - Number of Hens Histogram
results/hist_n_hens.png: R/create_histogram.R data/egg-production.csv
	Rscript R/create_histogram.R data/egg-production.csv n_hens "number of hens" results/hist_n_hens.png

# Rule for EDA - Production Type Bar Plot
results/bar_prod.png: R/create_bar_plot.R data/egg-production.csv
	Rscript R/create_bar_plot.R data/egg-production.csv prod_type "Production type" results/bar_prod.png

# Rule for EDA - Production Process Bar Plot
results/bar_prod_process.png: R/create_bar_plot.R data/egg-production.csv
	Rscript R/create_bar_plot.R data/egg-production.csv prod_process "Production process" results/bar_prod_process.png

# Data Wrangling Steps
results/data_wrangling.csv: R/script_data_wrangling.R data/egg-production.csv
	Rscript R/script_data_wrangling.R data/egg-production.csv

results/data_wrangling2.csv: R/script_data_wrangling2.R data/egg-production.csv
	Rscript R/script_data_wrangling2.R data/egg-production.csv

# Calculate the test statistic
results/test_stat.rds: R/calc_test_stat.R results/data_wrangling.csv
	Rscript R/calc_test_stat.R results/data_wrangling.csv n_egg_by_hen

# Run permutation test and generate p-value
results/null_distribution.csv: R/permutation.R results/egg_prod.csv results/test_stat.rds
	Rscript R/permutation.R results/egg_prod.csv n_egg_by_hen prod_type 'table eggs,hatching eggs' results/test_stat.rds 522

# Generate the final visualization
results/null_dist_plot.png: R/scr_generate_null_dist_plot.R results/null_distribution.csv results/test_stat.rds
	Rscript R/scr_generate_null_dist_plot.R results/null_distribution.csv results/test_stat.rds 0.05

notebooks/egg_production_inferential_report.html: notebooks/egg_production_inferential_report.qmd
	quarto render $< --to html
	move egg_production_inferential_report.html notebooks/

# Clean-up rule
clean:
	rm -f results/summary_egg-production.csv
	rm -f results/hist_n_eggs.png
	rm -f results/hist_n_hens.png
	rm -f results/bar_prod.png
	rm -f results/bar_prod_process.png
	rm -f results/data_wrangling.csv
	rm -f results/data_wrangling2.csv
	rm -f results/test_stat.rds
	rm -f results/null_distribution.csv
	rm -f results/null_dist_plot.png
	rm -rf notebooks/egg_production_inferential_report.html
	rm -f results/egg_prod.csv
	rm -f results/head.rds
	rm -f results/nrow.rds
	rm -f results/p_value.rds
	rm -f results/results_viz.png
	rm -f results/str.rds
	rm -f results/summary.rds
	rm -f results/tail.rds


