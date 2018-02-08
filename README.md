# firefox
Docker container to run Firefox - Free Web Browser

# Usage

The wrapper scripts volume mount the X11 and pulseaudio sockets in the launcher container. The X11 socket allows for the user interface display on the host, while the pulseaudio socket allows for the audio output to be rendered on the host.

When the image is launched the following directories are mounted as volumes

    Container		Host
--------------------------------------------
    ${HOME}/.firefox	~/.firefox
    ${HOME}/.config	~/.firefox/.config
    ${HOME}/.local	~/.firefox/.local
    ${HOME}/.pki	~/.firefox/.pki
    ${HOME}/Downloads	~/Downloads

This makes sure that your profile details are stored on the host and files received are available on your host in the appropriate download directory.

To launch Firefox in a container use the wrapper script. For example, after installation firefox command will launch Firefox inside a Docker container regardless of whether it is installed on the host or not.


# Installation

With the image locally available, install the wrapper scripts using:

```
docker run -it --rm --volume ~/bin/:/target dmitriiageev/firefox install
```

This will install a wrapper script to launch firefox.


# Uninstallation

```
docker run -it --rm --volume ~/bin:/target dmitriiageev/firefox uninstall
```

# Note
This docker image supports audio playback with PULSEAUDIO through a runtime dir mount.

GitHub Page: https://github.com/dmitrii-ageev/firefox
Docker Hub Page: https://hub.docker.com/r/dmitriiageev/firefox
