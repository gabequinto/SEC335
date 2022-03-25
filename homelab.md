### Overview
------
For this lab we were tasked with setting up our own home lab for pentesting purposes. This lab includes one VYOS box, one Kali Linux box, one xubuntu box, and one vulnerable 
centos box. After configuring all of these machines we had to configure a WireGuard VPN for connectivity between our Kali box and our vulnerable box. 

### Reflection
------
This was a very fun lab and the first time I had set up VM's in this manner. I have never configured VM's to be able to have connectivity to eachother, however I'm glad that we did this lab because it will be very helpful in the future. It will for sure pay off in the future to be able to do this for whatever the situation may call for. 

### VMWare Configuration
------

### VyOS Configuration
------
    configure
    set interfaces ethernet eth0 address '192.168.229.10/24'
    set interfaces ethernet eth0 description 'Nat on VMware Host'
    set interfaces ethernet eth1 address '10.0.5.2/24'
    set interfaces ethernet eth1 description 'VMNET5-RANGE'
    set protocols static route 0.0.0.0/0 next-hop 192.168.229.2
    set service ssh listen-address '192.168.229.10'
    set system name-server '192.168.229.2'
    set service ssh listen-address 192.168.229.10
    commit
    save


### DHCP Configuration
------
    configure 
    set service dhcp-server global-parameters 'local-address 10.0.5.2;'
    set service dhcp-server shared-network-name DHCPPOOL authoritative
    set service dhcp-server shared-network-name DHCPPOOL subnet 10.0.5.0/24 default-router '10.0.5.2'
    set service dhcp-server shared-network-name DHCPPOOL subnet 10.0.5.0/24 domain-name 'range.local'
    set service dhcp-server shared-network-name DHCPPOOL subnet 10.0.5.0/24 lease '86400'
    set service dhcp-server shared-network-name DHCPPOOL subnet 10.0.5.0/24 range POOL1 start '10.0.5.50'
    set service dhcp-server shared-network-name DHCPPOOL subnet 10.0.5.0/24 range POOL1 stop '10.0.5.100'
    commit
    save



### VPN Configuration
------
#### On Kali
    apt install wireguard resolvconf
    wg genkey | tee privatekey | wg pubkey > publickey
#### On VyOS
    sudo apt install wireguard
    cd /etc/wireguard
    umask 077
    wg genkey | tee privatekey | wg pubkey > publickey
    generate wireguard default-keypair
    configure
    set interfaces wireguard wg0 private-key default
    set interfaces wireguard wg0 address '10.0.99.1/24'
    set interfaces wireguard wg0 peer namegoeshere allowed-ips '10.0.99.100/32'
    set interfaces wireguard wg0 peer namegoeshere public-key keygoeshere
    set interfaces wireguard wg0 port '51820'
    commit
    save
    exit
