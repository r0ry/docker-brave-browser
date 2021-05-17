#!/bin/bash

sudo docker buid . -t brave:v1
for ((i=1; i<=$1; i=i+1))
do 
    echo "Instance number : " $i
    sudo docker run -d --rm -it --privileged --env DISPLAY=unix$DISPLAY -v $XAUTH:/root/.Xauthority -v /tmp/.X11-unix:/tmp/.X11-unix -p 500$i:500$i brave:v1
done
