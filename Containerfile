

FROM rocker/rstudio:4.3.2


LABEL maintainer="Alexis Bryant <albry@unc.edu>"
LABEL description="BIOS611 project environment with RStudio"


RUN apt-get update -qq && apt-get install -y \
    libxml2-dev libssl-dev libcurl4-openssl-dev libxt-dev libpng-dev libjpeg-dev \
    texlive-latex-base texlive-latex-recommended texlive-fonts-recommended texlive-latex-extra && \
    R -e "install.packages(c('tidyverse','caret','glmnet','cluster','factoextra','rmarkdown','knitr','GGally','patchwork','plotly','viridis','gridExtra'))" && \
    apt-get clean


WORKDIR /home/rstudio/project


COPY . /home/rstudio/project

RUN chown -R rstudio:rstudio /home/rstudio/project


EXPOSE 8787


CMD ["/init"]

