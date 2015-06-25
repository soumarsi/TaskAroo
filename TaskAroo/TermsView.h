//
//  TermsView.h
//  TaskAroo
//
//  Created by Prosenjit Kolay on 22/04/15.
//  Copyright (c) 2015 Prosenjit Kolay. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol termsDelegate <NSObject>
@required
-(void)termsclk:(UIButton *)sender;
@end
@interface TermsView : UIView
@property(assign)id<termsDelegate>myDelegate;
@property (weak, nonatomic) IBOutlet UIButton *btniagree;
@property (weak, nonatomic) IBOutlet UIButton *btncancel;
@property (weak, nonatomic) IBOutlet UIButton *btnsignnout;
- (IBAction)agreeclk:(id)sender;
- (IBAction)cancelclk:(UIButton *)sender;

@end