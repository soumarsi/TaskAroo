//
//  ReferFriendViewController.h
//  TaskAroo
//
//  Created by Prosenjit Kolay on 18/05/15.
//  Copyright (c) 2015 Prosenjit Kolay. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MessageUI/MessageUI.h>
#import "HeaderView.h"
#import "FooterView.h"
#import "LeftMenuView.h"
#import "TaskCell.h"
#import "UrlconnectionObject.h"
#import "MyAccountViewController.h"
#import "ContactViewController.h"
#import "MessageViewController.h"
@interface ReferFriendViewController : UIViewController
{
    LeftMenuView *leftView;
    UrlconnectionObject *urlobj;
    NSString *userid;
    UIView *loader_shadow_View;
}
@property (weak, nonatomic) IBOutlet UIScrollView *mainscroll;
@property (weak, nonatomic) IBOutlet UIView *mainview;
@property (weak, nonatomic) IBOutlet UITextField *txtemail;
@property (weak, nonatomic) IBOutlet UITextView *txtvwmesg;
@property (weak, nonatomic) IBOutlet UILabel *lblmsg;
- (IBAction)sendclk:(id)sender;

@end
