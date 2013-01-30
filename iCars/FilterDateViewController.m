//
//  FilterScreen.m
//  iCars
//
//  Created by mac on 6/14/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import "FilterDateViewController.h"


@implementation FilterDateViewController

@synthesize startDateTextField,endDateTextField;
@synthesize delegate;
// The designated initializer.  Override if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
/*
 - (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
 self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
 if (self) {
 
 
 }
 return self;
 }
 */
/*
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
*/

/*
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
*/
- (BOOL)textFieldShouldReturn:(UITextField *)textField{
	[textField resignFirstResponder];
	return YES;
}
	


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
	[super viewDidLoad];
	//add a done and a cancel button.
	UIBarButtonItem *doneButton =[[UIBarButtonItem alloc]initWithTitle:@"Done" 
																 style:UIBarButtonItemStyleBordered 
																target:self 
																action:@selector(doneEditing)];
	self.navigationItem.rightBarButtonItem = doneButton;
	[doneButton release];
	
		
	
}
- (void)cancelEditting{
	[self.parentViewController dismissModalViewControllerAnimated:YES];
}
- (void)doneEditing{
	[self.delegate userRequestsCarsWithStartDate:startDateTextField.text withEndDate:endDateTextField.text];
	[self.parentViewController dismissModalViewControllerAnimated:YES];
	
	
}
/*
- (void)doneEditing{
	
	
		NSLog(@"calling delegate");
		[self.delegate filterListOfCarsWithChassis:tipCaroserie minVolume:volumMinimMotor maxVolume:volumMaximMotor
										 minWeight:masaMinima maxWeight:masaMaxima];
		
	
		
	
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
	
	
	
	
}*/
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
	[startDateTextField release];
	[endDateTextField release];

}


@end
