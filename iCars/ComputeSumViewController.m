//
//  ComputeSumViewController.m
//  iCars
//
//  Created by mac on 6/23/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import "ComputeSumViewController.h"


@implementation ComputeSumViewController
@synthesize filteredArrayOfCars , localArrayOfCars;
@synthesize totalSales;
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
#pragma mark -
#pragma mark TableView DataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
	NSLog(@"CarObjects array count:%i",[filteredArrayOfCars count]);
	return [filteredArrayOfCars count];
	
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
	UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MyIdentifier"];
	
	if (nil == cell) {
		cell = [[[UITableViewCell alloc]initWithStyle:UITableViewStylePlain reuseIdentifier:@"MyIdentifier"]autorelease];
	}
	NSLog(@"Requesting object at index:%i",indexPath.row);
	cell.text = [NSString stringWithFormat:@"%@ %@",
				 [[self->filteredArrayOfCars objectAtIndex:indexPath.row]objectForKey:@"Producator"],
				 [[self->filteredArrayOfCars objectAtIndex:indexPath.row]objectForKey:@"Model"]];
	
	return cell;
	
}
#pragma mark  -
#pragma mark TableView Delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
	
	UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
	
	if (cell.accessoryType == UITableViewCellAccessoryCheckmark) {
		cell.accessoryType = UITableViewCellAccessoryNone;
		id object = [filteredArrayOfCars objectAtIndex:indexPath.row];
		totalSales -=[[object objectForKey:@"Pret"]intValue];
		NSLog(@"Vanzari totale:%i",totalSales);
		
	}else {
		cell.accessoryType = UITableViewCellAccessoryCheckmark;
		id object = [filteredArrayOfCars objectAtIndex:indexPath.row];
		totalSales +=[[object objectForKey:@"Pret"]intValue];
		NSLog(@"Vanzari totale:%i",totalSales);

	}
	[tableView deselectRowAtIndexPath:indexPath animated:YES];

    // In this example, any selection to the table will push on the detail view controller showing the same photo
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
	UIBarButtonItem *computeButton =[[UIBarButtonItem alloc]initWithTitle:@"Calculeaza" 
																 style:UIBarButtonItemStyleBordered 
																target:self 
																action:@selector(compute)];
	self.navigationItem.leftBarButtonItem = computeButton;
	[computeButton release];
	localArrayOfCars=[[NSMutableArray alloc]initWithCapacity:0];
	
}
- (void)compute{
	UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Suma Vanzarilor"
												   message:[NSString stringWithFormat:@"%i Euro",totalSales] 
												  delegate:self
										 cancelButtonTitle:@"Ok"
										 otherButtonTitles:nil];
	[alert show];
	[alert release];
	
	
	
}
- (void)doneEditing{
	[self.parentViewController dismissModalViewControllerAnimated:YES];
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
	[filteredArrayOfCars release];
	[localArrayOfCars release];
}


@end
