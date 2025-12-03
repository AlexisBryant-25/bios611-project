# BIOS 611 Final Project

### Description
This project analyzes student social media addiction data using clustering and regression methods taught in BIOS 611.
It builds a reproducible R environment with RStudio using Podman and includes a Makefile for automation.

<img width="267" height="148" alt="image" src="https://github.com/user-attachments/assets/3b30aa88-0982-4469-8bb7-30fb8456b855" />


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

