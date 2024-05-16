FROM gradle:8.7-jdk21-alpine

RUN apk add git

RUN git clone https://github.com/spotbugs/spotbugs.git /src

RUN cd /src \
      && ./gradlew distTar

RUN mkdir /spotbugs \
      && tar --strip-components=1 -C /spotbugs -xf /src/spotbugs/build/distributions/*-SNAPSHOT.tgz \
      && chmod +x /spotbugs/bin/spotbugs

WORKDIR /app

ENTRYPOINT [ "/spotbugs/bin/spotbugs" ]
