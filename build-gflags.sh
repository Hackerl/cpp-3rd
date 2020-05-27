# Root path
rootdir=$(cd "$(dirname "$0")"; pwd)

set -e

# uncompress
[ ! -d $rootdir/gflags ] && tar -xzvf gflags-2.2.2.tar.gz && mv gflags-2.2.2 gflags

# build
cd $rootdir/gflags; mkdir -p cmake-build; cd cmake-build
cmake -DCMAKE_INSTALL_PREFIX=$rootdir/output -DCMAKE_POSITION_INDEPENDENT_CODE=TRUE -DGFLAGS_REGISTER_INSTALL_PREFIX=OFF ..; make

# install
make install
