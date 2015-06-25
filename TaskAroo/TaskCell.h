//
//  TaskCell.h
//  TaskAroo
//
//  Created by Prosenjit Kolay on 07/04/15.
//  Copyright (c) 2015 Prosenjit Kolay. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TaskCell : UITableViewCell

//@property (weak, nonatomic) IBOutlet UIButton *btn1;
//@property (weak, nonatomic) IBOutlet UIButton *btn2;
//@property (weak, nonatomic) IBOutlet UIButton *btn3;
@property (weak, nonatomic) IBOutlet UILabel *lbltaskname;
@property (weak, nonatomic) IBOutlet UILabel *lbldesc;
@property (weak, nonatomic) IBOutlet UIButton *btncancel;
@property (weak, nonatomic) IBOutlet UILabel *lblbids;
@property (weak, nonatomic) IBOutlet UIButton *btnmarkCompleted;
@property (weak, nonatomic) IBOutlet UILabel *lblbidsname;
@property (weak, nonatomic) IBOutlet UIButton *btnwriteReview;


@end
