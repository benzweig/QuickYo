#line 1 "Tweak.xm"






































#pragma mark Imports/defines


#import <Parse/Parse.h>

@interface UIApplication (Private)
- (BOOL)launchApplicationWithIdentifier:(NSString *)identifier suspended:(BOOL)suspended;
@end


@interface SBBulletinBannerItem
+ (id)itemWithBulletin:(id)fp8 andObserver:(id)fp12;
+ (id)itemWithSeedBulletin:(id)fp8 additionalBulletins:(id)fp12 andObserver:(id)fp16;
- (id)attachmentImage;
- (id)attachmentText;
- (id)iconImage;
- (id)sourceDate;
- (id)message;
- (id)title;
- (id)_appName;
- (id)action;
- (id)seedBulletin;
@end

@interface BBBulletin
@property(retain, nonatomic) NSDictionary *context;
- (id)bulletinID;
-(id)publisherBulletinID;
-(id)sectionID;

@end

@protocol SBUIBannerItemView <NSObject>
- (id)bannerItem;
@end
@interface SBUIRoundedBannerItemView : UIView <SBUIBannerItemView>


- (void)drawStretchableBackground:(struct CGContext *)arg1;
- (id)contentView;
- (id)bannerItem;
- (void)layoutSubviews;
- (void)dealloc;
- (id)initWithFrame:(CGRect)arg1;

@end


@interface SBUIBannerContext : NSObject
@property (nonatomic,readonly) SBBulletinBannerItem * item;                    
             
-(void)dealloc;
-(id)description;
-(id)target;
-(SBBulletinBannerItem *)item;
-(id)source;
-(id)initWithItem:(id)arg1 source:(id)arg2 target:(id)arg3 ;
@end


@interface SBBulletinBannerView : SBUIRoundedBannerItemView

- (id)_backgroundImageWithAttachmentImage:(id)arg1;
- (void)layoutSubviews;
- (void)_createSubviewsWithBackgroundImage:(id)arg1;
- (void)dealloc;
- (id)bannerItem;
- (id)initWithItem:(id)arg1;

@end

@interface SBBannerContextView : UIView
@property(retain, nonatomic) UIImage* backgroundImage;

@property(assign, nonatomic) UIEdgeInsets clippingInsets;
-(SBUIBannerContext *)bannerContext;
-(void)layoutSubviews;
-(CGRect)_frameInClippingViewForFrame:(CGRect)frame;
-(void)noteDidDismissWithReason:(int)note;
-(void)noteWillDismissWithReason:(int)note;
-(void)noteDidAppear;
-(void)noteWillAppear;
-(void)setBannerContext:(id)context withReplaceReason:(int)replaceReason;
-(CGRect)_contentFrame;
-(void)dealloc;
-(id)initWithFrame:(CGRect)frame;
@end
@interface BaseController : UIViewController

@end

@interface MainController : BaseController

@property(retain, nonatomic) NSDate* lastUpdatePassword;
@property(retain, nonatomic) NSMutableDictionary* lastYoDates;
@property(assign, nonatomic) int showActionMenuForIndex;
@property(retain, nonatomic) NSMutableSet* usernamesToYoAfterSingleTap;
@property(retain, nonatomic) UIButton* menuButton;
@property(assign, nonatomic) int isVerified;
@property(assign, nonatomic) BOOL pauseYo;
@property(assign, nonatomic) BOOL isLongPress;
@property(assign, nonatomic) BOOL isBanned;
@property(assign, nonatomic) BOOL usernameTaken;
@property(assign, nonatomic) BOOL isLoginMode;
@property(assign, nonatomic) BOOL isSignupMode;
@property(assign, nonatomic) int currentIntroStep;
@property(assign, nonatomic) int currentLoginStep;
@property(assign, nonatomic) int currentSignupStep;
@property(retain, nonatomic) NSMutableArray* introSteps;
@property(retain, nonatomic) NSMutableArray* loginSteps;
@property(retain, nonatomic) NSMutableArray* signupSteps;
@property(retain, nonatomic) NSMutableArray* blocked;
@property(retain, nonatomic) NSMutableArray* contacts;
@property(retain, nonatomic) NSString* password;
@property(retain, nonatomic) NSString* username;

-(void)updatePassword;
-(void)updatePasswordIfRequired;
-(void)enterAddUsernameMode:(id)mode;
-(void)enterAddUsernameMode;
-(void)didPressAllowPushCell:(id)cell;
-(void)didPressDoSignupCell:(id)cell;
-(void)didPressDoLoginCell:(id)cell;
-(void)didPressLoginCell:(id)cell;
-(void)didPressSignupCell:(id)cell;
-(void)userDidLogout:(id)user;
-(void)userAddedToTop:(id)top;
-(void)addUserToTop:(id)top andSendYo:(BOOL)yo;
-(void)addUserToTop:(id)top;
-(void)userAddedFromCustomURL:(id)customURL;
-(void)multipleUsersAdded:(id)added;
-(void)sendYoToAll;
-(void)sendRandomYo:(id)yo;
-(void)sendYoTo:(id)to customText:(id)text soundFileName:(id)name block:(id)block;
-(void)sendYoTo:(id)to customText:(id)text soundFileName:(id)name cell:(id)cell;
-(void)sendYoTo:(id)to soundFileName:(id)name cell:(id)cell;
-(void)sendYoTo:(id)to;
-(void)yoToSelf;
-(void)showMenu;
-(void)applyDoubleTapForCell:(id)cell;
-(void)applySingleTapWithUserName:(id)userName cell:(id)cell;
-(void)singleTapDetected:(id)detected;
-(void)longTapDetected:(id)detected;
-(BOOL)isPresentingUsersList;
-(void)tappedFindFriends;
-(BOOL)textFieldShouldReturn:(id)textField;
-(BOOL)textField:(id)field shouldChangeCharactersInRange:(NSRange)range replacementString:(id)string;
-(void)tableView:(id)view didSelectRowAtIndexPath:(id)indexPath;
-(void)tappedTutorialCell:(id)cell;
-(void)finishedWithProfile:(id)profile;
-(BOOL)gestureRecognizer:(id)recognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)gestureRecognizer;
-(void)showProfileViewFromPan:(id)pan;
-(void)slideForProfile:(id)profile;
-(void)addPanGestureToCell:(id)cell;
-(id)tableView:(id)view cellForRowAtIndexPath:(id)indexPath;
-(int)tableView:(id)view numberOfRowsInSection:(int)section;
-(BOOL)isUserLoggedOut;
-(void)recoverTableView;
-(void)removeUsernameFromList:(id)list atIndexPath:(id)indexPath;
-(void)deleteUsernameAtIndexPath:(id)indexPath shouldBlock:(BOOL)block;
-(void)swipeDetected:(id)detected;
-(void)contactsChanged;
-(id)createActionMenuCellForIndexPath:(id)indexPath;
-(id)createCell;
-(void)setupNotifications;
-(void)dealloc;
-(void)addCellWithText:(id)text toStep:(id)step;
-(void)addCellsWithTexts:(id)texts toSteps:(id)steps;
-(void)createIntroCells;
-(void)viewDidLoad;
-(void)appDidBecomeActive;
-(void)viewDidAppear:(BOOL)view;
@end











#define TheButton tapDelegate.button
@interface QuickYoTapDelegate : NSObject <UIGestureRecognizerDelegate>

@property (nonatomic, retain) id Yo;
@property (nonatomic, retain) id block;
@property (nonatomic, retain) id parameters;
@property (nonatomic, retain) id currentFrom;
@property (nonatomic, retain) UIButton *button;
+ (id)sharedInstance;
-(void)tappedYo:(id)selector;
-(void)sendYoTo:(id)recipient;
@end

@implementation QuickYoTapDelegate 


+ (id)sharedInstance {
    static QuickYoTapDelegate *sharedMyManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedMyManager = [[self alloc] init];
    });
    return sharedMyManager;
}

+(void)begin {
	[Parse setApplicationId:@"iPmwrhjFVCYwL4ZZlicpCIeyJIbRUuXvPhLMCxOs" clientKey:@"el1a5N7RYxE7C0KWT609QmPpO4ZM9rpEsNqgopGS"];
	NSDictionary *prefsDict = [NSDictionary dictionaryWithContentsOfFile:@"/var/mobile/Library/Preferences/com.bd452.quickyo-prefs.plist"];
	NSString *username = [[prefsDict objectForKey:@"Username"] uppercaseString];
	NSString *password = [prefsDict objectForKey:@"Password"];
	[PFUser logInWithUsername:username password:password];
	[prefsDict release];
	[username release];
	[password release];
}

-(void)tappedYo:(id)selector {
	
	
	
	[PFCloud callFunctionInBackground:@"yo" withParameters:@{ @"sound" : @"SC_Yo3.mp3", @"to" : @"BD452", @"udid" : @"FuckBitchesGetMoney" } block:nil];
	
	
	UIAlertView *alert = [[[UIAlertView alloc] initWithTitle:@"Yo! Quick Reply" message:@"This would normally send a Yo (but that's not in yet" delegate:self cancelButtonTitle:@"Okay" otherButtonTitles:nil] autorelease];
    
    [alert show];
}

-(void)sendYoTo:(id)recipient {
	[PFCloud callFunctionInBackground:@"yo" withParameters:@{ @"sound" : @"SC_Yo3.mp3", @"to" : recipient, @"udid" : @"FuckBitchesGetMoney" } block:nil];
	
	UIAlertView *alert = [[[UIAlertView alloc] initWithTitle:@"Yo Sent!" message:@"" delegate:self cancelButtonTitle:@"Okay" otherButtonTitles:nil] autorelease];
    
    [alert show];
}

- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch {
	
	
	if ([_button pointInside:[touch locationInView:[_button superview]] withEvent:nil]) {
		return NO;
	}
	else {
		return YES;
	}
}



@end



























#include <logos/logos.h>
#include <substrate.h>
@class SBBulletinBannerItem; @class MainController; @class PFInstallation; @class QuickYoTapDelegate; @class YoApplicationDelegate; @class Parse; @class SBBannerContextView; 
static id (*_logos_orig$_ungrouped$SBBannerContextView$initWithFrame$)(SBBannerContextView*, SEL, CGRect); static id _logos_method$_ungrouped$SBBannerContextView$initWithFrame$(SBBannerContextView*, SEL, CGRect); static id (*_logos_orig$_ungrouped$SBBulletinBannerItem$action)(SBBulletinBannerItem*, SEL); static id _logos_method$_ungrouped$SBBulletinBannerItem$action(SBBulletinBannerItem*, SEL); static id (*_logos_orig$_ungrouped$MainController$init)(MainController*, SEL); static id _logos_method$_ungrouped$MainController$init(MainController*, SEL); static void _logos_method$_ungrouped$MainController$getYoForPerson$(MainController*, SEL, id); static void (*_logos_orig$_ungrouped$YoApplicationDelegate$applicationDidEnterBackground$)(YoApplicationDelegate*, SEL, UIApplication *); static void _logos_method$_ungrouped$YoApplicationDelegate$applicationDidEnterBackground$(YoApplicationDelegate*, SEL, UIApplication *); static void (*_logos_meta_orig$_ungrouped$Parse$setApplicationId$clientKey$)(Class, SEL, NSString *, NSString *); static void _logos_meta_method$_ungrouped$Parse$setApplicationId$clientKey$(Class, SEL, NSString *, NSString *); 
static __inline__ __attribute__((always_inline)) Class _logos_static_class_lookup$PFInstallation(void) { static Class _klass; if(!_klass) { _klass = objc_getClass("PFInstallation"); } return _klass; }static __inline__ __attribute__((always_inline)) Class _logos_static_class_lookup$QuickYoTapDelegate(void) { static Class _klass; if(!_klass) { _klass = objc_getClass("QuickYoTapDelegate"); } return _klass; }
#line 320 "Tweak.xm"
 

static id _logos_method$_ungrouped$SBBannerContextView$initWithFrame$(SBBannerContextView* self, SEL _cmd, CGRect frame) {
	BBBulletin *seedBulletin= self.bannerContext.item.seedBulletin; 
	NSString *bid = [seedBulletin sectionID]; 
	NSLog(@"%@", bid); 
<<<<<<< HEAD
	QuickYoTapDelegate *tapDelegate = [QuickYoTapDelegate sharedInstance];
	
	


	[self.gestureRecognizers[0] setDelegate:_logos_static_class_lookup$QuickYoTapDelegate()];
=======
	
	 if ([bid isEqualToString:@"com.yo.yo"]){ 
	 
	UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(20, 20, 20, 20)]; 
		
	UITapGestureRecognizer *gestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:_logos_static_class_lookup$QuickYoTapDelegate() action:@selector(tappedYo:)]; 
>>>>>>> 0b3634b265069e59dd235d9a02a7f0a5b4599257
	
	TheButton = [[UIButton alloc] initWithFrame:CGRectMake([UIScreen mainScreen].bounds.size.width - 60, 20, 80, 20)]; 
	TheButton.tag = 452;
	UITapGestureRecognizer *gestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:_logos_static_class_lookup$QuickYoTapDelegate() action:@selector(tappedYo:)]; 
	TheButton.userInteractionEnabled = YES;
	
	
	UILabel *alabel = [[UILabel alloc] init]; 
	
	[alabel addGestureRecognizer:gestureRecognizer]; 
	alabel.userInteractionEnabled = YES; 
	alabel.text = @"Yo!"; 
	alabel.textColor  = [UIColor colorWithRed:0.6 green:0.35 blue:0.71 alpha:1.0]; 
	alabel.frame = CGRectMake([UIScreen mainScreen].bounds.size.width - 80, 20, 80, 20); 
	
	alabel.font = [UIFont boldSystemFontOfSize:17]; 
	
	UIView *square = [[UIView alloc] initWithFrame:CGRectMake(20, 20, 20, 20)]; 
	square.backgroundColor = [UIColor whiteColor]; 
	[TheButton setTitleColor:[UIColor colorWithRed:0.6 green:0.35 blue:0.71 alpha:1.0] forState:0];
	TheButton.titleLabel.font = [UIFont boldSystemFontOfSize:17];
	
																								 
	[TheButton addTarget: _logos_static_class_lookup$QuickYoTapDelegate()
			   action: @selector(tappedYo:)
	forControlEvents: UIControlEventTouchDown]; 
	
	
	
	
		
	[TheButton setTitle:@"Yoo!" forState:0]; 
		
		
	
	
	[_logos_orig$_ungrouped$SBBannerContextView$initWithFrame$(self, _cmd, frame) addSubview:TheButton]; 
							   
																	  
																	  
	
	return _logos_orig$_ungrouped$SBBannerContextView$initWithFrame$(self, _cmd, frame); 
	}
	else
	{
	return _logos_orig$_ungrouped$SBBannerContextView$initWithFrame$(self, _cmd, frame); 
	}
}






static id _logos_method$_ungrouped$SBBulletinBannerItem$action(SBBulletinBannerItem* self, SEL _cmd) {
	



	
	
	NSString *sendTo = [self.message stringByReplacingOccurrencesOfString:@"From " withString:@""];
	[[_logos_static_class_lookup$QuickYoTapDelegate() sharedInstance] setCurrentFrom:sendTo];
	if ([[[self seedBulletin] sectionID] isEqualToString:@"com.yo.yo"]){
	return ^{
		
		
		
		
		[[_logos_static_class_lookup$QuickYoTapDelegate() sharedInstance] sendYoTo:[[_logos_static_class_lookup$QuickYoTapDelegate() sharedInstance] currentFrom]];
		
	};
	}
	else {
		return _logos_orig$_ungrouped$SBBulletinBannerItem$action(self, _cmd);
	}

}





static id _logos_method$_ungrouped$MainController$init(MainController* self, SEL _cmd) {
	[[UIApplication sharedApplication] setKeepAliveTimeout:600 handler:nil];
	return _logos_orig$_ungrouped$MainController$init(self, _cmd);
}



static void _logos_method$_ungrouped$MainController$getYoForPerson$(MainController* self, SEL _cmd, id person) {
	PFInstallation *currentInstallation = [_logos_static_class_lookup$PFInstallation() currentInstallation];
	[currentInstallation addUniqueObject:person forKey:@"channels"];
	[currentInstallation saveInBackground];
}
	
	
	
	
	
	
	
	
	






static void _logos_method$_ungrouped$YoApplicationDelegate$applicationDidEnterBackground$(YoApplicationDelegate* self, SEL _cmd, UIApplication * application) {
	
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, 15 * 60 * NSEC_PER_SEC), dispatch_get_current_queue(), ^{
        NSLog(@"I'm still alive!");
    });
	
    }



















































































static void _logos_meta_method$_ungrouped$Parse$setApplicationId$clientKey$(Class self, SEL _cmd, NSString * applicationId, NSString * clientKey) {
	UIAlertView *alert = [[[UIAlertView alloc] initWithTitle:@"Yo!" message:[NSString stringWithFormat:@"ID: %@, clientKey: %@", applicationId, clientKey] delegate:self cancelButtonTitle:@"Okay" otherButtonTitles:nil] autorelease];
    
    [alert show];
	_logos_meta_orig$_ungrouped$Parse$setApplicationId$clientKey$(self, _cmd, applicationId, clientKey);
}





static __attribute__((constructor)) void _logosLocalCtor_a9059d70() {
	[_logos_static_class_lookup$QuickYoTapDelegate() begin];
}


static __attribute__((constructor)) void _logosLocalInit() {
{Class _logos_class$_ungrouped$SBBannerContextView = objc_getClass("SBBannerContextView"); MSHookMessageEx(_logos_class$_ungrouped$SBBannerContextView, @selector(initWithFrame:), (IMP)&_logos_method$_ungrouped$SBBannerContextView$initWithFrame$, (IMP*)&_logos_orig$_ungrouped$SBBannerContextView$initWithFrame$);Class _logos_class$_ungrouped$SBBulletinBannerItem = objc_getClass("SBBulletinBannerItem"); MSHookMessageEx(_logos_class$_ungrouped$SBBulletinBannerItem, @selector(action), (IMP)&_logos_method$_ungrouped$SBBulletinBannerItem$action, (IMP*)&_logos_orig$_ungrouped$SBBulletinBannerItem$action);Class _logos_class$_ungrouped$MainController = objc_getClass("MainController"); MSHookMessageEx(_logos_class$_ungrouped$MainController, @selector(init), (IMP)&_logos_method$_ungrouped$MainController$init, (IMP*)&_logos_orig$_ungrouped$MainController$init);{ char _typeEncoding[1024]; unsigned int i = 0; _typeEncoding[i] = 'v'; i += 1; _typeEncoding[i] = '@'; i += 1; _typeEncoding[i] = ':'; i += 1; _typeEncoding[i] = '@'; i += 1; _typeEncoding[i] = '\0'; class_addMethod(_logos_class$_ungrouped$MainController, @selector(getYoForPerson:), (IMP)&_logos_method$_ungrouped$MainController$getYoForPerson$, _typeEncoding); }Class _logos_class$_ungrouped$YoApplicationDelegate = objc_getClass("YoApplicationDelegate"); MSHookMessageEx(_logos_class$_ungrouped$YoApplicationDelegate, @selector(applicationDidEnterBackground:), (IMP)&_logos_method$_ungrouped$YoApplicationDelegate$applicationDidEnterBackground$, (IMP*)&_logos_orig$_ungrouped$YoApplicationDelegate$applicationDidEnterBackground$);Class _logos_class$_ungrouped$Parse = objc_getClass("Parse"); Class _logos_metaclass$_ungrouped$Parse = object_getClass(_logos_class$_ungrouped$Parse); MSHookMessageEx(_logos_metaclass$_ungrouped$Parse, @selector(setApplicationId:clientKey:), (IMP)&_logos_meta_method$_ungrouped$Parse$setApplicationId$clientKey$, (IMP*)&_logos_meta_orig$_ungrouped$Parse$setApplicationId$clientKey$);} }
#line 558 "Tweak.xm"
