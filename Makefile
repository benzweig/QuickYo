TARGET = iPhone:8.0:5.0
ARCHS = armv7 arm64

THEOS_DEVICE_IP ?= localhost
THEOS_DEVICE_PORT ?= 2222

THEOS_PACKAGE_DIR_NAME = debs

include theos/makefiles/common.mk

TWEAK_NAME = QuickYo
QuickYo_FILES = Tweak.xm
QuickYo_FRAMEWORKS = UIKit CoreGraphics

include $(THEOS_MAKE_PATH)/tweak.mk
