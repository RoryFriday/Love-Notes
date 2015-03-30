//
//  starTwinkle.m
//  Baci_cloudstar
//

#import "starTwinkle.h"


@implementation starTwinkle

@synthesize starImage;

NSTimer *twinkleTimer;

int wooshID;


- (void)glowEnd:(NSString *)animationID finished:(BOOL)finished context:(void *)context
{
	[UIView beginAnimations:nil context:nil];
	[UIView setAnimationDuration:0.25];

	glow.alpha = 0;
	
	[UIView commitAnimations];
}

- (void)glowBegin:(NSString *)animationID finished:(BOOL)finished context:(void *)context
{
	
	[UIView beginAnimations:nil context:nil];
	[UIView setAnimationDuration:0.1];
	[UIView setAnimationDelegate:self];
	[UIView setAnimationDidStopSelector:@selector(glowEnd:finished:context:)];
	
	glow.alpha = 1;
	
	[UIView commitAnimations];
}

- (void)twinkleStarEnd:(NSString *)animationID finished:(BOOL)finished context:(void *)context
{
	[UIView beginAnimations:nil	context:nil];
	[UIView setAnimationDuration:0.5];
	[UIView setAnimationDelegate:self];
	[UIView setAnimationDidStopSelector:@selector(glowBegin:finished:context:)];
	
	self.alpha = 1; 
	
	[UIView commitAnimations];
}

- (void)twinkleStarBegin
{
	[UIView beginAnimations:nil	context:nil];
	[UIView setAnimationDuration:0.5];
	[UIView setAnimationDelegate:self];
	[UIView setAnimationDidStopSelector:@selector(twinkleStarEnd:finished:context:)];
	
	self.alpha = 0.1; 
	
	[UIView commitAnimations];
}

- (id)initWithInterval:(int)interval Image:(NSString *)imageName;
{
	UIImage *image = [UIImage imageNamed:imageName];
	CGRect frame = CGRectMake(0, 0, image.size.width, image.size.height);
	
	if(self = [self initWithFrame:frame])
	{
		self.opaque = NO;
		starImage = image;
		
		glow = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"star-glow.png"]];
		glow.frame = CGRectMake(0, 0, 25, 25);
		glow.center = CGPointMake(4,4);
		glow.alpha = 0;
		[self addSubview:glow];
		
		// setup timer to periodically "twinkle" the star
		twinkleTimer = [NSTimer scheduledTimerWithTimeInterval:interval target:self selector:@selector(twinkleStarBegin) userInfo:nil repeats:YES];
	}
	
	return self;
	
}

- (id)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        // Initialization code
    }
    return self;
}


- (void)drawRect:(CGRect)rect {
    
	[starImage drawAtPoint:(CGPointMake(0, 0))];
	
}


- (void)dealloc {
	[starImage release];
	[glow release];
    [super dealloc];
}


@end
