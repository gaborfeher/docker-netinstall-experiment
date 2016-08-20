FROM debian:jessie

RUN DEBIAN_FRONTEND=noninteractive && \
    apt-get update && \
    apt-get install -y dnsmasq

ENTRYPOINT ["/usr/sbin/dnsmasq", "--no-daemon", "--interface=eth0", "--port=0", "--dhcp-range=192.168.222.100,192.168.222.200", "--enable-tftp", "--tftp-root=/tftp" ]

