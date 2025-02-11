FROM ubuntu:22.04

RUN apt update && apt install -y zstd wget unzip


# Host side software
RUN mkdir /app && cd /app \
    && wget https://github.com/Matheus-Garbelini/braktooth_esp32_bluetooth_classic_attacks/releases/download/v1.2.0/wdissector_x86_64.tar.zst
RUN apt install -y sudo
RUN cd /app \
    && tar -xf wdissector_x86_64.tar.zst
RUN cd /app/wdissector && ./requirements.sh

# Not strictly needed. If it fails, feel free to comment this line out.
# this just speeds up the first run of the bt_fuzzer
RUN cd /app/wdissector && bin/bt_fuzzer --list-exploits || bin/bt_fuzzer --list-exploits || true


# Firmware loader, etc
RUN apt install -y unzip python3-dev python3-venv
RUN mkdir /app/firmware \
    && wget https://github.com/Matheus-Garbelini/braktooth_esp32_bluetooth_classic_attacks/releases/download/v1.2.0/esp32driver.zip -O /app/firmware/esp32driver.zip
RUN cd /app/firmware \
    && unzip esp32driver.zip \
    && cd release \
    && python3 firmware.py
    #&& python3 firmware.py flash /dev/ttyUSB1


# Commands must be run from here,
# e.g. bin/bt_fuzzer
WORKDIR /app/wdissector

# Best way we can get the data out, probably
RUN rm -rf /app/wdissector/logs && ln -s /work /app/wdissector/logs


ENTRYPOINT [ "/bin/bash" ]
