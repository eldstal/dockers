# Based heavily on https://github.com/j3ssie/codeql-docker

FROM ubuntu:22.04 AS codeql_base

# tzdata install needs to be non-interactive
ENV DEBIAN_FRONTEND=noninteractive

# create user, install/update basics and python
RUN apt-get update && \
	apt-get upgrade -y && \
	apt-get install -y --no-install-recommends \
	software-properties-common \
	nodejs \
	vim \
	curl \
	wget \
	git \
	build-essential \
	unzip \
	apt-transport-https \
	python3.10 \
	python3-venv \
	python3-pip \
	python3-setuptools \
	python3-dev \
	python-is-python3 \
	gnupg \
	g++ \
	make \
	gcc \
	apt-utils \
	rsync \
	file \
	dos2unix \
	gettext && \
	apt-get clean && \
	ln -sf /usr/bin/python3.8 /usr/bin/python && \
	ln -sf /usr/bin/pip3 /usr/bin/pip 

# Install Golang
RUN wget -q -O - https://raw.githubusercontent.com/canha/golang-tools-install-script/master/goinstall.sh | bash

# Install latest codeQL
ENV CODEQL_HOME /root/codeql-home

# Get CodeQL verion
RUN curl --silent "https://api.github.com/repos/github/codeql-cli-binaries/releases/latest" | grep '"tag_name":' | sed -E 's/.*"([^"]+)".*/\1/' > /tmp/codeql_version

# record the latest version of the codeql-cli
RUN mkdir -p ${CODEQL_HOME} \
	${CODEQL_HOME}/codeql-repo \
	${CODEQL_HOME}/codeql-go-repo \
	/opt/codeql

# get the latest codeql queries and record the HEAD
RUN git clone --depth=1 https://github.com/github/codeql ${CODEQL_HOME}/codeql-repo && \
	git --git-dir ${CODEQL_HOME}/codeql-repo/.git log --pretty=reference -1 > /opt/codeql/codeql-repo-last-commit

RUN CODEQL_VERSION=$(cat /tmp/codeql_version) && \
	wget -q https://github.com/github/codeql-cli-binaries/releases/download/${CODEQL_VERSION}/codeql-linux64.zip -O /tmp/codeql_linux.zip && \
	unzip /tmp/codeql_linux.zip -d ${CODEQL_HOME} && \
	rm /tmp/codeql_linux.zip

RUN git clone https://github.com/j3ssie/codeql-docker.git /root/codeql-docker
RUN cp -r /root/codeql-docker/scripts /root/scripts && chmod +x /root/scripts/*

ENV PATH="$PATH:${CODEQL_HOME}/codeql:/root/go/bin:/root/.go/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin"
#COPY scripts /root/scripts

# Pre-compile our queries to save time later
RUN /root/scripts/compile-qs.sh


# Additional deps
RUN apt-get update && \
	apt-get upgrade -y && \
	apt-get install -y --no-install-recommends \
	cmake


#
# Project-specific hacks to get your target to build in the container
#
WORKDIR /tmp

#RUN wget https://developer.download.nvidia.com/compute/cuda/repos/ubuntu2204/x86_64/cuda-ubuntu2204.pin && \
#    mv cuda-ubuntu2204.pin /etc/apt/preferences.d/cuda-repository-pin-600 && \
#    wget https://developer.download.nvidia.com/compute/cuda/13.0.2/local_installers/cuda-repo-ubuntu2204-13-0-local_13.0.2-580.95.05-1_amd64.deb && \
#    dpkg -i cuda-repo-ubuntu2204-13-0-local_13.0.2-580.95.05-1_amd64.deb && \
#    cp /var/cuda-repo-ubuntu2204-13-0-local/cuda-*-keyring.gpg /usr/share/keyrings/ && \
#    apt-get update && \
#    apt-get -y install cuda-toolkit-13-0
# 
#RUN wget https://www.nuget.org/api/v2/package/Microsoft.ML.OnnxRuntime/1.23.0 -O /tmp/onnxruntime.zip && \
#    mkdir /root/onnx && \
#    cd /root/onnx && \
#    unzip /tmp/onnxruntime.zip && \
#    cp runtimes/linux-x64/native/* /usr/lib/x86_64-linux-gnu/ && \
#    cp -r build/native/include/ /usr/include/onnxruntime




WORKDIR /root/
ENTRYPOINT ["/root/scripts/analyze.sh"]

