                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                (@"filteredArray count:%i",[filteredArrayOfCars count]);
	
	if ([tipCaroserie isEqualToString:@"All"]&& ((int)max == 0) && ((int)maximumW ==0)) {
		NSLog(@"Method 1");
		//this means Filter ALl/ALl/All
		for (id object in [[carObjects copy]autorelease])
		{
			[filteredArrayOfCars addObject:object];
		}
		
	}else if (![tipCaroserie isEqualToString:@"All"] && ((int)max == 0) && ((int)maximumW ==0)) {
		NSLog(@"Method 2");
		//if it gets here it The user selected say hatchback/All/All so filter by caroserie.
		for (id object in [[carObjects copy]autorelease])
		{
			if ([[object objectForKey:@"Caroserie"]isEqualToString:tipCaroserie]) {
				[filteredArrayOfCars addObject:object];
			}
			
		}
	}else if ([tipCaroserie isEqualToString:@"All"] && ((int)max == 0) && !((int)maximumW ==0)){
		NSLog(@"Method 3");
		//if it gets here the user specified All/ALl/weight
		for (id object in [[carObjects copy]autorelease])
		{
			if ([[object objectForKey:@"Masa"]intValue]>mininimumW && [[object objectForKey:@"Masa"]intValue]<maximumW) {
				[filteredArrayOfCars addObject:object];
			}
			
		}
	}else if ([tipCaroserie isEqualToString:@"All"] && !((int)max == 0) && ((int)maximumW ==0)) {
		//here user selected ALl/mass/All
		for (id object in [[carObjects copy]autorelease]){
			if ([[object objectForKey:@"VolumMotor"]intValue]>=min && [[object objectForKey:@"VolumMotor"]intValue]<=max) {
				[filteredArrayOfCars addObject:object];
			}
			
		}
	}else if (![tipCaroserie isEqualToString:@"All"] && !((int)max == 0) && ((int)maximumW ==0)) {
		//Here the user selected  model/mass/ALl
		for (id object in [[carObjects copy]autorelease]){
			if ([[object objectForKey:@"VolumMotor"]intValue]>=min && [[object objectForKey:@"VolumMotor"]intValue]<=max
				&& [[object objectForKey:@"Caroserie"]isEqualToString:tipCaroserie]) {
				[filteredArrayOfCars addObject:object];
			}
			
		}
	}else if (![tipCaroserie isEqualToString:@"All"] && ((int)max == 0) && !((int)maximumW ==0)) {
		//Here the user selected  model/mass/ALl
		for (id object in [[carObjects copy]autorelease]){
			if ([[object objectForKey:@"Masa"]intValue]>=mininimumW && [[object objectForKey:@"Masa"]intValue]<=maximumW
				&& [[object objectForKey:@"Caroserie"]isEqualToString:tipCaroserie]) {
				[filteredArrayOfCars addObject:object];
			}
			
		}
	}else if ([tipCaroserie isEqualToString:@"All"] && !((int)max == 0) && !((int)maximumW ==0)) {
		//Here the user selected  model/mass/ALl
		for (id object in [[carObjects copy]autorelease]){
			if ([[object objectForKey:@"Masa"]intValue]>=mininimumW && [[object objectForKey:@"Masa"]intValue]<=maximumW
				&& [[object objectForKey:@"VolumMotor"]intValue]>=min && [[object objectForKey:@"VolumMotor"]intValue]<=max) {
				[filteredArrayOfCars addObject:object];
			}
			
		}
	}else if (![tipCaroserie isEqualToString:@"All"] && !((int)max == 0) && !((int)maximumW ==0)) {
		//Here the user selected  model/mass/ALl
		for (id object in [[carObjects copy]autorelease]){
			if ([[object objectForKey:@"Masa"]intValue]>=mininimumW && [[object objectForKey:@"Masa"]intValue]<=maximumW
				&& [[object objectForKey:@"VolumMotor"]intValue]>=min && [[object objectForKey:@"VolumMotor"]intValue]<=max
				&& [[object objectForKey:@"Caroserie"]isEqualToString:tipCaroserie]) {
				[filteredArrayOfCars addObject:object];
			}
			
		}
	}
	
	//[[self->carObjects objectAtIndex:indexPath.row]objectForKey:@"Caroserie"].
	
	
	
	NSLog(@"Array filtered count:%i",[filteredArrayOfCars count]);
	
	//clear the filtered list first.
	[self.tableView reloadData];
}

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
	//add a filter button
	UIBarButtonItem *filterButton =[[UIBarButtonItem alloc]initWithTitle:@"Filter" 
																   style:UIBarButtonItemStyleBordered 
																  target:self 
																  action:@selector(filter)];
	self.navigationItem.rightBarButtonItem = filterButton;
	[filterButton release];
	
	UIBarButtonItem *sumButton =[[UIBarButtonItem alloc]initWithTitle:@"Suma" 
																   style:UIBarButtonItemStyleBordered 
																  target:self 
																  action:@selector(suma)];
	self.navigationItem.leftBarButtonItem = sumButton;
	[sumButton release];
	
	
	
	self.communicator = [NetworkCommunicator sharedRadioStation];
	communicator.delegate = self;
	NSLog(@"Communicator address %@",[communicator description]);
	FilterDateViewController *dateView = [[FilterDateViewController alloc]init];
	dateView.delegate = self;
	UINavigationController *navController = [[UINavigationController alloc]initWithRootViewController:dateView];
	[self presentModalViewController:navController animated:YES];

	
	

	
	
	

	
	
}
#pragma mark -
#pragma mark LoginScreen username/password delegate


#pragma mark -
#pragma mark NetworkCommunicator delegate
- (void)didReceiveData:(NSString *)data{
	[data retain];
	if ([data isEqualToString:@"AuthenticationSucces"]) {
	}else if ([data isEqualToString: @"AuthenticationError"]) {
		NSLog(@"Am primit eroare");
		[loginScreen failedLogin];//display an alert view with a failed login
	}else { //aici se ajunge daca am primit json.
		NSLog(@"Am primit ceva date json:%@",data);
		[self parseJSONString:data];
		//@warning [self dismissModalViewControllerAnimated:YES];
		
	}
	
}



/*
 // Override to allow orientations other than the default portrait orientation.
 - (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
 // Return YES for supported orientations
 return (interfaceOrientation == UIInterfaceOrientationPortrait);
 }
 */
#pragma mark -
#pragma mark MemoryManagement
- (void)didReceiveMemoryWarning {
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
	
	// Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
	// Release any retained subviews of the main view.
	// e.g. self.myOutlet = nil;
}


- (void)dealloc {
    [super dealloc];
}

@end
