//
//  SplashController.m
//  Baci01
//


#import "SplashController.h"
#import "starTwinkleContainer.h"

@implementation SplashController

@synthesize viewController;
@synthesize twinkleContainer;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil 
{
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) 
	{
		starTwinkleContainer *container = [[starTwinkleContainer alloc] init];
		self.twinkleContainer = container;
		[container release];
		twinkleContainer.center = CGPointMake(160,250);
		
		// remove from splash page as is positioned ontop of heart graphic
		[twinkleContainer.star2 removeFromSuperview];
		
		[self.view addSubview:twinkleContainer];
	}

	return self;
}


- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{	
	LoveNoteViewController *aViewController = [[LoveNoteViewController alloc] initWithNibName:@"LoveNoteViewController" bundle:[NSBundle mainBundle]];
	self.viewController = aViewController;
	[aViewController release];
	[self presentModalViewController:self.viewController animated:YES]; 
}

- (void)didReceiveMemoryWarning {
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
	
	// Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
	// Release any retained subviews of the main view.
	// e.g. self.myOutlet = nil;
}


- (void)dealloc {
	
	[viewController release];
    [super dealloc];
}


@end
