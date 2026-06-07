DEVICE_PATH := device/xiaomi/xmen

# Architecture
# Device uses 64-bit Cortex-A53 kernel, but Android userspace is 32-bit only.
TARGET_ARCH := arm
# twrp omni 6.0 branch does not support armv8-a, so we use armv7-a-neon instead.
TARGET_ARCH_VARIANT := armv7-a-neon
# TARGET_ARCH_VARIANT := armv8-a
TARGET_CPU_VARIANT := cortex-a53
# 32-bit Android userspace ABI
TARGET_CPU_ABI := armeabi-v7a
TARGET_CPU_ABI2 := armeabi

TARGET_BOARD_PLATFORM := gxbaby
TARGET_BOOTLOADER_BOARD_NAME := xmen

# Kernel
TARGET_PREBUILT_KERNEL := $(DEVICE_PATH)/prebuilt/kernel

BOARD_KERNEL_BASE := 0x01078000
BOARD_KERNEL_PAGESIZE := 2048
BOARD_BOOTIMG_HEADER_VERSION := 0

BOARD_MKBOOTIMG_ARGS := \
    --kernel_offset 0x00008000 \
    --ramdisk_offset 0xfff88000 \
    --second_offset 0xffe88000 \
    --tags_offset 0xfef88100 \
    --second $(DEVICE_PATH)/prebuilt/dtb.img


# BOARD_MKBOOTIMG_ARGS := \
#     --kernel_offset 0x00008000 \
#     --ramdisk_offset -0x00078000 \
#     --second_offset -0x00180000 \
#     --tags_offset -0x01077f00 \
#     --second $(DEVICE_PATH)/prebuilt/dtb.img


# BOARD_OS_VERSION := 6.0.1
# BOARD_OS_PATCH_LEVEL := 2017-04-01

# Partitions
BOARD_BOOTIMAGE_PARTITION_SIZE := 20971520
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 16777216
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 1073741824
BOARD_CACHEIMAGE_PARTITION_SIZE := 268435456
BOARD_FLASH_BLOCK_SIZE := 131072

# Recovery
TARGET_RECOVERY_FSTAB := $(DEVICE_PATH)/recovery/root/etc/recovery.fstab
BOARD_HAS_NO_SELECT_BUTTON := true
BOARD_SUPPRESS_SECURE_ERASE := true

# TWRP
TW_THEME := landscape_hdpi
TW_SCREEN_BLANK_ON_BOOT := false
TW_NO_SCREEN_BLANK := true
TW_EXCLUDE_SUPERSU := true
# TW_INCLUDE_NTFS_3G := false
# TW_INCLUDE_FUSE := false

# Android 6.0.1, encryption likely not required for TV device initially.
TW_INCLUDE_CRYPTO := false

# Optional quality-of-life
TW_USE_TOOLBOX := true

# TWRP language support
TW_EXTRA_LANGUAGES := true
TW_DEFAULT_LANGUAGE := zh_CN

TW_BRIGHTNESS_PATH := /sys/devices/backlight.14/backlight/aml-bl/brightness
TW_MAX_BRIGHTNESS := 255
TW_DEFAULT_BRIGHTNESS := 255

# TARGET_RECOVERY_PIXEL_FORMAT := "BGRA_8888"
TARGET_RECOVERY_FORCE_PIXEL_FORMAT := "RGB_565"

TW_DEFAULT_TIMEZONE := Asia/Shanghai
TW_DEVICE_VERSION := $(shell date '+%Y%m%d') by Sol Young
