FROM nvidia/cuda:10.0-cudnn7-runtime-ubuntu18.04

	
RUN  apt-get update \
    && apt-get install software-properties-common wget --no-install-recommends -y 
    && wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.asc.gpg \
    && mv microsoft.asc.gpg /etc/apt/trusted.gpg.d/ \
    && wget -q https://packages.microsoft.com/config/ubuntu/18.04/prod.list \
	&& mv prod.list /etc/apt/sources.list.d/microsoft-prod.list\
    && chown root:root /etc/apt/trusted.gpg.d/microsoft.asc.gpg \
    && chown root:root /etc/apt/sources.list.d/microsoft-prod.list \
    && apt-get install apt-transport-https\
    && apt-get update\
    && apt-get install --no-install-recommends -y libgtk2.0-dev pkg-config libavcodec-dev libavformat-dev libswscale-dev curl icu-devtools nano mc  wget gpg  aspnetcore-runtime-2.2  libjasper-dev libtbb2 libtbb-dev libjpeg-dev libpng-dev libtiff-dev libjasper-dev libdc1394-22-dev 
	

