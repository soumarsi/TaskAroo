//
//  MessageInboxCell.h
//  TaskAroo
//
//  Created by Prosenjit Kolay on 25/05/15.
//  Copyright (c) 2015 Prosenjit Kolay. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MessageInboxCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *lblsender;
@property (weak, nonatomic) IBOutlet UILabel *lbltaskcode;
@property (weak, nonatomic) IBOutlet UILabel *lbldetails;
@property (weak, nonatomic) IBOutlet UILabel *lblrequest;
@property (weak, nonatomic) IBOutlet UILabel *lbldate;
@property (weak, nonatomic) IBOutlet UIButton *btnattachment;

@end
