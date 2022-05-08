#
# Copyright 2020 The Android Open-Source Project
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

# must be before including vendor/omni
DEVICE_PACKAGE_OVERLAYS += device/google/raviole/oriole/overlay-omni

# Get the prebuilt list of APNs
$(call inherit-product, vendor/omni/config/gsm.mk)

TARGET_BOOTANIMATION_SIZE := 1080p

$(call inherit-product, vendor/omni/config/common.mk)
$(call inherit-product, device/google/gs101/device-omni.mk)
$(call inherit-product, device/google/raviole/aosp_oriole.mk)

PRODUCT_NAME := omni_oriole
PRODUCT_SYSTEM_DEVICE := oriole
PRODUCT_SYSTEM_MODEL := Pixel 6
PRODUCT_SYSTEM_NAME := oriole
PRODUCT_SYSTEM_MANUFACTURER := Google

PRODUCT_BUILD_PROP_OVERRIDES += \
    PRIVATE_BUILD_DESC="oriole-user 13 TP1A.221105.002 9080065 release-keys"

# TODO - could use PRODUCT_OVERRIDE_FINGERPRINT
# defined in vendor/google_devices/oriole/proprietary/BoardConfigVendor.mk
BUILD_FINGERPRINT := google/oriole/oriole:13/TP1A.221105.002/9080065:user/release-keys

PRODUCT_RESTRICT_VENDOR_FILES := false

# for bringup to disable secure adb - copy adbkey.pub from ~/.android
#PRODUCT_ADB_KEYS := device/google/raviole/adbkey.pub
#PRODUCT_PACKAGES += \
    adb_keys

#BOARD_BOOTCONFIG += androidboot.selinux=permissive
#BOARD_KERNEL_CMDLINE += androidboot.selinux=permissive

# HBM
PRODUCT_COPY_FILES += \
    device/google/raviole/permissions/permissions_com.android.hbmsvmanager.xml:$(TARGET_COPY_OUT_SYSTEM_EXT)/etc/permissions/permissions_com.android.hbmsvmanager.xml
