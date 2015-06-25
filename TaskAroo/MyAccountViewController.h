//
//  MyAccountViewController.h
//  TaskAroo
//
//  Created by Rahul Singha Roy on 20/05/15.
//  Copyright (c) 2015 Prosenjit Kolay. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HeaderView.h"
#import "FooterView.h"
#import "LeftMenuView.h"
#import "TaskCell.h"
#import "UrlconnectionObject.h"
#import "MyAccountViewController.h"
#import "ContactViewController.h"
#import "MessageViewController.h"
#import "AFHTTPClient.h"

#import "AFHTTPRequestOperation.h"
@interface MyAccountViewController : UIViewController
{
    LeftMenuView *leftView;
    NSString *userid,*province,*regtype,*usertype;
    UrlconnectionObject *urlobj;
    NSMutableDictionary *AccDic;
    UIPickerView *provincePicker;
    UIView *pickView;
    UIButton *btnsave,*btncancel;
    NSMutableArray *ArrProvince;
    UIActionSheet *actionsheet;
    UIView *loader_shadow_View;
}
@property (strong, nonatomic) IBOutlet UIScrollView *Main_acroll;

@property (strong, nonatomic) IBOutlet UITextField *firstname;
@property (strong, nonatomic) IBOutlet UITextField *lastname;
@property (strong, nonatomic) IBOutlet UITextField *language_spoken;
@property (strong, nonatomic) IBOutlet UITextField *address;
@property (strong, nonatomic) IBOutlet UITextField *city;

@property (strong, nonatomic) IBOutlet UITextField *postral_code;
@property (strong, nonatomic) IBOutlet UITextField *country;
@property (strong, nonatomic) IBOutlet UITextField *mobile_number;
@property (strong, nonatomic) IBOutlet UITextField *phone_number;
@property (strong, nonatomic) IBOutlet UITextField *email;
@property (strong, nonatomic) IBOutlet UITextField *password;
@property (strong, nonatomic) IBOutlet UITextField *confirmpassword;
@property (strong, nonatomic) IBOutlet UITextView *about_me;
@property (weak, nonatomic) IBOutlet UIView *head;
@property (weak, nonatomic) IBOutlet UIButton *btnprovince;
@property (weak, nonatomic) IBOutlet UIImageView *profileimg;

@property (weak, nonatomic) IBOutlet UIView *mainview;
- (IBAction)ProvinceClk:(id)sender;
@property (weak, nonatomic) IBOutlet UILabel *lblabtme;

@property (weak, nonatomic) IBOutlet UITextField *txtprovince;

- (IBAction)ChoosefileClk:(id)sender;
- (IBAction)UpdateClk:(id)sender;









@end
