# Custom Recovery Documentation for CMF Phone 1 (Tetris)

## Credits
This project is based on the DeviceTree from [Heptex](https://github.com/Heptex). Special thanks to Heptex for their contributions.

## Table of Contents
1. [Introduction](#introduction)
2. [Compilation Information](#compilation-information)
3. [Flashing Recovery Image](#flashing-recovery-image)
4. [Repacking Vendor Boot](#repacking-vendor-boot)
5. [Installing Android SDK](#installing-android-sdk)
6. [Device Specifications](#device-specifications)
7. [Acknowledgments](#acknowledgments)

---

## Introduction
This guide provides step-by-step instructions to build and flash a custom recovery for the **CMF Phone 1**, codenamed *Tetris*. You'll learn how to compile the recovery image, flash it to your device, repack the vendor boot image, and set up the Android SDK environment.

---

## Compilation Information

To compile the custom recovery, ensure your system is properly set up with the required dependencies. Follow these steps:

### 1. Clone the Repository
```bash
git clone https://github.com/YourRepo/CustomRecovery.git
cd CustomRecovery
```

### 2. Set Up the Build Environment
```bash
source build/envsetup.sh
lunch cmf_tetris-userdebug
```

### 3. Start the Build Process
```bash
make recoveryimage
```

The compiled recovery image will be located in the `output/` folder.

---

## Flashing Recovery Image

Once you have the recovery image, follow these steps to flash it onto your device:

1. Boot your CMF Phone 1 into **fastboot mode**:
   - Turn off the device.
   - Hold the **Volume Down** and **Power** buttons simultaneously until the fastboot screen appears.

2. Connect your device to a computer via USB.

3. Flash the recovery image using this command:
   ```bash
   fastboot flash recovery recovery.img
   ```

4. Reboot your device:
   ```bash
   fastboot reboot
   ```

---

## Repacking Vendor Boot

Repacking the vendor boot image may be necessary to enable certain functionalities. Follow these steps:

### 1. Extract the Current Vendor Boot Image
```bash
unpackbootimg -i vendor_boot.img -o output_directory
```

### 2. Modify the Extracted Files
Make any necessary adjustments to the kernel, ramdisk, or configuration files within the `output_directory`.

### 3. Repack the Vendor Boot Image
```bash
mkbootimg --kernel output_directory/kernel --ramdisk output_directory/ramdisk.img -o new_vendor_boot.img
```

---

## Installing Android SDK

The Android Software Development Kit (SDK) is required for building and debugging. Here's how to install it:

### 1. Download the SDK
Download the SDK tools from the [official Android website](https://developer.android.com/studio).

### 2. Install the SDK
Follow the installation instructions for your operating system (Windows, macOS, or Linux).

### 3. Configure Environment Variables
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

---

## Device Specifications

| **Category**        | **Details**                               |
|----------------------|-------------------------------------------|
| **CPU**             | 4x ARM Cortex-A78 @ 2.50 GHz + 4x ARM Cortex-A55 @ 2.00 GHz |
| **Chipset**         | MediaTek Dimensity 7300 5G                |
| **GPU**             | Mali-G615 MC2                             |
| **Memory**          | 6/8 GB RAM                                |
| **Shipped Android Version** | 14                                |
| **Storage**         | 128 GB                                    |
| **Battery**         | Li-Po 5000 mAh, non-removable             |
| **Display**         | 1080 x 2400 pixels, 6.7 inches, 60/120 Hz |

---

## Acknowledgments

Special thanks to:
- [Heptex](https://github.com/Heptex) for the DeviceTree.
- [Sidharth](https://github.com/sidharthify) for providing base trees.
- [Nothing Technology Limited](https://github.com/NothingOSS) for Linux kernel binaries and modules, shared under the GNU Public License.

--- 

### Helpful Links
- [Download Android SDK](https://developer.android.com/studio)
- [GitHub Repository](https://github.com/YourRepo/CustomRecovery)
- [Fastboot & ADB Installation Guide](https://developer.android.com/studio/releases/platform-tools)

