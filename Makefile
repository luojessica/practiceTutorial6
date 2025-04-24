# .PHONY all

all:
	mkdir -p data
	mkdir -p output
	Rscript R/01_load_data.R
	Rscript R/02_methods.R
	Rscript R/03_model.R
	Rscript R/04_results.R

clean:
	rm -rf data
	rm -rf output
