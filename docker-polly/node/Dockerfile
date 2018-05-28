###############################################################
# This Dockerfile will build the container NODEJS
###############################################################

FROM node:latest

LABEL Quentin Tshaimanga
ARG NODE_ENV

RUN mkdir /var/www
COPY ./express /var/www/express

WORKDIR /var/www/express/app

# Install nodemon
RUN npm install -g nodemon

# Install pm2
RUN npm install pm2 -g

# Run install and run project
RUN npm install

# RUN npm run $NODE_ENV
RUN pm2 start ./index.js --name app --watch --env $NODE_ENV