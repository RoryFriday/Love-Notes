//
//  Baci01ViewController.h
//  Baci01
//


#import <UIKit/UIKit.h>
#import <MessageUI/MessageUI.h>
#import <MessageUI/MFMailComposeViewController.h>
#import "LoveMessages.h"
#import "CustomButton.h"
#import "EmailTemplate.h"

@class starTwinkleContainer, SoundEffect;

@interface LoveNoteViewController : UIViewController <MFMailComposeViewControllerDelegate> 
{
	UILabel *message;
	UILabel *messageItalian;
	UILabel *messageNo;
	
	LoveMessages* loveMessages;
	EmailTemplate *emailTemplate;
	
	UIImageView* note;
	UIImageView* cloud;
	UIImageView* stars;
	UIImageView* starsBig;
	
	CustomButton* buttonRight;
	CustomButton* buttonLeft;
	CustomButton* buttonEmail;
	starTwinkleContainer *twinkleContainer;
	
	SoundEffect *whooshSound;
}

@property(nonatomic,retain) IBOutlet UILabel *message;
@property(nonatomic,retain) IBOutlet UILabel *messageItalian;
@property(nonatomic,retain) IBOutlet UILabel *messageNo;
@property(nonatomic,retain) LoveMessages* loveMessages;
@property(nonatomic,retain) EmailTemplate *emailTemplate;
@property(nonatomic,retain) starTwinkleContainer *twinkleContainer;

-(IBAction)showNextMessage:(id)sender;
-(IBAction)showPrevMessage:(id)sender;
-(IBAction)sendEmail:(id)sender;
-(void)clearTouchPosition;

@end

