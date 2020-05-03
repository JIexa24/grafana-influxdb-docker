#!/usr/bin/env bash
PREFIX=r9odt
. ./images.dat
for ((i = 0; i < ${#IMAGES[@]}; i+=3)); do
  docker build -t $PREFIX/${IMAGES[i]}:${IMAGES[i+2]} -t $PREFIX/${IMAGES[i]}:latest --build-arg IMAGE_VERSION=${IMAGES[i+1]} ./${IMAGES[i]}
done