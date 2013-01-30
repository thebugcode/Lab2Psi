//
//  FilterScreen.m
//  iCars
//
//  Created by mac on 6/14/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import "FilterScreen.h"


@implementation FilterScreen
@synthesize actionSheet;
@synthesize tipCaroserie,volumMinimMotor,volumMaximMotor,masaMinima,masaMaxima;
@synthesize masaPicker,volumPicker,caroseriePicker,currentPicker;
@synthesize masaArray,caroserieArray,volumMotorArray;
@synthesize senderPointer;
@synthesize delegate;
@synthesize caroserieLabel,masaLabel,volumLabel;
// The designated initializer.  Override if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
/*
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
		
				
    }
    return self;
}
*/
#pragma mark -
#pragma mark PickerViewDelegate

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
	NSLog(@"Method 1");
	if (pickerView == caroseriePicker) {
		NSLog(@"Alegem caroseria");
	}else if (pickerView == volumPicker) {
		NSLog(@"Alegem volumul");
	}else if (pickerView == masaPicker) {
		NSLog(@"Alegem masa");
	}
	return 1;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
	NSLog(@"Method 2"); 
	return 6;
	
}
- (NSString *)pickerView:(UIPickerView *)pickerView
			 titleForRow:(NSInteger)row
			forComponent:(NSInteger)component{
	NSLog(@"Row:%i,Component:%i",row,component);
	if (pickerView == caroseriePicker) {
		caroserieArray = [[NSArray arrayWithObjects:@"All",@"coupe",@"hatchback",@"sedan",@"universal",@"monovolum",nil]retain];
		return [caroserieArray objectAtIndex:row];
		
	}else if (pickerView == volumPicker) {
		volumMotorArray = [[NSArray arrayWithObjects:@"-All",@"",@"1",@"1599",@"1600",@"2000",@"2001",@"2499",@"2500",@"3000",@"3000",@"9999",nil]retain];
		return [NSString stringWithFormat:@"%@-%@",[volumMotorArray objectAtIndex:row*2],[volumMotorArray objectAtIndex:row*2+1]];
						   
	}else if (pickerView == masaPicker) {
		masaArray = [[NSArray arrayWithObjects:@"-All",@"",@"1",@"1500",@"1501",@"2000",@"2001",@"2500",@"2501",@"3000",@"3001",@"9999",nil]retain];
		return [NSString stringWithFormat:@"%@-%@",[masaArray objectAtIndex:row*2],[masaArray objectAtIndex:row*2+1]];
	}

} 

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
	NSLog(@"Row:%i,Component:%i",row,component);
	if (pickerView == caroseriePicker) {
		tipCaroserie =[caroserieArray objectAtIndex:row];
		NSLog(@"Tip caroserie ales:%@",tipCaroserie);
	}else if (pickerView == volumPicker) {
		volumMinimMotor = [[volumMotorArray objectAtIndex:row*2]integerValue];
		volumMaximMotor = [[volumMotorArray objectAtIndex:row*2+1]integerValue];
		NSLog(@"Vol Max:%i,Vol min:%i",volumMaximMotor,volumMinimMotor);
	}else if (pickerView == masaPicker) {
		masaMinima = [[masaArray objectAtIndex:row*2]integerValue];
		masaMaxima = [[masaArray objectAtIndex:row*2+1]integerValue];
	}
	
}

- (IBAction)buttonChooseChassisClicked:(UIButton *)sender{
	
	//save the sender button for further use
	senderPointer = sender;
	actionSheet = [[UIActionSheet alloc] initWithTitle:nil delegate:self 
									 cancelButtonTitle:nil destructiveButtonTitle:nil 
									 otherButtonTitles:nil]; //as we want to display a subview we won't be using the default buttons but rather we're need to create a toolbar to display the buttons on  
	
	[actionSheet setActionSheetStyle:UIActionSheetStyleBlackTranslucent];  
	CGRect pickerFrame = CGRectMake(0, 40, 0, 0);  
	
	UIPickerView *pickerView = [[UIPickerView alloc] initWithFrame:pickerFrame];
	//save the pickerView pointer for future comparison
	self.currentPicker = pickerView;
	if (sender.tag == 0) {
		caroseriePicker = pickerView;
	}else if (sender.tag == 1) {
		volumPicker = pickerView;
	}else if (sender.tag == 2) {
		masaPicker = pickerView;
	}
	pickerView.showsSelectionIndicator = YES;  
	pickerView.dataSource = self;  
	pickerView.delegate = self;  
	[actionSheet addSubview:pickerView];  
	
	UIToolbar *pickerToolbar = [[UIToolbar alloc] initWithFrame:CGRectMake(0, 0, 320, 44)];  
	pickerToolbar.barStyle = UIBarStyleBlackOpaque;  
	[pickerToolbar sizeToFit];  
	
	NSMutableArray *barItems = [[NSMutableArray alloc] init];  
	
	UIBarButtonItem *flexSpace = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace 
																			   target:self action:nil];  
	[barItems addObject:flexSpace];  
	
	UIBarButtonItem *doneBtn = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone 
																			 target:self action:@selector(doneButtonPressed:)];  
	[barItems addObject:doneBtn];  
	
	UIBarButtonItem *cancelBtn = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCancel 
																			   target:self action:@selector(cancelButtonPressed:)];  
	[barItems addObject:cancelBtn];  
	
	[pickerToolbar setItems:barItems animated:YES];  
	
	[actionSheet addSubview:pickerToolbar];  
	
	[actionSheet addSubview:pickerView];  
	
	[actionSheet showInView:self.view];  
	
	[actionSheet setBounds:CGRectMake(0, 0, 320, 400)]; 
}
-(void)doneButtonPressed:(id)sender{  
	if (currentPicker == caroseriePicker) {
		[caroserieLabel setText:[NSString stringWithFormat:@"%@",tipCaroserie] ];
	}else if (currentPicker == volumPicker) {
		if ((int)volumMaximMotor !=0){
			[volumLabel setText:[NSString stringWithFormat:@"%i-%i",volumMinimMotor,volumMaximMotor]];
		}else{
			[volumLabel setText:@"All"];
		}
			
	}else if (currentPicker == masaPicker) {
		if ((int)masaMaxima !=0){
			[masaLabel setText:[NSString stringWithFormat:@"%i-%i",masaMinima,masaMaxima]];
		}else{
			[masaLabel setText:@"All" ];
		}
		
	}
		[actionSheet dismissWithClickedButtonIndex:1 animated:YES]; 
	
 
}  

-(void)cancelButtonPressed:(id)sender{  
	
	[actionSheet dismissWithClickedButtonIndex:1 animated:YES];  
}  
// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
	[super viewDidLoad];
	//add a done and a cancel button.
	UIBarButtonItem *doneButton =[[UIBarButtonItem alloc]initWithTitle:@"Filter" 
																 style:UIBarButtonItemStyleBordered 
																target:self 
																action:@selector(doneEditing)];
	self.navigationItem.rightBarButtonItem = doneButton;
	[doneButton release];
	
	UIBarButtonItem *cancelButton = [[UIBarButtonItem alloc]initWithTitle:@"Cancel Filter"
																	style:UIBarButtonSystemItemCancel
																   target:self action:@selector(cancelEditting)];
	self.navigationItem.leftBarButtonItem  = cancelButton;
	[cancelButton release];
	
	// -1 means they werent set yet.I use this value to check later if they were set or not.
	masaMaxima = -1;
	volumMaximMotor = -1;
	//retrieve back the previous filter.
	NSUserDefaults *preferences = [NSUserDefaults standardUserDefaults];
	if([preferences objectForKey:@"Caroserie"]){
	caroserieLabel.text = [preferences objectForKey:@"Caroserie"];
		tipCaroserie =[preferences objectForKey:@"Caroserie"];
	}else {
		tipCaroserie = @"All";
		caroserieLabel.text =tipCaroserie;
	}

	volumMinimMotor=[[preferences objectForKey:@"volumMinimMotor"]intValue];
	volumMaximMotor =[[preferences objectForKey:@"volumMaximMotor"]intValue];
	
	if ((int)volumMaximMotor >0){
		[volumLabel setText:[NSString stringWithFormat:@"%i-%i",volumMinimMotor,volumMaximMotor]];
	}else{
		[volumLabel setText:@"All"];
		volumMinimMotor = 0;
		volumMaximMotor = 0;
	}
	
	masaMinima = [[preferences objectForKey:@"masaMinima"]intValue];
	masaMaxima = [[preferences objectForKey:@"masaMaxima"]intValue];;
	
	if ((int)masaMaxima >0){
		[masaLabel setText:[NSString stringWithFormat:@"%i-%i",masaMinima,masaMaxima]];
	}else{
		[masaLabel setText:@"All" ];
		masaMinima = 0;
		masaMaxima = 0;
	}
	

}
- (void)cancelEditting{
	[self.parentViewController dismissModalViewControllerAnimated:YES];
}
- (void)doneEditing{
	
	if (((int)volumMaximMotor >=0) && ((int)volumMinimMotor >=0) && ((int)masaMinima >=0) && ((int)masaMaxima >=0) && nil !=tipCaroserie) {
		NSLog(@"calling delegate");
		[self.delegate filterListOfCarsWithChassis:tipCaroserie minVolume:volumMinimMotor maxVolume:volumMaximMotor
										 minWeight:masaMinima maxWeight:masaMaxima];
		
		//save data into NSuserDefaults
		
		NSUserDefaults *preferences = [NSUserDefaults standardUserDefaults];
		[preferences setInteger:masaMinima forKey:@"masaMinima"];
		[preferences setInteger:masaMaxima forKey:@"masaMaxima"];
		[preferences setInteger:volumMinimMotor forKey:@"volumMinimMotor"];
		[preferences setInteger:volumMaximMotor forKey:@"volumMaximMotor"];
		[preferences setObject:tipCaroserie forKey:@"Caroserie"];
		[preferences synchronize];
		//Do something here here with the value selected using [pickerView date] to get that value  
		//@warning
		//First send the data to the parent view controller.
		[self.parentViewController dismissModalViewControllerAnimated:YES];
		
	
	}else {
		UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Error"
													   message:@"Please choose all filters"
													  delegate:self
											 cancelButtonTitle:@"Ok"
											 otherButtonTitles:nil];
		[alert show];
		[alert release];
	}
	

	
	
}
/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations.
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/

- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc. that aren't in use.
}

- (void)viewDidUnload {
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}


- (void)dealloc {
    [super dealloc];
	[actionSheet release];
	[tipCaroserie release];
	[masaLabel release];
	[volumLabel release];
	[caroserieLabel release];
}


@end
