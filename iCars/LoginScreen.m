//
//  LoginScreen.m
//  iCars
//
//  Created by mac on 6/13/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import "LoginScreen.h"


@implementation LoginScreen
@synthesize usernameField,passwordField,loginActivityIndicator;
@synthesize delegate;

	
- (void)failedLogin{
	[loginActivityIndicator stopAnimating];
	UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Error"
												   message:@"Couldn't authenticate"
												  delegate:self
										 cancelButtonTitle:@"Ok"
										 otherButtonTitles:nil];
	[alert show];
	[alert release];
	
	
}
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
// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
}
*/

/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations.
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/
- (IBAction)loginButtonPressed:(id)sender{
	[loginActivityIndicator startAnimating];
	[self.delegate loginWithUsername:usernameField.text andPassword:passwordField.text];
	
}


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
	[passwordField release];
	[usernameField release];
	[loginActivityIndicator release];
    [super dealloc];
}


@end
