#!/bin/bash
set -eu

./autogen.sh

./configure \
    --prefix="$PREFIX" \
    --enable-static=no \
    --enable-shared=yes \
    --verbose

make V=1
make check || { cat ./test-suite.log && false; }
