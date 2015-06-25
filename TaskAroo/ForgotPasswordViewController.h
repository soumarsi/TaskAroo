//
//  ForgotPasswordViewController.h
//  TaskAroo
//
//  Created by Priyanka ghosh on 10/06/15.
//  Copyright (c) 2015 Prosenjit Kolay. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SignInViewController.h"
#import "ViewController.h"
@interface ForgotPasswordViewController : UIViewController


@property (weak, nonatomic) IBOutlet UITextField *txtemail;
@property (weak, nonatomic) IBOutlet UIScrollView *mainscroll;

- (IBAction)logoClk:(id)sender;
- (IBAction)SubmitClk:(id)sender;
- (IBAction)SignInClk:(id)sender;


@end
