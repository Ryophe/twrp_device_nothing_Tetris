### Custom Recovery Tree for the CMF Phone 1 (Tetris)
#### The Linux Kernel binary and it's accompanying modules are provided by [Nothing Technology Limited](https://github.com/NothingOSS) under the GNU Public License
❤ Credits to [Heptex](https://github.com/Heptex/) for the Recovery Tree.

❤ Big thanks to [HpDevFox](https://github.com/hpdevFOX) for helping me with compilation and the tree.

The CMF Phone 1 (codenamed _"Tetris"_) is a mid-range smartphone from Nothing released in early 2024.

## Device specifications

Basic   | Spec Sheet
-------:|:-------------------------
CPU     | 4x ARM Cortex-A78 @ 2.50 GHz • 4x ARM Cortex-A55 @ 2.00 GHz
Chipset | Mediatek Dimensity 7300 5G
GPU     | Mali-G615 MC2
Memory  | 6/8 GB RAM
Shipped Android Version | 14
Storage | 128 GB
Battery | Li-Po 5000 mAh, non-removable
Display | 1080 x 2400 pixels, 6.7 inches, 60/120 hz

![CMF Phone 1](https://in.cmf.tech/cdn/shop/files/Engineering_aesthetics_1600x.png?v=1720164742)

### Guides
Root guide - https://xdaforums.com/t/root-cmf-phone-1.4681502/

Bootloader unlock - https://xdaforums.com/t/nothing-cmf-phone-1-bootloader-unlock-guide.4680441/
### Compile from source
# 1. Clone the repo
```bash
git clone https://github.com/HackySoftOfficial/twrp_device_Nothing_CMF1
cd twrp_device_Nothing_CMF1
```

# 2. Installing Android SDK (For compilation)
The Android Software Development Kit (SDK) is required for building and debugging. Here's how to install it:
## 1. [Download the SDK](https://developer.android.com/studio)
## 2. Install the SDK
## 3. Configure Environment Variables
Set up the environment variables for the SDK tools:
```bash
export ANDROID_HOME=path_to_android_sdk
export PATH=$PATH:$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools
```
Verify the installation by running:
```bash
adb version
fastboot version
```

# 3. Set Up build environment
```bash
source build/envsetup.sh
lunch cmf_tetris-userdebug
```

# 4. Building the image
```bash
make recoveryimage
```
The compiled recovery image will be located in the `output/` folder.

## After you've built a custom recovery using this tree, you can enter the following command in fastboot to flash it (yes, the recovery is stored in `vendor_boot`)
# 5. Flash it!
Once you have the recovery image, follow these steps to flash it onto your device:
   1. Boot your CMF Phone 1 into fastboot mode:
     - Turn off the device.
     - Hold the **Volume Down** and **Power** buttons simultaneously until the fastboot screen appears.
   2. Connect your device to a computer via USB.
   3. Install the fastboot and ADB drivers if not installed. [Tutorial](https://nerdschalk.com/how-to-install-adb-and-fastboot/)
   4. Flash the recovery image:
      ```bash
      fastboot flash vendor_boot vendor_boot.img
      ```
   5. Reboot your device.
      ```bash
      fastboot reboot
      ```

## Thanks to [Sidharth](https://github.com/sidharthify) For Base trees. ❤️
