//
//  CustomButton.m
//  Baci_cloudstar
//

#import "CustomButton.h"


@implementation CustomButton

-(id)initWithImage:(NSString *)image Frame:(CGRect)frame
{
	if(self = [super initWithFrame:frame])
	{
		[self setImage:[UIImage imageNamed:image] forStates:UIControlStateNormal];
		// When the button is pressed, draw to button with less opacity.
		self.adjustsImageWhenHighlighted = YES;
	}
	
	return self;	
}

@end
