
# Use the official RStudio base image for ARM/M1 or x86
FROM rocker/rstudio:4.3.2

# Metadata
LABEL maintainer="Alexis Bryant <albry@unc.edu>"
LABEL description="BIOS611 project environment with RStudio"

# Install system libraries and R packages
RUN apt-get update -qq && apt-get install -y \
    libxml2-dev libssl-dev libcurl4-openssl-dev libxt-dev libpng-dev libjpeg-dev \
    texlive-latex-base texlive-latex-recommended texlive-fonts-recommended texlive-latex-extra && \
    R -e "install.packages(c('tidyverse','caret','glmnet','cluster','factoextra','rmarkdown','knitr','GGally','patchwork','plotly','viridis','gridExtra'))" && \
    apt-get clean

# Set working directory in the container
WORKDIR /home/rstudio/project

# Copy everything from your repo into the container
COPY . /home/rstudio/project

# Set permissions so RStudio user can write
RUN chown -R rstudio:rstudio /home/rstudio/project

# Expose RStudio port
EXPOSE 8787

# Default command
CMD ["/init"]

