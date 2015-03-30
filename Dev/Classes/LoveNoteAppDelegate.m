//
//  Baci01AppDelegate.m
//  Baci01
//


#import "LoveNoteAppDelegate.h"
#import "SplashController.h"

@implementation LoveNoteAppDelegate

@synthesize window;
@synthesize viewController;


- (void)applicationDidFinishLaunching:(UIApplication *)application {    
    
	[application setStatusBarStyle:UIStatusBarStyleBlackOpaque];
	
    // Override point for customization after app launch
	SplashController *aViewController = [[SplashController alloc] initWithNibName:@"SplashController" bundle:[NSBundle mainBundle]];
	self.viewController = aViewController;
	[aViewController release];
	
    [window addSubview:viewController.view];
    [window makeKeyAndVisible];
}


- (void)dealloc {
    [viewController release];
    [window release];
    [super dealloc];
}


@end
