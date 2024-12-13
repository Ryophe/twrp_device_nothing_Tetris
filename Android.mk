LOCAL_PATH := $(call my-dir)

ifeq ($(TARGET_DEVICE),Tetris)
include $(call all-subdir-makefiles,$(LOCAL_PATH))

# Include the prebuilt dtb.img (Fix of the "missing and no known rule to make it" error)
include $(CLEAR_VARS)
LOCAL_MODULE := dtb.img
LOCAL_MODULE_CLASS := ETC
LOCAL_SRC_FILES := $(TARGET_PREBUILT_DTB)
LOCAL_MODULE_PATH := $(TARGET_OUT_PRODUCT)
include $(BUILD_PREBUILT)
endif
