include theos/makefiles/common.mk

BUNDLE_NAME = QuickYo
QuickYo_FILES = QuickYo.mm
QuickYo_INSTALL_PATH = /Library/PreferenceBundles
QuickYo_FRAMEWORKS = UIKit
QuickYo_PRIVATE_FRAMEWORKS = Preferences

include $(THEOS_MAKE_PATH)/bundle.mk

internal-stage::
	$(ECHO_NOTHING)mkdir -p $(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences$(ECHO_END)
	$(ECHO_NOTHING)cp entry.plist $(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences/QuickYo.plist$(ECHO_END)
