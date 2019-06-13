#!/bin/bash

set -o nounset
set -o errexit
set -o pipefail
set -x

git clone https://github.com/jbeder/yaml-cpp
pushd yaml-cpp
mkdir build
cd build
cmake ..

make
version="$(grep ^Version: yaml-cpp.pc)"
yamlcpp_pkg_dir="yaml-cpp-${version##* }"
make install DESTDIR="/tmp/${yamlcpp_pkg_dir}"

pushd /tmp
tar cfz "/out/${yamlcpp_pkg_dir}.tar.gz" "$yamlcpp_pkg_dir"
