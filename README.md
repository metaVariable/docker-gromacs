#docker for gromacs

## Usage

### gromacs 5.1.4

```sh
# build
cd gromacs-5.1.4
docker build . -t gromacs:5.1.4

# run
docker run -it gromacs:5.1.4 gmx --version

docker run -it gromacs:5.1.4 /bin/bash
```
