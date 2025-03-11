FROM debian:12

# Install required software and srb2
RUN apt update && apt install -y software-properties-common build-essential libpng-dev zlib1g-dev libsdl2-dev libsdl2-mixer-dev libgme-dev libopenmpt-dev libcurl4-openssl-dev nasm git pkg-config libsdl2-mixer-dev libpng-dev libcurl4-openssl-dev libgme-dev libopenmpt-dev libminiupnpc-dev \
    && git clone https://git.do.srb2.org/STJr/SRB2.git
WORKDIR /SRB2
RUN git checkout master && make -j$(nproc) LINUX64=1 NOHW=1
    
# Setup volumes
VOLUME /config
VOLUME /addons
VOLUME /data
VOLUME /logs

# Symlink for config
RUN ln -sf /config/adedserv.cfg && ln -sf /addons /SRB2/bin/addons

# Expose network port
EXPOSE 5029/udp

# Copy bash script and fix execute permission
COPY srb2.sh  /SRB2/bin/
RUN chmod a+x  /SRB2/bin/srb2.sh

COPY srb2.pk3  \
    #patch.pk3  \
    #patch_music.pk3  \
     music.pk3  \
     srb2.pk3  \
     zones.pk3 \
     characters.pk3 \
     /SRB2/bin/


# Set working directory
WORKDIR /SRB2/bin

STOPSIGNAL SIGINT

# Run script
CMD ["/SRB2/bin/lsdl2srb2", "-dedicated"]