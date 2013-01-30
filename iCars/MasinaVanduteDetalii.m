//
//  MasinaVanduteDetalii.m
//  iCars
//
//  Created by mac on 6/11/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import "MasinaVanduteDetalii.h"


@implementation MasinaVanduteDetalii
@synthesize Caroserie,Producator,Model,AnProductie,VolumMotor,Masa,Categorie,Pret,DataVanzare;
@synthesize myImage;

// The designated initializer.  Override if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
/*
 - (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
 self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
 if (self) {
 // Custom initialization.
 }
 return self;
 }
 */


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
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
	[Caroserie release];
	[Producator release];
	[Model release];
	[AnProductie release];
	[VolumMotor release];
	[Masa release];
	[Categorie release];
	[Pret release];
	[DataVanzare release];
	[myImage release];
    [super dealloc];
}


@end
