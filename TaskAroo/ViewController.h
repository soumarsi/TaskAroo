//
//  ViewController.h
//  TaskAroo
//
//  Created by Prosenjit Kolay on 26/03/15.
//  Copyright (c) 2015 Prosenjit Kolay. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GlobalViewController.h"
#import "SignUpViewController.h"
#import "SignInViewController.h"
@interface ViewController : GlobalViewController
{
    UIView *mainview,*topview,*bodyview;
    UIImageView *logoimg;
    UIButton *btnsignin,*btnsignup,*btnpost;
    UITextField *txttask;
    UILabel *lblor,*lbltask;
    UITableView *tbltask;
    NSMutableArray *sections,*tasktype,*selectedtasktype,*sections1;
    int k;
}

@end

