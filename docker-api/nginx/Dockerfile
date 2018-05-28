###############################################################
# This Dockerfile will build the container NODEJS
###############################################################

FROM nginx:latest

LABEL Quentin Tshaimanga

COPY ./config/nginx.conf /etc/nginx/nginx.conf
COPY ./sites-enabled/ /etc/nginx/conf.d/
