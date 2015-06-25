//
//  CreditCardCell.m
//  TaskAroo
//
//  Created by Prosenjit Kolay on 21/05/15.
//  Copyright (c) 2015 Prosenjit Kolay. All rights reserved.
//

#import "CreditCardCell.h"

@implementation CreditCardCell
@synthesize lblcardno,lblname,btnchkbox,btnremove;
- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (IBAction)checkboxclk:(id)sender {
   
    /*
    if (btnchkbox.selected==YES) {
        btnchkbox.selected=NO;
        [btnchkbox setBackgroundImage:[UIImage imageNamed:@"tick2.png"] forState:UIControlStateNormal];
    }
    else
    {
    btnchkbox.selected=YES;
    [btnchkbox setBackgroundImage:[UIImage imageNamed:@"tick1.png"] forState:UIControlStateSelected];
    }
     */
}
@end
