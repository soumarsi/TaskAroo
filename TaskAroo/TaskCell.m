//
//  TaskCell.m
//  TaskAroo
//
//  Created by Prosenjit Kolay on 07/04/15.
//  Copyright (c) 2015 Prosenjit Kolay. All rights reserved.
//

#import "TaskCell.h"

@implementation TaskCell
@synthesize lbldesc,lbltaskname,btncancel,lblbids,btnmarkCompleted,lblbidsname,btnwriteReview;
- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
