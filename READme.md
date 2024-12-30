
# Installing SDR Utilities for RTL-SDR and BladeRF on Ubuntu 22.04

### Step 1: Update and Install Required Packages
Run the following commands to update your system and install necessary tools:
```bash
sudo apt update
sudo apt install git openssh-server net-tools -y
ifconfig
```

> You can now SSH into the machine or continue working directly on it.

---

### Step 2: Clone the Repository
Clone the BladeRF startup scripts repository and make the scripts executable:
```bash
git clone https://github.com/andrew153d/bladerf-startup.git
cd bladerf-startup/
sudo chmod +x *.sh
```

---

### Step 3: Install SDR Software
Run the script to install BladeRF, RTL-SDR, SoapySDR, and CubicSDR
```bash
sudo ./SdrInstalls.sh
```

---
### Step 3: Optional Configurations
#### Static IP Address
If you want to set a static IP address, run:
```bash
sudo ./Network.sh
```

#### VNC Setup
To configure VNC for remote desktop access:
1. Run the first part of the VNC setup:
   ```bash
   ./VncPart1.sh
   ```
2. Reboot your system.
3. After rebooting, run the second part of the VNC setup:
   ```bash
   ./VncPart2.sh
   ```

---
