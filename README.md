# android_device_xiaomi_xmen

TWRP Device Tree for Xiaomi MiTV4A/MiTV4S (ANSM0)

The Xiaomi MiTV4A/MiTV4S (codenamed _"xmen"_) is a 4K UHD smart TV from Xiaomi, powered by the Amlogic T962 SoC.

## Device specifications

| Basic | Spec Sheet |
| ----: | :--- |
| SoC | Amlogic T962 |
| CPU | ARM Cortex-A53 quad-core @ 1.5 GHz |
| GPU | Mali-450 @ 750 MHz |
| Memory | 2 GB DDR |
| Shipped Android Version | 6.0.1 (Marshmallow) |
| Storage | 8 GB eMMC |
| Display | 3840 × 2160 (4K UHD) |


## Compile

First, repo init the TWRP 6.0 tree:

```sh
mkdir ~/android/twrp-6.0
cd ~/android/twrp-6.0
repo init -u git://github.com/minimal-manifest-twrp/platform_manifest_twrp_omni.git -b twrp-6.0
repo sync
```

Copy device tree files to `device/xiaomi/xmen/`, then build:

```sh
. build/envsetup.sh
lunch omni_xmen-eng
mka recoveryimage
```

## Notes

The ROM update function has been tested on Xiaomi TV 4S 65-inch (platform_name=txl_xmen_t33l). Other functions and device models have not been tested. Please proceed with caution.