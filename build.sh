#!/usr/bin/env bash
set -e

cd "$(dirname "$0")"

if [ -v DEBUG ]; then
  DEBUG_OPTIONS="DEBUG=snp,nii,netdevice,snponly,snpnet,efi_driver,efi_init,efi_pci"
fi
BUILD_CMD="make -j $(nproc) bin-x86_64-efi/ipxe.efi ${DEBUG_OPTIONS}"

docker build -t ipxe-build .
docker run --rm -v $(pwd)/src:/src ipxe-build ${BUILD_CMD}
