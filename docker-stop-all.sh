#!/bin/bash

# Stop all containers
docker stop $(docker ps -a -q)
echo All containers or images are destroyed ! see you soon !
