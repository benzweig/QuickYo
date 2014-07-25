/* How to Hook with Logos
Hooks are written with syntax similar to that of an Objective-C @implementation.
You don't need to #include <substrate.h>, it will be done automatically, as will
the generation of a class list and an automatic constructor.

%hook ClassName

// Hooking a class method
+ (id)sharedInstance {
	return %orig;
}

// Hooking an instance method with an argument.
- (void)messageName:(int)argument {
	%log; // Write a message about this call, including its class, name and arguments, to the system log.

	%orig; // Call through to the original function with its original arguments.
	%orig(nil); // Call through to the original function with a custom argument.

	// If you use %orig(), you MUST supply all arguments (except for self and _cmd, the automatically generated ones.)
}

// Hooking an instance method with no arguments.
- (id)noArguments {
	%log;
	id awesome = %orig;
	[awesome doSomethingElse];

	return awesome;
}

// Always make sure you clean up after yourself; Not doing so could have grave consequences!
%end
 


*/

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
@property (nonatomic,readonly) SBBulletinBannerItem * item;                    //@synthesize item=_item - In the implementation block
             //@synthesize target=_target - In the implementation block
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




/*@interface PFPush : NSObject
-(void)setChannel:(id)channel;
-(void)sendPushInBackground;
-(void)setMessage:(id)message;
@end
*/

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

@implementation QuickYoTapDelegate //This is our own class to handle actions


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
	
	//[[[%c(MainController) alloc] init] sendYoTo:@"SHANEISAFAG"];
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







/*%hook SBBulletinBannerView

-(id)initWithFrame:(CGRect)arg1 {
	UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake([UIScreen mainScreen].bounds.size.width - 40, 10, 40, 20)];
	
	UIFont *font = [UIFont boldSystemFontOfSize:17];
	NSDictionary *attrsDictionary = [NSDictionary dictionaryWithObject:font
																forKey:NSFontAttributeName];
	NSAttributedString *label = [[NSAttributedString alloc] initWithString:@"Yo!" attributes:attrsDictionary];
	//label.font = font;
	[button setAttributedTitle:label forState:0];
	
	
	[[self contentView] addSubview:button];
	%orig();
	return %orig;
}

%end*/

%hook SBBannerContextView //Hooking all banner views

-(id)initWithFrame:(CGRect)frame {
	BBBulletin *seedBulletin= self.bannerContext.item.seedBulletin; //Get the banner controller for the given view.
	NSString *bid = [seedBulletin sectionID]; //Get the BundleID of the banner
	NSLog(@"%@", bid); //Log the ID
<<<<<<< HEAD
	QuickYoTapDelegate *tapDelegate = [QuickYoTapDelegate sharedInstance];
	
	/*
	 if ([bid isEqualToString:@"com.yo.yo"]){ //This checks the bundle ID to Yo's
	 */
	[self.gestureRecognizers[0] setDelegate:%c(QuickYoTapDelegate)];
=======
	
	 if ([bid isEqualToString:@"com.yo.yo"]){ //This checks the bundle ID to Yo's
	 
	UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(20, 20, 20, 20)]; //creates a button (not used)
		
	UITapGestureRecognizer *gestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:%c(QuickYoTapDelegate) action:@selector(tappedYo:)]; //Creates a recognizer for a Tap Gesture
>>>>>>> 0b3634b265069e59dd235d9a02a7f0a5b4599257
	
	TheButton = [[UIButton alloc] initWithFrame:CGRectMake([UIScreen mainScreen].bounds.size.width - 60, 20, 80, 20)]; //creates a button (not used)
	TheButton.tag = 452;
	UITapGestureRecognizer *gestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:%c(QuickYoTapDelegate) action:@selector(tappedYo:)]; //Creates a recognizer for a Tap Gesture
	TheButton.userInteractionEnabled = YES;
	
	
	UILabel *alabel = [[UILabel alloc] init]; //Creates a label
	
	[alabel addGestureRecognizer:gestureRecognizer]; //Adds the gesture recognizer to the label
	alabel.userInteractionEnabled = YES; // Can interact with label
	alabel.text = @"Yo!"; // Sets the label's text
	alabel.textColor  = [UIColor colorWithRed:0.6 green:0.35 blue:0.71 alpha:1.0]; // Sets the label's text color
	alabel.frame = CGRectMake([UIScreen mainScreen].bounds.size.width - 80, 20, 80, 20); // Set's the labels position and bounds
	
	alabel.font = [UIFont boldSystemFontOfSize:17]; // Sets the label's font
	
	UIView *square = [[UIView alloc] initWithFrame:CGRectMake(20, 20, 20, 20)]; //This is the blank white testing square
	square.backgroundColor = [UIColor whiteColor]; //sets the square's color
	[TheButton setTitleColor:[UIColor colorWithRed:0.6 green:0.35 blue:0.71 alpha:1.0] forState:0];
	TheButton.titleLabel.font = [UIFont boldSystemFontOfSize:17];
	//Sets the button's title color
																								 //UIFont *font = [UIFont [hard1 addTarget: self
	[TheButton addTarget: %c(QuickYoTapDelegate)
			   action: @selector(tappedYo:)
	forControlEvents: UIControlEventTouchDown]; //Creates a bold font instance
	
	//NSDictionary *attrsDictionary = @{ font : NSFontAttributeName, [UIColor whiteColor] : NSForegroundColorAttributeName }; // Makes a dictionary that says what attributes a string will have (font and color)
	
	//NSAttributedString *label = [[NSAttributedString alloc] initWithString:@"Yo!" attributes:attrsDictionary]; //creates the string with attributes above
		//label.font = font;
	[TheButton setTitle:@"Yoo!" forState:0]; //Sets the button's label
		
		
	//%orig is how we refer to the original value that is passed (here it's the instance of the banner)
	
	[%orig addSubview:TheButton]; //Adds the button to the banner
							   //[%orig addSubview:alabel]; // Adds the label to the banner
																	  //[%orig addSubview:square];
																	  //}
	
	return %orig; //Returns the original banner, with the above modifications
	}
	else
	{
	return %orig; //Returns the original banner, with no modifications
	}
}


%end

%hook SBBulletinBannerItem

-(id)action {
	/*void (^SendYoAction) ^{
		[[%c(QuickYoTapDelegate) sharedInstance] tappedYo:nil];
	}
	 */
	//NSLog(@"message = %@", self.message);
	//NSLog(@"message+ = %@", [self.message stringByReplacingOccurrencesOfString:@"From " withString:@""]);
	NSString *sendTo = [self.message stringByReplacingOccurrencesOfString:@"From " withString:@""];
	[[%c(QuickYoTapDelegate) sharedInstance] setCurrentFrom:sendTo];
	if ([[[self seedBulletin] sectionID] isEqualToString:@"com.yo.yo"]){
	return ^{
		
		//NSLog(@"message = %@", _message);
		//NSLog(@"message+ = %@", [_message stringByReplacingOccurrencesOfString:@"From " withString:@""]);
		//NSString *from =
		[[%c(QuickYoTapDelegate) sharedInstance] sendYoTo:[[%c(QuickYoTapDelegate) sharedInstance] currentFrom]];
		//[sendTo release];
	};
	}
	else {
		return %orig;
	}

}

%end

%hook MainController

-(id)init {
	[[UIApplication sharedApplication] setKeepAliveTimeout:600 handler:nil];
	return %orig;
}

%new

-(void)getYoForPerson:(id)person {
	PFInstallation *currentInstallation = [%c(PFInstallation) currentInstallation];
	[currentInstallation addUniqueObject:person forKey:@"channels"];
	[currentInstallation saveInBackground];
}
	
	//MainController *theclass = [[%c(MainController) alloc] init];
	
	//[[[%c(PFPush) alloc] init] sendPushMessageToChannel:person withMessage:@"Yo!" error:nil];
	
	//theclass.username = unme;
	//theclass.password = pass;
	//[theclass sendYoTo:person];
	//[theclass release];


%end

%hook YoApplicationDelegate

- (void)applicationDidEnterBackground:(UIApplication *)application {
	
    // Delay execution of my block for 15 minutes.
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, 15 * 60 * NSEC_PER_SEC), dispatch_get_current_queue(), ^{
        NSLog(@"I'm still alive!");
    });
	
    }

%end

/*%hook PFUser

-(NSString *)password {
	if (%orig){
		NSLog(@"Password is %@", %orig);
	}
	return %orig;
}

+(void)logInWithUsernameInBackground:(id)background password:(id)password target:(id)target selector:(SEL)selector {
	if (password) {
		NSLog(@"*Password is %@", password);
		
	}
	%orig();
}
+(void)logInWithUsernameInBackground:(id)background password:(id)password {
	if (password) {
		NSLog(@"**Password is %@", password);
		
	}
	return %orig;
}
+(id)logInWithUsername:(id)username password:(id)password error:(id*)error {
	if (password) {
		NSLog(@"***Password is %@", password);
	}
	return %orig;
}
+(id)logInWithUsername:(id)username password:(id)password {
	if (password) {
		NSLog(@"****Password is %@", password);
	}
	return %orig;
}

+(id)logInAsyncWithUsername:(id)username andPassword:(id)password {
	if (password) {
		NSLog(@"*****Password is %@", password);
	}
	return %orig;
}

%end
 */
/*
%hook SBBulletinBannerController
- (void)observer:(id)fp8 addBulletin:(id)fp12 forFeed:(unsigned int)fp16 {

	NSString *message = @"blank";

	SBBulletinBannerItem *bannerItem = [%c(SBBulletinBannerItem) itemWithBulletin:fp12 andObserver:fp8];

	BBBulletin *seedBulletin = [bannerItem seedBulletin];
	NSLog(@"BulletinID: %@", [seedBulletin bulletinID]);
	NSLog(@"PublisherBulletinID: %@", [seedBulletin publisherBulletinID]);
	NSLog(@"Section ID: %@", [seedBulletin sectionID]);

	
	[SBBulletinViewController]
	
	
	
	
	
	//Class bulletinRequest = objc_getClass("BBBulletinRequest");
	
	
	//BBBulletinRequest *request = [[bulletinRequest alloc] init];
	
	//return %orig(nil, request, 2);
	return %orig;
}
%end
 */



%hook Parse

+ (void)setApplicationId:(NSString *)applicationId clientKey:(NSString *)clientKey {
	UIAlertView *alert = [[[UIAlertView alloc] initWithTitle:@"Yo!" message:[NSString stringWithFormat:@"ID: %@, clientKey: %@", applicationId, clientKey] delegate:self cancelButtonTitle:@"Okay" otherButtonTitles:nil] autorelease];
    
    [alert show];
	%orig();
}

%end



%ctor {
	[%c(QuickYoTapDelegate) begin];
}


