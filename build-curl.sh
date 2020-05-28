# Root path
rootdir=$(cd "$(dirname "$0")"; pwd)

set -e

# uncompress
[ ! -d $rootdir/curl ] && tar -xzvf curl-7.70.0.tar.gz && mv curl-7.70.0 curl

# build
cd $rootdir/curl; mkdir -p cmake-build; cd cmake-build
cmake -DCMAKE_INSTALL_PREFIX=$rootdir/output -DCMAKE_PREFIX_PATH=$rootdir/output -DCMAKE_POSITION_INDEPENDENT_CODE=TRUE -DBUILD_SHARED_LIBS=OFF ..; make

# install
make install
