//
//  FilterScreen.h
//  iCars
//
//  Created by mac on 6/14/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol FilterScreenDelegate<NSObject>
@required
-(void)filterListOfCarsWithChassis:(NSString *)tipCaroserie minVolume:(NSInteger)min 
						 maxVolume:(NSInteger)max minWeight:(NSInteger)mininimumW maxWeight:(NSInteger)maximumW;

@end


@interface FilterScreen : UIViewController<UITextFieldDelegate,UIActionSheetDelegate,UIPickerViewDelegate,UIPickerViewDataSource>{
	IBOutlet UILabel *caroserieLabel;
	IBOutlet UILabel *masaLabel;
	IBOutlet UILabel *volumLabel;

	
	UIActionSheet *actionSheet;
	
	UIPickerView *volumPicker;
	UIPickerView *masaPicker;
	UIPickerView *caroseriePicker;
	UIPickerView *currentPicker;
	UIButton *senderPointer;
	//arrays with data to be picked from
	NSArray *caroserieArray;
	NSArray *volumMotorArray;
	NSArray *masaArray;
	//Filter data
	NSMutableString *tipCaroserie;
	NSInteger volumMinimMotor;
	NSInteger volumMaximMotor;
	NSInteger masaMinima;
	NSInteger masaMaxima;
	
	id <FilterScreenDelegate> delegate;
	
}
@property (nonatomic,retain)IBOutlet UILabel *caroserieLabel;
@property (nonatomic,retain)IBOutlet UILabel *masaLabel;
@property (nonatomic,retain)IBOutlet UILabel *volumLabel;

@property (nonatomic,assign)id<FilterScreenDelegate> delegate;

@property (nonatomic,retain)UIButton *senderPointer;
@property (nonatomic,retain)NSArray *caroserieArray;
@property (nonatomic,retain)NSArray *masaArray;
@property (nonatomic,retain)NSArray *volumMotorArray;

@property (nonatomic,assign)UIPickerView *volumPicker;
@property (nonatomic,assign)UIPickerView *masaPicker;
@property (nonatomic,assign)UIPickerView *caroseriePicker;
@property (nonatomic,assign)UIPickerView *currentPicker;

@property (nonatomic,retain)NSMutableString *tipCaroserie;
@property (nonatomic,assign)NSInteger volumMinimMotor;
@property (nonatomic,assign)NSInteger volumMaximMotor;
@property (nonatomic,assign)NSInteger masaMinima;
@property (nonatomic,assign)NSInteger masaMaxima;

@property (nonatomic,assign)UIActionSheet *actionSheet;
- (IBAction)doneEditing;
- (IBAction)buttonChooseChassisClicked:(id)sender;
@end
