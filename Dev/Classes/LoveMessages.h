//
//  LoveMessages.h
//  Baci01
//

#import <Foundation/Foundation.h>

struct aMessage {
	NSString *message;
	NSString *messageItalian;
	NSString *author;
	NSString *number;
};

@interface LoveMessages : NSObject {
	NSMutableArray *messages;
	NSMutableArray *messagesItalian;
	int currentMessageNumber;
}

@property(nonatomic,retain)NSMutableArray *messages;
@property(nonatomic,retain)NSMutableArray *messagesItalian;
@property int currentMessageNumber;

-(id)init;
-(int)totalMessages;
-(void)moveNext;
-(void)movePrevious;
-(struct aMessage)getTheMessage;

@end
