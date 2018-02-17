FROM ubuntu:trusty
MAINTAINER Dmitrii Ageev <d.ageev@gmail.com>

# Set environment
ENV APPLICATION "firefox"
ENV VERSION "57.0.2"
ENV FILE "firefox-${VERSION}.tar.bz2"
ENV LINK "https://download-installer.cdn.mozilla.net/pub/firefox/releases/${VERSION}/linux-x86_64/en-GB/${FILE}"
ENV EXECUTABLE "/firefox/firefox"

# Install software package
RUN apt update
RUN apt -y dist-upgrade
RUN apt install --no-install-recommends -t trusty-updates -y \
    lsb-release \
    libatk1.0-0 \
    libc6 \
    libcairo-gobject2 \
    libcairo2 \
    libdbus-1-3 \
    libdbus-glib-1-2 \
    libfontconfig1 \
    libfreetype6 \
    libgcc1 \
    libgdk-pixbuf2.0-0 \
    libglib2.0-0 \
    libgtk-3-0 \
    libpango-1.0-0 \
    libpangocairo-1.0-0 \
    libstartup-notification0 \
    libstdc++6 \
    libx11-6 \
    libx11-xcb1 \
    libxcb-shm0 \
    libxcb1 \
    libxcomposite1 \
    libxdamage1 \
    libxext6 \
    libxfixes3 \
    libxrender1 \
    libxt6 \
    x264 \
    gstreamer1.0-libav \
    gstreamer1.0-fluendo-mp3 \
    gstreamer1.0-pulseaudio \
    gstreamer1.0-plugins-base \
    gstreamer1.0-plugins-base-apps \
    gstreamer1.0-plugins-good \
    gstreamer1.0-plugins-bad \
    gstreamer1.0-plugins-bad-faad \
    gstreamer1.0-plugins-bad-videoparsers \
    gstreamer1.0-plugins-ugly \
    libcanberra-gtk3-module \
    packagekit-gtk3-module \
    hunspell-ru \
    hunspell-en-us \
    pulseaudio-utils \
    bzip2 \
    curl \
    sudo

RUN curl -kL -O ${LINK}
RUN tar -xjf ${FILE}

# Remove unwanted stuff
RUN rm -f ${FILE}
RUN apt purge -y --auto-remove curl bzip2
RUN rm -rf /var/lib/apt/lists/* /var/cache/apt/*

# Copy scripts and pulse audio settings
COPY files/wrapper /sbin/wrapper
COPY files/entrypoint.sh /sbin/entrypoint.sh
COPY files/pulse-client.conf /etc/pulse/client.conf
COPY files/hosts /etc/hosts

# Proceed to the entry point
ENTRYPOINT ["/sbin/entrypoint.sh"]
