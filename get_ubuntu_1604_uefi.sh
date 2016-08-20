#!/bin/bash

# https://wiki.ubuntu.com/UEFI/PXE-netboot-install
# https://wiki.kubuntu.org/UEFI/SecureBoot-PXE-IPv6

rm -Rf tftp/*
mkdir tftp

pushd tftp

wget http://archive.ubuntu.com/ubuntu/dists/xenial-updates/main/installer-amd64/current/images/netboot/netboot.tar.gz
tar xfz netboot.tar.gz

wget http://archive.ubuntu.com/ubuntu/dists/xenial/main/uefi/grub2-amd64/current/grubnetx64.efi.signed

cp grubnetx64.efi.signed grubx64.efi

mkdir tmp
pushd tmp
apt-get download shim-signed
ar vx shim-signed_1.18~16.04.1+0.8-0ubuntu2_amd64.deb
tar -xvJf data.tar.xz
cp ./usr/lib/shim/shim.efi.signed ../bootx64.efi
popd
rm -Rf tmp

mkdir grub
cat >grub/grub.cfg  <<EOF
menuentry "Install Ubuntu" {
set gfxpayload=keep
linux /ubuntu-installer/amd64/linux gfxpayload=800x600x16,800x600 -- quiet
initrd /ubuntu-installer/amd64/initrd.gz
}
EOF

popd

sed -i '/dhcp-boot/c\      "--dhcp-boot=bootx64.efi"' docker-compose.yml
