#!/bin/sh

echo "Checking if the output directory exists"
if [ ! -d "output" ]; then
  echo "Creating output directory"
  mkdir -pv output
fi

echo "Getting latest version of Amazon Linux 2023"
curl -sOL https://cdn.amazonlinux.com/al2023/os-images/latest/kvm-arm64/SHA256SUMS
file=`cat SHA256SUMS | awk '{print $2}'`

echo "Checking if the image is already downloaded"
if ! [ -f $file ]; then
  echo "Downloading latest image ($file)"
  curl -OL --progress-bar  https://cdn.amazonlinux.com/al2023/os-images/latest/kvm-arm64/$file
fi

echo "Checking the integrity of the downloaded image"
if [ "$(uname)" == "Darwin" ]; then
  shasum -a 256 -c SHA256SUMS
elif [ "$(expr substr $(uname -s) 1 5)" == "Linux" ]; then
  sha256sum -c SHA256SUMS
fi

echo "Converting the image to VMDK format"
qemu-img convert -f qcow2 -O vmdk $file output/"${file%.qcow2}.vmdk"

echo "Image downloaded and converted to VMDK format"

echo "Cleaning up"
rm *.qcow2
rm SHA256SUMS
