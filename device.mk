#
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

$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)


# Also get non-open-source specific aspects if available
$(call inherit-product-if-exists, vendor/pantech/magnus/magnus-vendor.mk)

# overlays
DEVICE_PACKAGE_OVERLAYS += device/pantech/magnus/overlay

# Device uses high-density artwork where available
PRODUCT_AAPT_CONFIG := normal hdpi xhdpi
PRODUCT_AAPT_PREF_CONFIG := xhdpi
PRODUCT_PROPERTY_OVERRIDES += ro.sf.lcd_density=320

# Boot animation
TARGET_SCREEN_HEIGHT := 1280
TARGET_SCREEN_WIDTH := 720

# Audio configuration
PRODUCT_COPY_FILES += \
   device/pantech/magnus/audio/snd_soc_msm_2x:system/etc/snd_soc_msm/snd_soc_msm_2x \
   device/pantech/magnus/audio/audio_policy.conf:system/etc/audio_policy.conf

# Camera firmware
PRODUCT_COPY_FILES += \
    device/pantech/magnus/camera/CE150F00.bin:root/CE150F00.bin \
    device/pantech/magnus/camera/CE150F01.bin:root/CE150F01.bin \
    device/pantech/magnus/camera/CE150F02.bin:root/CE150F02.bin \
    device/pantech/magnus/camera/CE150F03.bin:root/CE150F03.bin

# Config
PRODUCT_COPY_FILES += \
   device/pantech/magnus/configs/wpa_supplicant.conf:system/etc/wifi/wpa_supplicant.conf

# Media config
PRODUCT_COPY_FILES += \
	device/pantech/magnus/media/media_profiles.xml:system/etc/media_profiles.xml

# Keylayout
PRODUCT_COPY_FILES += \
	device/pantech/magnus/keylayout/cyttsp4-i2c.kl:system/usr/keylayout/cyttsp4-i2c.kl \
	device/pantech/magnus/keylayout/max11871-touchscreen.kl:system/usr/keylayout/max11871-touchscreen.kl \
	device/pantech/magnus/keylayout/qt602240_ts_input.kl:system/usr/keylayout/qt602240_ts_input.kl

# Ramdisk
PRODUCT_PACKAGES += \
    fstab.qcom \
    init.qcom.usb.rc \
    init.qcom.rc \
    init.target.rc \
    ueventd.qcom.rc

# Torch
PRODUCT_PACKAGES += Torch

# Vold configuration
PRODUCT_COPY_FILES += \
    device/pantech/magnus/vold.fstab:system/etc/vold.fstab

# Set default USB interface
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
    persist.sys.usb.config=mtp

# Lights
PRODUCT_PACKAGES += lights.msm8960

# Increase the HWUI font cache since we have tons of RAM
PRODUCT_PROPERTY_OVERRIDES += \
    ro.hwui.text_cache_width=2048

# QC Perf
PRODUCT_PROPERTY_OVERRIDES += \
    ro.vendor.extension_library=/system/lib/libqc-opt.so

# QRNGD
PRODUCT_PACKAGES += qrngd

# enable repeatable keys in cwm
PRODUCT_PROPERTY_OVERRIDES += \
    ro.cwm.enable_key_repeat=true \
    ro.cwm.repeatable_keys=114,115

# NFC Support
PRODUCT_PACKAGES += \
    libnfc \
    libnfc_jni \
    Nfc \
    Tag \
    com.android.nfc_extras

# NFCEE access control
ifeq ($(TARGET_BUILD_VARIANT),user)
    NFCEE_ACCESS_PATH := device/pantech/magnus/nfc/nfcee_access.xml
else
    NFCEE_ACCESS_PATH := device/pantech/magnus/nfc/nfcee_access_debug.xml
endif
PRODUCT_COPY_FILES += \
    $(NFCEE_ACCESS_PATH):system/etc/nfcee_access.xml

# common msm8960
$(call inherit-product, device/pantech/msm8960-common/msm8960.mk)

$(call inherit-product, frameworks/native/build/phone-xhdpi-1024-dalvik-heap.mk)
