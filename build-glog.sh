# Root path
rootdir=$(cd "$(dirname "$0")"; pwd)

set -e

# uncompress
[ ! -d $rootdir/gflags ] && tar -xzvf gflags-2.2.2.tar.gz && mv gflags-2.2.2 gflags
[ ! -d $rootdir/glog ] && tar -xzvf glog-0.4.0.tar.gz && mv glog-0.4.0 glog

# build gflags
cd $rootdir/gflags; mkdir -p cmake-build; cd cmake-build
cmake -DCMAKE_INSTALL_PREFIX=$rootdir/output -DCMAKE_POSITION_INDEPENDENT_CODE=TRUE -DGFLAGS_REGISTER_INSTALL_PREFIX=OFF ..; make

# install gflags
make install

# build glog
cd $rootdir/glog; mkdir -p cmake-build; cd cmake-build
cmake -DCMAKE_INSTALL_PREFIX=$rootdir/output -DCMAKE_POSITION_INDEPENDENT_CODE=TRUE -DCMAKE_PREFIX_PATH=$rootdir/output/lib/cmake/gflags ..; make

# install gflags
make install
