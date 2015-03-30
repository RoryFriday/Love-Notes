//
//  Baci01AppDelegate.h
//  Baci01
//

#import <UIKit/UIKit.h>

@class SplashController;

@interface LoveNoteAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
	SplashController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet SplashController *viewController;

@end

