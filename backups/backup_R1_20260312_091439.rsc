# 2026-03-12 09:14:34 by RouterOS 7.21.3
# software id = WTB9-I4MI
#
# model = RB760iGS
# serial number = HCF0858DHTH
/interface lte apn
set [ find default=yes ] ip-type=ipv4 use-network-apn=no
/ip pool
add name=dhcp_pool0 ranges=10.10.10.2-10.10.10.254
add name=dhcp_pool1 ranges=192.168.10.2-192.168.10.254
add name=dhcp_pool2 ranges=192.168.10.2-192.168.10.254
/ip firewall connection tracking
set udp-timeout=10s
/ipv6 settings
set disable-ipv6=yes max-neighbor-entries=8192
/interface ovpn-server server
add auth=sha1,md5 mac-address=FE:35:09:CC:A2:FB name=ovpn-server1
/ip address
add address=192.168.10.1/24 interface=ether2 network=192.168.10.0
add address=10.10.10.1/24 interface=ether3 network=10.10.10.0
add address=172.16.1.1/24 interface=ether4 network=172.16.1.0
/ip dhcp-client
add interface=ether1
/ip dhcp-server
add address-pool=dhcp_pool2 interface=ether2 name=dhcp1
/ip dhcp-server network
add address=10.10.10.0/24 gateway=10.10.10.1
add address=192.168.10.0/24 gateway=192.168.10.1
/ip dns
set allow-remote-requests=yes servers=8.8.8.8,8.8.4.4
/ip firewall filter
add action=accept chain=forward disabled=yes dst-address=192.168.10.0/24 \
    in-interface=ether1 src-address=192.168.20.0/24
/ip firewall nat
add action=masquerade chain=srcnat out-interface=ether1
add action=masquerade chain=srcnat out-interface=ether1
/ip hotspot profile
set [ find default=yes ] html-directory=hotspot
/ip ipsec profile
set [ find default=yes ] dpd-interval=2m dpd-maximum-failures=5
/ip route
add dst-address=192.168.2.0/24 gateway=192.168.11.2
add dst-address=192.168.20.0/24 gateway=192.168.11.153
add dst-address=0.0.0.0/0 gateway=192.168.11.1
/ip service
set api address=0.0.0.0/0
/routing bfd configuration
add disabled=no interfaces=all min-rx=200ms min-tx=200ms multiplier=5
/system clock
set time-zone-name=Asia/Jakarta
/system identity
set name=R1
/system ntp client
set enabled=yes
/system ntp client servers
add address=0.id.pool.ntp.org
add address=1.id.pool.ntp.org