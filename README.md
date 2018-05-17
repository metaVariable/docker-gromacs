# docker for gromacs

> Note: if `gmx` command not found, please exec `. /usr/local/gromacs/bin/GMXRC` to configure the PATH.

## gromacs 5.1.4

- Dockerfile: [gromacs-5.1.4/Dockerfile](gromacs-5.1.4/Dockerfile)

```sh
# build
cd gromacs-5.1.4
docker build . -t gromacs:5.1.4
```

```sh
# show version
docker run -it --rm gromacs:5.1.4 gmx --version

# shell
docker run -it --rm gromacs:5.1.4 /bin/bash

# run regressiontests
docker run -it --rm gromacs:5.1.4 /opt/gromacs-5.1.4/build/tests/regressiontests-5.1.4/gmxtest.pl all
```

## gromacs 5.1.4-cuda8

- Dockerfile: [gromacs-5.1.4-cuda8/Dockerfile](gromacs-5.1.4-cuda8/Dockerfile)
- requirement: [nvidia-docker](https://github.com/NVIDIA/nvidia-docker)

```sh
# build
cd gromacs-5.1.4-cuda8
docker build . -t gromacs:5.1.4-cuda8
```

```sh
# show version
docker run -it --rm --runtime=nvidia gromacs:5.1.4-cuda8 gmx --version

# shell
docker run -it --rm --runtime=nvidia gromacs:5.1.4-cuda8 /bin/bash

# run regressiontests
docker run -it --rm --runtime=nvidia gromacs:5.1.4-cuda8 \
       /opt/gromacs-5.1.4/build/tests/regressiontests-5.1.4/gmxtest.pl all
```


