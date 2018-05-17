FROM ubuntu:17.10

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
    cmake .. -DGMX_BUILD_OWN_FFTW=ON -DREGRESSIONTEST_DOWNLOAD=ON && \
    make -j$(nproc) && \
    make install

# configure entrypoint.sh
RUN echo "#!/bin/bash"                    >> /entrypoint.sh && \ 
    echo ". /usr/local/gromacs/bin/GMXRC" >> /entrypoint.sh && \
    echo "exec \$@"                       >> /entrypoint.sh && \
    chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]

CMD ["/bin/bash"]
