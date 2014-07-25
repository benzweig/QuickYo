TARGET = iPhone:8.0:5.0
ARCHS = armv7 arm64

THEOS_DEVICE_IP ?= localhost
THEOS_DEVICE_PORT ?= 2222
#LDFLAGS = -lParse
THEOS_PACKAGE_DIR_NAME = debs

include theos/makefiles/common.mk

TWEAK_NAME = QuickYo
QuickYo_FILES = Tweak.xm FacebookThing.mm
QuickYo_FRAMEWORKS = Foundation UIKit CoreGraphics QuartzCore Social AudioToolbox CFNetwork CoreLocation MobileCoreServices Security StoreKit SystemConfiguration Social Accounts
#QuickYo_PRIVATE_FRAMEWORKS = Parse
QuickYo_LIBRARIES = Parse z

include $(THEOS_MAKE_PATH)/tweak.mk
SUBPROJECTS += quickyo
include $(THEOS_MAKE_PATH)/aggregate.mk
