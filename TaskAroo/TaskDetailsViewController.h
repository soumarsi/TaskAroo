//
//  TaskDetailsViewController.h
//  TaskAroo
//
//  Created by Prosenjit Kolay on 19/05/15.
//  Copyright (c) 2015 Prosenjit Kolay. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>
#import <Foundation/Foundation.h>
#import "GlobalViewController.h"
#import "HeaderView.h"
#import "FooterView.h"
#import "LeftMenuView.h"
#import "ViewController.h"
#import "MyHomeViewController.h"
#import "TransactionCell.h"
#import "UrlconnectionObject.h"
#import "FinancialDetailsViewController.h"
#import "ReferFriendViewController.h"
#import "UIImageView+WebCache.h"
#import "MyAccountViewController.h"
#import "ContactViewController.h"
#import "MessageViewController.h"
#import "BidCell.h"
#import "MessageCell.h"
#import "MesgSubmitView.h"
#import "ALAssetsLibrary+CustomPhotoAlbum.h"

@interface TaskDetailsViewController : UIViewController
{
     UrlconnectionObject *urlobj;
    NSMutableDictionary *taskdic;
    NSString *userid,*recieverid,*taskposterid,*bidid,*biderid,*AwardedTo;
    
    NSString *cellId;
   NSMutableArray *Arrmesg,*ArrAllBids,*ArrBigImg,*ArrRecieverId1;
    NSArray *ArrRecieverId;
    MesgSubmitView *mesgview;
    UIView *screenview,*loader_shadow_View,*screenview1;
    UIButton *btncancel;
    UIActionSheet *actionsheet;
    NSInteger IsAwarded;
    NSInteger Isaccept,Ismakefavour,Isremovefavour,Iscancel,timetype;
}
@property(assign,nonatomic) NSString *taskid;
@property (weak, nonatomic) IBOutlet UIView *mainview;
@property (weak, nonatomic) IBOutlet UIScrollView *mainscroll;
@property (weak, nonatomic) IBOutlet UILabel *lbltasktitle;
@property (weak, nonatomic) IBOutlet UILabel *lblusertype;
@property (weak, nonatomic) IBOutlet UILabel *lbltaskcreatedt;
@property (weak, nonatomic) IBOutlet UILabel *lblbidenddt;
@property (weak, nonatomic) IBOutlet UILabel *lbltaskenddt;
@property (weak, nonatomic) IBOutlet UILabel *lbllocation;
@property (weak, nonatomic) IBOutlet UILabel *lblamt;
@property (weak, nonatomic) IBOutlet UILabel *lblContractorSpend;

@property (weak, nonatomic) IBOutlet UIView *tasktypeview;
@property (weak, nonatomic) IBOutlet UILabel *lblimage;
@property (weak, nonatomic) IBOutlet UITableView *tblmesg;

@property (weak, nonatomic) IBOutlet UIImageView *taskimg1;
@property (weak, nonatomic) IBOutlet UIImageView *taskimage2;
@property (weak, nonatomic) IBOutlet UIImageView *taskimage3;
@property (weak, nonatomic) IBOutlet UILabel *lbltasktype;
@property (weak, nonatomic) IBOutlet UILabel *lblrepeattask;
@property (weak, nonatomic) IBOutlet UILabel *lblestimatedtime;
@property (weak, nonatomic) IBOutlet MKMapView *MapView;
@property (weak, nonatomic) IBOutlet UIView *titleview;
@property (weak, nonatomic) IBOutlet UILabel *lbltaskcode;

@property (weak, nonatomic) IBOutlet UIView *menuview;
@property (weak, nonatomic) IBOutlet UIButton *btndetails;
@property (weak, nonatomic) IBOutlet UIButton *btnmesgboard;
@property (weak, nonatomic) IBOutlet UIButton *btnallbids;
- (IBAction)detailsclk:(id)sender;

- (IBAction)mesgClk:(id)sender;

- (IBAction)AllbidsClk:(id)sender;
@property (weak, nonatomic) IBOutlet UITableView *tblbids;
@property (weak, nonatomic) IBOutlet UIButton *btnmesg;

- (IBAction)sendmesgclk:(id)sender;
@property (weak, nonatomic) IBOutlet UIImageView *underlineimg;
@property (weak, nonatomic) IBOutlet UILabel *lbladddetail;
@property (weak, nonatomic) IBOutlet UILabel *lbladditionalDetail;
@property (weak, nonatomic) IBOutlet UIButton *btntaskcancel;
@property (weak, nonatomic) IBOutlet UILabel *lblnodata;
@property (weak, nonatomic) IBOutlet UIButton *btntaskimg1;
@property (weak, nonatomic) IBOutlet UIButton *btntaskimg2;
@property (weak, nonatomic) IBOutlet UIButton *btntaskimg3;
- (IBAction)taskimg1clk:(id)sender;
- (IBAction)taskimg2clk:(id)sender;
- (IBAction)taskimg3clk:(id)sender;
- (IBAction)cancelclk:(id)sender;



@end
