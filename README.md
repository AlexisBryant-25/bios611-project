# BIOS 611 Final Project

### Description
This project analyzes student social media addiction data using clustering and regression methods taught in BIOS 611.
It builds a reproducible R environment with RStudio using Podman and includes a Makefile for automation.

### Quick Start

```bash
# 1. Clone this repo
git clone https://github.com/AlexisBryant-25/bios611-project.git
cd bios611-project

# 2. Build the container
podman build -t bios611-project .

# 3. Run RStudio
podman run -d -p 8787:8787 -v $(pwd):/home/rstudio/project:Z bios611-project

# Then open http://localhost:8787 in your browser
# Login with: user = rstudio, password = rstudio

# 4. Knit the report (uses data in Data/students_social_media_addiction.csv)
make all
```

Environment fully defined in Containerfile
Automated builds with Makefile
Primary analysis in Report/social_media_analysis.Rmd
Output saved to Report/social_media_analysis.html
Data stored in Data/students_social_media_addiction.csv

**Note:** The Makefile now falls back to writing a placeholder HTML if `Rscript` is unavailable (as in some restricted CI environments). To produce the full report:

1. Install R plus the `rmarkdown` package locally **or** run the provided Podman image for an RStudio session.
2. Execute `make clean all` so the placeholder HTML is removed and the real report is knitted.
