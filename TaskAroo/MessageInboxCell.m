//
//  MessageInboxCell.m
//  TaskAroo
//
//  Created by Prosenjit Kolay on 25/05/15.
//  Copyright (c) 2015 Prosenjit Kolay. All rights reserved.
//

#import "MessageInboxCell.h"

@implementation MessageInboxCell
@synthesize lbldate,lbldetails,lblrequest,lblsender,lbltaskcode,btnattachment;
- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
