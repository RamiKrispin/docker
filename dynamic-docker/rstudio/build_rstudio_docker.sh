#!/usr/bin/env bash
echo "Build the docker"

if [[ $# -eq 1 ]] ; then
  echo "No rstudio version and version arguments, using default setting"
  rstudio=1.4.1106
  tag=default
  docker build --build-arg RSTUDIO_VERSION=$rstudio . -t docker.apple.com/rkrispin/lh_rstudio:$tag
else
  rstudio=$1
  tag=$2
  docker build --build-arg RSTUDIO_VERSION=$rstudio . -t docker.apple.com/rkrispin/lh_rstudio:$tag
fi



if [[ $? = 0 ]] ; then
    echo "Pushing docker..."
    docker push docker.apple.com/rkrispin/lh_rstudio:$tag
else
    echo "Docker build failed"
fi
