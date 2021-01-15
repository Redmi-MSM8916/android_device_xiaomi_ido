#
# Copyright (C) 2016 The CyanogenMod Project
# Copyright (C) 2018 The LineageOS Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

# Inherit from msm8916-common
include device/cyanogen/msm8916-common/BoardConfigCommon.mk

PRODUCT_ENFORCE_VINTF_MANIFEST := true
PRODUCT_USES_QCOM_HARDWARE := true
PRODUCT_BOARD_PLATFORM := msm8916
QCOM_HARDWARE_VARIANT := msm8916
BUILD_BROKEN_DUP_RULES := true
BUILD_BROKEN_USES_BUILD_COPY_HEADERS := true
TEMPORARY_DISABLE_PATH_RESTRICTIONS := true
TARGET_OTA_ALLOW_NON_AB := true
BUILD_BROKEN_PREBUILT_ELF_FILES := true
PRODUCT_ENFORCE_VINTF_MANIFEST_OVERRIDE := true
TARGET_DISABLE_POSTRENDER_CLEANUP := true

DEVICE_PATH := device/xiaomi/ido

# Audio
AUDIO_FEATURE_ENABLED_ANC_HEADSET := true
AUDIO_FEATURE_ENABLED_ACDB_LICENSE := true
AUDIO_FEATURE_ENABLED_EXTN_FORMATS := true
AUDIO_FEATURE_ENABLED_KPI_OPTIMIZE := true
USE_XML_AUDIO_POLICY_CONF := 1

# Bluetooth
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := $(DEVICE_PATH)/bluetooth

# Camera
USE_DEVICE_SPECIFIC_CAMERA := true
TARGET_PROCESS_SDK_VERSION_OVERRIDE += \
    /system/bin/cameraserver=23 \
    /system/bin/mediaserver=23

# Charger
BOARD_CHARGER_ENABLE_SUSPEND := true
BOARD_CHARGER_DISABLE_INIT_BLANK := true

# memfd
TARGET_HAS_MEMFD_BACKPORT := true

# Filesystem
BOARD_FLASH_BLOCK_SIZE := 131072
BOARD_BOOTIMAGE_PARTITION_SIZE := 33554432
BOARD_CACHEIMAGE_PARTITION_SIZE := 274726912
BOARD_PERSISTIMAGE_PARTITION_SIZE := 33554432
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 33554432
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 2415919104
BOARD_USERDATAIMAGE_PARTITION_SIZE := 12066978816
BOARD_USERDATAIMAGE_FILE_SYSTEM_TYPE := ext4

# GPS
TARGET_NO_RPC := true
USE_DEVICE_SPECIFIC_GPS := true

# HIDL
#DEVICE_MANIFEST_FILE += $(DEVICE_PATH)/manifest.xml

# Init
TARGET_INIT_VENDOR_LIB := libinit_ido
TARGET_RECOVERY_DEVICE_MODULES := libinit_ido

# Kernel
BOARD_KERNEL_IMAGE_NAME := Image.gz-dtb
#TARGET_KERNEL_SOURCE := kernel/xiaomi/msm8916
TARGET_KERNEL_CONFIG := mokee_ido_defconfig
BOARD_KERNEL_CMDLINE += androidboot.selinux=permissive
BOARD_KERNEL_TAGS_OFFSET := 0x00000100
BOARD_RAMDISK_OFFSET     := 0x02000000

# Power
TARGET_HAS_NO_POWER_STATS := true

# Properties
TARGET_SYSTEM_PROP += $(DEVICE_PATH)/system.prop

# Recovery
TARGET_RECOVERY_FSTAB := $(DEVICE_PATH)/rootdir/etc/fstab.qcom
BOARD_NO_SECURE_DISCARD := true

# SELinux
BOARD_SEPOLICY_DIRS += \
    $(DEVICE_PATH)/sepolicy

# Shims
TARGET_LD_SHIM_LIBS += \
    /system/vendor/lib64/hw/android.hardware.bluetooth@1.0-impl-qti.so|libbase-v28.so \
    /system/vendor/lib64/libril-qc-qmi-1.so|libshim_audioclient.so \
    /system/vendor/bin/mm-qcamera-daemon|libshim_camera.so:/system/vendor/bin/perfd|libshim_atomic.so \
    /system/vendor/lib/hw/sound_trigger.primary.msm8916.so|libshim_atomic.so

# inherit from the proprietary version
include vendor/xiaomi/ido/BoardConfigVendor.mk
