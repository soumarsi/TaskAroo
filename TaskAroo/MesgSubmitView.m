//
//  MesgSubmitView.m
//  TaskAroo
//
//  Created by Prosenjit Kolay on 22/05/15.
//  Copyright (c) 2015 Prosenjit Kolay. All rights reserved.
//

#import "MesgSubmitView.h"

@implementation MesgSubmitView
@synthesize btnchoosefile,btnsend,txtvwmesg,lblmesg,fileimg;
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
        [self addSubview:[[[NSBundle mainBundle] loadNibNamed:@"MesgSubmitView" owner:self options:nil] objectAtIndex:0]];
        
    }
    
    return self;
    
}
- (IBAction)ChooseFileClk:(id)sender
{
    
}

- (IBAction)SendClk:(id)sender {
}
- (BOOL)textViewShouldBeginEditing:(UITextView *)textView
{
    
    lblmesg.hidden=YES;
    return YES;
}
- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text {
    
    lblmesg.hidden=YES;
    
    if([text isEqualToString:@"\n"]) {
        [textView resignFirstResponder];
        //  [Main_acroll setContentOffset:CGPointMake(0,0) animated:YES];
        if (textView.text.length==0) {
           lblmesg.hidden=NO;
        }
        return NO;
    }
    
    
    return YES;
}

@end
