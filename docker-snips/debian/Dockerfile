###############################################################
# This Dockerfile will build the container DEBIAN with SNIPS
###############################################################

FROM debian:jessie

LABEL Quentin Tshaimanga

ENV DEBIAN_FRONTEND noninteractive

# Copy Allo project
COPY ./allo /snips/allo
WORKDIR /snips

# Update and install Utils
RUN apt-get update &&\
    apt-get install -y apt-utils
    
# Install systemd-sysv
RUN apt install -y systemd-sysv

# Install lsb-release
RUN apt-get install -y lsb-release

# HTTP transport
RUN apt-get install -y apt-transport-https

# Install aplay cmd
RUN apt-get install -y alsa-utils

# Install Snips Platform
RUN apt-get install -y dirmngr
RUN bash -c  'echo "deb https://debian.snips.ai/$(lsb_release -cs) stable main" > /etc/apt/sources.list.d/snips.list'
# RUN apt-key adv --keyserver pgp.mit.edu --recv-keys F727C778CCB0A455
RUN apt-key adv --keyserver pgp.mit.edu --recv-keys D4F50CDCA10A2849
RUN apt-get update
RUN apt-get install -y --force-yes snips-platform-voice

# Install snips demo
RUN apt-get install -y --force-yes snips-platform-demo

# Install mosquitto
RUN apt-get install -y libc-ares2 libmosquitto1 libwrap0 tcpd mosquitto mosquitto-clients

# Install de Python 3
RUN apt-get install -y python3-pip
RUN pip3 install paho-mqtt python-etcd

# Install Allo project
# RUN pip3 install -r ./allo/requirements.txt

# Update before running
RUN apt-get -y update && apt-get -y upgrade

# Start Allo project
# RUN python ./allo/main.py

# Test Snips
# RUN mosquitto_pub -h ip -t test -m "hello world"
# ARG IP=127.0.0.1
# RUN mosquitto_pub -h $IP -t 'hermes/dialogueManager/startSession' -m '{"init":{"type":"notification","text":"Hello world"}}'