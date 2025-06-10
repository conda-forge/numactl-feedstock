#!/bin/bash
set -eu

autoreconf --install --symlink

./configure \
    --prefix="$PREFIX" \
    --enable-static=no \
    --enable-shared=yes \
    --verbose

make V=1
make check || { cat ./test-suite.log && false; }
