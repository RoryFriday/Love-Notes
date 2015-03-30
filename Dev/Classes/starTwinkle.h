//
//  starTwinkle.h
//  Baci_cloudstar
//


#import <UIKit/UIKit.h>


@interface starTwinkle : UIView {
	UIImage *starImage;
	UIImageView* glow;
}

@property (nonatomic,retain) UIImage *starImage;

- (id)initWithInterval:(int)interval Image:(NSString *)imageName;

@end
