#!/bin/bash

PROJECT=$1

cd /home/rcw/katli

COMPOSE_PROJECT_NAME=$PROJECT docker-compose up -d
./deploy $PROJECT si
COMPOSE_PROJECT_NAME=$PROJECT docker-compose stop
