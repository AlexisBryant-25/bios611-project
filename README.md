
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

# 4. Knit the report
make all
```

Environment fully defined in Containerfile
Automated builds with Makefile
Primary analysis in src/analysis.Rmd
Figures in report/figures/
Data in /data/
