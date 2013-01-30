//
//  ComputeSumViewController.h
//  iCars
//
//  Created by mac on 6/23/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface ComputeSumViewController : UITableViewController {
	NSMutableArray *filteredArrayOfCars;
	NSMutableArray *localArrayOfCars;
	int totalSales;

}
@property int totalSales;
@property (nonatomic,retain)NSMutableArray *filteredArrayOfCars;
@property (nonatomic,retain)NSMutableArray *localArrayOfCars;
@end
