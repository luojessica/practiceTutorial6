# .PHONY all

all:
	Rscript R/01_load_data.R
	Rscript R/02_methods.R
	Rscript R/03_model.R
	Rscript R/04_results.R
