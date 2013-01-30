//
//  FilterScreen.h
//  iCars
//
//  Created by mac on 6/14/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol FilterDateViewControllerDelegate<NSObject>
@required
-(void)userRequestsCarsWithStartDate:(NSString *)startDate withEndDate:(NSString *)endDate;

@end


@interface FilterDateViewController : UIViewController<UIActionSheetDelegate,UITextFieldDelegate>{
	IBOutlet UITextField *startDateTextField;
	IBOutlet UITextField *endDateTextField;
	id <FilterDateViewControllerDelegate> delegate;
	
}
@property (nonatomic,retain)IBOutlet UITextField *startDateTextField;
@property (nonatomic,retain)IBOutlet UITextField *endDateTextField;

@property (nonatomic,assign)id<FilterDateViewControllerDelegate> delegate;

- (IBAction)doneEditing;

@end
