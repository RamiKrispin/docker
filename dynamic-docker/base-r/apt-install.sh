#!/usr/bin/env bash

# Install dependencies
apt-get update && apt-get install -y --no-install-recommends \
        r-base-core\
        r-base\
        r-base-dev \
        libpangocairo-1.0-0 \
        libpango-1.0-0 \
        apt-utils\
        gfortran \
        git \
        g++ \
        psmisc \
        procps \
        python-setuptools \
        libreadline-dev \
        libblas-dev \
        liblapack-dev \
        libncurses5-dev \
        libpango1.0-dev \
        libpcre3-dev \
        libxt-dev \
        libpng-dev \
        libjpeg-dev \
        libcairo2-dev \
        libcurl4-openssl-dev \
        libssl-dev \
        libxml2-dev \
        libudunits2-dev \
        libgdal-dev \
        libbz2-dev \
        libzstd-dev \
        liblzma-dev \
        libpcre2-dev \
        libtiff5-dev \
        libx11-dev \
        locales \
        openjdk-8-jdk \
        screen \
        texinfo \
        texlive \
        texlive-fonts-extra \
        vim \
        wget \
        xvfb \
        tzdata \
        sudo\
        jq\
        curl\
        file \
        libapparmor1 \
        libclang-dev \
        libedit2 \
        lsb-release \
        multiarch-support \
        python-setuptools \
        xorg-dev \
    && rm -rf /var/lib/apt/lists/*

apt-get update && apt-get install -y --no-install-recommends \
        libgit2-dev \
        libmagick++-dev \
    && rm -rf /var/lib/apt/lists/*

# Get most recent version of git
apt-get update && \
        apt-get -y install sudo
sudo apt-get install software-properties-common -y
sudo add-apt-repository ppa:git-core/ppa && \
        sudo apt-get update -y && \
        sudo apt-get install git -y
