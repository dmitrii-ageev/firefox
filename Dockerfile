FROM debian:sid
MAINTAINER Dmitrii Ageev <d.ageev@gmail.com>

# Set environment variables
ENV UNAME developer
ENV DEBIAN_FRONTEND noninteractive

# Install software package
RUN apt update
RUN apt dist-upgrade -y
RUN apt install -y firefox firefox-l10n-en-gb libcanberra-gtk3-module packagekit-gtk3-module hunspell-en-gb pulseaudio-utils

# Copy pulse audio settings
COPY files/pulse-client.conf /etc/pulse/client.conf

# Copy hosts file
COPY files/hosts /etc/hosts

# Create a user and add it to audio group
RUN groupadd -g 1000 $UNAME
RUN useradd -u 1000 -g 1000 -G audio,video -m $UNAME

# Run a software piece as non-root user
USER $UNAME
CMD /usr/bin/firefox
