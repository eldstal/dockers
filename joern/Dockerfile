FROM alpine:3.17.3

# dependencies
RUN apk update && apk upgrade && apk add --no-cache openjdk17-jdk python3 git curl gnupg bash nss ncurses php
RUN ln -sf python3 /usr/bin/python

# sbt
ENV SBT_VERSION 1.8.0
ENV SBT_HOME /usr/local/sbt
ENV PATH ${PATH}:${SBT_HOME}/bin
RUN curl -sL "https://github.com/sbt/sbt/releases/download/v$SBT_VERSION/sbt-$SBT_VERSION.tgz" | gunzip | tar -x -C /usr/local

# building joern
RUN git clone https://github.com/joernio/joern && cd joern && sbt stage
RUN cd /joern && echo "" | ./querydb-install.sh
ENV PATH ${PATH}:/joern/

# Add graphical tools to visualize AST
COPY <<EOF /usr/share/applications/imv.desktop
[Desktop Entry]
Version=1.0
Name=Image Viewer
Exec=/usr/bin/imv %F
Terminal=false
Type=Application
EOF
RUN apk add --no-cache graphviz xdg-utils imv imv-x11 \
    && apk add --no-cache fontconfig font-liberation \
    && fc-cache -f \
    && xdg-mime default imv.desktop image/svg+xml

WORKDIR /joern


