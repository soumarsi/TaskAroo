//
//  HeaderView.h
//  TaskAroo
//
//  Created by Prosenjit Kolay on 17/04/15.
//  Copyright (c) 2015 Prosenjit Kolay. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ViewController.h"
@protocol headerDelegate <NSObject>
@required
-(void)headerclk:(UIButton *)sender;
@end

@interface HeaderView : UIView
{
  //  UIButton *btnsignnout,*btnlogo1,*btnleftmenu;
}
@property (weak, nonatomic)  UIButton *btnsignnout,*btnlogo1,*btnleftmenu,*btnleftmenuextra,*btnback,*btnbackextra;
@property (strong, nonatomic)  UILabel *lblpagename;

@property (weak, nonatomic) IBOutlet UIButton *btnsignout;
@property(assign)id<headerDelegate>myDelegate;

- (IBAction)test:(UIButton *)sender;

@end
