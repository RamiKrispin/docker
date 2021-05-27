#!/usr/bin/env bash

echo "Build the docker"

if [[ $1 = "" ]] ; then
  echo "No major argument, using default setting"
  major=4
else
  major=$1
fi

if [[ $2 = "" ]] ; then
  echo "No minor argument, using default setting"
  minor=0
else
  minor=$2
fi


if [[ $3 = "" ]] ; then
  echo "No patch argument, using default setting"
  patch=0
else
  patch=$3
fi

if [[ $4 = "" ]] ; then
  echo "No image argument, using default setting"
  image=ubuntu:18.04
else
  image=$4
fi

if [[ $5 = "" ]] ; then
  echo "No rstudio version argument, using default setting"
  rstudio_ver=1.4.1106
else
  rstudio_ver=$5
fi

echo "R version is set to $major.$minor.$patch"
echo "Using $image"

docker build  --build-arg IMAGE=$image --build-arg R_VERSION_MAJOR=$major --build-arg R_VERSION_MINOR=$minor --build-arg R_VERSION_PATCH=$patch ./base-r -t rkrispin/baser:v$major.$minor.$patch

if [[ $? = 0 ]] ; then
    echo "Pushing docker..."
    docker push rkrispin/baser:v$major.$minor.$patch
    echo "Building the RStudio docker..."
    docker build --build-arg IMAGE=rkrispin/baser:v$major.$minor.$patch  --build-arg RSTUDIO_VERSION=$rstudio_ver ./rstudio -t rkrispin/rstudio:v$major.$minor.$patch
    if [[ $? = 0 ]] ; then
        docker push rkrispin/rstudio:v$major.$minor.$patch
    else
        echo "RStudio Docker build failed"
    fi  
else
    echo "Docker build failed"
fi
