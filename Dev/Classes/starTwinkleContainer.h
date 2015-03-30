//
//  starTwinkleContainer.h
//  Baci_cloudstar
//


#import <UIKit/UIKit.h>

@class starTwinkle;

@interface starTwinkleContainer : UIView {
	starTwinkle *star1;
	starTwinkle *star2;
	starTwinkle *star3;
}

- (id)init;

@property(nonatomic,retain)starTwinkle *star1;
@property(nonatomic,retain)starTwinkle *star2;
@property(nonatomic,retain)starTwinkle *star3;

@end
