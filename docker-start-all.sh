#!/bin/bash

# Build api containers
cd docker-elk && docker-compose build && cd ..
cd docker-mongo && docker-compose build && cd ..
cd docker-polly && docker-compose build && cd ..
cd docker-api && docker-compose build && cd ..

# Start all containers
cd docker-elk && docker-compose up -d && cd ..
cd docker-mongo && docker-compose up -d && cd ..
cd docker-polly && docker-compose up -d && cd ..
cd docker-api && docker-compose up -d && cd ..

