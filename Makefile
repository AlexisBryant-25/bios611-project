# ───────────── BIOS611 Project Makefile ─────────────
# Variables
REPORT = Report/final_report.docx
RMD = SRC/analysis.Rmd

# Default target
all: $(REPORT)

# Knit R Markdown to Word
$(REPORT): $(RMD)
	Rscript -e "rmarkdown::render('$<', output_file='$@')"

# Clean up generated files
.PHONY: clean
clean:
	rm -f $(REPORT)
	rm -rf report/figures/*

# Run RStudio container (optional helper)
.PHONY: run
run:
	podman run -d -p 8787:8787 -v $$(pwd):/home/rstudio/project:Z bios611-project


