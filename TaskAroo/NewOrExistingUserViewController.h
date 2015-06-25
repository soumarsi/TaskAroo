//
//  NewOrExistingUserViewController.h
//  TaskAroo
//
//  Created by Prosenjit Kolay on 20/04/15.
//  Copyright (c) 2015 Prosenjit Kolay. All rights reserved.
//

#import "GlobalViewController.h"
#import "MyHomeViewController.h"
#import "SignInViewController.h"
#import "SignUpViewController.h"
#import "ViewController.h"
@interface NewOrExistingUserViewController : GlobalViewController
{
    NSMutableDictionary *mutDic,*mainDic,*fbdatadic;
    NSOperationQueue *operation;
    NSMutableData *DATA;
    NSMutableArray *arrmain;
    UIColor *placeholdercolor;
    UIActivityIndicatorView *myspinn;
    NSString *userid;
     NSMutableData *mutableData;
    BOOL signin;
}
- (IBAction)logoclk:(id)sender;
- (IBAction)headsigninclk:(id)sender;
- (IBAction)headsignupclk:(id)sender;

@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *myspinner;

@property (weak, nonatomic) IBOutlet UIScrollView *mainscroll;
@property (weak, nonatomic) IBOutlet UIButton *btnexistinguser;
@property (weak, nonatomic) IBOutlet UIButton *btnnewuser;
@property (weak, nonatomic) IBOutlet UIButton *btnnewuserextra;
@property (weak, nonatomic) IBOutlet UIButton *btnexistinguserextra;
@property (weak, nonatomic) IBOutlet UIView *signinview;
@property (weak, nonatomic) IBOutlet UIView *signupview;
@property (weak, nonatomic) IBOutlet UITextField *txtemail;
@property (weak, nonatomic) IBOutlet UITextField *txtpassword;

//@property (weak, nonatomic) IBOutlet UITextField *txtemail;
//@property (weak, nonatomic) IBOutlet UITextField *txtpassword;
@property (weak, nonatomic) IBOutlet UIButton *btnlogin;

- (IBAction)newuserbtnextraclk:(id)sender;
- (IBAction)existinguserbtnextraclk:(id)sender;
- (IBAction)exsistinguserclk:(id)sender;
- (IBAction)newuserbtnclk:(id)sender;

@property (weak, nonatomic) IBOutlet UIButton *btnsignup;
@property (weak, nonatomic) IBOutlet UITextField *txtsecurityans;
@property (weak, nonatomic) IBOutlet UITextField *txtsecurityques;
@property (weak, nonatomic) IBOutlet UITextField *txtconfirmpass;
@property (weak, nonatomic) IBOutlet UITextField *txtpass;
@property (weak, nonatomic) IBOutlet UITextField *txtemail1;
@property (weak, nonatomic) IBOutlet UITextField *txtph;
@property (weak, nonatomic) IBOutlet UITextField *txtpcode;
@property (weak, nonatomic) IBOutlet UITextField *txtlang;
@property (weak, nonatomic) IBOutlet UITextField *txtlastname;
@property (weak, nonatomic) IBOutlet UITextField *txtfirstname;

- (IBAction)signinclk:(id)sender;
- (IBAction)signupclk:(id)sender;

@end
