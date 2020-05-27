# Root path
rootdir=$(cd "$(dirname "$0")"; pwd)

set -e

# uncompress
[ ! -d $rootdir/glog ] && tar -xzvf glog-0.4.0.tar.gz && mv glog-0.4.0 glog

# build
cd $rootdir/glog; mkdir -p cmake-build; cd cmake-build
cmake -DCMAKE_INSTALL_PREFIX=$rootdir/output -DCMAKE_POSITION_INDEPENDENT_CODE=TRUE ..; make

# install
make install
