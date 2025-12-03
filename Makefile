# BIOS611 Project Makefile
# Variables

REPORT = Report/social_media_analysis.html
RMD = Report/social_media_analysis.Rmd
RSCRIPT := $(shell command -v Rscript)
LATEX := $(shell command -v pdflatex)

.PHONY: all report report-html report-pdf clean run

all: report-html
report: report-html

# Knit R Markdown to HTML (with fallback when Rscript is unavailable)
report-html: $(REPORT_HTML)
$(REPORT_HTML): $(RMD)
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
  '    <p>After R is available, rerun <code>make clean report-html</code> to replace this placeholder with the real analysis output.</p>' \
  '  </body>' \
  '</html>' > $@
else
	$(RSCRIPT) -e "rmarkdown::render('$<', output_file='$@')"
endif

# Knit R Markdown to PDF (requires both Rscript and a LaTeX engine)
report-pdf: $(REPORT_PDF)
$(REPORT_PDF): $(RMD)
ifeq ($(RSCRIPT),)
	@echo "Rscript not found. Cannot render PDF. Install R or use the container image."
else ifeq ($(LATEX),)
	@echo "pdflatex not found. Install LaTeX (e.g., tinytex or TeX Live) or build inside the container."
else
	$(RSCRIPT) -e "rmarkdown::render('$<', output_file='$@', output_format='pdf_document')"
endif

clean:
	rm -f $(REPORT_HTML) $(REPORT_PDF)
	rm -rf Report/figure
	rm -rf Report/social_media_analysis_files

run:
	podman run -d -p 8787:8787 -v $$(pwd):/home/rstudio/project:Z bios611-project