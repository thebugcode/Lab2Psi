//
//  LoginScreen.h
//  iCars
//
//  Created by mac on 6/13/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol LoginScreenDelegate <NSObject>
@required
-(void)loginWithUsername:(NSString *)username andPassword:(NSString *)password;
@end

@interface LoginScreen : UIViewController <UITextFieldDelegate>{
	IBOutlet UITextField *usernameField;
	IBOutlet UITextField *passwordField;
    IBOutlet UIActivityIndicatorView *loginActivityIndicator;
	id <LoginScreenDelegate> delegate;

}
@property (nonatomic,assign)id <LoginScreenDelegate> delegate;
@property (nonatomic,retain)IBOutlet UITextField *usernameField;
@property (nonatomic,retain)IBOutlet UITextField *passwordField;
@property (nonatomic,retain)IBOutlet UIActivityIndicatorView *loginActivityIndicator;
- (IBAction)loginButtonPressed:(id)sender;
- (void)failedLogin;
@end
