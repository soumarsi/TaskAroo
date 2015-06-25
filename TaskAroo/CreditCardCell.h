//
//  CreditCardCell.h
//  TaskAroo
//
//  Created by Prosenjit Kolay on 21/05/15.
//  Copyright (c) 2015 Prosenjit Kolay. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CreditCardCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *lblcardno;
@property (weak, nonatomic) IBOutlet UILabel *lblname;
@property (weak, nonatomic) IBOutlet UIButton *btnremove;
@property (weak, nonatomic) IBOutlet UIButton *btnchkbox;
- (IBAction)checkboxclk:(id)sender;

@end
