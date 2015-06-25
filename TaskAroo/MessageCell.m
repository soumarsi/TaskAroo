//
//  MessageCell.m
//  TaskAroo
//
//  Created by Prosenjit Kolay on 22/05/15.
//  Copyright (c) 2015 Prosenjit Kolay. All rights reserved.
//

#import "MessageCell.h"

@implementation MessageCell
@synthesize lblmesg,lblpostername,btnattachment;
- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
