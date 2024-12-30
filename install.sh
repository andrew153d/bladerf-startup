
# purge existing packages if present #
sudo apt purge bladerf libbladerf-dev cubicsdr -y
rm hostedxA4-latest.rbf
rm bladeRF_fw_latest.img

sudo apt-get update

# setup networking #
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

# install bladerf#
# https://github.com/Nuand/bladeRF/wiki/Getting-Started%3A-Linux #

git clone https://github.com/Nuand/bladeRF.git ./bladeRF
cd ./bladeRF
cd host/
mkdir build
cd build
cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr/local -DINSTALL_UDEV_RULES=ON ../
make && sudo make install && sudo ldconfig
export PATH=$PATH:/usr/local

wget https://www.nuand.com/fpga/hostedxA4-latest.rbf
wget https://www.nuand.com/fx3/bladeRF_fw_latest.img

# SoapySDR #
sudo apt-get install cmake g++ libpython3-dev python3-numpy swig
git clone https://github.com/pothosware/SoapySDR.git
cd SoapySDR
mkdir build
cd build
cmake ..
make -j`nproc`
sudo make install -j`nproc`
sudo ldconfig #needed on debian systems
SoapySDRUtil --info

#cubicsdr
sudo apt install cubicsdr
































