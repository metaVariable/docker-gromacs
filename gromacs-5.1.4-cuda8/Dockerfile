FROM nvidia/cuda:8.0-devel

MAINTAINER metaVariable

ENV GROMACS_VERSION 5.1.4

RUN apt-get update -y && \
    apt-get install -y \
	build-essential \
	wget \
	cmake

RUN wget -P /tmp ftp://ftp.gromacs.org/pub/gromacs/gromacs-${GROMACS_VERSION}.tar.gz && \
    tar zxfv /tmp/gromacs-${GROMACS_VERSION}.tar.gz -C /opt

RUN mkdir -p /opt/gromacs-${GROMACS_VERSION}/build && \
    cd /opt/gromacs-${GROMACS_VERSION}/build && \
    cmake .. -DGMX_BUILD_OWN_FFTW=ON -DREGRESSIONTEST_DOWNLOAD=ON \
             -DGMX_GPU=ON -DCUDA_TOOLKIT_ROOT_DIR=/usr/local/cuda && \
    make -j$(nproc) && \
    make install

RUN echo "#!/bin/bash"                    >> /entrypoint.sh && \ 
    echo ". /usr/local/gromacs/bin/GMXRC" >> /entrypoint.sh && \
    echo "exec \$@"                       >> /entrypoint.sh && \
    chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]

CMD ["/bin/bash"]
