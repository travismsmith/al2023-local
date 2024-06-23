# Amazon Linux 2023 Local

## Description

Script for downloading and converting the latest Amazon Linux 2023 image
and converting it from qcow2 to vmdk.

## Running in docker

Run the `run.sh` script to download and convert the latest image using
the a docker image. The host OS must have docker installed.

## Running locally

Run the `download.sh` script to download and convert the latest image
using the host OS. The host OS must have qemu-img and curl installed.
