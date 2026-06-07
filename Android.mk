LOCAL_PATH := $(call my-dir)

ifeq ($(TARGET_DEVICE), xmen)

include $(call all-makefiles-under,$(LOCAL_PATH))

endif