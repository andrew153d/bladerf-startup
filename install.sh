# https://github.com/pothosware/SoapySDR/wiki/BuildGuide
cd ~/
git clone https://github.com/pothosware/SoapySDR.git
cd SoapySDR
mkdir build
cd build
cmake ..
make -j`nproc`
sudo make install -j`nproc`
sudo ldconfig #needed on debian systems
SoapySDRUtil --info

# https://github.com/pothosware/SoapyBladeRF/wiki
cd ~/
git clone https://github.com/pothosware/SoapyBladeRF.git
cd SoapyBladeRF
mkdir build
cd build
cmake ..
make
sudo make install

#https://www.rtl-sdr.com/rtl-sdr-quick-start-guide/
sudo apt purge ^librtlsdr -y
sudo rm -rvf /usr/lib/librtlsdr* /usr/include/rtl-sdr* /usr/local/lib/librtlsdr* /usr/local/include/rtl-sdr* /usr/local/include/rtl_* /usr/local/bin/rtl_*

cd ~/
sudo apt-get install libusb-1.0-0-dev git cmake pkg-config build-essential -y
git clone https://github.com/rtlsdrblog/rtl-sdr-blog
cd rtl-sdr-blog/
mkdir build
cd build
cmake ../ -DINSTALL_UDEV_RULES=ON
make
sudo make install
sudo cp ../rtl-sdr.rules /etc/udev/rules.d/
sudo ldconfig

echo 'blacklist dvb_usb_rtl28xxu' | sudo tee --append /etc/modprobe.d/blacklist-dvb_usb_rtl28xxu.conf

# https://github.com/pothosware/SoapyRTLSDR/wiki
cd ~/
git clone https://github.com/pothosware/SoapyRTLSDR.git
cd SoapyRTLSDR
mkdir build
cd build
cmake ..
make
sudo make install



sudo apt update
sudo apt -y install cubicsdr
