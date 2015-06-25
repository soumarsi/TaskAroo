//
//  HeaderView.m
//  TaskAroo
//
//  Created by Prosenjit Kolay on 17/04/15.
//  Copyright (c) 2015 Prosenjit Kolay. All rights reserved.
//

#import "HeaderView.h"

@implementation HeaderView
@synthesize btnsignout,myDelegate,btnleftmenu,btnlogo1,btnsignnout,btnleftmenuextra,btnback,btnbackextra,lblpagename;
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        //delegate not working on xib
     //   [self addSubview:[[[NSBundle mainBundle] loadNibNamed:@"HeaderView" owner:self options:nil] objectAtIndex:0]];
        
        btnsignnout = [UIButton buttonWithType:UIButtonTypeCustom];
        btnsignnout.frame = CGRectMake(self.frame.size.width-90, 35, 76,30);
        [btnsignnout setTitle:@"Sign Out" forState:UIControlStateNormal];
        btnsignnout.backgroundColor = [UIColor clearColor];
        [btnsignnout setTitleColor:[UIColor blackColor] forState:UIControlStateNormal ];
        btnsignnout.titleLabel.font = [UIFont fontWithName:@"OpenSans-Semibold" size:14.0];
        btnsignnout.tag=2;
        [self addSubview:btnsignnout];
        [btnsignnout addTarget:self action:@selector(signoutclk:) forControlEvents:UIControlEventTouchUpInside];
        
        
   
        
        btnlogo1 = [UIButton buttonWithType:UIButtonTypeCustom];
        btnlogo1.frame = CGRectMake(26,17, 121,49);
        UIImage *btnImage = [UIImage imageNamed:@"logo"];
        [btnlogo1 setImage:btnImage forState:UIControlStateNormal];
        btnlogo1.backgroundColor = [UIColor clearColor];
     //   [btnsignnout setTitleColor:[UIColor blackColor] forState:UIControlStateNormal ];
    //    btnsignnout.titleLabel.font = [UIFont fontWithName:@"OpenSans-Semibold" size:14.0];
        btnlogo1.tag=1;
        [self addSubview:btnlogo1];
     [btnlogo1 addTarget:self action:@selector(logoclk:) forControlEvents:UIControlEventTouchUpInside];
        
        btnleftmenu = [UIButton buttonWithType:UIButtonTypeCustom];
        btnleftmenu.frame = CGRectMake(20,30, 20,15);
        UIImage *btnImage1 = [UIImage imageNamed:@"menu-icon"];
        [btnleftmenu setImage:btnImage1 forState:UIControlStateNormal];
        btnleftmenu.backgroundColor = [UIColor clearColor];
        btnleftmenu.tag=3;
        [self addSubview:btnleftmenu];
        [btnleftmenu addTarget:self action:@selector(leftmenuclk:) forControlEvents:UIControlEventTouchUpInside];
        btnleftmenu.hidden=YES;
        
         btnleftmenuextra= [UIButton buttonWithType:UIButtonTypeCustom];
        btnleftmenuextra.frame = CGRectMake(0,7,50,50);
        btnleftmenuextra.backgroundColor = [UIColor clearColor];
        btnleftmenuextra.tag=4;
        [self addSubview:btnleftmenuextra];
        [btnleftmenuextra addTarget:self action:@selector(leftmenuextraclk:) forControlEvents:UIControlEventTouchUpInside];
        btnleftmenuextra.hidden=YES;
        
        lblpagename = [[UILabel alloc]initWithFrame:CGRectMake(81, 22, 160, 30)];
        lblpagename.text = @"MY TASKS";
        lblpagename.font = [UIFont fontWithName:@"OpenSans-Semibold" size:17.0];
        lblpagename.numberOfLines = 0;
        lblpagename.baselineAdjustment = YES;
     //   lblpagename.adjustsFontSizeToFitWidth = YES;
        lblpagename.clipsToBounds = YES;
        lblpagename.backgroundColor = [UIColor clearColor];
        lblpagename.textColor =[UIColor blackColor];
        lblpagename.textAlignment = NSTextAlignmentCenter;
        [self addSubview:lblpagename];
        
        
        btnback = [UIButton buttonWithType:UIButtonTypeCustom];
        btnback.frame = CGRectMake(20,25, 25,25);
        UIImage *btnImage2 = [UIImage imageNamed:@"pb_back"];
        [btnback setImage:btnImage2 forState:UIControlStateNormal];
    //    btnback.titleLabel.font = [UIFont fontWithName:@"OpenSans-Light" size:15];
    //    btnback.tintColor=[UIColor blackColor];
    //    btnback.titleLabel.text=@"< BACK";
        [btnback setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        btnback.backgroundColor = [UIColor clearColor];
        btnback.tag=5;
        [self addSubview:btnback];
        [btnback addTarget:self action:@selector(backclk:) forControlEvents:UIControlEventTouchUpInside];
        btnback.hidden=YES;
   
        
        btnbackextra= [UIButton buttonWithType:UIButtonTypeCustom];
        btnbackextra.frame = CGRectMake(0,7,50,50);
        btnbackextra.backgroundColor = [UIColor clearColor];
        btnbackextra.tag=6;
        [self addSubview:btnbackextra];
        [btnbackextra addTarget:self action:@selector(backextraclk:) forControlEvents:UIControlEventTouchUpInside];
        btnbackextra.hidden=YES;
        
    }
    
    return self;
    
}
-(void)signoutclk:(UIButton *)sender
{
  //   NSLog(@"check signout clk");
     [myDelegate headerclk:sender];
}
-(void)logoclk:(UIButton *)sender
{
  
    [myDelegate headerclk:sender];
}
-(void)leftmenuclk:(UIButton *)sender
{
    //   NSLog(@"check signout clk");
    [myDelegate headerclk:sender];
}
-(void)leftmenuextraclk:(UIButton *)sender
{
    //   NSLog(@"check signout clk");
    [myDelegate headerclk:sender];
}
-(void)backclk:(UIButton *)sender
{
    //   NSLog(@"check signout clk");
    [myDelegate headerclk:sender];
}
-(void)backextraclk:(UIButton *)sender
{
    //   NSLog(@"check signout clk");
    [myDelegate headerclk:sender];
}
- (IBAction)test:(UIButton *)sender {
    
    NSLog(@"test signout clk");
    
    if ([myDelegate performSelector:@selector(headerclk:)]) {
        
        [myDelegate headerclk:sender];
    } else {
        NSLog(@"in elseee");
    }
    
//    [myDelegate getDataValue:sender];

}
 
@end
