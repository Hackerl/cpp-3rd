# Root path
rootdir=$(cd "$(dirname "$0")"; pwd)

set -e

# uncompress
[ ! -d $rootdir/jsoncpp ] && tar -xzvf jsoncpp-1.9.4.tar.gz && mv jsoncpp-1.9.4 jsoncpp

# build
cd $rootdir/jsoncpp; mkdir -p cmake-build; cd cmake-build
cmake -DCMAKE_INSTALL_PREFIX=$rootdir/output -DCMAKE_POSITION_INDEPENDENT_CODE=TRUE ..; make

# install
make install
