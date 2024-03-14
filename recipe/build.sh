set -eu

./configure \
    --prefix="$PREFIX" \
    --enable-static=no \
    --enable-shared=yes

make V=1
make check || { cat ./test-suite.log && false; }
