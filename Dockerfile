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
RUN apt install -y \
  curl \
  apt-transport-https \
  gconf-service \
  libasound2 \
  libatk1.0-0 \
  libcairo2 \
  libcups2 \
  libfontconfig1 \
  libgconf-2-4 \
  libgdk-pixbuf2.0-0 \
  libglib2.0-0 \
  libgt
RUN curl -L -o opera.deb "https://www.opera.com/download/get/?id=42785&amp;location=415&amp;nothanks=yes&amp;sub=marine"
RUN apt install -y ./opera.deb
RUN rm -f opera.deb
RUN apt install -y chromium-codecs-ffmpeg-extra
RUN mv -f /usr/lib/chromium-browser/* /usr/lib64/opera/

# Copy pulse audio settings
COPY files/pulse-client.conf /etc/pulse/client.conf

# Copy hosts file
COPY files/hosts /etc/hosts

# Run a software piece as non-root user
USER $UNAME
CMD /usr/bin/firefox
