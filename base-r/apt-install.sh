#!/usr/bin/env bash

# Install dependencies
apt-get update && apt-get install -y --no-install-recommends \
        apt-utils\
        gfortran \
        git \
        g++ \
        psmisc \
        procps \
        python-setuptools \
        libreadline-dev \
        libx11-dev \
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
    && rm -rf /var/lib/apt/lists/*

apt-get update && apt-get install -y --no-install-recommends \
        libgit2-dev \
        libmagick++-dev \
    && rm -rf /var/lib/apt/lists/*