//
//  TaskHomeViewController.h
//  TaskAroo
//
//  Created by Prosenjit Kolay on 06/05/15.
//  Copyright (c) 2015 Prosenjit Kolay. All rights reserved.
//

#import "GlobalViewController.h"
#import "HeaderView.h"
#import "FooterView.h"
#import "LeftMenuView.h"
#import "ViewController.h"
#import "MyHomeViewController.h"
#import "TaskCell.h"
#import "UrlconnectionObject.h"
#import "FinancialDetailsViewController.h"
#import "ReferFriendViewController.h"
#import "MyTransactionViewController.h"
#import "TaskDetailsViewController.h"
#import "MyAccountViewController.h"
#import "ContactViewController.h"
#import "MessageViewController.h"
#import "FinalPaymentViewController.h"
#import "WriteReviewViewController.h"

@interface TaskHomeViewController : UIViewController<UITableViewDelegate,UITableViewDataSource>
{
    LeftMenuView *leftView;
    TaskCell *cell;
    NSString *cellId;
    UrlconnectionObject *urlobj;
    NSString *userid,*taskid;
    NSInteger totalactivedata,pageno,totalcompletedata,totalsearchdata,tasktype,totalawardeddata,totalcanceleddata;
    NSMutableArray *arrtask,*Arrtaskname;
    UIView *loader_shadow_View;
    __weak IBOutlet UILabel *lbltableempty;
    int activepageno,completepageno,searchpageno,Issearch,awardedpageno,canceledpageno;
    
}
@property (weak, nonatomic) IBOutlet UIView *mainview;
@property (weak, nonatomic) IBOutlet UIView *menuview;
@property (weak, nonatomic) IBOutlet UIButton *btnactivetask;
@property (weak, nonatomic) IBOutlet UIButton *btncompletetask;
//@property (weak, nonatomic) IBOutlet UILabel *lbltask;
@property (weak, nonatomic) IBOutlet UITableView *tbltask;
- (IBAction)activetaskbtnclk:(id)sender;
- (IBAction)completetaskbtnclk:(id)sender;
@property (weak, nonatomic) IBOutlet UIView *activity_indicator;
@property (weak, nonatomic) IBOutlet UIView *nodataview;
@property (weak, nonatomic) IBOutlet UILabel *lblnodata;
@property (weak, nonatomic) IBOutlet UIImageView *underlineimg;
@property (weak, nonatomic) IBOutlet UISearchBar *searchbar;
@property (weak, nonatomic) IBOutlet UITableView *tblTaskName;
@property (weak, nonatomic) IBOutlet UIButton *btnarrow;
- (IBAction)arrowclk:(id)sender;
@property (weak, nonatomic) IBOutlet UILabel *lbltaskname;

@end
