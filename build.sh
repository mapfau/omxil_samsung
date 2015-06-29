#!/bin/sh

TOOLCHAIN_PATH="/usr"
OMX_INSTALL_PATH=""
OMXCORE_INCLUDE_PATH=$OMX_INSTALL_PATH"/usr/include"


cflags="-Wno-error=switch -Wno-error=unused-but-set-variable -I$OMX_INSTALL_PATH/include -I$TOOLCHAIN_PATH/include \
	-I$OMXCORE_INCLUDE_PATH \
	-L$OMX_INSTALL_PATH/usr/lib"

make distclean

autoreconf -i

ac_cv_func_memset_0_nonnull=yes ac_cv_func_realloc_0_nonnull=yes  ac_cv_func_malloc_0_nonnull=yes ./configure \
 --host=arm-linux-gnueabi \
 --prefix=/usr \
 --enable-shared \
 CFLAGS="$cflags"


mkdir -p $OMX_INSTALL_PATH

make uninstall DESTDIR=$OMX_INSTALL_PATH
make
make install DESTDIR=$OMX_INSTALL_PATH
