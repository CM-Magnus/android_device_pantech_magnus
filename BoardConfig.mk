# Copyright (C) 2014 The CyanogenMod Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

#
# This file sets variables that control the way modules are built
# thorughout the system. It should not be used to conditionally
# disable makefiles (the proper mechanism to control what gets
# included in a build is to use PRODUCT_PACKAGES in a product
# definition file).
#

# WARNING: This line must come *before* including the proprietary
# variant, so that it gets overwritten by the parent (which goes
# against the traditional rules of inheritance).
USE_CAMERA_STUB := true

# inherit from common msm8960
-include device/pantech/msm8960-common/BoardConfigCommon.mk

# Kernel
TARGET_KERNEL_SOURCE        := kernel/pantech/magnus
TARGET_KERNEL_CONFIG        := msm8960_magnus_defconfig
BOARD_KERNEL_CMDLINE        := console=ttyHSL0,115200,n8 androidboot.hardware=qcom androidboot.carrier=ATT user_debug=31 msm_rtb.filter=0x3F ehci-hcd.park=3 maxcpus=2 loglevel=0
BOARD_KERNEL_BASE           := 0x80200000
BOARD_MKBOOTIMG_ARGS        := --ramdisk_offset 0x02000000
BOARD_KERNEL_PAGESIZE       := 2048

TARGET_BOOTLOADER_BOARD_NAME := MSM8960

# Assert
TARGET_OTA_ASSERT_DEVICE := magnus

# Recovery
BOARD_USE_CUSTOM_RECOVERY_FONT := \"roboto_15x24.h\"
BOARD_USES_MMCUTILS := true
BOARD_HAS_LARGE_FILESYSTEM := true
BOARD_HAS_NO_MISC_PARTITION := true
BOARD_HAS_NO_SELECT_BUTTON := true
TARGET_RECOVERY_FSTAB := device/pantech/magnus/recovery.fstab

TARGET_USERIMAGES_USE_EXT4 := true
BOARD_BOOTIMAGE_PARTITION_SIZE := 0x00A00000
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 0x00A00000
BOARD_SYSTEMIMAGE_PARTITION_SIZE     := 1258291200
BOARD_USERDATAIMAGE_PARTITION_SIZE   := 13351518208
BOARD_FLASH_BLOCK_SIZE := 131072

# Bluetooth
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := device/pantech/magnus/bluetooth

# Disable initlogo
TARGET_NO_INITLOGO := true


# TWRP config
DEVICE_RESOLUTION := 720x1280
RECOVERY_SDCARD_ON_DATA := true
TW_INTERNAL_STORAGE_PATH := "/data/media"
TW_INTERNAL_STORAGE_MOUNT_POINT := "data"
TW_EXTERNAL_STORAGE_PATH := "/external_sd"
TW_EXTERNAL_STORAGE_MOUNT_POINT := "external_sd"
TW_NO_USB_STORAGE := true
RECOVERY_GRAPHICS_USE_LINELENGTH := true

#MultiROM config. MultiROM also uses parts of TWRP config
MR_INPUT_TYPE := type_b
MR_INIT_DEVICES := device/pantech/magnus/mr_init_devices.c
MR_RD_ADDR := 0x82500000
MR_DPI := hdpi
MR_FSTAB := device/pantech/magnus/twrp.fstab
MR_USE_MROM_FSTAB := true
MR_KEXEC_MEM_MIN := 0x85000000
MR_INFOS := device/pantech/magnus/mrom_infos
