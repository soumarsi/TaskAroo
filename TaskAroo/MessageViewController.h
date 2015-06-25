//
//  MessageViewController.h
//  TaskAroo
//
//  Created by Prosenjit Kolay on 21/05/15.
//  Copyright (c) 2015 Prosenjit Kolay. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ContactViewController.h"
#import "HeaderView.h"
#import "FooterView.h"
#import "LeftMenuView.h"
#import "UrlconnectionObject.h"
#import "MyAccountViewController.h"
#import "MessageInboxCell.h"
#import "MessageDetailsViewController.h"
#import "UIImageView+WebCache.h"
#import "ALAssetsLibrary+CustomPhotoAlbum.h"
@interface MessageViewController : UIViewController
{
    NSString *userid;
    UrlconnectionObject *urlobj;
    LeftMenuView *leftView;
    NSInteger totaldata,pageno;
    NSMutableArray *ArrMesg;
    MessageInboxCell *cell;
    NSString *cellId;
    
}
@property (weak, nonatomic) IBOutlet UIView *mainview;
@property (weak, nonatomic) IBOutlet UITableView *tblmesg;
@property (weak, nonatomic) IBOutlet UILabel *lblnodata;
@property (weak, nonatomic) IBOutlet UIView *activity_indicator;
@property (weak, nonatomic) IBOutlet UIView *nomoredataview;
@property (weak, nonatomic) IBOutlet UILabel *lblnomore;
@property (weak, nonatomic) IBOutlet UIView *titleview;

@end
