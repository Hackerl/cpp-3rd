# Root path
rootdir=$(cd "$(dirname "$0")"; pwd)

set -e

# uncompress
[ ! -d $rootdir/openssl ] && tar -xzvf openssl-1.1.1g.tar.gz && mv openssl-1.1.1g openssl

# build
cd $rootdir/openssl
./config --prefix=$rootdir/output; make

# install
make install
