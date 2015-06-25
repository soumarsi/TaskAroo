//
//  FooterView.m
//  TaskAroo1
//
//  Created by Prosenjit Kolay on 19/03/15.
//  Copyright (c) 2015 Prosenjit Kolay. All rights reserved.
//

#import "FooterView.h"
#define  IsIphone6 (([[UIScreen mainScreen] bounds].size.height)>600)?true:false
@implementation FooterView
@synthesize bgimage,btnmenu1,btnmenu2,btnmenu3,btnmenu4,lblmenu1,lblmenu2,lblmenu3,lblmenu4;
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
    if (self) {
        
        bgimage =[[UIImageView alloc] initWithFrame:CGRectMake(0,0,self.frame.size.width,self.frame.size.height)];
        bgimage.image=[UIImage imageNamed:@"bottom-bar.png"];
        [self addSubview:bgimage];
        
        if(IsIphone6)
        {
            btnmenu1 = [UIButton buttonWithType:UIButtonTypeCustom];
            btnmenu1.frame = CGRectMake(20, 5, 40, 40);
            [btnmenu1 setBackgroundImage:[UIImage imageNamed:@"bottom-icon1.png"] forState:UIControlStateNormal];
            [btnmenu1 addTarget:self action:@selector(menu1clk:) forControlEvents:UIControlEventTouchUpInside];
            [self addSubview:btnmenu1];
            
            lblmenu1 = [[UILabel alloc]initWithFrame:CGRectMake(20, 45, 40, 15)];
            lblmenu1.text = @"MY TASKS";
            lblmenu1.font = [UIFont fontWithName:@"OpenSans-Semibold" size:14.0];
            //  UIFont* boldFont = [UIFont boldSystemFontOfSize:[UIFont systemFontSize]];
            //  [lbllogin setFont:boldFont];
            lblmenu1.numberOfLines = 0;
            lblmenu1.baselineAdjustment = YES;
            lblmenu1.adjustsFontSizeToFitWidth = YES;
            lblmenu1.clipsToBounds = YES;
            lblmenu1.backgroundColor = [UIColor clearColor];
            lblmenu1.textColor =[UIColor whiteColor];
            lblmenu1.textAlignment = NSTextAlignmentLeft;
            [self addSubview:lblmenu1];
            
            btnmenu2 = [UIButton buttonWithType:UIButtonTypeCustom];
            btnmenu2.frame = CGRectMake(110,5, 40, 40);
            [btnmenu2 setBackgroundImage:[UIImage imageNamed:@"bottom-icon2.png"] forState:UIControlStateNormal];
            //  [btnmenu2 addTarget:self action:@selector(menu1clk) forControlEvents:UIControlEventTouchUpInside];
            [self addSubview:btnmenu2];
            
            lblmenu2 = [[UILabel alloc]initWithFrame:CGRectMake(110, 45, 40, 15)];
            lblmenu2.text = @"ACCOUNT";
            lblmenu2.font = [UIFont fontWithName:@"OpenSans-Semibold" size:14.0];
            //  UIFont* boldFont = [UIFont boldSystemFontOfSize:[UIFont systemFontSize]];
            //  [lbllogin setFont:boldFont];
            lblmenu2.numberOfLines = 0;
            lblmenu2.baselineAdjustment = YES;
            lblmenu2.adjustsFontSizeToFitWidth = YES;
            lblmenu2.clipsToBounds = YES;
            lblmenu2.backgroundColor = [UIColor clearColor];
            lblmenu2.textColor =[UIColor whiteColor];
            lblmenu2.textAlignment = NSTextAlignmentLeft;
            [self addSubview:lblmenu2];
            
            btnmenu3 = [UIButton buttonWithType:UIButtonTypeCustom];
            btnmenu3.frame = CGRectMake(200,5, 40, 40);
            [btnmenu3 setBackgroundImage:[UIImage imageNamed:@"bottom-icon3.png"] forState:UIControlStateNormal];
            //  [btnmenu3 addTarget:self action:@selector(menu1clk) forControlEvents:UIControlEventTouchUpInside];
            [self addSubview:btnmenu3];
            
            lblmenu3 = [[UILabel alloc]initWithFrame:CGRectMake(200, 45, 40, 15)];
            lblmenu3.text = @"MESSAGES";
            lblmenu3.font = [UIFont fontWithName:@"OpenSans-Semibold" size:14.0];
            //  UIFont* boldFont = [UIFont boldSystemFontOfSize:[UIFont systemFontSize]];
            //  [lbllogin setFont:boldFont];
            lblmenu3.numberOfLines = 0;
            lblmenu3.baselineAdjustment = YES;
            lblmenu3.adjustsFontSizeToFitWidth = YES;
            lblmenu3.clipsToBounds = YES;
            lblmenu3.backgroundColor = [UIColor clearColor];
            lblmenu3.textColor =[UIColor whiteColor];
            lblmenu3.textAlignment = NSTextAlignmentLeft;
            [self addSubview:lblmenu3];
            
            btnmenu4 = [UIButton buttonWithType:UIButtonTypeCustom];
            btnmenu4.frame = CGRectMake(300,5, 40, 40);
            [btnmenu4 setBackgroundImage:[UIImage imageNamed:@"bottom-icon4.png"] forState:UIControlStateNormal];
            //  [btnmenu4 addTarget:self action:@selector(menu1clk) forControlEvents:UIControlEventTouchUpInside];
            [self addSubview:btnmenu4];
            
            lblmenu4 = [[UILabel alloc]initWithFrame:CGRectMake(302, 45, 40, 15)];
            lblmenu4.text = @"CONTACT";
            lblmenu4.font = [UIFont fontWithName:@"OpenSans-Semibold" size:14.0];
            //  UIFont* boldFont = [UIFont boldSystemFontOfSize:[UIFont systemFontSize]];
            //  [lbllogin setFont:boldFont];
            lblmenu4.numberOfLines = 0;
            lblmenu4.baselineAdjustment = YES;
            lblmenu4.adjustsFontSizeToFitWidth = YES;
            lblmenu4.clipsToBounds = YES;
            lblmenu4.backgroundColor = [UIColor clearColor];
            lblmenu4.textColor =[UIColor whiteColor];
            lblmenu4.textAlignment = NSTextAlignmentLeft;
            [self addSubview:lblmenu4];
        }
        else
        {
        btnmenu1 = [UIButton buttonWithType:UIButtonTypeCustom];
        btnmenu1.frame = CGRectMake(20, 5, 40, 40);
        [btnmenu1 setBackgroundImage:[UIImage imageNamed:@"bottom-icon1.png"] forState:UIControlStateNormal];
        [btnmenu1 addTarget:self action:@selector(menu1clk:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:btnmenu1];
            
            lblmenu1 = [[UILabel alloc]initWithFrame:CGRectMake(17, 42, 45, 18)];
            lblmenu1.text = @"MY TASKS";
            lblmenu1.font = [UIFont fontWithName:@"OpenSans-Semibold" size:16.0];
            //  UIFont* boldFont = [UIFont boldSystemFontOfSize:[UIFont systemFontSize]];
            //  [lbllogin setFont:boldFont];
            lblmenu1.numberOfLines = 0;
            lblmenu1.baselineAdjustment = YES;
            lblmenu1.adjustsFontSizeToFitWidth = YES;
            lblmenu1.clipsToBounds = YES;
            lblmenu1.backgroundColor = [UIColor clearColor];
            lblmenu1.textColor =[UIColor whiteColor];
            lblmenu1.textAlignment = NSTextAlignmentLeft;
            [self addSubview:lblmenu1];
        
        btnmenu2 = [UIButton buttonWithType:UIButtonTypeCustom];
        btnmenu2.frame = CGRectMake(100,5, 40, 40);
        [btnmenu2 setBackgroundImage:[UIImage imageNamed:@"bottom-icon2.png"] forState:UIControlStateNormal];
        //  [btnmenu2 addTarget:self action:@selector(menu1clk) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:btnmenu2];
            
            lblmenu2 = [[UILabel alloc]initWithFrame:CGRectMake(99, 42, 45, 18)];
            lblmenu2.text = @"ACCOUNT";
            lblmenu2.font = [UIFont fontWithName:@"OpenSans-Semibold" size:16.0];
            //  UIFont* boldFont = [UIFont boldSystemFontOfSize:[UIFont systemFontSize]];
            //  [lbllogin setFont:boldFont];
            lblmenu2.numberOfLines = 0;
            lblmenu2.baselineAdjustment = YES;
            lblmenu2.adjustsFontSizeToFitWidth = YES;
            lblmenu2.clipsToBounds = YES;
            lblmenu2.backgroundColor = [UIColor clearColor];
            lblmenu2.textColor =[UIColor whiteColor];
            lblmenu2.textAlignment = NSTextAlignmentLeft;
            [self addSubview:lblmenu2];
        
        btnmenu3 = [UIButton buttonWithType:UIButtonTypeCustom];
        btnmenu3.frame = CGRectMake(180, 5, 40, 40);
        [btnmenu3 setBackgroundImage:[UIImage imageNamed:@"bottom-icon3.png"] forState:UIControlStateNormal];
        //  [btnmenu3 addTarget:self action:@selector(menu1clk) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:btnmenu3];
        
            lblmenu3 = [[UILabel alloc]initWithFrame:CGRectMake(178, 42, 45, 18)];
            lblmenu3.text = @"MESSAGES";
            lblmenu3.font = [UIFont fontWithName:@"OpenSans-Semibold" size:16.0];
            //  UIFont* boldFont = [UIFont boldSystemFontOfSize:[UIFont systemFontSize]];
            //  [lbllogin setFont:boldFont];
            lblmenu3.numberOfLines = 0;
            lblmenu3.baselineAdjustment = YES;
            lblmenu3.adjustsFontSizeToFitWidth = YES;
            lblmenu3.clipsToBounds = YES;
            lblmenu3.backgroundColor = [UIColor clearColor];
            lblmenu3.textColor =[UIColor whiteColor];
            lblmenu3.textAlignment = NSTextAlignmentLeft;
            [self addSubview:lblmenu3];
            
        btnmenu4 = [UIButton buttonWithType:UIButtonTypeCustom];
        btnmenu4.frame = CGRectMake(260, 5, 40, 40);
        [btnmenu4 setBackgroundImage:[UIImage imageNamed:@"bottom-icon4.png"] forState:UIControlStateNormal];
        //  [btnmenu4 addTarget:self action:@selector(menu1clk) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:btnmenu4];
            
            lblmenu4 = [[UILabel alloc]initWithFrame:CGRectMake(260, 42, 45, 18)];
            lblmenu4.text = @"CONTACT";
            lblmenu4.font = [UIFont fontWithName:@"OpenSans-Semibold" size:16.0];
            //  UIFont* boldFont = [UIFont boldSystemFontOfSize:[UIFont systemFontSize]];
            //  [lbllogin setFont:boldFont];
            lblmenu4.numberOfLines = 0;
            lblmenu4.baselineAdjustment = YES;
            lblmenu4.adjustsFontSizeToFitWidth = YES;
            lblmenu4.clipsToBounds = YES;
            lblmenu4.backgroundColor = [UIColor clearColor];
            lblmenu4.textColor =[UIColor whiteColor];
            lblmenu4.textAlignment = NSTextAlignmentLeft;
            [self addSubview:lblmenu4];
        }
    }
    return self;
}
-(void)menu1clk:(id)sender
{
    
}

@end
