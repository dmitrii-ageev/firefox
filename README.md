# firefox
Docker container to run Firefox - Free Web Browser

# Usage
```
docker run -d --rm --name firefox \
       --net="host" \
       -e DISPLAY=$DISPLAY \
       -v /tmp/.X11-unix:/tmp/.X11-unix \
       -v /etc/machine-id:/etc/machine-id \
       -v /dev/snd:/dev/snd \
       -v $XDG_RUNTIME_DIR/pulse:$XDG_RUNTIME_DIR/pulse \
       -v $HOME/.cache:/home/developer/.cache \
       -v $HOME/.mozilla:/home/developer/.mozilla \
       -v $HOME/Downloads:/home/developer/Downlods \
       dmitriiageev/firefox

```

GitHub Page: https://github.com/dmitrii-ageev/firefox
Docker Hub Page: https://hub.docker.com/r/dmitriiageev/firefox

# Note
The image supports audio playback with two methods: ALSA (through /dev/snd hardware access) and PULSEAUDIO with a runtime dir mount.

