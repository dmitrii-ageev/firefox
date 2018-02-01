FROM ubuntu:14.04
MAINTAINER Dmitrii Ageev <d.ageev@gmail.com>

# Set environment variables
ENV UNAME developer
ENV DEBIAN_FRONTEND noninteractive

# Create a user and add it to audio group
RUN groupadd -g 1000 $UNAME
RUN useradd -u 1000 -g 1000 -G audio -m $UNAME

# Install software package
RUN apt update
RUN apt install -y firefox firefox-locale-en pulseaudio-utils 
RUN apt install -y chromium-codecs-ffmpeg-extra chromium-codecs-ffmpeg
RUN mv -f /usr/lib/chromium-browser/* /usr/lib/

# Copy pulse audio settings
COPY files/pulse-client.conf /etc/pulse/client.conf

# Copy hosts file
COPY files/hosts /etc/hosts

# Run a software piece as non-root user
USER $UNAME
CMD /usr/bin/firefox
