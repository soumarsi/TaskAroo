//
//  MyTransactionViewController.h
//  TaskAroo
//
//  Created by Prosenjit Kolay on 18/05/15.
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
#import "MyAccountViewController.h"
#import "ContactViewController.h"
#import "MessageViewController.h"
@interface MyTransactionViewController : UIViewController
{
    LeftMenuView *leftView;
    TransactionCell *cell;
    NSString *cellId;
    NSString *userid;
    UrlconnectionObject *urlobj;
}
@property (weak, nonatomic) IBOutlet UIView *mainview;
@property (weak, nonatomic) IBOutlet UITableView *transactiontable;
@property (weak, nonatomic) IBOutlet UILabel *lblnodata;
@property (weak, nonatomic) IBOutlet UIView *titleview;


@end
