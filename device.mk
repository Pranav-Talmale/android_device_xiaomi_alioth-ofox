#
# SPDX-License-Identifier: Apache-2.0
#

ALLOW_MISSING_DEPENDENCIES := true

# Inherit from sm8250-common
#$(call inherit-product, device/xiaomi/alioth/kona.mk) (no longer needed since it has been merged)
#$(call inherit-product, vendor/xiaomi/alioth/alioth-vendor.mk)

# Ihnerit virtual_ab_ota product
$(call inherit-product, \
    $(SRC_TARGET_DIR)/product/virtual_ab_ota.mk)

# Enable updating of APEXes
$(call inherit-product, $(SRC_TARGET_DIR)/product/updatable_apex.mk)

# Include GSI keys
$(call inherit-product, $(SRC_TARGET_DIR)/product/gsi_keys.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

PRODUCT_SHIPPING_API_LEVEL := 30
 
#Init Recovery
PRODUCT_COPY_FILES += \
     $(LOCAL_PATH)/recovery/root/init.recovery.qcom.rc:$(TARGET_COPY_OUT_RECOVERY)/root/init.recovery.qcom.rc    
     
# Virtual A/B OTA
$(call inherit-product, \
    $(SRC_TARGET_DIR)/product/virtual_ab_ota.mk)
    
# fastbootd
PRODUCT_PACKAGES += \
    android.hardware.fastboot@1.0-impl-mock \
	android.hardware.fastboot@1.0-impl-mock.recovery \
    fastbootd    

# A/B
ENABLE_VIRTUAL_AB := true
     
# Overlays
DEVICE_PACKAGE_OVERLAYS += \
    $(LOCAL_PATH)/overlay 
    
PRODUCT_PACKAGES += \
    qcom_decrypt \
    qcom_decrypt_fbe

PRODUCT_SOONG_NAMESPACES += \
    vendor/qcom/opensource/commonsys-intf/display

#A/B
AB_OTA_POSTINSTALL_CONFIG += \
    RUN_POSTINSTALL_system=true \
    POSTINSTALL_PATH_system=system/bin/otapreopt_script \
    FILESYSTEM_TYPE_system=ext4 \
    POSTINSTALL_OPTIONAL_system=true

AB_OTA_POSTINSTALL_CONFIG += \
    RUN_POSTINSTALL_vendor=true \
    POSTINSTALL_PATH_vendor=bin/checkpoint_gc \
    FILESYSTEM_TYPE_vendor=ext4 \
    POSTINSTALL_OPTIONAL_vendor=true

PRODUCT_PACKAGES_DEBUG += update_engine_client
PRODUCT_PACKAGES += \
  update_engine \
  update_engine_client \
  update_engine_sideload \
  update_verifier

PRODUCT_PACKAGES += \
    checkpoint_gc \
    otapreopt_script

PRODUCT_PACKAGES += \
    android.hardware.boot@1.1-impl-qti \
    android.hardware.boot@1.1-impl-qti.recovery \
    android.hardware.boot@1.1-service \
    bootctrl.kona \
    bootctrl.kona.recovery

PRODUCT_PACKAGES_DEBUG += \
    bootctl

# fastbootd
PRODUCT_PACKAGES += \
    fastbootd

# Health
PRODUCT_PACKAGES += \
    android.hardware.health@2.1-impl \
    android.hardware.health@2.1-service

# OTA
PRODUCT_HOST_PACKAGES += \
    signapk

# Crypto
TW_INCLUDE_CRYPTO := true
TW_INCLUDE_CRYPTO_FBE := true
TW_INCLUDE_FBE_METADATA_DECRYPT := true
BOARD_USES_METADATA_PARTITION := true
PLATFORM_SECURITY_PATCH := 2099-12-31
VENDOR_SECURITY_PATCH := 2099-12-31
PLATFORM_VERSION := 16.1.0
BOARD_USES_QCOM_FBE_DECRYPTION := true

TARGET_RECOVERY_DEVICE_MODULES += libion libandroidicu vendor.display.config@1.0 vendor.display.config@2.0 libdisplayconfig.qti

# TWRP specific build flags
TW_THEME := portrait_hdpi
RECOVERY_SDCARD_ON_DATA := true
TARGET_RECOVERY_QCOM_RTC_FIX := true
TW_EXCLUDE_DEFAULT_USB_INIT := true
TW_EXTRA_LANGUAGES := true
TW_INCLUDE_NTFS_3G := true
TW_USE_TOOLBOX := true
TW_INCLUDE_RESETPROP := true
TW_INCLUDE_REPACKTOOLS := true
TW_INPUT_BLACKLIST := "hbtp_vm"
TW_BRIGHTNESS_PATH := "/sys/class/backlight/panel0-backlight/brightness"
TW_DEFAULT_BRIGHTNESS := 1200
TWRP_INCLUDE_LOGCAT := true
TARGET_USES_LOGD := true
TARGET_USES_MKE2FS := true
TW_NO_SCREEN_BLANK := true
TW_EXCLUDE_APEX := true

# Vibrator
TW_SUPPORT_INPUT_AIDL_HAPTICS := true

PRODUCT_PACKAGES += \
    vendor.qti.hardware.vibrator.service

RECOVERY_LIBRARY_SOURCE_FILES += \
    $(TARGET_OUT_SHARED_LIBRARIES)/libion.so \
    $(TARGET_OUT_SYSTEM_EXT_SHARED_LIBRARIES)/vendor.display.config@1.0.so \
    $(TARGET_OUT_SYSTEM_EXT_SHARED_LIBRARIES)/vendor.display.config@2.0.so \
    $(TARGET_OUT_SYSTEM_EXT_SHARED_LIBRARIES)/libdisplayconfig.qti.so

PRODUCT_COPY_FILES += \
    $(OUT_DIR)/target/product/alioth/obj/SHARED_LIBRARIES/libandroidicu_intermediates/libandroidicu.so:$(TARGET_COPY_OUT_RECOVERY)/root/system/lib64/libandroidicu.so \
    $(call find-copy-subdir-files,*,$(LOCAL_PATH)/prebuilt/modules,$(TARGET_COPY_OUT_RECOVERY)/root/vendor/lib/modules) \
    $(call find-copy-subdir-files,*,$(LOCAL_PATH)/prebuilt/firmware,$(TARGET_COPY_OUT_RECOVERY)/root/vendor/firmware)
    
# OEM otacert
PRODUCT_EXTRA_RECOVERY_KEYS += \
    vendor/recovery/security/miui
