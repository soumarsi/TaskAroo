//
//  BidCell.h
//  TaskAroo
//
//  Created by Prosenjit Kolay on 22/05/15.
//  Copyright (c) 2015 Prosenjit Kolay. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BidCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIButton *btnimage;
@property (weak, nonatomic) IBOutlet UILabel *lblpropose;
@property (weak, nonatomic) IBOutlet UILabel *lblamt;
@property (weak, nonatomic) IBOutlet UILabel *lbltime;
@property (weak, nonatomic) IBOutlet UIButton *btnfavourite;
@property (weak, nonatomic) IBOutlet UIButton *btnaccept;
@property (weak, nonatomic) IBOutlet UIImageView *posterimg;
@property (weak, nonatomic) IBOutlet UILabel *lblfavourite;
@property (weak, nonatomic) IBOutlet UILabel *lblaccepted;

@end
