//
//  starTwinkleContainer.m
//  Baci_cloudstar
//


#import "starTwinkleContainer.h"
#import "starTwinkle.h"

@implementation starTwinkleContainer

@synthesize star1;
@synthesize star2;
@synthesize star3;

- (id)init
{
	CGRect frame = CGRectMake(0, 0, 320, 460);
	
	if(self = [self initWithFrame:frame])
	{
		self.opaque = NO;
		
		starTwinkle *star = [[starTwinkle alloc] initWithInterval:2.5 Image:@"twinkle-star1.png"];
		self.star1 = star;
		[star release];
		star1.center = CGPointMake(50,65);
		[self addSubview:star1];
		
		star = [[starTwinkle alloc] initWithInterval:3.5 Image:@"twinkle-star2.png"];
		self.star2 = star;
		[star release];
		star2.center = CGPointMake(245,25);
		[self addSubview:star2];
		
		star = [[starTwinkle alloc] initWithInterval:4.5 Image:@"twinkle-star3.png"];
		self.star3 = star;
		[star release];
		star3.center = CGPointMake(277,65);
		[self addSubview:star3];
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
    // Drawing code
}


- (void)dealloc {
	[star1 release];
	[star2 release];
	[star3 release];
    [super dealloc];
}


@end
