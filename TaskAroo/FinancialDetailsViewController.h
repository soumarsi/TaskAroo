//
//  FinancialDetailsViewController.h
//  TaskAroo
//
//  Created by Prosenjit Kolay on 15/05/15.
//  Copyright (c) 2015 Prosenjit Kolay. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HeaderView.h"
#import "FooterView.h"
#import "LeftMenuView.h"
#import "CreditCardCell.h"
#import "UrlconnectionObject.h"
#import "MyAccountViewController.h"
#import "ContactViewController.h"
#import "MessageViewController.h"
@interface FinancialDetailsViewController : UIViewController
{
    LeftMenuView *leftView;
    NSString *userid,*cardid,*defaultcreditId;
    NSInteger totaldata;
    NSMutableArray *ArrCard,*arryr,*arrmonth,*ArrCardDetails;
    UrlconnectionObject *urlobj;
    CreditCardCell *cell;
    NSString *cellId;
    UIPickerView *cardtypepicker,*monthpicker,*yrpicker;
    UIButton *btncardtypesave,*btncardtypecancel,*btndtsave,*btndtcancel;
    UIView *cardtypeview,*dtview;
    NSString *cardtype,*cardno,*expirymonth,*expirtyear,*cvv,*emonth,*eyear;
    UIView *loader_shadow_View;
    NSInteger selectedrow;
    UISwipeGestureRecognizer *recognizer;
    UIButton *btncelldelete;
    
    
    
    //--
    
    UIButton *check_box_button;
    
    NSInteger check_mode;
    
}
@property (weak, nonatomic) IBOutlet UIView *mainview;
@property (weak, nonatomic) IBOutlet UIView *menuview;
@property (weak, nonatomic) IBOutlet UIButton *btnviewcard;
@property (weak, nonatomic) IBOutlet UIButton *btnaddcard;
//@property (weak, nonatomic) IBOutlet UILabel *lblcardheading;
@property (weak, nonatomic) IBOutlet UITableView *tblcarddetails;
- (IBAction)addcardclk:(id)sender;

- (IBAction)viewcardclk:(id)sender;
@property (weak, nonatomic) IBOutlet UIScrollView *addcardscroll;
@property (weak, nonatomic) IBOutlet UITextField *txtcardtype;
@property (weak, nonatomic) IBOutlet UITextField *txtcardholdername;
@property (weak, nonatomic) IBOutlet UITextField *txtcardno;
@property (weak, nonatomic) IBOutlet UITextField *txtexpdt;
@property (weak, nonatomic) IBOutlet UITextField *txtcvv;
@property (weak, nonatomic) IBOutlet UIButton *btnexpdt;
- (IBAction)expclk:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *btncardtype;
- (IBAction)cardtypeclk:(id)sender;
- (IBAction)scancardclk:(id)sender;
- (IBAction)cardstoreclk:(id)sender;
@property (weak, nonatomic) IBOutlet UIImageView *underlineimg;
@property (weak, nonatomic) IBOutlet UILabel *lblnodata;
@property (weak, nonatomic) IBOutlet UIButton *btnsetdefault;
- (IBAction)setdefaultclk:(id)sender;


@end
