# THEOS_DEVICE_IP = localhost -o StrictHostKeyChecking=no
# THEOS_DEVICE_PORT = 2222

ARCHS = arm64 arm64e

TARGET := iphone:clang:latest:12.0
INSTALL_TARGET_PROCESSES = ZeroTierPTP


include $(THEOS)/makefiles/common.mk

TWEAK_NAME = ZeroTieriOSFix

ZeroTieriOSFix_FILES = Tweak.x
ZeroTieriOSFix_CFLAGS = -fobjc-arc

# 支持无根越狱
ifeq ($(THEOS_PACKAGE_SCHEME),rootless)
    TARGET = iphone:clang:latest:15.0
    # THEOS_PLATFORM_SDK_ROOT = $(THEOS)/sdks/iPhoneOS16.5.sdk
    # THEOS_PLATFORM_DEVELOPER_PATH = $(THEOS)/toolchains/XcodeDefault.xctoolchain
    # THEOS_PLATFORM_SDK_VERSION = 16.5
endif

include $(THEOS_MAKE_PATH)/tweak.mk
