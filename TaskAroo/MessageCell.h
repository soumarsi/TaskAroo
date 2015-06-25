//
//  MessageCell.h
//  TaskAroo
//
//  Created by Prosenjit Kolay on 22/05/15.
//  Copyright (c) 2015 Prosenjit Kolay. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MessageCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *lblmesg;
@property (weak, nonatomic) IBOutlet UILabel *lblpostername;
@property (weak, nonatomic) IBOutlet UIButton *btnattachment;

@end
