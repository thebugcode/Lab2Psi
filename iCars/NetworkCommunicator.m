//
//  NetworkCommunicator.m
//  iCars
//
//  Created by mac on 6/13/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import "NetworkCommunicator.h"
#define RealHost @"169.254.140.153"
#define localhost @"127.0.0.1"
@interface NetworkCommunicator(private)
- (void)initNetworkCommunication;
- (void)requestData:(NSString *)response;
@end

static NetworkCommunicator* singleton = nil;
@implementation NetworkCommunicator
@synthesize delegate;


+ (NetworkCommunicator *)sharedRadioStation{

	@synchronized(self)
		{
			if (nil == singleton) 
				NSLog(@"Entered allocation");
				singleton = [[NetworkCommunicator alloc]init];
				[singleton initNetworkCommunication];
		}
	return singleton;
	
}


- (void)send:(NSString *)payload{
	[self requestData:payload];
}


- (void)initNetworkCommunication{
	

	CFReadStreamRef readStream;
	CFWriteStreamRef writeStream;
	CFStreamCreatePairWithSocketToHost(NULL, (CFStringRef)RealHost, 9999, &readStream, &writeStream);
	inputStream = (NSInputStream *)readStream;
	outputStream = (NSOutputStream *)writeStream;
	[inputStream setDelegate:self];
	[outputStream setDelegate:self];
	
	[inputStream scheduleInRunLoop:[NSRunLoop currentRunLoop] forMode:NSDefaultRunLoopMode];
	[outputStream scheduleInRunLoop:[NSRunLoop currentRunLoop] forMode:NSDefaultRunLoopMode];

	[inputStream open];
	[outputStream open];



	
	
}
- (void)stream:(NSStream *)theStream handleEvent:(NSStreamEvent)streamEvent {
	
	switch (streamEvent) {
			
		case NSStreamEventOpenCompleted:
			NSLog(@"Stream opened");
			break;
			
		case NSStreamEventHasBytesAvailable:
			if (theStream == inputStream) {
				uint8_t buffer[2048];
				int len;
				
				while ([inputStream hasBytesAvailable]) {
					len = [inputStream read:buffer maxLength:sizeof(buffer)];
					if (len > 0) {
						
						NSString *output = [[NSString alloc] initWithBytes:buffer length:len encoding:NSASCIIStringEncoding];
						
						if (nil != output) {
							[output autorelease];
							[self.delegate didReceiveData:output];
							//NSLog(@"%@",output);
						}
					}
				}
			}
			break;			
			
		case NSStreamEventErrorOccurred:
		{
			NSLog(@"Cannot connect to server.!");
		}
			break;
			
		case NSStreamEventEndEncountered:
			break;
			
		default:
			NSLog(@"Unknown event");
	}
	
}
- (void)requestData:(NSString *)response{
	//NSString *response  = [NSString stringWithString:@"GET /AutomobileVanzare"];
	NSData *data = [[NSData alloc] initWithData:[response dataUsingEncoding:NSASCIIStringEncoding]];
	[outputStream write:[data bytes] maxLength:[data length]];
}

@end
