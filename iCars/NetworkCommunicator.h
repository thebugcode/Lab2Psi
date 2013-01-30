//
//  NetworkCommunicator.h
//  iCars
//
//  Created by mac on 6/13/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol NetworkCommunicatorDelegate <NSObject>
@optional
-(void)didReceiveData:(NSString *)data;
@end

@interface NetworkCommunicator : NSObject<NSStreamDelegate> {
	NSInputStream *inputStream;
	NSOutputStream *outputStream;
	id <NetworkCommunicatorDelegate> delegate;

}
@property (nonatomic , assign) id <NetworkCommunicatorDelegate> delegate;
- (void)send:(NSString *)payload;
+ (NetworkCommunicator *)sharedRadioStation;
@end
