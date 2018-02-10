FROM ubuntu:trusty
MAINTAINER Dmitrii Ageev <d.ageev@gmail.com>

# Set environment
ENV APPLICATION "firefox"
ENV VERSION "58.0.2"
ENV FILE "firefox-${VERSION}.tar.bz2"
ENV LINK "https://download-installer.cdn.mozilla.net/pub/firefox/releases/${VERSION}/linux-x86_64/en-US/${FILE}"
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
    libcanberra-gtk3-module \
    packagekit-gtk3-module \
    hunspell-ru \
    hunspell-en-us \
    pulseaudio-utils \
    curl \
    sudo

RUN curl -kL -O ${LINK}
RUN tar -xjf ${FILE}

# Remove unwanted stuff
RUN rm -f ${FILE}
RUN apt purge -y --auto-remove curl
RUN rm -rf /var/lib/apt/lists/* /var/cache/apt/*

# Copy scripts and pulse audio settings
COPY files/wrapper /sbin/wrapper
COPY files/entrypoint.sh /sbin/entrypoint.sh
COPY files/pulse-client.conf /etc/pulse/client.conf

# Proceed to the entry point
ENTRYPOINT ["/sbin/entrypoint.sh"]
