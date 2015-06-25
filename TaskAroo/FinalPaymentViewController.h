//
//  FinalPaymentViewController.h
//  taskaroo
//
//  Created by Saptarshi's iMAC on 29/05/15.
//  Copyright (c) 2015 Esolz. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HeaderView.h"
#import "FooterView.h"
#import "LeftMenuView.h"
#import "UrlconnectionObject.h"

@interface FinalPaymentViewController : UIViewController
{
    NSString *userid,*defaultcardid,*bidderid,*bidmode,*completiontime;
    UrlconnectionObject *urlobj;
    LeftMenuView *leftView;
    NSInteger totaldata,pageno,update,payment;
    NSString *cellId;
    NSMutableArray *ArrCardDetails;
    UIView *loader_shadow_View;
    float BillAmtActual;
}
@property (strong, nonatomic) IBOutlet UIScrollView *mainscroll;
@property (strong, nonatomic) IBOutlet UIView *myview;
@property (weak, nonatomic) IBOutlet UITableView *tblcarddetails;
@property (strong, nonatomic) NSString *taskid;
@property (weak, nonatomic) IBOutlet UILabel *lblbidamt;
@property (weak, nonatomic) IBOutlet UILabel *lblbillingamt;
@property (weak, nonatomic) IBOutlet UILabel *lblservicefee;
@property (weak, nonatomic) IBOutlet UILabel *lblsubtotal;
@property (weak, nonatomic) IBOutlet UILabel *lblpercentage;
@property (weak, nonatomic) IBOutlet UITextField *txtextraamt;
@property (weak, nonatomic) IBOutlet UIButton *btnupdt;
- (IBAction)updateClk:(id)sender;
@property (weak, nonatomic) IBOutlet UIView *extraview;
@property (weak, nonatomic) IBOutlet UILabel *lblextraamt;
@property (weak, nonatomic) IBOutlet UIView *billingview;
@property (weak, nonatomic) IBOutlet UIView *hourview;

- (IBAction)PaymentClk:(id)sender;
@property (weak, nonatomic) IBOutlet UILabel *lblhrs;
@property (weak, nonatomic) IBOutlet UIView *billmainview;
@property (weak, nonatomic) IBOutlet UIView *billinfolowerview;
@property (weak, nonatomic) IBOutlet UIView *verticallineview;
@property (weak, nonatomic) IBOutlet UILabel *lbliagree;
@property (weak, nonatomic) IBOutlet UIButton *btnpayment;
@property (weak, nonatomic) IBOutlet UIButton *btnAgreeExtra;
- (IBAction)AgreeExtraClk:(id)sender;
- (IBAction)AddextraAmtclk:(id)sender;

@end
