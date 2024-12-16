LOCAL_PATH := $(call my-dir)

ifeq ($(TARGET_DEVICE),Tetris)
include $(call all-subdir-makefiles,$(LOCAL_PATH))

# Define source files for DTB
DTB_OBJS := \
    $(wildcard $(BOARD_PREBUILT_DTB_DIR)/*.dtb)

# Define the target for dtb.img
$(PRODUCT_OUT)/dtb.img: $(DTB_OBJS)
    @echo "Building dtb.img"
    $(hide) cat $(DTB_OBJS) > $(PRODUCT_OUT)/dtb.img

# Ensure dtb.img is a dependency of vendor_boot.img
$(PRODUCT_OUT)/vendor_boot.img: $(PRODUCT_OUT)/dtb.img
endif
