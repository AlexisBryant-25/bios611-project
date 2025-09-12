FROM rocker/verse:latest

RUN apt-get update && \
    yes | unminimize && \
    apt-get install -y man-db && \
    rm -rf /var/lib/apt/lists/*

