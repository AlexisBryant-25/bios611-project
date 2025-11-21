# BIOS611 Project Makefile
# Variables
REPORT = Report/social_media_analysis.html
RMD = Report/social_media_analysis.Rmd
RSCRIPT := $(shell command -v Rscript)

.PHONY: all
all: $(REPORT)

# Knit R Markdown to HTML (with fallback when Rscript is unavailable)
$(REPORT): $(RMD)
ifeq ($(RSCRIPT),)
	@echo "Rscript not found. Skipping render and writing a placeholder report to $@."
	@echo "See README.md for options to install R locally or use the containerized RStudio setup."
	@printf '%s\n' \
	  '<!doctype html>' \
	  '<html>' \
	  '  <body>' \
	  '    <h1>social_media_analysis</h1>' \
	  '    <p><strong>Render skipped:</strong> Rscript was not available in this environment, so the full report could not be knitted.</p>' \
	  '    <p>To generate the complete HTML, install R with the <code>rmarkdown</code> package or run <code>make all</code> inside the provided container image.</p>' \
	  '    <p>After R is available, rerun <code>make clean all</code> to replace this placeholder with the real analysis output.</p>' \
	  '  </body>' \
	  '</html>' > $@
else
	$(RSCRIPT) -e "rmarkdown::render('$<', output_file='$@')"
endif

# Clean up generated files
.PHONY: clean
clean:
	rm -f $(REPORT)
	rm -rf Report/figure
	rm -rf Report/social_media_analysis_files

# Run RStudio container (optional helper)
.PHONY: run
run:
	podman run -d -p 8787:8787 -v $$(pwd):/home/rstudio/project:Z bios611-project
