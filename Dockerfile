FROM ubuntu:20.10

# Install required software and srb2kart
ARG DEBIAN_FRONTEND=noninteractive
RUN apt update && apt install -y software-properties-common build-essential libpng-dev zlib1g-dev libsdl2-dev libsdl2-mixer-dev libgme-dev libopenmpt-dev libcurl4-openssl-dev nasm git pkg-config
RUN export LIBGME_CFLAGS= \
    && export LIBGME_LDFLAGS=-lgme
RUN git clone https://git.do.srb2.org/STJr/SRB2.git
WORKDIR /SRB2
RUN git checkout master
RUN make

# Setup volumes
VOLUME /config
VOLUME /addons
VOLUME /data

# Symlink for config
RUN ln -sf /config/adedserv.cfg /SRB2/bin/kartserv.cfg && ln -sf /addons /SRB2/bin/addons

# Expose network port
EXPOSE 5029/udp

# Copy bash script and fix execute permission
COPY srb2.sh /usr/bin/srb2.sh
RUN chmod a+x /usr/bin/srb2.sh

COPY models.dat  \
    patch.pk3  \
    patch_music.pk3  \
    player.dta  \
    srb2.pk3  \
    zones.pk3 \
    /SRB2/bin

# Set working directory
WORKDIR /SRB2

# Run script
ENTRYPOINT ["srb2.sh"]
