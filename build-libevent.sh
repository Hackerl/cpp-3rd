# Root path
rootdir=$(cd "$(dirname "$0")"; pwd)

set -e

# uncompress
[ ! -d $rootdir/libevent ] && tar -xzvf libevent-2.1.12-stable.tar.gz && mv libevent-2.1.12-stable libevent

# build
cd $rootdir/libevent; mkdir -p cmake-build; cd cmake-build
cmake -DCMAKE_INSTALL_PREFIX=$rootdir/output -DCMAKE_PREFIX_PATH=$rootdir/output -DCMAKE_POSITION_INDEPENDENT_CODE=TRUE ..; make

# install
make install
