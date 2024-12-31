echo -e "# Let NetworkManager manage all devices on this system\n\
network:\n\
  version: 2\n\
  renderer: NetworkManager\n\
  ethernets:\n\
        eth0:\n\
            addresses:\n\
                - 192.168.12.234/24\n\
            nameservers:\n\
                addresses: [8.8.8.8, 8.8.4.4]\n\
            routes:\n\
                - to: default\n\
                  via: 192.168.12.1" | sudo tee /etc/netplan/01-network-manager-all.yaml > /dev/null

sudo netplan apply
sudo systemctl restart network-manager
