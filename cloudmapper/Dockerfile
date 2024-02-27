FROM python:3.8-slim as cloudmapper

LABEL maintainer="https://github.com/0xdabbad00/"
LABEL Project="https://github.com/duo-labs/cloudmapper"

EXPOSE 8000
WORKDIR /opt/cloudmapper
ENV AWS_DEFAULT_REGION=us-east-1 

RUN apt-get update -y
RUN apt-get install -y build-essential autoconf automake libtool python3-tk jq awscli git
RUN apt-get install -y bash

RUN git clone https://github.com/duo-labs/cloudmapper.git /opt/cloudmapper

RUN pip install -r requirements.txt

ENTRYPOINT [ "/opt/cloudmapper/cloudmapper.py" ]
