# BIOS 611 Final Project

### Description
<<<<<<< ours
This project analyzes student social media addiction data using clustering and regression methods taught in BIOS 611.
It builds a reproducible R environment with RStudio using Podman and includes a Makefile for automation.

### Quick Start
=======
This project analyzes student social media addiction data using clustering and regression methods taught in BIOS 611. It provides a fully reproducible RStudio environment, a Makefile-driven workflow, and clear instructions for reproducing the report artifacts.
>>>>>>> theirs

### Quick Start (containerized RStudio)
```bash
# 1. Clone this repo
git clone https://github.com/AlexisBryant-25/bios611-project.git
cd bios611-project

# 2. Build the container (works with podman or docker)
podman build -t bios611-project .
# or
docker build -t bios611-project .

# 3. Run RStudio
docker run -d -p 8787:8787 -v $(pwd):/home/rstudio/project:Z --name bios611-project bios611-project
# or
podman run -d -p 8787:8787 -v $(pwd):/home/rstudio/project:Z --name bios611-project bios611-project

# 4. Open http://localhost:8787 in your browser
# Login with: user = rstudio, password = rstudio

<<<<<<< ours
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
=======
# 5. Build the report artifacts from the project root
make clean report-html      # knitted HTML
make report-pdf             # PDF (requires LaTeX; installed in the container)
```

### Data
- Primary dataset: `Data/students_social_media_addiction.csv` (bundled in the repo).
- The R Markdown file accepts a `params$data_path` argument if you want to point to an alternate CSV with the same schema.

### Report Artifacts
- Source: `Report/social_media_analysis.Rmd`
- HTML output: `Report/social_media_analysis.html`
- PDF output: `Report/social_media_analysis.pdf` (requires LaTeX; automatically available inside the provided container)

### Developer Notes
The project is organized via the Makefile:
- `make all` / `make report-html`: knit the HTML report (falls back to a placeholder if `Rscript` is missing).
- `make report-pdf`: knit the PDF report (requires both `Rscript` and LaTeX).
- `make clean`: remove generated report artifacts and figure folders.
- `make run`: launch the containerized RStudio session using the built image.

Environment:
- All required R packages and LaTeX dependencies are installed in the `Containerfile` so analyses and PDF knitting work out-of-the-box in the container.
- If running locally without the container, install R (4.3+) plus the packages listed in `Report/social_media_analysis.Rmd`; for PDF output install a LaTeX engine (e.g., `tinytex` or TeX Live).

### Reproducibility Checklist
1. `git clone https://github.com/AlexisBryant-25/bios611-project.git`
2. `docker build . -t bios611-project` (or `podman build ...`)
3. `docker run -d -p 8787:8787 -v $(pwd):/home/rstudio/project:Z bios611-project`
4. `make clean report-html` to generate the HTML report (or `make report-pdf` for PDF)

The container plus Makefile guarantee consistent behavior across environments while keeping build artifacts out of version control.
>>>>>>> theirs
