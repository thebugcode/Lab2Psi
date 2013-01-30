//
//  iCarsViewController.h
//  iCars
//
//  Created by mac on 6/3/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NetworkCommunicator.h"
#import "LoginScreen.h"
#import "FilterScreen.h"
#import "FilterDateViewController.h"
@interface iSoldCarsViewController : UITableViewController<NSStreamDelegate,
NetworkCommunicatorDelegate,LoginScreenDelegate,FilterDateViewControllerDelegate,FilterScreenDelegate> {
	NSInputStream *inputStream;
	NSOutputStream *outputStream;
	NetworkCommunicator *communicator;
	LoginScreen *loginScreen ;
	UIApplication *sharedApp;
	NSArray* carObjects;
	NSMutableArray *filteredArrayOfCars;
}
@property (nonatomic,retain)NSArray *carObjects;
@property (nonatomic,retain)NSMutableArray *filteredArrayOfCars;
@property (nonatomic,retain)LoginScreen *loginScreen ;
@property (nonatomic,assign)NetworkCommunicator *communicator;
@end

