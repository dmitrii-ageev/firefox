FROM ubuntu:trusty
MAINTAINER Dmitrii Ageev <d.ageev@gmail.com>

# Set environment
ENV APPLICATION "firefox"
ENV EXECUTABLE "/usr/bin/firefox"

# Install software package
RUN apt update
RUN apt install --no-install-recommends -t trusty-updates -y \
    firefox \
    firefox-locale-en \
    firefox-mozsymbols \
    libcanberra-gtk3-module \
    packagekit-gtk3-module \
    hunspell-ru \
    hunspell-en-us \
    pulseaudio-utils \
    sudo

# Copy scripts and pulse audio settings
COPY files/wrapper /sbin/wrapper
COPY files/entrypoint.sh /sbin/entrypoint.sh
COPY files/pulse-client.conf /etc/pulse/client.conf

# Copy hosts file
COPY files/hosts /etc/hosts

# Proceed to the entry point
ENTRYPOINT ["/sbin/entrypoint.sh"]
