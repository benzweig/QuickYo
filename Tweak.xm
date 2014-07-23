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



@interface QuickYoTapDelegate : NSObject <UIGestureRecognizerDelegate>
-(void)tappedYo:(id)selector;
@end

@implementation QuickYoTapDelegate //This is our own class to handle actions

-(void)tappedYo:(id)selector {
	UIAlertView *alert = [[[UIAlertView alloc] initWithTitle:@"Yo! Quick Reply" message:@"This would normally send a Yo (but that's not in yet" delegate:self cancelButtonTitle:@"Okay" otherButtonTitles:nil] autorelease];
    
    [alert show];
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
	/*
	 if ([bid isEqualToString:@"com.yo.yo"]){ //This checks the bundle ID to Yo's
	 */
	UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(20, 20, 20, 20)]; //creates a button (not used)
		
	UITapGestureRecognizer *gestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:%c(QuickYoTapDelegate) action:@selector(tappedYo:)]; //Creates a recognizer for a Tap Gesture
	
	
	
	UILabel *alabel = [[UILabel alloc] init]; //Creates a label
	
	[alabel addGestureRecognizer:gestureRecognizer]; //Adds the gesture recognizer to the label
	alabel.userInteractionEnabled = YES; // Can interact with label
	alabel.text = @"Yo!"; // Sets the label's text
	alabel.textColor  = [UIColor colorWithRed:0.6 green:0.35 blue:0.71 alpha:1.0]; // Sets the label's text color
	alabel.frame = CGRectMake([UIScreen mainScreen].bounds.size.width - 40, 20, 80, 20); // Set's the labels position and bounds
	
	alabel.font = [UIFont boldSystemFontOfSize:17]; // Sets the label's font
	
	UIView *square = [[UIView alloc] initWithFrame:CGRectMake(20, 20, 20, 20)]; //This is the blank white testing square
	square.backgroundColor = [UIColor whiteColor]; //sets the square's color
	[button setTitleColor:[UIColor whiteColor] forState:0]; //Sets the button's title color
	UIFont *font = [UIFont boldSystemFontOfSize:17]; //Creates a bold font instance
	
	NSDictionary *attrsDictionary = @{ font : NSFontAttributeName, [UIColor whiteColor] : NSForegroundColorAttributeName }; // Makes a dictionary that says what attributes a string will have (font and color)
	
	NSAttributedString *label = [[NSAttributedString alloc] initWithString:@"Yo!" attributes:attrsDictionary]; //creates the string with attributes above
		//label.font = font;
	[button setAttributedTitle:label forState:0]; //Sets the button's label
		
		
	[%orig addSubview:button]; //Adds the button to the banner
	[%orig addSubview:alabel]; // Adds the label to the banner
																	  //[%orig addSubview:square];
																	  //}
	
	return %orig;
}


%end
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


