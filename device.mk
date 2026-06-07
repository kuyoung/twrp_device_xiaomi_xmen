LOCAL_PATH := device/xiaomi/xmen

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/recovery/root/fstab.amlogic:recovery/root/fstab.amlogic \
    $(LOCAL_PATH)/recovery/root/etc/recovery.fstab:recovery/root/etc/recovery.fstab \
    $(LOCAL_PATH)/recovery/root/etc/twrp.fstab:recovery/root/etc/twrp.fstab \
    $(LOCAL_PATH)/recovery/root/init.recovery.amlogic.rc:recovery/root/init.recovery.amlogic.rc \
    $(LOCAL_PATH)/recovery/root/init.recovery.logd.rc:recovery/root/init.recovery.logd.rc \
    $(LOCAL_PATH)/recovery/root/init.recovery.ldconfig.rc:recovery/root/init.recovery.ldconfig.rc \
    $(LOCAL_PATH)/recovery/root/init.recovery.vold_decrypt.rc:recovery/root/init.recovery.vold_decrypt.rc \
    $(LOCAL_PATH)/recovery/root/sbin/display-init.sh:recovery/root/sbin/display-init.sh

