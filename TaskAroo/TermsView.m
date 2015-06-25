//
//  TermsView.m
//  TaskAroo
//
//  Created by Prosenjit Kolay on 22/04/15.
//  Copyright (c) 2015 Prosenjit Kolay. All rights reserved.
//

#import "TermsView.h"

@implementation TermsView
@synthesize btncancel,btniagree,myDelegate,btnsignnout;
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
          [self addSubview:[[[NSBundle mainBundle] loadNibNamed:@"TermsView" owner:self options:nil] objectAtIndex:0]];
  /*
        btnsignnout = [UIButton buttonWithType:UIButtonTypeCustom];
        btnsignnout.frame = CGRectMake(self.frame.size.width-90, 35, 76,30);
        [btnsignnout setTitle:@"Sign Out" forState:UIControlStateNormal];
        btnsignnout.backgroundColor = [UIColor clearColor];
        [btnsignnout setTitleColor:[UIColor blackColor] forState:UIControlStateNormal ];
        btnsignnout.titleLabel.font = [UIFont fontWithName:@"OpenSans-Semibold" size:14.0];
        btnsignnout.tag=2;
        [self addSubview:btnsignnout];
        [btnsignnout addTarget:self action:@selector(signoutclk:) forControlEvents:UIControlEventTouchUpInside];
  */
    }
    
    return self;
    
}

/*
- (IBAction)cancelclk:(UIButton *)sender
{     [myDelegate termsclk:sender];

}
*/
- (IBAction)agreeclk:(id)sender
{
    [[NSNotificationCenter defaultCenter]
     postNotificationName:@"agreeNotification"
     object:self];
}
/*
- (IBAction)signoutclk:(UIButton *)sender
{
    [myDelegate termsclk:sender];
}
 */
- (IBAction)cancelclk:(UIButton *)sender
{
    [[NSNotificationCenter defaultCenter]
     postNotificationName:@"TestNotification"
     object:self];
  /*
    NSLog(@"sender=%@",sender);
    if([myDelegate respondsToSelector:@selector(termsclk:)])
    {
     [myDelegate termsclk:sender];
    }
   */
}
@end
