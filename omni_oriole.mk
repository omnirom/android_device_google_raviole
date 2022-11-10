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
DEVICE_PACKAGE_OVERLAYS += device/google/raviole/oriole/omni_overlay

TARGET_BOOTANIMATION_SIZE := 1080p

$(call inherit-product, vendor/omni/config/common.mk)

$(call inherit-product, device/google/gs101/aosp_common.mk)
$(call inherit-product, device/google/raviole/device-oriole.mk)

PRODUCT_NAME := omni_oriole
PRODUCT_DEVICE := oriole
PRODUCT_MODEL := AOSP on Oriole
PRODUCT_BRAND := Android
PRODUCT_MANUFACTURER := Google

# for bringup to disable secure adb - copy adbkey.pub from ~/.android
PRODUCT_ADB_KEYS := device/google/raviole/adbkey.pub
PRODUCT_PACKAGES += \
    adb_keys