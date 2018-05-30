###############################################################
# This Dockerfile will build the container DEBIAN with SNIPS
###############################################################

FROM debian:jessie

LABEL Quentin Tshaimanga

ENV DEBIAN_FRONTEND noninteractive

#INSTALL ALL
RUN apt-get update &&\
    apt-get install -y apt-utils
    

# Install OMYZSH
# RUN ["apt-get", "update"]
# RUN ["apt-get", "install", "-y", "zsh"]
# RUN wget https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | zsh || true

# Install systemd-sysv
RUN apt install -y systemd-sysv

# Install lsb-release
RUN apt-get install -y lsb-release

# HTTP transport
RUN apt-get install -y apt-transport-https

# get aplay cmd
RUN apt-get install -y alsa-utils

# 1. Configure network access: WIFI
# 2. Enable SSH
# 3. Install the Snips Platform
RUN apt-get install -y dirmngr
RUN bash -c  'echo "deb https://debian.snips.ai/$(lsb_release -cs) stable main" > /etc/apt/sources.list.d/snips.list'
RUN apt-key adv --keyserver pgp.mit.edu --recv-keys F727C778CCB0A455
RUN apt-get update
RUN apt-get install -y snips-platform-voice

#Install snips demo
RUN apt-get install snips-platform-demo

# cmd mqtt : adress + body{text}
RUN mqtt localhost:7756 {"hello wolrd !"}
