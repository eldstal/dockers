FROM python:3.11-alpine
RUN apk update \
    && apk add --no-cache python3 py3-pip py3-requests \
                       git \
    && git clone https://github.com/punk-security/dnsReaper.git /opt/dnsreaper \
    && cd /opt/dnsreaper \
    && git checkout tags/1.9.4 \
    && pip3 install -r requirements.txt

WORKDIR /app

ENTRYPOINT ["python3", "/opt/dnsreaper/main.py"]
