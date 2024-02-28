FROM python:3.8-slim-buster

RUN apt-get update ; apt-get install -y graphviz git
RUN git clone https://github.com/nccgroup/PMapper.git /opt/pmapper \
    && pip install -r /opt/pmapper/requirements.txt \
    && pip install /opt/pmapper \
    && mkdir /storage

ENV PMAPPER_STORAGE /app/pmapper
WORKDIR /app

ENTRYPOINT [ "pmapper" ]

