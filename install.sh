
# purge existing packages if present #
# sudo apt purge bladerf libbladerf-dev cubicsdr -y
rm hostedxA4-latest.rbf
rm bladeRF_fw_latest.img

sudo apt-get update

# install bladerf#
# https://github.com/Nuand/bladeRF/wiki/Getting-Started%3A-Linux #
#dependecies #
sudo apt-get install libusb-1.0-0-dev libusb-1.0-0 build-essential cmake libncurses5-dev libtecla1 libtecla-dev pkg-config git wget -y
sudo apt-get install doxygen help2man pandoc -y
#rm -rf ./bladeRF
git clone https://github.com/Nuand/bladeRF.git ./bladeRF --recursive
cd ./bladeRF
cd host/
mkdir build
cd build
cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr/local -DINSTALL_UDEV_RULES=ON ../
make
sudo make install
sudo ldconfig
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
sudo ldconfig
SoapySDRUtil --info

#cubicsdr
sudo apt install cubicsdr -y
































