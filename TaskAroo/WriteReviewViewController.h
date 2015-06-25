//
//  WriteReviewViewController.h
//  TaskAroo
//
//  Created by Prosenjit Kolay on 02/06/15.
//  Copyright (c) 2015 Prosenjit Kolay. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MessageViewController.h"
#import "HeaderView.h"
#import "FooterView.h"
#import "LeftMenuView.h"
#import "UrlconnectionObject.h"
#import "MyAccountViewController.h"
#import "TaskHomeViewController.h"
#import "DYRateView.h"
@interface WriteReviewViewController : UIViewController
{
    NSString *userid,*rateis,*bidderid;
    UrlconnectionObject *urlobj;
    LeftMenuView *leftView;
    UIView *loader_shadow_View;
    NSMutableDictionary *taskdic;
}
@property (weak, nonatomic) NSString *taskid;
@property (weak, nonatomic) IBOutlet UIView *mainview;
@property (weak, nonatomic) IBOutlet UIScrollView *mainscroll;
@property (weak, nonatomic) IBOutlet UIView *titleview;
@property (weak, nonatomic) IBOutlet UILabel *lbltaskcode;
@property (weak, nonatomic) IBOutlet UILabel *lbltaskname;
@property (weak, nonatomic) IBOutlet UITextView *txtvwmessage;
@property (weak, nonatomic) IBOutlet UILabel *lblmesg;
- (IBAction)SendClk:(id)sender;
@property (weak, nonatomic) IBOutlet UIView *ratereview;


@end
