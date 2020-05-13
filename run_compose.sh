#!/usr/bin/env bash
. ./images.dat
for ((i = 0; i < ${#IMAGES[@]}; i+=3)); do
  export ${IMAGES[i]}_version=${IMAGES[i+2]}
done

docker-compose up -d $*