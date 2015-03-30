//
//  SplashController.h
//  Baci01
//


#import <UIKit/UIKit.h>
#import "LoveNoteViewController.h"

@class starTwinkleContainer;

@interface SplashController : UIViewController {
	LoveNoteViewController *viewController;
	starTwinkleContainer *twinkleContainer;
}

@property (nonatomic, retain) LoveNoteViewController *viewController;
@property (nonatomic, retain) starTwinkleContainer *twinkleContainer;

@end
