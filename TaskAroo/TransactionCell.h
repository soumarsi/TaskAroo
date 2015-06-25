//
//  TransactionCell.h
//  TaskAroo
//
//  Created by Prosenjit Kolay on 18/05/15.
//  Copyright (c) 2015 Prosenjit Kolay. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TransactionCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *taskname;
@property (weak, nonatomic) IBOutlet UILabel *paidto;
@property (weak, nonatomic) IBOutlet UILabel *date_txt;
@property (weak, nonatomic) IBOutlet UILabel *amount_txt;

@end
