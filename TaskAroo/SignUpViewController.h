//
//  SignUpViewController.h
//  TaskAroo1
//
//  Created by Prosenjit Kolay on 20/03/15.
//  Copyright (c) 2015 Prosenjit Kolay. All rights reserved.
//

#import "GlobalViewController.h"
#import <FacebookSDK/FacebookSDK.h>
#import "AppDelegate.h"
#import "MyHomeViewController.h"
#import "TermsView.h"
@interface SignUpViewController : GlobalViewController
{
    NSMutableData *mutableData;
    NSMutableDictionary *mutDic,*mainDic,*fbdatadic;
    NSMutableArray *arrmain;
    UIColor *placeholdercolor;
    TermsView *tm;
    UIView *screenview;
}
//@property (nonatomic, strong) TermsView *tm;
@property (nonatomic, strong) AppDelegate *appDelegate;
@property (weak, nonatomic) IBOutlet UIScrollView *mainscroll;
@property (weak, nonatomic) IBOutlet UITextField *txtfirstname;
@property (weak, nonatomic) IBOutlet UITextField *txtlastname;
@property (weak, nonatomic) IBOutlet UITextField *txtlang;
@property (weak, nonatomic) IBOutlet UITextField *txtpcode;
@property (weak, nonatomic) IBOutlet UITextField *txtphno;
@property (weak, nonatomic) IBOutlet UITextField *txtemail;
@property (weak, nonatomic) IBOutlet UITextField *txtpassword;
@property (weak, nonatomic) IBOutlet UITextField *txtsques1;
@property (weak, nonatomic) IBOutlet UITextField *txtsques2;
@property (weak, nonatomic) IBOutlet UIButton *btnsignup;
@property (weak, nonatomic) IBOutlet UITextField *txtconfirmpass;
@property (weak, nonatomic) IBOutlet UIButton *btnchk;
@property (weak, nonatomic) IBOutlet UIButton *btnfblogin;
@property (weak, nonatomic) IBOutlet UILabel *lblagree;
@property (weak, nonatomic) IBOutlet UILabel *lblor;
@property (weak, nonatomic) IBOutlet UILabel *lblloginwith;
@property (weak, nonatomic) IBOutlet UIButton *btnback;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *myspinner;
@property (weak, nonatomic) IBOutlet UIButton *btnchkextra;
@property (weak, nonatomic) IBOutlet UIView *passwordview;
@property (weak, nonatomic) IBOutlet UIView *buttonview;
@property (assign, nonatomic) BOOL tasktosignup;
@property (strong, nonatomic) NSMutableDictionary *fbdetaildic;
@property (nonatomic, assign) BOOL fbdicchk;

- (IBAction)checkclk:(id)sender;
- (IBAction)btnchkextraclk:(id)sender;
- (IBAction)signuppressed:(id)sender;
- (IBAction)fbloginclkj:(id)sender;
- (IBAction)godashboardclk:(id)sender;

- (IBAction)backclk:(id)sender;

@end
