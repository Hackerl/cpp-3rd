# Root path
rootdir=$(cd "$(dirname "$0")"; pwd)

set -e

# uncompress
[ ! -d $rootdir/libpcap ] && tar -xzvf libpcap-libpcap-1.9.1.tar.gz && mv libpcap-libpcap-1.9.1 libpcap

# build
cd $rootdir/libpcap; mkdir -p cmake-build; cd cmake-build
cmake -DCMAKE_INSTALL_PREFIX=$rootdir/output -DCMAKE_POSITION_INDEPENDENT_CODE=TRUE -DUSE_STATIC_RT=ON ..; make

# install
make install
