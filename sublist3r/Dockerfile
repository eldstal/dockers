FROM python:3.4-alpine3.8

RUN apk add git

RUN mkdir /opt/ \
    && cd /opt \
    && git clone https://github.com/aboul3la/Sublist3r.git \
    && cd Sublist3r \
    && python -m pip install -r requirements.txt

WORKDIR /app

ENTRYPOINT [ "python", "/opt/Sublist3r/sublist3r.py" ]
