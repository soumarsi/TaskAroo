//
//  PaymentViewController.h
//  TaskAroo
//
//  Created by Prosenjit Kolay on 22/04/15.
//  Copyright (c) 2015 Prosenjit Kolay. All rights reserved.
//

#import "GlobalViewController.h"
#import "CardIOPaymentViewControllerDelegate.h"
#import "CardIO.h"
#import "TaskHomeViewController.h"
#import "AFHTTPClient.h"

#import "AFHTTPRequestOperation.h"
@interface PaymentViewController : GlobalViewController
{
      NSString *cardno,*expirymonth,*expirtyear,*cvv;
    NSString *biddatetime,*taskclsdatetime;
    NSInteger imgcount;
    NSMutableData *mutableData;
    NSMutableDictionary *mutDic,*mainDic;
    UIView *dateview;
     UIPickerView *monthpicker,*yrpicker;
    UIButton *btndtsave,*btndtcancel;
    NSMutableArray *arrmonth,*arryr;
    NSString *emonth,*eyear;
}
@property (weak, nonatomic) IBOutlet UITextField *txtbillname;
@property (weak, nonatomic) IBOutlet UIButton *btnradioscan;
@property (weak, nonatomic) IBOutlet UIButton *btnradiomanual;
- (IBAction)scanextraclk:(id)sender;
- (IBAction)manualextraclk:(id)sender;
- (IBAction)scanradioclk:(id)sender;
- (IBAction)manualradioclk:(id)sender;
@property (weak, nonatomic) IBOutlet UIScrollView *mainscroll;
@property (weak, nonatomic) IBOutlet UIButton *btnpayment;
- (IBAction)paymentclk:(id)sender;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *myspinner;
- (IBAction)testclk:(id)sender;
//@property (weak, nonatomic) IBOutlet UITextField *txtcardno;
@property (weak, nonatomic) IBOutlet UITextField *tctcvv;
@property (weak, nonatomic) IBOutlet UITextField *txtexpdt;
@property (weak, nonatomic) IBOutlet UITextField *txtcardno;
@property (weak, nonatomic) IBOutlet UIButton *btnscancard;
@property (weak, nonatomic) IBOutlet UIButton *btndt;
- (IBAction)dateclk:(id)sender;

//@property (weak, nonatomic) IBOutlet UIScrollView *txtcardno;

@end
