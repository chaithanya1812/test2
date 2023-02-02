#!/bin/bash
docker rm -f chaitu chaitu1
docker rmi test
docker build -t test .
docker run -d --name chaitu -p 8091:8080 test
docker run -d --name chaitu1 -p 8092:8080 test


