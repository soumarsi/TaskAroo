//
//  MyHomeViewController.h
//  TaskAroo1
//
//  Created by Prosenjit Kolay on 24/03/15.
//  Copyright (c) 2015 Prosenjit Kolay. All rights reserved.
//

#import "GlobalViewController.h"
#import "SignInViewController.h"
#import "SignUpViewController.h"
#import "ViewController.h"
#import "TaskHomeViewController.h"
#import "NewOrExistingUserViewController.h"
#import "TermsView.h"
#import "PaymentViewController.h"
#import "LeftMenuView.h"
#import "FinancialDetailsViewController.h"
#import "AFHTTPClient.h"

#import "AFHTTPRequestOperation.h"
@interface MyHomeViewController : GlobalViewController
{
    UITableView *estimatedaytable,*citytable,*repeattasktable,*estimatetimetable;
    NSMutableArray *arrday,*arrcity,*arrrepeattask,*arrtime,*arramt,*arrimage;
    UIPickerView *amtpicker,*estimatedaypicker,*estimatetimepicker,*repeattaskpicker,*provincepicker;
    UIPickerView *contactoramtpicker;
    UIDatePicker *datepicker,*taskcompdatepicker;
    UIButton *btndtsave,*btndtcompsave,*btncontactpaysave,*btnpaysave,*btndaysave,*btntimesave,*btnrepeatsave,*btnprovincesave,*btndtcancel,*btndtcompcancel,*btncontactpaycancel,*btnpaycancel,*btndaycancel,*btntimecancel,*btnrepeatcancel,*btnprovincecancel;
    NSString *contactorpay,*amtpay,*day,*time,*repeattask,*province;
    UIActionSheet *actionsheet;
    NSInteger imgcount,clickedimg;
    UILongPressGestureRecognizer *imggesture1,*imggesture2,*imggesture3;
    NSString *biddatetime,*taskclsdatetime;
    BOOL user;
    NSString *cardno,*expirymonth,*expirtyear,*cvv;
     NSMutableData *mutableData;
     NSMutableDictionary *mutDic,*mainDic;
    UIView *viewday,*viewtime,*viewrepeattask,*viewprovince,*viewpay,*viewcontactorpay,*viewbidcls,*viewtaskcls;
    TermsView *tm;
    UIView *screenview;
    LeftMenuView *leftView;
    UIImage *addimage1;
    NSString *userid;
}
@property (weak, nonatomic) IBOutlet UIImageView *logoimage;
@property (weak, nonatomic) IBOutlet UIButton *btnleftview;
@property (weak, nonatomic) IBOutlet UIButton *btnleftviewextra;
@property (weak, nonatomic) IBOutlet UIButton *btnlogo;
@property (weak, nonatomic) IBOutlet UIView *headerview;

//@property (weak, nonatomic) IBOutlet UIButton *btnsignout;
@property (weak, nonatomic) IBOutlet UIScrollView *mainscroll;
@property (weak, nonatomic) IBOutlet UIButton *btntaskdescarrow;
@property (weak, nonatomic) IBOutlet UIView *taskdescmainview;
@property (weak, nonatomic) IBOutlet UIButton *btnradioindiv;
@property (weak, nonatomic) IBOutlet UIButton *btnradiobusi;
@property (weak, nonatomic) IBOutlet UITextView *txtvwtaskdesc;
@property (weak, nonatomic) IBOutlet UITextField *txtphoto;
@property (weak, nonatomic) IBOutlet UILabel *lblrepeattask;
@property (weak, nonatomic) IBOutlet UITextField *txtday;
@property (weak, nonatomic) IBOutlet UIImageView *taskdesctopimg;
@property (weak, nonatomic) IBOutlet UIButton *camerabtn;
@property (weak, nonatomic) IBOutlet UIButton *btnbidtick;
@property (weak, nonatomic) IBOutlet UIButton *btnvehicletick;
@property (weak, nonatomic) IBOutlet UIButton *btnphtick;
@property (weak, nonatomic) IBOutlet UIButton *btnestimateddayarrow;
@property (weak, nonatomic) IBOutlet UIButton *btnindividual;
@property (weak, nonatomic) IBOutlet UIButton *btnbusiness;
@property (weak, nonatomic) IBOutlet UITextField *txttaskname;
@property (weak, nonatomic) IBOutlet UITextView *taskdescview;
@property (weak, nonatomic) IBOutlet UITextField *txtrepeattask;
@property (weak, nonatomic) IBOutlet UIButton *btnrepeattaskarrow;
@property (weak, nonatomic) IBOutlet UITextField *txttime;
@property (weak, nonatomic) IBOutlet UIImageView *imgtimearrow;
@property (weak, nonatomic) IBOutlet UIButton *btntime;
@property (weak, nonatomic) IBOutlet UIImageView *img;
@property (weak, nonatomic) IBOutlet UIImageView *img1;
@property (weak, nonatomic) IBOutlet UIImageView *addedimg;
@property (weak, nonatomic) IBOutlet UILabel *lbltaskdesc;
@property (weak, nonatomic) IBOutlet UILabel *lbladdress;
//@property (weak, nonatomic) IBOutlet UIButton *btnsignup;
@property (weak, nonatomic) IBOutlet UIButton *btnrepeattaskextra;
@property (weak, nonatomic) IBOutlet UIButton *btnday;
@property (weak, nonatomic) IBOutlet UIButton *btndonebyph;
@property (weak, nonatomic) IBOutlet UIButton *btnvehicle;
@property (weak, nonatomic) IBOutlet UIButton *btnbid;
//@property (weak, nonatomic) IBOutlet UIButton *btnsignup;
@property (weak, nonatomic) IBOutlet UIButton *btnsignup;
@property (weak, nonatomic) IBOutlet UILabel *lblno;
@property (weak, nonatomic) IBOutlet UILabel *lbltaskrequire;
@property (weak, nonatomic) IBOutlet UIButton *camerabtnextra;

@property (weak, nonatomic) IBOutlet UIButton *btnsignin;

//@property (weak, nonatomic) IBOutlet UINavigationItem *btnsignup;
- (IBAction)leftimageclk:(id)sender;


- (IBAction)leftmenuclk:(id)sender;

//- (IBAction)repeattaskextra:(id)sender;
- (IBAction)godashboardclk:(id)sender;

- (IBAction)btnradioindivclk:(id)sender;
- (IBAction)btnradiobusinessclk:(id)sender;
- (IBAction)camerabtnclk:(id)sender;
- (IBAction)bidtickclk:(id)sender;
- (IBAction)vehicletickclk:(id)sender;
- (IBAction)phtickbtnclk:(id)sender;
- (IBAction)estimatedayarrowclk:(id)sender;
- (IBAction)btnindividualclk:(id)sender;
- (IBAction)btnbusinessclk:(id)sender;
- (IBAction)taskdescarrowclk:(id)sender;
- (IBAction)taskdescbtnextraclk:(id)sender;
- (IBAction)signout:(id)sender;
- (IBAction)txtestimatedayextraclk:(id)sender;
- (IBAction)phtickbtnextraclk:(id)sender;
- (IBAction)vehicletickextraclk:(id)sender;
- (IBAction)bidtickextraclk:(id)sender;
//- (IBAction)repeattaskclk:(id)sender;
- (IBAction)repeattaskclk:(id)sender;
- (IBAction)repeattaskextra:(id)sender;
- (IBAction)timebtnclk:(id)sender;
- (IBAction)Signup:(id)sender;
- (IBAction)camerabtnextraclk:(id)sender;

//location of task

@property (weak, nonatomic) IBOutlet UIButton *btntasklocationarrow;
@property (weak, nonatomic) IBOutlet UITextView *txtvwaddress;
@property (weak, nonatomic) IBOutlet UITextField *txtcity;
@property (weak, nonatomic) IBOutlet UIButton *btncityarrow;
@property (weak, nonatomic) IBOutlet UITextField *txtprovince;
@property (weak, nonatomic) IBOutlet UITextField *txtpcode;
@property (weak, nonatomic) IBOutlet UIButton *btndeliverychk;
@property (weak, nonatomic) IBOutlet UIView *tasklocationview;
@property (weak, nonatomic) IBOutlet UIView *tasklocationmainview;
@property (weak, nonatomic) IBOutlet UIImageView *tasklocationtopimg;
@property (weak, nonatomic) IBOutlet UILabel *lbltasklocation;
@property (weak, nonatomic) IBOutlet UIButton *btntasklocationextra;
@property (weak, nonatomic) IBOutlet UIButton *btnprovinceextra;
@property (weak, nonatomic) IBOutlet UIView *deliveryview;
@property (weak, nonatomic) IBOutlet UITextView *txtdroplocation;

@property (weak, nonatomic) IBOutlet UILabel *lbldroplocation;
@property (weak, nonatomic) IBOutlet UIButton *btndeliveryextra;


- (IBAction)deliverychkclk:(id)sender;
- (IBAction)tasklocationarrowclk:(id)sender;
- (IBAction)tasklocationbtnextraclk:(id)sender;
- (IBAction)deliverychkextraclk:(id)sender;
//- (IBAction)cityarrowclk:(id)sender;
//- (IBAction)cityarrowextraclk:(id)sender;
- (IBAction)cityarrowclk:(id)sender;
- (IBAction)cityarrowextraclk:(id)sender;


//deadline

@property (weak, nonatomic) IBOutlet UIView *deadlineview;
@property (weak, nonatomic) IBOutlet UIView *deadlinemainview;
@property (weak, nonatomic) IBOutlet UIView *bidclsdeadview;
@property (weak, nonatomic) IBOutlet UIView *taskcompdtview;
@property (weak, nonatomic) IBOutlet UIButton *btndeadlinearrow;
@property (weak, nonatomic) IBOutlet UIImageView *deadlinetopimg;
@property (weak, nonatomic) IBOutlet UILabel *lbldeadline;
@property (weak, nonatomic) IBOutlet UIButton *btndeadlineextra;
@property (weak, nonatomic) IBOutlet UILabel *lblbiddt;
@property (weak, nonatomic) IBOutlet UILabel *lblbidmonth;
@property (weak, nonatomic) IBOutlet UILabel *lblbidyr;
@property (weak, nonatomic) IBOutlet UILabel *lblbidtime;
@property (weak, nonatomic) IBOutlet UILabel *lbltaskdt;
@property (weak, nonatomic) IBOutlet UILabel *lbltaskmonth;
@property (weak, nonatomic) IBOutlet UILabel *lbltaskyr;
@property (weak, nonatomic) IBOutlet UILabel *lbltasktime;
@property (weak, nonatomic) IBOutlet UILabel *lbltaskcompletiondt;
@property (weak, nonatomic) IBOutlet UIButton *btnbidclosedeadline;
@property (weak, nonatomic) IBOutlet UIButton *btnbidclosedeadline1;
@property (weak, nonatomic) IBOutlet UIButton *btntaskcompdt;



- (IBAction)deadlinearrowclk:(id)sender;
- (IBAction)deadlinebtnextraclk:(id)sender;
//- (IBAction)bidclosedeadlineclk:(id)sender;
- (IBAction)taskcompdeadclk:(id)sender;
- (IBAction)bidclosedeadlineclk:(id)sender;

//- (IBAction)bidclosedeadlineclk:(id)sender;


@property (weak, nonatomic) IBOutlet UIButton *deadlinebtnextraclk;

//price

@property (weak, nonatomic) IBOutlet UIView *priceview;
@property (weak, nonatomic) IBOutlet UIView *pricemainview;
@property (weak, nonatomic) IBOutlet UIButton *btnpricearrow;
@property (weak, nonatomic) IBOutlet UITextField *txtperjob;
@property (weak, nonatomic) IBOutlet UIButton *btnpayarrow;
@property (weak, nonatomic) IBOutlet UITextField *txtcontractorpay;
@property (weak, nonatomic) IBOutlet UIButton *btncontractpayarrow;
@property (weak, nonatomic) IBOutlet UIButton *btnpaydetail;
@property (weak, nonatomic) IBOutlet UIImageView *pricetopimg;
@property (weak, nonatomic) IBOutlet UILabel *lblprice;
@property (weak, nonatomic) IBOutlet UIButton *btnperjob;
@property (weak, nonatomic) IBOutlet UIButton *btnperhour;
@property (weak, nonatomic) IBOutlet UIButton *btnradioperjob;
@property (weak, nonatomic) IBOutlet UIButton *btnradioperhour;
@property (weak, nonatomic) IBOutlet UILabel *lblcontactorpay;
@property (weak, nonatomic) IBOutlet UIImageView *contratorlineimg;
@property (weak, nonatomic) IBOutlet UIButton *btnpriceextra;
@property (weak, nonatomic) IBOutlet UIButton *btnpayamt;
@property (weak, nonatomic) IBOutlet UIButton *btncontractorpayamt;
@property (weak, nonatomic) IBOutlet UIImageView *imgagreetick;
@property (weak, nonatomic) IBOutlet UIButton *btnedit;
@property (weak, nonatomic) IBOutlet UIButton *btnagreetick;
@property (weak, nonatomic) IBOutlet UIView *editview;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *myspinner;
@property (weak, nonatomic) IBOutlet UILabel *lblpagename;


- (IBAction)pricearrowclk:(id)sender;
- (IBAction)perjobclk:(id)sender;
- (IBAction)perhourclk:(id)sender;
- (IBAction)perjobradioclk:(id)sender;
- (IBAction)perhourradioclk:(id)sender;
- (IBAction)payarrowclk:(id)sender;
- (IBAction)contactorpayarrowclk:(id)sender;
- (IBAction)pricebtnextraclk:(id)sender;
- (IBAction)payextraclk:(id)sender;
- (IBAction)contactorpayextraclk:(id)sender;
- (IBAction)paydetailclk:(id)sender;
- (IBAction)editclk:(id)sender;
- (IBAction)agreetickclk:(id)sender;
- (IBAction)agreeextratickclk:(id)sender;


@property (weak, nonatomic) IBOutlet UIButton *contactorextraclk;

@property (weak, nonatomic) IBOutlet UIButton *perjobradioclk;


@property (strong, nonatomic) NSMutableDictionary *taskdetaildic;
@property (assign, nonatomic) BOOL taskfilled;
@end
