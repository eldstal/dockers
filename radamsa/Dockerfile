FROM alpine:3.19

RUN apk add --no-cache curl gcc make git build-base

RUN cd /opt \
    && git clone https://gitlab.com/akihe/radamsa.git \
    && cd radamsa \
    && make \
    && make install

ENTRYPOINT [ "radamsa" ]
