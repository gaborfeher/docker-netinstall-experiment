# docker-netinstall-experiment

Tools to make a PXE network install server running in Docker. The server will ship an Ubuntu 16.04 with UEFI mode and secure
boot supported.

Usage:

1. Make sure that you have the `eth0` interface set up with the static IP `192.168.222.1/24` or change the `Dockerfile` and
`docker-compose.yml`.
2. Install `docker` and `docker-compose`.
3. Download installation files using: `get_ubuntu_1604_uefi.sh`. I think this only works on Ubuntu 16.04
because of the way `shim.efi.signed` is acquired. You can also get it manually.
4. Don't forget to open UDP ports 67 and 69 on your firewall.
5. Run `start.sh`. (Comment out the checks if you have changed things in step 1.)
6. Don't be too surprised if it doesn't work. Between my two PCs it always works in one way and only works 1 out of 100 times
the other way. Something like this might be the problem: https://bugs.launchpad.net/maas/+bug/1437353
7. Once the installer is running, you'll need to manually connect it to the real Internet.


Main sources of inspiration:
* https://github.com/jpetazzo/pxe
* https://wiki.kubuntu.org/UEFI/SecureBoot-PXE-IPv6
