# registry.cn-shanghai.aliyuncs.com/wayneqll/ctphft
FROM centos:7

RUN yum install -y gcc gcc-c++ \
                  libtool libtool-ltdl \
                  make git librdkafka-devel \
                  wget unzip tar

RUN mkdir -p /data/CTPHFT

WORKDIR /data/CTPHFT

RUN wget https://github.com/Kitware/CMake/releases/download/v3.18.1/cmake-3.18.1-Linux-x86_64.tar.gz \
&& tar -xzvf cmake-3.18.1-Linux-x86_64.tar.gz \
&& rm -f cmake-3.18.1-Linux-x86_64.tar.gz

ENV PATH /data/CTPHFT/cmake-3.18.1-Linux-x86_64/bin:$PATH

RUN wget https://github.com/edenhill/librdkafka/archive/v1.5.0.zip \
&& unzip v1.5.0.zip \
&& cd librdkafka-1.5.0 \
&& ./configure \
&& make \
&& make install \
&& rm -f v1.5.0.zip

RUN wget https://github.com/catchorg/Catch2/archive/v2.13.0.zip \
&& unzip v2.13.0.zip \
&& cd Catch2-2.13.0 \
&& mkdir build \
&& cd build \
&& cmake .. \
&& make \
&& make install \
&& rm -f v2.13.0.zip
