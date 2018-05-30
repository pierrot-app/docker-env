#!/bin/bash

# Build api containers
echo "Start build all containers"
cd docker-elk && docker-compose build && cd ..
cd docker-mongo && docker-compose build && cd ..
cd docker-polly && docker-compose build && cd ..
cd docker-api && docker-compose build && cd ..
echo "Containers builded"

# Start all containers
echo "Start all containers"
cd docker-elk && docker-compose up -d && \
cd ../docker-mongo && docker-compose up -d && \
cd ../docker-polly && docker-compose up -d && \

# Sleep 60s before starting NGINX and connect all containers
echo "Wait for microservices connections (more or less 1 minutes) !"
sleep 90;
echo "ALl microservices are connected !"

echo "Start API middleware"
cd ../docker-api && docker-compose up -d && cd ..
echo "Containers started, let's play !"

