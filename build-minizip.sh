# Root path
rootdir=$(cd "$(dirname "$0")"; pwd)

set -e

# uncompress
[ ! -d $rootdir/minizip ] && tar -xzvf minizip-2.9.3.tar.gz && mv minizip-2.9.3 minizip

# build
cd $rootdir/minizip; mkdir -p cmake-build; cd cmake-build
cmake -DCMAKE_INSTALL_PREFIX=$rootdir/output -DCMAKE_PREFIX_PATH=$rootdir/output -DCMAKE_POSITION_INDEPENDENT_CODE=TRUE ..; make

# install
make install
