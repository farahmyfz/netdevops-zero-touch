# mar/12/2026 09:14:35 by RouterOS 7.6
# software id = EAT6-U3NG
#
# model = RB760iGS
# serial number = E1F10D4DD2E0
/interface wireless security-profiles
set [ find default=yes ] supplicant-identity=MikroTik
/ip hotspot profile
set [ find default=yes ] html-directory=hotspot
/ip pool
add name=dhcp_pool0 ranges=\
    192.168.11.1-192.168.11.9,192.168.11.11-192.168.11.254
add name=dhcp_pool1 ranges=10.10.10.1,10.10.10.3-10.10.10.254
add name=dhcp_pool2 ranges=192.168.20.2-192.168.20.254
/ip dhcp-server
add address-pool=dhcp_pool2 interface=ether2 name=dhcp1
/port
set 0 name=serial0
/ip address
add address=192.168.20.1/24 interface=ether2 network=192.168.20.0
add address=10.10.10.2/24 interface=ether3 network=10.10.10.0
add address=172.16.1.2/24 interface=ether4 network=172.16.1.0
/ip dhcp-client
add interface=ether1
/ip dhcp-server network
add address=10.10.10.0/24 dns-server=8.8.8.8 gateway=10.10.10.2
add address=192.168.11.0/24 gateway=192.168.11.10
add address=192.168.20.0/24 gateway=192.168.20.1
/ip dns
set allow-remote-requests=yes servers=8.8.8.8,8.8.4.4
/ip firewall filter
add action=accept chain=input comment="Allow SSH for Ansible" dst-port=22 \
    in-interface=ether1 protocol=tcp
/ip firewall nat
add action=masquerade chain=srcnat out-interface=ether1
add action=masquerade chain=srcnat out-interface=ether1
/ip route
add distance=1 dst-address=192.168.10.0/24 gateway=10.10.10.1 routing-table=\
    main scope=30 target-scope=10
add dst-address=192.168.10.0/24 gateway=192.168.11.1
add disabled=no dst-address=192.168.10.0/24 gateway=192.168.11.164 \
    routing-table=main suppress-hw-offload=no
add dst-address=192.168.10.0/24 gateway=192.168.11.154
add dst-address=192.168.10.0/24 gateway=192.168.11.154
add dst-address=0.0.0.0/0 gateway=192.168.11.1
/ip service
set api address=0.0.0.0/0
/ip ssh
set strong-crypto=yes
/system clock
set time-zone-name=Asia/Jakarta
/system identity
set name=R2
/system ntp client
set enabled=yes
/system ntp client servers
add address=0.id.pool.ntp.org
add address=1.id.pool.ntp.org