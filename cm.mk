$(call inherit-product, device/pantech/magnus/full_magnus.mk)

# Inherit some common CM stuff.
$(call inherit-product, vendor/cm/config/gsm.mk)

# Enhanced NFC
$(call inherit-product, vendor/cm/config/nfc_enhanced.mk)

# Inherit some common CM stuff.
$(call inherit-product, vendor/cm/config/common_full_phone.mk)

PRODUCT_BUILD_PROP_OVERRIDES += \
    PRODUCT_NAME=magnus \
    TARGET_DEVICE=magnus \
    BUILD_FINGERPRINT="ATT/PantechP9090/magnus:4.1.2/JZO54K/magnus_0715:user/release-keys" \
    PRIVATE_BUILD_DESC="msm8960-user 4.1.2 JZO54K eng.p13678.20130715.200449 release-keys"

PRODUCT_NAME := cm_magnus
PRODUCT_DEVICE := magnus

