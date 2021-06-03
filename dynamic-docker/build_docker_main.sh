#!/usr/bin/env bash
# Arguments:
# 1 R version major
# 2 R version minor
# 3 R version patch
# 4 base image
# 5 RStudio version
# 6 Docker Hub user name

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

if [[ $6 = "" ]] ; then
  echo "The user name argument is missing, tagging the images without pusing them to Docker Hub"
  tag_base=baser:v$major.$minor.$patch
  tag_rstudio=rstudio:v$major.$minor.$patch

else
 tag_base=$6/baser:v$major.$minor.$patch
 tag_rstudio=$6/rstudio:v$major.$minor.$patch
fi

echo "------------------------------------------"
echo "R version is set to $major.$minor.$patch"
echo "RStudio version is set to $rstudio_ver"
echo "Using $image"
echo "Base R tag: $tag_base"
echo "RStudio tag: $tag_rstudio"
echo "------------------------------------------"
echo
echo "Starting to build the base-R image"

docker build  --build-arg IMAGE=$image --build-arg R_VERSION_MAJOR=$major --build-arg R_VERSION_MINOR=$minor --build-arg R_VERSION_PATCH=$patch ./base-r -t $tag_base

if [[ $? = 0 ]] ; then
  if [[ $6 != "" ]] ; then
    echo "Pushing docker..."
    docker push $tag_base
  fi

  echo "Building the RStudio docker..."
  docker build --build-arg IMAGE=$tag_base  --build-arg RSTUDIO_VERSION=$rstudio_ver ./rstudio -t $tag_rstudio
  if [[ $? = 0 ]] ; then
    if [[ $6 != "" ]] ; then
        docker push $tag_rstudio
    else
      echo "The RStudio docker was build but not pushed"
    fi
  else
    echo "RStudio Docker build failed"
  fi
else
    echo "Docker build failed"
fi
