# Creating a Dynamic Dockerized R Environment

The `build_docker_main.sh` **bash** script enables to create a dynamic dockerized R and RStudio environment by controlling the R version, base OS image (e.g., `Ubuntu 18.04`) and RStudio version. In **bash** the arguments are indexed, therefore they always must follow the same order as they were set. In this case the `build_docker_main.sh` arguments ordered as the following:

* `$1` - the major component of the R version (default value is `4`)
* `$2` - the minor component of the R version (default value is `0`)
* `$3` - the patch component of the R version (default value is `0`)
* `$4` - The Ubuntu image (by default `Ubuntu 18.04`)
* `$5` - The RStudio version (by default `1.4.1106`)
* `$6` - The docker hub user name, if not provided, the images won't be pushed to https://hub.docker.com/

**Note:** If you are skipping one or more of the arguments it may ended up with **wrong** output or result with error. For example, if you provide the first three argument, let's say `4`, `0`, and `3` for installing R `4.0.3`, skip the Ubuntu argument, and provides the Rstudio version as `1.4.1106` it will use the later as the Ubuntu image, and use the default for the RStudio version.


### Usage

The following example demonstrate how to create an RStudio env with R version 4.0.0:

``` bash
bash build_docker_main.sh 4 0 0 ubuntu:18.04 1.4.1106 rkrispin
```

<img src="figures/r400.gif" width="100%" />

This will tag the docker as `docker.io/rkrispin/rstudio:v4.0.0`

To launch the docker on port 8787 use the following:

``` bash
docker run -e DISABLE_AUTH=true \
-p 8787:8787 \
docker.io/rkrispin/rstudio:v4.0.0
```
<img src="figures/rstudio400.gif" width="100%" />
