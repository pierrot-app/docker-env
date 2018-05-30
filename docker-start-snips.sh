#!/bin/bash

# Build snips containers
echo "Start build snips containers"
cd docker-snips && docker-compose build
echo "Container builded"

# Sleep 60s before SNIPS
echo "Wait during SNIPS install (more or less 1 minutes) !"
sleep 90;

# Start all containers
cd docker-snips && docker-compose up -d && cd ..
echo "SNIPS connected !"
