#!/bin/bash

PACKAGE_NAME="ja2"
UPSTREAM_VERSION="0.21.0"
P="${PACKAGE_NAME}-${UPSTREAM_VERSION}"

# Fetch sources
wget https://github.com/ja2-stracciatella/ja2-stracciatella/archive/v${UPSTREAM_VERSION}.tar.gz
tar zxpvf v${UPSTREAM_VERSION}.tar.gz
cd ja2-stracciatella-${UPSTREAM_VERSION}

# Build # Set options
mkdir _bin && cd _bin
cmake ..
cp ja2 ../../gamedata/


# sed version upstream

# TODO - sed version repo with maybe r1 with counter? - manual

rm data.zip gamedata.sqfs
mksquashfs gamedata gamedata.sqfs -comp xz
cd assets; zip -r ../data.zip *; cd ..
cat gamedata.sqfs data.zip > ${P}_maquis196.dbp
