#!/bin/bash

mkdir -pv output

docker build . -t al2023-downloader:latest
docker run --rm -v $(pwd)/output:/output al2023-downloader:latest
docker image rm al2023-downloader:latest