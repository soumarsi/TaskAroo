//
//  MessageDetailsViewController.h
//  TaskAroo
//
//  Created by Prosenjit Kolay on 25/05/15.
//  Copyright (c) 2015 Prosenjit Kolay. All rights reserved.
//

#import <UIKit/UIKit.h>
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
#import "UIImageView+WebCache.h"
#import "ALAssetsLibrary+CustomPhotoAlbum.h"
#import "MesgSubmitView.h"
@interface MessageDetailsViewController : UIViewController
{
    UrlconnectionObject *urlobj;
    NSMutableDictionary *taskdic;
    NSString *userid,*taskid,*recieverid;
    
    NSString *cellId;
    MesgSubmitView *mesgview;
    UIView *screenview,*loader_shadow_View;
    UIActionSheet *actionsheet;
    
}
@property (weak, nonatomic) IBOutlet UIView *mainview;
@property (weak, nonatomic) IBOutlet UIScrollView *mainscroll;
@property (weak, nonatomic) IBOutlet UIView *titleview;
@property (weak, nonatomic) NSString *messageid;
@property (weak, nonatomic) IBOutlet UILabel *lblsendername;
@property (weak, nonatomic) IBOutlet UILabel *lbltaskcode;
@property (weak, nonatomic) IBOutlet UILabel *lbldate;
@property (weak, nonatomic) IBOutlet UILabel *lblmessage;
@property (weak, nonatomic) IBOutlet UIButton *btnattachment;
- (IBAction)attachmentclk:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *btntaskview;
- (IBAction)taskviewclk:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *btnreply;
- (IBAction)replyclk:(id)sender;



@end
