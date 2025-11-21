# =========================================================
# BIOS 611 Makefile
# =========================================================

R = Rscript
REPORT = Clustering_HW.Rmd
OUTPUT = Clustering_HW.pdf

# Default target: do everything
all: setup knit

# ---------------------------------------------------------
#  Install required R packages
# ---------------------------------------------------------
setup:
	@echo " Installing required R packages..."
	$(R) -e "packages <- c('tidyverse','cluster','factoextra','rmarkdown','kernlab','ggplot2'); \
			  installed <- packages %in% installed.packages()[,'Package']; \
			  if(any(!installed)) install.packages(packages[!installed], repos='https://cloud.r-project.org')"

# ---------------------------------------------------------
# Knit to PDF
# ---------------------------------------------------------
knit:
	@echo "Rendering $(REPORT) to $(OUTPUT)..."
	$(R) -e "rmarkdown::render('$(REPORT)', output_file='$(OUTPUT)')"


clean:
	@echo " Cleaning up..."
	rm -f $(OUTPUT)

.PHONY: all setup knit clean

