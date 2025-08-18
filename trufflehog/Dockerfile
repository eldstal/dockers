FROM golang:1.24-alpine
RUN apk --no-cache add ca-certificates git

RUN git clone https://github.com/trufflesecurity/trufflehog /opt/trufflehog
RUN cd /opt/trufflehog \
    && go install

WORKDIR /app
ENTRYPOINT ["trufflehog"]
