FROM debian:jessie

MAINTAINER Zheng Hao Tan <tanzhao@umich.edu>

RUN apt-get update \
	&& apt-get upgrade -y \
	&& apt-get install -y unzip wget vim build-essential \
		cmake git pkg-config libswscale-dev \
		python3-dev python3-numpy \
		libtbb2 libtbb-dev libjpeg-dev \
		libpng-dev libtiff-dev libjasper-dev

RUN cd \
	&& wget https://github.com/Itseez/opencv/archive/3.2.0.zip \
	&& unzip 3.2.0.zip \
	&& cd opencv-3.2.0 \
	&& mkdir build \
	&& cd build \
	&& cmake .. \
	&& make -j4 \
	&& make install \
	&& cd \
	&& rm 3.2.0.zip