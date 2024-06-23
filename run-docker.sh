#!/bin/bash

mkdir -pv output

echo "Building docker image"
docker build . -t al2023-downloader:latest
echo "Running docker container"
docker run --rm -v $(pwd)/output:/output al2023-downloader:latest
echo "Cleaning up the docker image"
docker image rm al2023-downloader:latest
