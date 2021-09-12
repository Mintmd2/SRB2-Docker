#!/bin/bash

cd /SRB2/bin || exit

ADDONS=$(ls /addons)

if [ -z "$ADDONS" ]; then
    /SRB2/bin/lsdl2srb2 -dedicated -config adedserv.cfg -home /data $*
    exit
fi

# Intentional word splitting
/SRB2/bin/lsdl2srb2 -dedicated -config adedserv.cfg -home /data $* -file $ADDONS