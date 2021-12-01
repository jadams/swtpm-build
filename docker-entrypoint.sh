#!/bin/bash
cd /usr/src
set -xeuo pipefail
wget https://github.com/stefanberger/libtpms/archive/refs/tags/v${LIBTPMS_VER}.tar.gz
tar xvf v${LIBTPMS_VER}.tar.gz
cd libtpms-${LIBTPMS_VER}
./autogen.sh --with-openssl --with-tpm2
dpkg-buildpackage -us -uc -j$(nproc)
cd ..
dpkg -i libtpms0_${LIBTPMS_VER}_amd64.deb libtpms-dev_${LIBTPMS_VER}_amd64.deb
wget https://github.com/stefanberger/swtpm/archive/refs/tags/v${SWTPM_VER}.tar.gz
tar xvf v${SWTPM_VER}.tar.gz
cd swtpm-${SWTPM_VER}
./autogen.sh --with-openssl
dpkg-buildpackage -us -uc -j$(nproc)
