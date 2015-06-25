//
//  ForgotPasswordViewController.m
//  TaskAroo
//
//  Created by Priyanka ghosh on 10/06/15.
//  Copyright (c) 2015 Prosenjit Kolay. All rights reserved.
//

#import "ForgotPasswordViewController.h"

@interface ForgotPasswordViewController ()<UITextFieldDelegate>

@end

@implementation ForgotPasswordViewController
@synthesize txtemail,mainscroll;
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [mainscroll setFrame:CGRectMake(self.view.layer.frame.origin.x, self.view.layer.frame.origin.y, self.view.bounds.size.width, self.view.bounds.size.height)];
    UIGraphicsBeginImageContext(mainscroll.frame.size);
    [[UIImage imageNamed:@"bg.png"] drawInRect:mainscroll.bounds];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    mainscroll.backgroundColor = [UIColor colorWithPatternImage:image];
    
    UIView *paddingView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 20, 0)];
    txtemail.leftView = paddingView;
    txtemail.leftViewMode = UITextFieldViewModeAlways;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)logoClk:(id)sender
{
    ViewController *obj=[self.storyboard instantiateViewControllerWithIdentifier:@"ViewControllersid"];
    [self.navigationController pushViewController:obj animated:YES];
}

- (IBAction)SubmitClk:(id)sender
{
    NSString *emailRegEx = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegEx];
    
    if ([emailTest evaluateWithObject:txtemail.text] == NO)
    {
        txtemail.text=@"";
        txtemail.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"Not a valid email" attributes:@{NSForegroundColorAttributeName: [UIColor redColor]}];
        
    }
    else
    {
        
    }
}

- (IBAction)SignInClk:(id)sender
{
    SignInViewController *obj=[self.storyboard instantiateViewControllerWithIdentifier:@"SignInViewControllersid"];
    [self.navigationController pushViewController:obj animated:YES];
}
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}
@end
