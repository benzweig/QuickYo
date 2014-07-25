#import <Preferences/Preferences.h>

@interface QuickYoListController: PSListController {
}
@end

@implementation QuickYoListController
- (id)specifiers {
	if(_specifiers == nil) {
		_specifiers = [[self loadSpecifiersFromPlistName:@"QuickYo" target:self] retain];
	}
	return _specifiers;
}
@end

// vim:ft=objc
