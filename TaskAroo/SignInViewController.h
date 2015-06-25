//
//  SignInViewController.h
//  TaskAroo1
//
//  Created by Prosenjit Kolay on 20/03/15.
//  Copyright (c) 2015 Prosenjit Kolay. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <FacebookSDK/FacebookSDK.h>
#import "AppDelegate.h"
#import "SignUpViewController.h"
#import "MyHomeViewController.h"
#import "ViewController.h"
#import "TaskHomeViewController.h"
#import "ForgotPasswordViewController.h"

@interface SignInViewController : UIViewController
{
    NSMutableDictionary *mutDic,*mainDic,*fbdatadic;
    NSOperationQueue *operation;
    NSMutableData *DATA;
    NSMutableArray *arrmain;
     UIColor *placeholdercolor;
    UIActivityIndicatorView *myspinn;
    NSString *userid;
}

@property (nonatomic, strong) AppDelegate *appDelegate;
@property (weak, nonatomic) IBOutlet UITextField *txtusername;
@property (weak, nonatomic) IBOutlet UITextField *txtpassword;
@property (weak, nonatomic) IBOutlet UIButton *btnsignin;
@property (weak, nonatomic) IBOutlet UIScrollView *mainscroll;
@property (weak, nonatomic) IBOutlet UIImageView *logoimg;
@property (weak, nonatomic) IBOutlet UIButton *btnforgotpass;
@property (weak, nonatomic) IBOutlet UIButton *btnfblogin;
@property (weak, nonatomic) IBOutlet UIButton *btnsignup;
@property (weak, nonatomic) IBOutlet UILabel *lbldonthvac;
@property (weak, nonatomic) IBOutlet UILabel *lblloginwith;
@property (assign, nonatomic) BOOL tasktosignin;
@property (assign, nonatomic) NSString *pagename;

-(void)handleFBSessionStateChangeWithNotification:(NSNotification *)notification;


- (IBAction)signinclk:(id)sender;
- (IBAction)signupclk:(id)sender;
- (IBAction)fbloginclk:(id)sender;
- (IBAction)godashboardclk:(id)sender;
- (IBAction)forgetpasswordClk:(id)sender;

@end
