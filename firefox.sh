#!/bin/bash
docker run -d --rm --name firefox -h docker \
       --cpuset-cpus 0 --memory 2048mb --net host \
       -e DISPLAY=$DISPLAY \
       -v /tmp/.X11-unix:/tmp/.X11-unix \
       -v /etc/machine-id:/etc/machine-id \
       -v /dev/snd:/dev/snd \
       -v $XDG_RUNTIME_DIR/pulse:$XDG_RUNTIME_DIR/pulse \
       -v $HOME/.cache:/home/developer/.cache \
       -v $HOME/.mozilla:/home/developer/.mozilla \
       -v $HOME/Downloads:/home/developer/Downlods \
       dmitriiageev/firefox
