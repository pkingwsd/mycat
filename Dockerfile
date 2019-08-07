FROM nvidia/cuda:10.0-cudnn7-runtime-ubuntu18.04


	
RUN  apt-get update \
    && wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.asc.gpg \
    && mv microsoft.asc.gpg /etc/apt/trusted.gpg.d/ \
    && wget -q https://packages.microsoft.com/config/ubuntu/18.04/prod.list \
	&& mv prod.list /etc/apt/sources.list.d/microsoft-prod.list\
    && chown root:root /etc/apt/trusted.gpg.d/microsoft.asc.gpg \
    && chown root:root /etc/apt/sources.list.d/microsoft-prod.list \
    && apt-get install apt-transport-https\
    && apt-get update\
    && apt-get install curl icu-devtools nano mc  wget gpg  aspnetcore-runtime-2.2
