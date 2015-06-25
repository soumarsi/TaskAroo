//
//  ContactViewController.h
//  TaskAroo
//
//  Created by Prosenjit Kolay on 21/05/15.
//  Copyright (c) 2015 Prosenjit Kolay. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MessageViewController.h"
#import "HeaderView.h"
#import "FooterView.h"
#import "LeftMenuView.h"
#import "UrlconnectionObject.h"
#import "MyAccountViewController.h"
@interface ContactViewController : UIViewController
{
    NSString *userid;
    UrlconnectionObject *urlobj;
    LeftMenuView *leftView;
    UIView *loader_shadow_View;
}
@property (weak, nonatomic) IBOutlet UIView *mainview;
@property (weak, nonatomic) IBOutlet UIScrollView *mainscroll;
@property (weak, nonatomic) IBOutlet UITextField *txtemail;
@property (weak, nonatomic) IBOutlet UITextField *txtname;
@property (weak, nonatomic) IBOutlet UITextView *txtvwmesg;
@property (weak, nonatomic) IBOutlet UILabel *lblmesg;


- (IBAction)Sendclk:(id)sender;

@end
