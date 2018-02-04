#!/bin/bash
docker run -d --rm --name firefox -h docker \
       --cpuset-cpus 0 --memory 2048mb --net host \
       -e DISPLAY=$DISPLAY \
       --device="/dev/snd:/dev/snd" \
       --device="/dev/dri:/dev/dri" \
       --device="/dev/video0:/dev/video0" \
       -v /etc/machine-id:/etc/machine-id \
       -v /dev/shm:/dev/shm \
       -v /tmp/.X11-unix:/tmp/.X11-unix \
       -v $XDG_RUNTIME_DIR/pulse:$XDG_RUNTIME_DIR/pulse \
       -v $HOME/.cache/mozilla:/home/developer/.cache/mozilla \
       -v $HOME/.mozilla:/home/developer/.mozilla \
       -v $HOME/Downloads:/home/developer/Downloads \
       dmitriiageev/firefox
