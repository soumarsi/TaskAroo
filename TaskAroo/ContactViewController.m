//
//  ContactViewController.m
//  TaskAroo
//
//  Created by Prosenjit Kolay on 21/05/15.
//  Copyright (c) 2015 Prosenjit Kolay. All rights reserved.
//

#import "ContactViewController.h"

@interface ContactViewController ()<headerDelegate,leftDelegate,UITextFieldDelegate,UITextViewDelegate>

@end

@implementation ContactViewController
@synthesize txtemail,txtname,txtvwmesg,mainview,mainscroll,lblmesg;
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    NSUserDefaults *prefs = [NSUserDefaults standardUserDefaults];
    userid=[prefs valueForKey:@"userid"];
    
    HeaderView *hv = [[HeaderView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 60)];
    hv.userInteractionEnabled = YES;
    hv.myDelegate = self;
    
    //  hv.btnlogo1.hidden=YES;
    if (userid == nil || [userid isEqualToString:@""])
    {
        hv.btnlogo1.hidden=YES;
        hv.lblpagename.text=@"CONTACT US";
        hv.lblpagename.center=CGPointMake(self.view.center.x, hv.lblpagename.center.y);
    }else
    {
         hv.btnlogo1.hidden=YES;
      //  hv.btnlogo1.frame=CGRectMake(self.view.frame.size.width- hv.btnlogo1.frame.size.width-30,  hv.btnlogo1.frame.origin.y-10,  hv.btnlogo1.frame.size.width,  hv.btnlogo1.frame.size.height);
        hv.btnleftmenu.hidden=NO;
        hv.btnleftmenuextra.hidden=NO;
        hv.lblpagename.text=@"CONTACT US";
        hv.lblpagename.center=CGPointMake(self.view.center.x, hv.lblpagename.center.y);
     //   hv.lblpagename.frame=CGRectMake(hv.lblpagename.frame.origin.x-15,  hv.lblpagename.frame.origin.y,  hv.lblpagename.frame.size.width,  hv.lblpagename.frame.size.height);
    }
   
    hv.btnsignnout.hidden=YES;
    [mainview addSubview:hv];
    
    FooterView *fv = [[FooterView alloc]initWithFrame:CGRectMake(0,self.view.frame.size.height-60, self.view.frame.size.width,60)];
    [fv.btnmenu1 addTarget:self action:@selector(taskbuttonTapped:) forControlEvents:UIControlEventTouchUpInside];
    [fv.btnmenu2 addTarget:self action:@selector(MyAccountbuttonTapped:) forControlEvents:UIControlEventTouchUpInside];
    [fv.btnmenu3 addTarget:self action:@selector(MessagebuttonTapped:) forControlEvents:UIControlEventTouchUpInside];
//    [fv.btnmenu4 addTarget:self action:@selector(ContactbuttonTapped:) forControlEvents:UIControlEventTouchUpInside];
    
    [mainview addSubview:fv];
    
    UIView *paddingView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 20, 0)];
    txtemail.leftView = paddingView;
    txtemail.leftViewMode = UITextFieldViewModeAlways;
    
    UIView *paddingView1 = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 20, 0)];
    txtname.leftView = paddingView1;
    txtname.leftViewMode = UITextFieldViewModeAlways;
    
    urlobj=[[UrlconnectionObject alloc]init];
    
   
    txtname.text=[prefs valueForKey:@"username"];
     txtemail.text=[prefs valueForKey:@"email"];
}
-(void)taskbuttonTapped:(id)sender
{
    if (userid == nil || [userid isEqualToString:@""])
    {
        SignInViewController *obj=[self.storyboard instantiateViewControllerWithIdentifier:@"SignInViewControllersid"];
        
        [self.navigationController pushViewController:obj animated:NO];
    }
    else{
    TaskHomeViewController *obj=[self.storyboard instantiateViewControllerWithIdentifier:@"TaskHomeViewControllersid"];
    
    [self.navigationController pushViewController:obj animated:NO];
    }
    
}
-(void)MyAccountbuttonTapped:(id)sender
{
    
    if (userid == nil || [userid isEqualToString:@""])
    {
        SignInViewController *obj=[self.storyboard instantiateViewControllerWithIdentifier:@"SignInViewControllersid"];
        obj.pagename=@"account";
        [self.navigationController pushViewController:obj animated:NO];
    }
    else
    {
        MyAccountViewController *obj=[self.storyboard instantiateViewControllerWithIdentifier:@"MyAccountViewControllersid"];
        
        [self.navigationController pushViewController:obj animated:NO];
    }
    /*
     UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"just alert" message:@"first footer clicked" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
     [alert show];
     */
}
-(void)MessagebuttonTapped:(id)sender
{
    
    if (userid == nil || [userid isEqualToString:@""])
    {
        SignInViewController *obj=[self.storyboard instantiateViewControllerWithIdentifier:@"SignInViewControllersid"];
        obj.pagename=@"message";
        [self.navigationController pushViewController:obj animated:NO];
    }
    else
    {
        MessageViewController *obj=[self.storyboard instantiateViewControllerWithIdentifier:@"MessageViewControllersid"];
        
        [self.navigationController pushViewController:obj animated:NO];
    }
    /*
     UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"just alert" message:@"first footer clicked" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
     [alert show];
     */
}
-(void)leftclk:(NSInteger)sender
{
    if (sender==0) {
        //   NSLog(@"go task page.");
        ViewController *obj=[self.storyboard instantiateViewControllerWithIdentifier:@"ViewControllersid"];
        
        [self.navigationController pushViewController:obj animated:YES];
    }
    if (sender==1) {
        //   NSLog(@"go task page.");
        FinancialDetailsViewController *obj=[self.storyboard instantiateViewControllerWithIdentifier:@"FinancialDetailsViewControllersid"];
        
        [self.navigationController pushViewController:obj animated:YES];
    }
    else if (sender==2) {
        //   NSLog(@"go task page.");
        MyTransactionViewController *obj=[self.storyboard instantiateViewControllerWithIdentifier:@"MyTransactionViewControllersid"];
        
        [self.navigationController pushViewController:obj animated:YES];
    }
    else if (sender==3) {
        //   NSLog(@"go task page.");
        ReferFriendViewController *obj=[self.storyboard instantiateViewControllerWithIdentifier:@"ReferFriendViewControllersid"];
        
        [self.navigationController pushViewController:obj animated:YES];
    }
    else if (sender==4) {
        NSString *appDomain = [[NSBundle mainBundle] bundleIdentifier];
        [[NSUserDefaults standardUserDefaults] removePersistentDomainForName:appDomain];
        [self deleteDocDirectory];
        ViewController *obj1=[self.storyboard instantiateViewControllerWithIdentifier:@"ViewControllersid"];
        [self.navigationController pushViewController:obj1 animated:YES];
    }
}
-(void)deleteDocDirectory
{
    
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask,   YES);
    
    for (int i=0; i<3; i++)
    {
        NSString *documentsDirectory = [paths objectAtIndex:0];
        NSString *taskimg=[@"taskimage" stringByAppendingString:[NSString stringWithFormat:@"%d", i+1]];
        NSString *taskimg1=[taskimg stringByAppendingString:@".png"];
        NSString *savedImagePath = [documentsDirectory stringByAppendingPathComponent:taskimg1];
        NSError *error = nil;
        
        BOOL fileExists = [[NSFileManager defaultManager] fileExistsAtPath:savedImagePath];
        if (fileExists==YES)
        {
            if(![fileManager removeItemAtPath: savedImagePath error:&error])
            {
                NSLog(@"Delete failed:%@", error);
            }
            else
            {
                NSLog(@"image removed: %@", savedImagePath);
            }
        }
    }
    
}
-(void)headerclk:(UIButton *)sender
{
    
    //   NSLog(@"get value method called");
    long tagId = [sender tag];
    if (tagId==3 || tagId==4)
    {
        //  NSLog(@"left menu");
        if(mainview.center.x==self.view.frame.size.width/2)
        {
            
            //            [UIView beginAnimations:@"ToggleViews" context:nil];
            //            [UIView setAnimationRepeatCount:1];
            //            [UIView setAnimationRepeatAutoreverses:NO];
            //            mainview.center = CGPointMake([[UIScreen mainScreen] bounds].size.width+60,
            //                                          self.view.center.y);
            [txtemail resignFirstResponder];
            [txtname resignFirstResponder];
            [txtvwmesg resignFirstResponder];
       //     [mainscroll setContentOffset:CGPointMake(0,0) animated:YES];
            
            [leftView removeFromSuperview];
            leftView = [LeftMenuView leftmenu];
            [leftView leftmenumethod];
            leftView.frame = CGRectMake(-160, 0,[[UIScreen mainScreen] bounds].size.width/2+60, self.view.frame.size.height);
            leftView.leftDelegate=self;
            [leftView.btnprofImg addTarget:self action:@selector(ProfilebuttonTapped:) forControlEvents:UIControlEventTouchUpInside];
            [self.view addSubview:leftView];
            
            [UIView animateWithDuration:0.5 animations:^{
                
                
                mainview.center = CGPointMake([[UIScreen mainScreen] bounds].size.width+60,self.view.center.y);
                
                leftView.frame = CGRectMake(0, 0,[[UIScreen mainScreen] bounds].size.width/2+60, self.view.frame.size.height);
                
                
            } completion:^(BOOL finished) {
                
                
            }];
            
            
            
            // [UIView commitAnimations];
        }
        else
        {
            //            [UIView beginAnimations:@"ToggleViews" context:nil];
            //            [UIView setAnimationRepeatCount:1];
            //            [UIView setAnimationRepeatAutoreverses:NO];
            //            mainview.center = CGPointMake(self.view.center.x,
            //                                          self.view.center.y);
            //    leftView.frame=CGRectMake(self.view.frame.origin.x-[[UIScreen mainScreen] bounds].size.width/2-60, 0,[[UIScreen mainScreen] bounds].size.width/2+60, self.view.frame.size.height);
            
            [UIView animateWithDuration:0.5 animations:^{
                
                
                mainview.center = CGPointMake(self.view.center.x,self.view.center.y);
                
                leftView.frame = CGRectMake(-leftView.frame.size.width, 0,[[UIScreen mainScreen] bounds].size.width/2+60, self.view.frame.size.height);
                
                
            } completion:^(BOOL finished) {
                
                [leftView removeFromSuperview];
                [UIView commitAnimations];
            }];
            
            
            
            
            
            
            
            
            
            
            
        }
    }
    else if (tagId==1)
    {
        ViewController *obj=[self.storyboard instantiateViewControllerWithIdentifier:@"ViewControllersid"];
        
        [self.navigationController pushViewController:obj animated:YES];
    }
}
-(void)ProfilebuttonTapped:(id)sender
{
    
    if (userid == nil || [userid isEqualToString:@""])
    {
        SignInViewController *obj=[self.storyboard instantiateViewControllerWithIdentifier:@"SignInViewControllersid"];
        
        [self.navigationController pushViewController:obj animated:YES];
    }
    else
    {
        MyAccountViewController *obj=[self.storyboard instantiateViewControllerWithIdentifier:@"MyAccountViewControllersid"];
        
        [self.navigationController pushViewController:obj animated:YES];
    }
    /*
     UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"just alert" message:@"first footer clicked" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
     [alert show];
     */
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

- (IBAction)Sendclk:(id)sender
{
    NSString *emailRegEx = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegEx];
    if (txtname.text.length==0)
    {
        txtname.text=@"";
        txtname.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"Enter Your Name" attributes:@{NSForegroundColorAttributeName: [UIColor redColor]}];
        
    }
    else if ([emailTest evaluateWithObject:txtemail.text] == NO)
    {
        txtemail.text=@"";
        txtemail.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"Not a valid email" attributes:@{NSForegroundColorAttributeName: [UIColor redColor]}];
        
    }
    
    else if(txtvwmesg.text.length==0)
    {
        lblmesg.hidden=NO;
        lblmesg.textColor=[UIColor redColor];
        lblmesg.text=@"Enter some message";
        
    }
    else
    {
        [self sendmesg];
        
    }
}
-(void)sendmesg
{
   
    NSString *str=[NSString stringWithFormat:@"%@contactus_ios/index?email=%@&name=%@&message=%@",URL_LINK,[txtemail.text stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding],[txtname.text stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding],[txtvwmesg.text stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
    NSLog(@"str=%@",str);
    BOOL net=[urlobj connectedToNetwork];
    if (net==YES) {
    [urlobj global:str typerequest:@"array" withblock:^(id result, NSError *error,BOOL completed) {
         [self checkLoader];
        //   NSLog(@"event result----- %@", result);
        NSMutableDictionary *dic=[[NSMutableDictionary alloc]init];
        dic=[result valueForKey:@"response"];
        
        //     NSLog(@"maindictionary %@", mainDic);
        
        NSLog(@"values:%@",[dic valueForKey:@"status"]);
        
        
        if ([[dic valueForKey:@"status"] isEqualToString:@"Success"]) {
            
            [self checkLoader];
            UIAlertView *aler=[[UIAlertView alloc] initWithTitle:@"Success" message:@"Mail sent successfully." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
            [aler show];
        }
        else
        {
            [self checkLoader];
            UIAlertView *aler=[[UIAlertView alloc] initWithTitle:@"Error" message:@"Unsucessful...." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
            [aler show];
        }
        
    }];
    }
    else{
        
        UIAlertView *aler=[[UIAlertView alloc] initWithTitle:@"Alert" message:@"No Network Connection." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [aler show];
    }
}
-(void)checkLoader
{
    
    if([self.view.subviews containsObject:loader_shadow_View])
    {
        
        [loader_shadow_View removeFromSuperview];
        [self.view setUserInteractionEnabled:YES];
    }
    else
    {
        loader_shadow_View = [[UIView alloc] initWithFrame:self.view.frame];
        [loader_shadow_View setBackgroundColor:[UIColor colorWithRed:0 green:0 blue:0 alpha:0.56f]];
        [loader_shadow_View setUserInteractionEnabled:NO];
        [[loader_shadow_View layer] setZPosition:2];
        [self.view setUserInteractionEnabled:NO];
        UIActivityIndicatorView *loader =[[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
        
        [loader setCenter:CGPointMake(self.view.frame.size.width/2, self.view.frame.size.height/2)];
        
        [loader startAnimating];
        
        
        [loader_shadow_View addSubview:loader];
        [self.view addSubview:loader_shadow_View];
    }
}
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [mainscroll setContentOffset:CGPointMake(0,0) animated:YES];
    [textField resignFirstResponder];
    return YES;
}
- (BOOL)textViewShouldBeginEditing:(UITextView *)textView
{
    
    lblmesg.hidden=YES;
    [mainscroll setContentOffset:CGPointMake(0,50) animated:YES];
    return YES;
}
- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text {
    
    lblmesg.hidden=YES;
    
    if([text isEqualToString:@"\n"]) {
        [textView resignFirstResponder];
          [mainscroll setContentOffset:CGPointMake(0,0) animated:YES];
        if (textView.text.length==0) {
            lblmesg.hidden=NO;
        }
        return NO;
    }
    
    
    return YES;
}
@end
