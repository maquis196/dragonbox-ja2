#!/bin/bash

set -euo pipefail

VERSION="${1:?Usage: $0 <version - example - 0.22.1>}"
UPSTREAM_VERSION="${VERSION%-r*}"

PACKAGE_NAME="ja2"
REVISION="${VERSION##*-r}"
P="${PACKAGE_NAME}-${UPSTREAM_VERSION}"

# Fetch sources
mkdir -p build
cd build
rm -f "v${UPSTREAM_VERSION}.tar.gz"
wget https://github.com/ja2-stracciatella/ja2-stracciatella/archive/v${UPSTREAM_VERSION}.tar.gz
tar zxpvf v${UPSTREAM_VERSION}.tar.gz
cd ja2-stracciatella-${UPSTREAM_VERSION}

# Build # Set options
mkdir _bin
cd _bin
cmake ..
# cargo repo doesn't always like pyra
export CARGO_REGISTRIES_CRATES_IO_PROTOCOL=sparse
make -j2

## copy the needful to gamedata
cp -a externalized ../../../gamedata
cp ja2 ../../../gamedata/

cd ../../..

## Configure meta file
cat > assets/meta/default.desktop <<EOF
[Desktop Entry]
Version=${UPSTREAM_VERSION}
Type=Application
Categories=Game;Strategy;
Name=Jagged Alliance 2 Stracciatella
Exec=ja2.sh
Icon=icon.jpg
X-DBP-Screenshot=teaser1.jpg;teaser2.jpg;

[Package Entry]
Id=ja2_maquis196
Name=Jagged Alliance 2 Stracciatella
Arch=armhf
Exec=ja2.sh
Version=${VERSION}
Appdata=ja2
Icon=icon.jpg
EOF

rm -f data.zip gamedata.sqfs
mksquashfs gamedata gamedata.sqfs -comp xz

cd assets
zip -r ../data.zip *
cd ..

cat gamedata.sqfs data.zip > "${P}_maquis196.dbp"
