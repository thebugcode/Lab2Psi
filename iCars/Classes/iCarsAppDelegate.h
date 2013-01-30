//
//  iCarsAppDelegate.h
//  iCars
//
//  Created by mac on 6/3/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class SegmentsController;
@interface iCarsAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    SegmentsController * SegmentsController;
	UISegmentedControl * segmentedControl;
}
@property (nonatomic,retain) SegmentsController		*segmentsController;
@property (nonatomic,retain) UISegmentedControl		*segmentedControl;


@property (nonatomic, retain) IBOutlet UIWindow *window;
@end

