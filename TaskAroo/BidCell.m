//
//  BidCell.m
//  TaskAroo
//
//  Created by Prosenjit Kolay on 22/05/15.
//  Copyright (c) 2015 Prosenjit Kolay. All rights reserved.
//

#import "BidCell.h"

@implementation BidCell
@synthesize btnaccept,btnfavourite,btnimage,lblamt,lblpropose,lbltime,posterimg,lblfavourite,lblaccepted;
- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
