//
//  Baci01ViewController.m
//  Baci01
//

#import "LoveNoteViewController.h"
#import "starTwinkle.h"
#import "starTwinkleContainer.h"

// values dictating range of swipe. Adjust these if swiping range seems too "tight"
#define HORIZ_SWIPE_DRAG_MIN	20
#define VERT_SWIPE_DRAG_MAX		8

#define NOTE_DEFAULT_POSITION_X 157
#define NOTE_DEFAULT_POSITION_Y 228

#define CLOUD_DEFAULT_POSITION_X -400
#define CLOUD_DEFAULT_POSITION_Y 228

#define STAR_DEFAULT_POSITION_X -450
#define STAR_DEFAULT_POSITION_Y 150

// instance variable used to record at what position touch started at. We reference this value
// to help determine if a swipe motion has occured
CGPoint startTouchPosition;


@interface LoveNoteViewController (PrivateMethods)
- (void)setupSubViews;
- (void)setupSounds;
- (void)writeNoteMessage;
@end

@implementation LoveNoteViewController

@synthesize message;
@synthesize messageItalian;
@synthesize messageNo;
@synthesize loveMessages;
@synthesize emailTemplate;
@synthesize twinkleContainer;


// The designated initializer. Override to perform setup that is required before the view is loaded.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil 
{
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) 
	{
		loveMessages = [[LoveMessages alloc] init];
		emailTemplate = [[EmailTemplate alloc] init];
		
		[self setupSubViews];	
		[self writeNoteMessage];
	}
	
    return self;
}


- (void)setupSubViews
{
	// Twinkling stars
	starTwinkleContainer *container = [[starTwinkleContainer alloc] init];
	self.twinkleContainer = container;
	[container release];
	twinkleContainer.center = CGPointMake(160,230);
	
	// Note transistion stars
	stars = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"stars-cut1.png"]];
	stars.frame = CGRectMake(0, 0, 558, 253);
	stars.center = CGPointMake(STAR_DEFAULT_POSITION_X, STAR_DEFAULT_POSITION_Y);
	
	starsBig = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"stars-cut2.png"]];
	starsBig.frame = CGRectMake(0, 0, 558, 253);
	starsBig.center = CGPointMake(STAR_DEFAULT_POSITION_X, STAR_DEFAULT_POSITION_Y);
	
	cloud = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"cloud3.png"]];
	cloud.frame = CGRectMake(0,0,800,350);
	cloud.center = CGPointMake(CLOUD_DEFAULT_POSITION_X, CLOUD_DEFAULT_POSITION_Y);
	
	// message note
	note = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"note.png"]];
	note.frame = CGRectMake(0, 0, 360, 212);
	note.center = CGPointMake(NOTE_DEFAULT_POSITION_X, NOTE_DEFAULT_POSITION_Y);;
	
	// note navigation
	buttonRight = [[CustomButton alloc] initWithImage:@"arrow_right.png" Frame:CGRectMake(10,10,50,50)];
	buttonRight.center = CGPointMake(300,225);
	[buttonRight addTarget:self action:@selector(showNextMessage:) forControlEvents:UIControlEventTouchUpInside];
	
	buttonLeft = [[CustomButton alloc] initWithImage:@"arrow_left.png" Frame:CGRectMake(10,10,50,50)];
	buttonLeft.center = CGPointMake(20,225);
	[buttonLeft addTarget:self action:@selector(showPrevMessage:) forControlEvents:UIControlEventTouchUpInside];
	
	buttonEmail = [[CustomButton alloc] initWithImage:@"button_email.png" Frame:CGRectMake(10,10,100,100)];
	buttonEmail.center = CGPointMake(80,400);
	[buttonEmail addTarget:self action:@selector(sendEmail:) forControlEvents:UIControlEventTouchDown];
	
	// add views in proper order and location
	[self.view addSubview:twinkleContainer];
	[self.view addSubview:buttonRight];
	[self.view addSubview:buttonLeft];
	[self.view addSubview:buttonEmail];	
	
	[self.view insertSubview:stars atIndex:1];
	[self.view insertSubview:starsBig atIndex:1];
	[self.view insertSubview:note atIndex:1];
	[self.view insertSubview:cloud atIndex:1];	
}


- (NSString *)formatAuthorAndNoteNumber:(struct aMessage)loveMsg
{
	NSString *msgNo = [NSString stringWithFormat:@"no. %@   %@", loveMsg.number, loveMsg.author];
	return msgNo;
}


- (void)writeNoteMessage
{
	struct aMessage theMessage = [loveMessages getTheMessage];
	
	messageItalian.text = theMessage.messageItalian;
	message.text = theMessage.message;
	messageNo.text = [self formatAuthorAndNoteNumber:theMessage];
}


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
}


-(void)noteStepFourFinished:(NSString *)animationID finished:(BOOL)finished context:(void *)context
{
	[UIView beginAnimations:nil context:nil];
	[UIView setAnimationDuration:0.5];
	
	starsBig.alpha = 0;
	stars.alpha = 0;
	
	[UIView commitAnimations];
	
	self.view.userInteractionEnabled = YES;
}


-(void)noteStepThreeFinished:(NSString *)animationID finished:(BOOL)finished context:(void *)context
{
	if(finished)
	{
		[UIView beginAnimations:nil context:nil];
		[UIView setAnimationCurve:UIViewAnimationCurveEaseIn];
		[UIView setAnimationDelegate:self];
		[UIView setAnimationDidStopSelector:@selector(noteStepFourFinished:finished:context:)];
		[UIView setAnimationDuration:0.2];
		
		messageNo.alpha = 1;
		message.center = CGPointMake(160, message.center.y); 
		messageItalian.center = CGPointMake(160, messageItalian.center.y);
		
		note.center = CGPointMake(NOTE_DEFAULT_POSITION_X, NOTE_DEFAULT_POSITION_Y);
		
		buttonRight.alpha = 1;
		buttonLeft.alpha = 1;
		
		[UIView commitAnimations];
	}
}


-(void)noteStepTwoFinished:(NSString *)animationID finished:(BOOL)finished context:(void *)context 
{
	if(finished)
	{
		message.center = CGPointMake(-100, message.center.y + 20);
		messageItalian.center = CGPointMake(-100, messageItalian.center.y + 20);
		note.center = CGPointMake(-150,NOTE_DEFAULT_POSITION_Y);
		
		[self writeNoteMessage];
			
		[UIView beginAnimations:nil context:nil];
		[UIView setAnimationDelegate:self];
		[UIView setAnimationDidStopSelector:@selector(noteStepThreeFinished:finished:context:)];
		[UIView setAnimationCurve:UIViewAnimationCurveEaseOut];
		[UIView setAnimationDuration:0.5];
		
		message.alpha = 1;
		message.center = CGPointMake(180, message.center.y);
		messageItalian.alpha = 1;
		messageItalian.center = CGPointMake(180, messageItalian.center.y);
		
		note.center = CGPointMake(180, NOTE_DEFAULT_POSITION_Y);
		
		cloud.alpha = 0;
		cloud.center = CGPointMake(cloud.center.x + 200, cloud.center.y);
		
		[UIView commitAnimations];
		
	}
}


-(void)noteStepOneFinished:(NSString *)animationID finished:(BOOL)finished context:(void *)context
{
	if(finished)
	{
		// Note animation
		[UIView	beginAnimations:nil context:nil];
		[UIView setAnimationCurve:UIViewAnimationCurveEaseIn];
		[UIView setAnimationDuration:1];
		[UIView setAnimationDelegate:self];
		[UIView setAnimationDidStopSelector:@selector(noteStepTwoFinished:finished:context:)];
	
		note.center = CGPointMake(note.center.x + 700, note.center.y);
		cloud.center = CGPointMake(cloud.center.x + 1000, cloud.center.y);
		
		[UIView	commitAnimations];
		
		// Falling stars animation
		starsBig.center = CGPointMake(180, STAR_DEFAULT_POSITION_Y + 100);
		stars.center = CGPointMake(180, STAR_DEFAULT_POSITION_Y + 90);
		
		[UIView beginAnimations:nil context:nil];
		[UIView setAnimationDuration:2];
		[UIView setAnimationCurve:UIViewAnimationCurveEaseOut];
		
		starsBig.alpha = 1;
		starsBig.center = CGPointMake(starsBig.center.x + 40, starsBig.center.y - 90);
		
		stars.alpha = 1;
		stars.center = CGPointMake(stars.center.x + 50, stars.center.y - 120);
		
		[UIView commitAnimations];
		
		// Falling text animation
		[UIView beginAnimations:nil context:nil];
		[UIView setAnimationCurve:UIViewAnimationCurveEaseIn];
		[UIView setAnimationDuration:0.5];
		
		message.alpha = 0;
		message.center = CGPointMake(message.center.x + 20, message.center.y - 20);
		messageItalian.alpha = 0;
		messageItalian.center = CGPointMake(messageItalian.center.x + 20, messageItalian.center.y - 20);
		
		[UIView commitAnimations];
		
	}	
}


-(void)startNoteAnimationRight
{
	cloud.alpha = 1;
	cloud.center = CGPointMake(-500, CLOUD_DEFAULT_POSITION_Y);
	
	starsBig.center = CGPointMake(170, STAR_DEFAULT_POSITION_Y + 110);
	stars.center = CGPointMake(170, STAR_DEFAULT_POSITION_Y + 110);
	
	[UIView	beginAnimations:nil context:nil];
	[UIView setAnimationCurve:UIViewAnimationCurveEaseOut];
	[UIView setAnimationDuration:0.2];
	[UIView setAnimationDelegate:self];
	[UIView setAnimationDidStopSelector:@selector(noteStepOneFinished:finished:context:)];
	
	messageNo.alpha = 0;
	
	message.center = CGPointMake(message.center.x - 20, message.center.y);
	message.alpha = 0.5;
	messageItalian.center = CGPointMake(messageItalian.center.x - 20, messageItalian.center.y);
	messageItalian.alpha = 0.5;
	
	note.center = CGPointMake(note.center.x - 20, note.center.y);
	
	buttonRight.alpha = 0;
	buttonLeft.alpha = 0;

	starsBig.alpha = 1;
	starsBig.center = CGPointMake(starsBig.center.x + 10, starsBig.center.y - 10);
	
	stars.alpha = 1;
	stars.center = CGPointMake(stars.center.x + 10, stars.center.y - 20);
	
	[UIView	commitAnimations];
}


-(void)noteStepFourFinishedLeft:(NSString *)animationID finished:(BOOL)finished context:(void *)context
{
	[UIView beginAnimations:nil context:nil];
	[UIView setAnimationDuration:0.5];
	
	starsBig.alpha = 0;
	stars.alpha = 0;
	
	[UIView commitAnimations];
	
	self.view.userInteractionEnabled = YES;
}


-(void)noteStepThreeFinishedLeft:(NSString *)animationID finished:(BOOL)finished context:(void *)context
{
	if(finished)
	{
		[UIView beginAnimations:nil context:nil];
		[UIView setAnimationDelegate:self];
		[UIView setAnimationDidStopSelector:@selector(noteStepFourFinishedLeft:finished:context:)];
		[UIView setAnimationCurve:UIViewAnimationCurveEaseIn];
		[UIView setAnimationDuration:0.2];
		
		messageNo.alpha = 1;
		
		message.center = CGPointMake(160, message.center.y); 
		messageItalian.center = CGPointMake(160, messageItalian.center.y);
		
		note.center = CGPointMake(NOTE_DEFAULT_POSITION_X, NOTE_DEFAULT_POSITION_Y);
		
		buttonRight.alpha = 1;
		buttonLeft.alpha = 1;
		
		[UIView commitAnimations];
	}
}


-(void)noteStepTwoFinishedLeft:(NSString *)animationID finished:(BOOL)finished context:(void *)context 
{
	if(finished)
	{
		// reposition at starting point
		message.alpha = 0;
		message.center = CGPointMake(420, message.center.y + 20);
		messageItalian.alpha = 0;
		messageItalian.center = CGPointMake(420, messageItalian.center.y + 20);
		
		note.center = CGPointMake(470,NOTE_DEFAULT_POSITION_Y);
		
		[self writeNoteMessage];
		
		[UIView beginAnimations:nil context:nil];
		[UIView setAnimationDelegate:self];
		[UIView setAnimationDidStopSelector:@selector(noteStepThreeFinishedLeft:finished:context:)];
		[UIView setAnimationCurve:UIViewAnimationCurveEaseOut];
		[UIView setAnimationDuration:0.5];
		
		message.alpha = 1;
		message.center = CGPointMake(140, message.center.y); //160
		messageItalian.alpha = 1;
		messageItalian.center = CGPointMake(140,messageItalian.center.y);
		
		cloud.alpha = 0;
		cloud.center = CGPointMake(cloud.center.x - 200, cloud.center.y);
		
		note.center = CGPointMake(140, NOTE_DEFAULT_POSITION_Y);
		
		[UIView commitAnimations];
		
	}
}


-(void)noteStepOneFinishedLeft:(NSString *)animationID finished:(BOOL)finished context:(void *)context
{
	if(finished)
	{
		[UIView	beginAnimations:nil context:nil];
		[UIView setAnimationCurve:UIViewAnimationCurveEaseIn];
		[UIView setAnimationDuration:1];
		[UIView setAnimationDelegate:self];
		[UIView setAnimationDidStopSelector:@selector(noteStepTwoFinishedLeft:finished:context:)];
		
		note.center = CGPointMake(note.center.x - 700, note.center.y);
		cloud.center = CGPointMake(cloud.center.x - 1000, cloud.center.y);
		
		[UIView	commitAnimations];
		
		// Falling stars animation
		starsBig.center = CGPointMake(190, STAR_DEFAULT_POSITION_Y + 100);
		stars.center = CGPointMake(190, STAR_DEFAULT_POSITION_Y + 90);
		
		[UIView beginAnimations:nil context:nil];
		[UIView setAnimationDuration:2];
		[UIView setAnimationCurve:UIViewAnimationCurveEaseOut];
		
		starsBig.alpha = 1;
		starsBig.center = CGPointMake(starsBig.center.x - 40, starsBig.center.y - 90);
		
		stars.alpha = 1;
		stars.center = CGPointMake(stars.center.x - 50, stars.center.y - 120);
		
		[UIView commitAnimations];
		
		// Falling text animation
		[UIView beginAnimations:nil context:nil];
		[UIView setAnimationCurve:UIViewAnimationCurveEaseIn];
		[UIView setAnimationDuration:0.5];
		
		message.alpha = 0;
		message.center = CGPointMake(message.center.x - 20, message.center.y - 20);
		messageItalian.alpha = 0;
		messageItalian.center = CGPointMake(messageItalian.center.x - 20, messageItalian.center.y - 20);
		
		[UIView commitAnimations];
	}
	
}


-(void)startNoteAnimationLeft
{
	cloud.alpha = 1;
	cloud.center = CGPointMake(960, CLOUD_DEFAULT_POSITION_Y);
	
	starsBig.center = CGPointMake(200, STAR_DEFAULT_POSITION_Y + 110);
	stars.center = CGPointMake(200, STAR_DEFAULT_POSITION_Y + 110);
	
	[UIView	beginAnimations:nil context:nil];
	[UIView setAnimationCurve:UIViewAnimationCurveEaseOut];
	[UIView setAnimationDuration:0.2];
	[UIView setAnimationDelegate:self];
	[UIView setAnimationDidStopSelector:@selector(noteStepOneFinishedLeft:finished:context:)];
	
	messageNo.alpha = 0;
	
	message.center = CGPointMake(message.center.x + 20, message.center.y);
	message.alpha = 0.5;
	messageItalian.center = CGPointMake(messageItalian.center.x + 20, messageItalian.center.y);
	messageItalian.alpha = 0.5;
	
	note.center = CGPointMake(note.center.x + 20, note.center.y);
	
	buttonRight.alpha = 0;
	buttonLeft.alpha = 0;
	
	starsBig.alpha = 1;
	starsBig.center = CGPointMake(starsBig.center.x - 10, starsBig.center.y - 10);
	
	stars.alpha = 1;
	stars.center = CGPointMake(stars.center.x - 10, stars.center.y - 20);
	
	[UIView	commitAnimations];
}


-(void)MoveRight
{
	self.view.userInteractionEnabled = NO;
	[loveMessages moveNext];
	[self startNoteAnimationRight];
}


-(void)MoveLeft
{
	self.view.userInteractionEnabled = NO;
	[loveMessages movePrevious];
	[self startNoteAnimationLeft];
}


-(IBAction)showNextMessage:(id)sender
{
	[self MoveRight];
}


-(IBAction)showPrevMessage:(id)sender
{	
	[self MoveLeft];	
}


- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
	
	if(self.view.userInteractionEnabled == NO)
		return;
	
	UITouch *touch = [touches anyObject];
	startTouchPosition = [touch locationInView:self.view];	
}


- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
	
	if(self.view.userInteractionEnabled == NO)
		return;
	
	UITouch *touch = [touches anyObject];
	CGPoint currentTouchPosition = [touch locationInView:self.view];
	
	// checking for long horizonal movement/touch
	if(fabsf(startTouchPosition.x - currentTouchPosition.x) >= HORIZ_SWIPE_DRAG_MIN &&
	   fabsf(startTouchPosition.y - currentTouchPosition.y) <= VERT_SWIPE_DRAG_MAX)
	{
		// its a swipe, now check if its from the left or right
		if(startTouchPosition.x < currentTouchPosition.x){
			//[self showNextMessage];
			[self MoveRight];
			[self clearTouchPosition];
			
		}else{
			//[self showPrevMessage];
			[self MoveLeft];
			[self clearTouchPosition];			
		}
		
	}
}


-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event 
{
	self.clearTouchPosition;
}


-(void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event 
{
	self.clearTouchPosition;
}


-(void)clearTouchPosition
{
	startTouchPosition.x = 0;
	startTouchPosition.y = 0;
}


-(NSString *)getEmailTemplate:(NSString *)emailTemplateURL
{	
	NSString *baciEmailString = emailTemplateURL;
	
	NSURL *baciEmailURL = [NSURL URLWithString:baciEmailString];
	NSError *error;

	NSString *baciEmailPage = [NSString stringWithContentsOfURL:baciEmailURL encoding:NSASCIIStringEncoding error:&error];
		
	return baciEmailPage;
}


-(NSString *)generateEmailBody
{
	struct aMessage theMessage = [loveMessages getTheMessage];

	if(emailTemplate.emailBodyTemplate == @"")
	{
		emailTemplate.emailBodyTemplate = [NSString stringWithString:[self getEmailTemplate:emailTemplate.templateURL]];
	}
	
	NSString *body = [NSString stringWithString:emailTemplate.emailBodyTemplate];
		
	body = [body stringByReplacingOccurrencesOfString:@"[ITALIAN_MSG]" withString:theMessage.messageItalian];
	body = [body stringByReplacingOccurrencesOfString:@"[ENGLISH_MSG]" withString:theMessage.message];
	body = [body stringByReplacingOccurrencesOfString:@"[NOTE_AUTHOR]" withString:[self formatAuthorAndNoteNumber:theMessage]];
	
	return body;
}


// make sure we are checking if the user has ability to send email from device (i.e. they have their mail settings configured)
-(void)showEmailModalView
{
	MFMailComposeViewController *picker = [[MFMailComposeViewController alloc] init];
	picker.mailComposeDelegate = self;
	
	[picker setSubject:@"A Baci Chocolate Love Note"];
	
	NSString *emailBody = [self generateEmailBody];
	
	[picker setMessageBody:emailBody isHTML:YES];
	
	picker.navigationBar.barStyle = UIBarStyleBlack;
	 
	[self presentModalViewController:picker animated:YES]; 
	
	[picker release];
}

-(void)mailComposeController:(MFMailComposeViewController*)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError*)error
{
	switch (result)
	{
		case MFMailComposeResultCancelled:
			break;
		case MFMailComposeResultSaved:
			break;
		case MFMailComposeResultSent:
			break;
		case MFMailComposeResultFailed:
			break;
			
		default:
		{
			UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Email" message:@"Sending Failed – Unknown Error"
														   delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil];
			[alert show];
			[alert release];
		}
			
			break;
	}
	
	[self dismissModalViewControllerAnimated:YES];
}


-(IBAction)sendEmail:(id)sender
{
	Class mailClass = (NSClassFromString(@"MFMailComposeViewController"));
	
	if([mailClass canSendMail])
	{
		[self showEmailModalView];
	}
	else
	{
		UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Email" message:@"Unable to send mail on this device." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
		[alert show];
		[alert release];
	}
}


- (void)didReceiveMemoryWarning 
{
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
	
	// Release any cached data, images, etc that aren't in use.
}


- (void)viewDidUnload 
{
	// Release any retained subviews of the main view.
	// e.g. self.myOutlet = nil;
}


- (void)dealloc 
{
	[cloud release];
	[stars release];
	[starsBig release];
	[note release];
	[message release];
	[emailTemplate release];
	[messageNo release];
	[loveMessages release];
	[buttonRight release];
	[buttonLeft release];
	[twinkleContainer release];
	[whooshSound release];
    [super dealloc];
}

@end
