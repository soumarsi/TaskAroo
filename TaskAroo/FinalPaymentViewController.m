//
//  FinalPaymentViewController.m
//  taskaroo
//
//  Created by Saptarshi's iMAC on 29/05/15.
//  Copyright (c) 2015 Esolz. All rights reserved.
//

#import "FinalPaymentViewController.h"
#import "FinalPrototypeTableViewCell.h"

@interface FinalPaymentViewController ()<UITableViewDataSource,UITableViewDelegate,headerDelegate,leftDelegate,UITextFieldDelegate,UIAlertViewDelegate>
{
    UIButton *checkbox;
    UIButton *checkbox1;
    BOOL checkBoxSelected;
    BOOL checkBox1Selected;
    BOOL radioButton1Selected;
    BOOL radioButton2Selected;
    BOOL radioButton3Selected;
    BOOL radioButton4Selected;
    BOOL radioButton5Selected;
    
    NSString *terms;
    NSString *terms1;
    NSString *terms2;
    NSString *terms3;
    NSString *terms4;
    NSString *terms5;
    NSString *terms6;
    
    UIButton *radiobutton1;
    UIButton *radiobutton2;
    UIButton *radiobutton3;
    UIButton *radiobutton4;
    UIButton *radiobutton5;
    
    NSInteger flag1;
    NSInteger flag2;
    
}

@end

@implementation FinalPaymentViewController
@synthesize myview,mainscroll,tblcarddetails,taskid,lblbidamt,lblbillingamt,lblservicefee,lblsubtotal,lblpercentage,btnupdt,txtextraamt,lblextraamt,extraview,billingview,lblhrs,hourview,billmainview,billinfolowerview,verticallineview,lbliagree,btnpayment,btnAgreeExtra;
-(void) viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    flag1=0;
    flag2=0;
    if(self.view.frame.size.width==320)
    {
        [self.mainscroll setContentSize:CGSizeMake(320.0f,800.0f)];
    checkbox = [[UIButton alloc] initWithFrame:CGRectMake(25,682,25,25)];
    checkbox1 = [[UIButton alloc] initWithFrame:CGRectMake(25,372,15,15)];
//   radiobutton1=[[UIButton alloc] initWithFrame:CGRectMake(45,472,20,20)];
//   radiobutton2=[[UIButton alloc] initWithFrame:CGRectMake(45,507,20,20)];
//   radiobutton3=[[UIButton alloc] initWithFrame:CGRectMake(45,548,20,20)];
//   radiobutton4=[[UIButton alloc] initWithFrame:CGRectMake(45,584,20,20)];
//   radiobutton5=[[UIButton alloc] initWithFrame:CGRectMake(45,624,20,20)];
    }
    if ([UIScreen mainScreen].bounds.size.width>320)
    {
        //_mainscroll.frame = CGRectMake(0,90,320,875);
        //[self.mainscroll setFrame:CGRectMake(0, 60, 320, 875)];
        [self.mainscroll setContentSize:CGSizeMake(320.0f,800.0f)];
        
    checkbox = [[UIButton alloc] initWithFrame:CGRectMake(35,682,25,25)];
    checkbox1 = [[UIButton alloc] initWithFrame:CGRectMake(25,372,15,15)];
//   radiobutton1=[[UIButton alloc] initWithFrame:CGRectMake(45,472,20,20)];
//   radiobutton2=[[UIButton alloc] initWithFrame:CGRectMake(45,508,20,20)];
//   radiobutton3=[[UIButton alloc] initWithFrame:CGRectMake(45,548,20,20)];
//   radiobutton4=[[UIButton alloc] initWithFrame:CGRectMake(45,584,20,20)];
//   radiobutton5=[[UIButton alloc] initWithFrame:CGRectMake(45,624,20,20)];
        
        //[_mainscroll setFrame:CGRectMake(0,0,[UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height)];
//        radiobutton1.tag=1;
//        radiobutton2.tag=2;
//        radiobutton3.tag=3;
//        radiobutton4.tag=4;
//        radiobutton5.tag=5;
        
    }

    [mainscroll addSubview:checkbox];
    [mainscroll addSubview:checkbox1];
//    [_mainscroll addSubview:radiobutton1];
//    [_mainscroll addSubview:radiobutton2];
//    [_mainscroll addSubview:radiobutton3];
//    [_mainscroll addSubview:radiobutton4];
//    [_mainscroll addSubview:radiobutton5];
    
   
    [checkbox setBackgroundImage:[UIImage imageNamed:@"tick2"]
                        forState:UIControlStateNormal];
    [checkbox setBackgroundImage:[UIImage imageNamed:@"tick1"]
                        forState:UIControlStateSelected];
    [checkbox setBackgroundImage:[UIImage imageNamed:@"tick1"]
                        forState:UIControlStateHighlighted];
    checkbox.adjustsImageWhenHighlighted=YES;
    
    [checkbox1 setBackgroundImage:[UIImage imageNamed:@"tick2"]
                        forState:UIControlStateNormal];
    [checkbox1 setBackgroundImage:[UIImage imageNamed:@"tick1"]
                        forState:UIControlStateSelected];
    [checkbox1 setBackgroundImage:[UIImage imageNamed:@"tick1"]
                        forState:UIControlStateHighlighted];
    checkbox.adjustsImageWhenHighlighted=YES;
    
   
//    [radiobutton1 setBackgroundImage:[UIImage imageNamed:@"radiobutton1"]
//                         forState:UIControlStateNormal];
//   
//    [radiobutton1 setBackgroundImage:[UIImage imageNamed:@"radiobutton2"]
//                         forState:UIControlStateSelected];
//    [radiobutton1 setBackgroundImage:[UIImage imageNamed:@"radiobutton2"]
//                         forState:UIControlStateHighlighted];
//    radiobutton1.adjustsImageWhenHighlighted=YES;
//    
//   
//    
//    
//    
//    
//    [radiobutton2 setBackgroundImage:[UIImage imageNamed:@"radiobutton1"]
//                            forState:UIControlStateNormal];
//    [radiobutton2 setBackgroundImage:[UIImage imageNamed:@"radiobutton2"]
//                            forState:UIControlStateSelected];
//    [radiobutton2 setBackgroundImage:[UIImage imageNamed:@"radiobutton2"]
//                            forState:UIControlStateHighlighted];
//    radiobutton2.adjustsImageWhenHighlighted=YES;
//
//    
//    
//    [radiobutton3 setBackgroundImage:[UIImage imageNamed:@"radiobutton1"]
//                            forState:UIControlStateNormal];
//    [radiobutton3 setBackgroundImage:[UIImage imageNamed:@"radiobutton2"]
//                            forState:UIControlStateSelected];
//    [radiobutton3 setBackgroundImage:[UIImage imageNamed:@"radiobutton2"]
//                            forState:UIControlStateHighlighted];
//    radiobutton3.adjustsImageWhenHighlighted=YES;
//    
//    [radiobutton4 setBackgroundImage:[UIImage imageNamed:@"radiobutton1"]
//                            forState:UIControlStateNormal];
//    [radiobutton4 setBackgroundImage:[UIImage imageNamed:@"radiobutton2"]
//                            forState:UIControlStateSelected];
//    [radiobutton4 setBackgroundImage:[UIImage imageNamed:@"radiobutton2"]
//                            forState:UIControlStateHighlighted];
//    radiobutton4.adjustsImageWhenHighlighted=YES;
//    
//    [radiobutton5 setBackgroundImage:[UIImage imageNamed:@"radiobutton1"]
//                            forState:UIControlStateNormal];
//    [radiobutton5 setBackgroundImage:[UIImage imageNamed:@"radiobutton2"]
//                            forState:UIControlStateSelected];
//    [radiobutton5 setBackgroundImage:[UIImage imageNamed:@"radiobutton2"]
//                            forState:UIControlStateHighlighted];
//    radiobutton5.adjustsImageWhenHighlighted=YES;
    
    
    [checkbox addTarget:self action:@selector(checkboxSelected:) forControlEvents:UIControlEventTouchUpInside];
    
    [checkbox1 addTarget:self action:@selector(checkbox1Selected:) forControlEvents:UIControlEventTouchUpInside];
    
  
//    [radiobutton1 addTarget:self action:@selector(radiobutton1Selected:) forControlEvents:UIControlEventTouchUpInside];
//    
// 
//    [radiobutton2 addTarget:self action:@selector(radiobutton2Selected:) forControlEvents:UIControlEventTouchUpInside];
//    
// 
//     [radiobutton3 addTarget:self action:@selector(radiobutton3Selected:) forControlEvents:UIControlEventTouchUpInside];
//        
//    
//     [radiobutton4 addTarget:self action:@selector(radiobutton4Selected:) forControlEvents:UIControlEventTouchUpInside];
//    
//      [radiobutton5 addTarget:self action:@selector(radiobutton5Selected:) forControlEvents:UIControlEventTouchUpInside];
    //[self.view addSubview:checkbox];
    
    
    NSUserDefaults *prefs = [NSUserDefaults standardUserDefaults];
    userid=[prefs valueForKey:@"userid"];
    
    HeaderView *hv = [[HeaderView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 60)];
    hv.userInteractionEnabled = YES;
    hv.myDelegate = self;
    //  hv.btnlogo1.hidden=YES;
    if (userid == nil || [userid isEqualToString:@""])
    {
    }else
    {
        hv.btnlogo1.hidden=YES;
        //  hv.btnlogo1.frame=CGRectMake(self.view.frame.size.width- hv.btnlogo1.frame.size.width-30,  hv.btnlogo1.frame.origin.y-10,  hv.btnlogo1.frame.size.width,  hv.btnlogo1.frame.size.height);
        hv.btnleftmenu.hidden=NO;
        hv.btnleftmenuextra.hidden=NO;
        hv.lblpagename.text=@"PAYMENT";
        hv.lblpagename.center=CGPointMake(self.view.center.x, hv.lblpagename.center.y);
        //    hv.lblpagename.frame=CGRectMake(hv.lblpagename.frame.origin.x-24,  hv.lblpagename.frame.origin.y,  hv.lblpagename.frame.size.width,  hv.lblpagename.frame.size.height);
    }
    
    hv.btnsignnout.hidden=YES;
    [myview addSubview:hv];
    
    FooterView *fv = [[FooterView alloc]initWithFrame:CGRectMake(0,self.view.frame.size.height-60, self.view.frame.size.width,60)];
    [fv.btnmenu1 addTarget:self action:@selector(taskbuttonTapped:) forControlEvents:UIControlEventTouchUpInside];
    [fv.btnmenu2 addTarget:self action:@selector(MyAccountbuttonTapped:) forControlEvents:UIControlEventTouchUpInside];
       [fv.btnmenu3 addTarget:self action:@selector(MessagebuttonTapped:) forControlEvents:UIControlEventTouchUpInside];
    [fv.btnmenu4 addTarget:self action:@selector(ContactbuttonTapped:) forControlEvents:UIControlEventTouchUpInside];
    
    [myview addSubview:fv];
    
    
    
    
    UIToolbar *toolbar1 = [[UIToolbar alloc] initWithFrame:CGRectMake(0.0f, 0.0f, 320.0f, 35.0f)];
    toolbar1.barStyle=UIBarStyleDefault;
    //    // Create a flexible space to align buttons to the right
    UIBarButtonItem *flexibleSpace1 = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
    //    // Create a cancel button to dismiss the keyboard
    UIBarButtonItem *barButtonItem1 = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(resetView1)];
    //    // Add buttons to the toolbar
    [toolbar1 setItems:[NSArray arrayWithObjects:flexibleSpace1, barButtonItem1, nil]];
    // Set the toolbar as accessory view of an UITextField object
    txtextraamt.inputAccessoryView = toolbar1;
    
    UIView *paddingView2 = [[UIView alloc] initWithFrame:CGRectMake(0, 0,18, 20)];
    txtextraamt.leftView = paddingView2;
    txtextraamt.leftViewMode = UITextFieldViewModeAlways;
    
    urlobj=[[UrlconnectionObject alloc]init];
    ArrCardDetails=[[NSMutableArray alloc]init];
    [self defaultcreditShow];
    update=0;
    NSLog(@"taskid=%@",taskid);

}
-(void)resetView1
{
    [txtextraamt resignFirstResponder];
}
-(void)taskbuttonTapped:(id)sender
{
    
    TaskHomeViewController *obj=[self.storyboard instantiateViewControllerWithIdentifier:@"TaskHomeViewControllersid"];
    
    [self.navigationController pushViewController:obj animated:NO];
    
}
-(void)MyAccountbuttonTapped:(id)sender
{
    
    if (userid == nil || [userid isEqualToString:@""])
    {
        SignInViewController *obj=[self.storyboard instantiateViewControllerWithIdentifier:@"SignInViewControllersid"];
        
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

-(void)ContactbuttonTapped:(id)sender
{
    
    ContactViewController *obj=[self.storyboard instantiateViewControllerWithIdentifier:@"ContactViewControllersid"];
    
    [self.navigationController pushViewController:obj animated:NO];
    
}
-(void)MessagebuttonTapped:(id)sender
{
    
    if (userid == nil || [userid isEqualToString:@""])
    {
        SignInViewController *obj=[self.storyboard instantiateViewControllerWithIdentifier:@"SignInViewControllersid"];
        
        [self.navigationController pushViewController:obj animated:YES];
    }
    else
    {
        MessageViewController *obj=[self.storyboard instantiateViewControllerWithIdentifier:@"MessageViewControllersid"];
        
        [self.navigationController pushViewController:obj animated:YES];
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
        if(myview.center.x==self.view.frame.size.width/2)
        {
            
            //            [UIView beginAnimations:@"ToggleViews" context:nil];
            //            [UIView setAnimationRepeatCount:1];
            //            [UIView setAnimationRepeatAutoreverses:NO];
            //            mainview.center = CGPointMake([[UIScreen mainScreen] bounds].size.width+60,
            //                                          self.view.center.y);
            [leftView removeFromSuperview];
            leftView = [LeftMenuView leftmenu];
            [leftView leftmenumethod];
            leftView.frame = CGRectMake(-160, 0,[[UIScreen mainScreen] bounds].size.width/2+60, self.view.frame.size.height);
            leftView.leftDelegate=self;
            [leftView.btnprofImg addTarget:self action:@selector(ProfilebuttonTapped:) forControlEvents:UIControlEventTouchUpInside];
            [self.view addSubview:leftView];
            
            [UIView animateWithDuration:0.5 animations:^{
                
                
                myview.center = CGPointMake([[UIScreen mainScreen] bounds].size.width+60,self.view.center.y);
                
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
                
                
                myview.center = CGPointMake(self.view.center.x,self.view.center.y);
                
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

-(void)checkboxSelected:(id)sender
{
    checkBoxSelected = !checkBoxSelected; /* Toggle */
    [checkbox setSelected:checkBoxSelected];
    if(checkBoxSelected==YES)
    {
        terms=@"YES";
    }
    else
    {
        terms=@"NO";
        
    }
    //[self.regbtn setEnabled:YES];
}

-(void)checkbox1Selected:(id)sender
{
    checkBox1Selected = !checkBox1Selected; /* Toggle */
    [checkbox1 setSelected:checkBox1Selected];
    if(checkBox1Selected==YES)
    {
        terms1=@"YES";
        txtextraamt.hidden=NO;
      //  btnupdt.hidden=NO;
    }
    else
    {
        terms1=@"NO";
        txtextraamt.hidden=YES;
        btnupdt.hidden=YES;
    }
    //[self.regbtn setEnabled:YES];
}

//-(void)radiobutton1Selected:(id)sender
//{
//    radiobutton1.tag=0;
//    if([sender isSelected])
//    {
//        [radiobutton1 setBackgroundImage:[UIImage imageNamed:@"radiobutton1"]
//                                forState:UIControlStateNormal];
//        [sender setSelected:NO];
//    }
//    else
//    {
//        [radiobutton1 setBackgroundImage:[UIImage imageNamed:@"radiobutton1"]
//                                forState:UIControlStateNormal];
//        [sender setSelected:YES];
//    }
//    [radiobutton2 setSelected:NO];
//    [radiobutton3 setSelected:NO];
//    [radiobutton4 setSelected:NO];
//    [radiobutton5 setSelected:NO];
//
//}
//
//-(void)radiobutton2Selected:(id)sender
//{
//    radiobutton2.tag=0;
//    if([sender isSelected])
//    {
//        [radiobutton2 setBackgroundImage:[UIImage imageNamed:@"radiobutton1"]
//                                forState:UIControlStateNormal];
//        [sender setSelected:NO];
//    }
//    else
//    {
//        [radiobutton2 setBackgroundImage:[UIImage imageNamed:@"radiobutton1"]
//                                forState:UIControlStateNormal];
//        [sender setSelected:YES];
//    }
//    [radiobutton1 setSelected:NO];
//    [radiobutton3 setSelected:NO];
//    [radiobutton4 setSelected:NO];
//    [radiobutton5 setSelected:NO];
//
//}
//
//-(void)radiobutton3Selected:(id)sender
//{
//    radiobutton3.tag=0;
//    if([sender isSelected])
//    {
//        [radiobutton3 setBackgroundImage:[UIImage imageNamed:@"radiobutton1"]
//                                forState:UIControlStateNormal];
//        [sender setSelected:NO];
//    }
//    else
//    {
//        [radiobutton3 setBackgroundImage:[UIImage imageNamed:@"radiobutton1"]
//                                forState:UIControlStateNormal];
//        [sender setSelected:YES];
//    }
//    [radiobutton1 setSelected:NO];
//    [radiobutton2 setSelected:NO];
//    [radiobutton4 setSelected:NO];
//    [radiobutton5 setSelected:NO];
//
//
//}
//
//-(void)radiobutton4Selected:(id)sender
//{
//    radiobutton4.tag=0;
//    if([sender isSelected])
//    {
//        [radiobutton4 setBackgroundImage:[UIImage imageNamed:@"radiobutton1"]
//                                forState:UIControlStateNormal];
//        [sender setSelected:NO];
//    }
//    else
//    {
//        [radiobutton4 setBackgroundImage:[UIImage imageNamed:@"radiobutton1"]
//                                forState:UIControlStateNormal];
//        [sender setSelected:YES];
//    }
//    [radiobutton1 setSelected:NO];
//    [radiobutton2 setSelected:NO];
//    [radiobutton3 setSelected:NO];
//    [radiobutton5 setSelected:NO];
//    
//
//}
//
//-(void)radiobutton5Selected:(id)sender
//{
//    radiobutton5.tag=0;
//    if([sender isSelected])
//    {
//        [radiobutton5 setBackgroundImage:[UIImage imageNamed:@"radiobutton1"]
//                                forState:UIControlStateNormal];
//        [sender setSelected:NO];
//    }
//    else
//    {
//        [radiobutton5 setBackgroundImage:[UIImage imageNamed:@"radiobutton1"]
//                                forState:UIControlStateNormal];
//        [sender setSelected:YES];
//    }
//    [radiobutton1 setSelected:NO];
//    [radiobutton2 setSelected:NO];
//    [radiobutton3 setSelected:NO];
//    [radiobutton4 setSelected:NO];
//    
//
//}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 50.0f;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [ArrCardDetails count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellid=@"myprototype";
    FinalPrototypeTableViewCell *cell=(FinalPrototypeTableViewCell *)[tableView dequeueReusableCellWithIdentifier:cellid];
    cell.lblcardno.text = [[ArrCardDetails objectAtIndex:indexPath.row] valueForKey:@"cardnumber"];
    cell.lblcardname.text = [[ArrCardDetails objectAtIndex:indexPath.row] valueForKey:@"name"];
    if ([[[ArrCardDetails objectAtIndex:indexPath.row] valueForKey:@"cardid"] isEqualToString:defaultcardid]) {
        cell.radioimg.image=[UIImage imageNamed:@"rediobutton2"];
    }
    return cell;
}
-(void)ViewCardUrl
{
    @try {
        
        [ArrCardDetails removeAllObjects];
        NSString *str=[NSString stringWithFormat:@"%@add_creditcard_ios/get_card_details?user_id=%@",URL_LINK,[userid stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
        NSLog(@"str=%@",str);
        BOOL net=[urlobj connectedToNetwork];
        if (net==YES) {
            [urlobj global:str typerequest:@"array" withblock:^(id result, NSError *error,BOOL completed) {
                
                   NSLog(@"event result----- %@", result);
                //  totaldata=[[result objectForKey:@"total"] integerValue];
                //    NSLog(@"total active data=%ld",(long)totaldata);
                
                
                NSMutableArray *array = [[NSMutableArray alloc]init];
                for ( NSDictionary *tempDict in  [result objectForKey:@"usercarddetails"])
                {
                    [array addObject:tempDict];
                    
                }
                //    NSLog(@"fggg=%@",[[[result objectForKey:@"usercarddetails"] valueForKey:@"0"] valueForKey:@"cardnumber"]);
                if ([[result valueForKey:@"status"] isEqualToString:@"Success"])
                {
                    
                    if ([array count]==0)
                    {
                        
                        
                    }
                    else{
                        
                        for ( NSDictionary *tempDict in  [result objectForKey:@"usercarddetails"])
                        {
                            [ArrCardDetails addObject:tempDict];
                            
                        }
                        
                        
                        if ([ArrCardDetails count]==0) {
                            
                        }
                        else{
                            
                            
                            [tblcarddetails reloadData];
                           [self PaymentDetailUrl];
                        //    btnsetdefault.hidden=NO;
                           
                        }
                    }
                }
                else
                {
                    
                    
                }
            }];
        }
        else{
            UIAlertView *aler=[[UIAlertView alloc] initWithTitle:@"Alert" message:@"No Network Connection." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
            [aler show];
        }
    }
    @catch (NSException *exception) {
       
        
    }
    @finally {
        
    }
    
    
    
    
}
-(void)defaultcreditShow
{
    
    NSString *str=[NSString stringWithFormat:@"%@add_creditcard_ios/get_default_card?user_id=%@",URL_LINK,[userid stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
    NSLog(@"str=%@",str);
    BOOL net=[urlobj connectedToNetwork];
    if (net==YES) {
        
        [urlobj global:str typerequest:@"array" withblock:^(id result, NSError *error,BOOL completed)
         {
          //   NSLog(@"event result----- %@", result);
             NSMutableDictionary *dic=[[NSMutableDictionary alloc]init];
             dic=[result valueForKey:@"response"];
             
             //     NSLog(@"maindictionary %@", mainDic);
             
         //    NSLog(@"values:%@",[dic valueForKey:@"status"]);
             
             
             if ([[dic valueForKey:@"status"] isEqualToString:@"Success"])
             {
                 
                 defaultcardid=[dic valueForKey:@"default_card_id"];
                 //     UIAlertView *aler=[[UIAlertView alloc] initWithTitle:@"Success" message:@"Default card set." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
                 [self ViewCardUrl];
                 
                 //      [aler show];
             }
             else
             {
                 [self ViewCardUrl];
                 //       UIAlertView *aler=[[UIAlertView alloc] initWithTitle:@"Error" message:@"Unsucessful...." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
                 //       [aler show];
             }
             
         }];
    }
    else{
        //   UIAlertView *aler=[[UIAlertView alloc] initWithTitle:@"Alert" message:@"No Network Connection." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        //   [aler show];
    }
    
}
-(void)PaymentDetailUrl
{
    
    NSString *str=[NSString stringWithFormat:@"%@mark_as_payment_ios/get_user_payment_details?task_id=%@&user_id=%@",URL_LINK,[taskid stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding],[userid stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
    NSLog(@"str=%@",str);
    BOOL net=[urlobj connectedToNetwork];
    if (net==YES) {
        
        [urlobj global:str typerequest:@"array" withblock:^(id result, NSError *error,BOOL completed)
         {
          //   NSLog(@"event result----- %@", result);
             NSMutableDictionary *dic=[[NSMutableDictionary alloc]init];
             dic=[result valueForKey:@"task_data"];
             
             //
             
            
             
             
             if ([[result valueForKey:@"status"] isEqualToString:@"Success"])
             {
                  NSLog(@"maindictionary %@", dic);
                 lblbidamt.text=[@"$" stringByAppendingString:[dic valueForKey:@"bid_amount"]];
                 BillAmtActual=[[dic valueForKey:@"billamount"] floatValue];
                 lblbillingamt.text=[@"$" stringByAppendingString:[dic valueForKey:@"billamount"]];
                 lblservicefee.text=[@"$" stringByAppendingString:[dic valueForKey:@"service_fee"]];
                 lblsubtotal.text=[@"$" stringByAppendingString:[dic valueForKey:@"total_amount"]];
                 lblpercentage.text=[dic valueForKey:@"percentage"];
                 bidderid=[dic valueForKey:@"bidder_id"];
                 bidmode=[dic valueForKey:@"bid_mode"];
                 if ([bidmode isEqualToString:@"1"])
                 {
                     hourview.hidden=NO;
                     hourview.frame=CGRectMake(1, billinfolowerview.frame.origin.y+2, hourview.frame.size.width, hourview.frame.size.height);
                     [billmainview addSubview:hourview];
                     billmainview.frame=CGRectMake(billmainview.frame.origin.x, billmainview.frame.origin.y, billmainview.frame.size.width, billmainview.frame.size.height+hourview.frame.size.height);
                     billingview.frame=CGRectMake(billingview.frame.origin.x, hourview.frame.origin.y+hourview.frame.size.height, billingview.frame.size.width, billingview.frame.size.height);
                     verticallineview.frame=CGRectMake(verticallineview.frame.origin.x, verticallineview.frame.origin.y-4, verticallineview.frame.size.width, verticallineview.frame.size.height+extraview.frame.size.height-5);
                     [billmainview bringSubviewToFront:verticallineview];
                     tblcarddetails.frame=CGRectMake(tblcarddetails.frame.origin.x, billmainview.frame.origin.y+billmainview.frame.size.height+10, tblcarddetails.frame.size.width, tblcarddetails.frame.size.height);
                     checkbox1.frame=CGRectMake(checkbox1.frame.origin.x, checkbox1.frame.origin.y+hourview.frame.size.height, checkbox1.frame.size.width, checkbox1.frame.size.height);
                 }
                 completiontime=[dic valueForKey:@"completion_time"];
                 lblhrs.text=completiontime;
             }
             else
             {
                 
                 //       UIAlertView *aler=[[UIAlertView alloc] initWithTitle:@"Error" message:@"Unsucessful...." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
                 //       [aler show];
             }
             tblcarddetails.frame=CGRectMake(tblcarddetails.frame.origin.x, billmainview.frame.origin.y+billmainview.frame.size.height+10, tblcarddetails.frame.size.width, 57*[ArrCardDetails count]);
             checkbox.frame=CGRectMake(checkbox.frame.origin.x, tblcarddetails.frame.origin.y+tblcarddetails.frame.size.height+10+5, checkbox.frame.size.width, checkbox.frame.size.height);
             lbliagree.frame=CGRectMake(lbliagree.frame.origin.x, tblcarddetails.frame.origin.y+tblcarddetails.frame.size.height+10, lbliagree.frame.size.width, lbliagree.frame.size.height);
             btnAgreeExtra.frame=CGRectMake(btnAgreeExtra.frame.origin.x, tblcarddetails.frame.origin.y+tblcarddetails.frame.size.height+10, btnAgreeExtra.frame.size.width, btnAgreeExtra.frame.size.height);
              btnpayment.frame=CGRectMake(btnpayment.frame.origin.x, lbliagree.frame.origin.y+lbliagree.frame.size.height+10, btnpayment.frame.size.width, btnpayment.frame.size.height);
             [self.mainscroll setContentSize:CGSizeMake(320.0f,750.0f+57*[ArrCardDetails count]-57)];
         }];
    }
    else{
        //   UIAlertView *aler=[[UIAlertView alloc] initWithTitle:@"Alert" message:@"No Network Connection." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        //   [aler show];
    }
    
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

- (IBAction)updateClk:(id)sender
{
    if (btnupdt.selected==NO) {
        
   
    if ([bidmode isEqualToString:@"1"])
    {
      //  btnupdt.selected=YES;
        
        if (txtextraamt.text.length>0)
        {
            extraview.hidden=NO;
            extraview.frame=CGRectMake(1, hourview.frame.origin.y+hourview.frame.size.height, extraview.frame.size.width, extraview.frame.size.height);
            
            billingview.frame=CGRectMake(billingview.frame.origin.x, extraview.frame.origin.y+extraview.frame.size.height, billingview.frame.size.width, billingview.frame.size.height);
            lblextraamt.text=[@"$" stringByAppendingString:txtextraamt.text];
            [billmainview addSubview:extraview];
            
            if (update==0)
            {
                NSLog(@"main view increased");
                billmainview.frame=CGRectMake(billmainview.frame.origin.x, billmainview.frame.origin.y, billmainview.frame.size.width, billmainview.frame.size.height+extraview.frame.size.height);
                checkbox1.frame=CGRectMake(checkbox1.frame.origin.x, checkbox1.frame.origin.y+extraview.frame.size.height, checkbox1.frame.size.width, checkbox1.frame.size.height);
            }
            lblbillingamt.text=[NSString stringWithFormat:@"%.2f",BillAmtActual+[[lblextraamt.text  substringWithRange:NSMakeRange(1, lblextraamt.text.length-1)] floatValue]];
            float percent=[[lblpercentage.text substringToIndex:lblpercentage.text.length-1] floatValue];
            float amt=[lblbillingamt.text floatValue];
            float servicefee=amt*(percent/100.0);
            lblservicefee.text=[@"$" stringByAppendingString:[NSString stringWithFormat:@"%0.2f",servicefee]];
            amt=amt+servicefee;
            lblbillingamt.text=[@"$" stringByAppendingString:lblbillingamt.text];

            lblsubtotal.text=[@"$" stringByAppendingString:[NSString stringWithFormat:@"%0.2f",amt]];
            
            
        }
        
    }
    else
    {
        if (txtextraamt.text.length>0)
        {
            extraview.hidden=NO;
            extraview.frame=CGRectMake(1, billinfolowerview.frame.origin.y+1, extraview.frame.size.width, extraview.frame.size.height);
            [billmainview addSubview:extraview];
            
           
            billingview.frame=CGRectMake(billingview.frame.origin.x, extraview.frame.origin.y+extraview.frame.size.height, billingview.frame.size.width, billingview.frame.size.height);
            lblextraamt.text=[@"$" stringByAppendingString:txtextraamt.text];
            if (update==0)
            {
                NSLog(@"main view increased");
                billmainview.frame=CGRectMake(billmainview.frame.origin.x, billmainview.frame.origin.y, billmainview.frame.size.width, billmainview.frame.size.height+extraview.frame.size.height);
                checkbox1.frame=CGRectMake(checkbox1.frame.origin.x, checkbox1.frame.origin.y+extraview.frame.size.height, checkbox1.frame.size.width, checkbox1.frame.size.height);
            }
            
            lblbillingamt.text=[NSString stringWithFormat:@"%.2f",BillAmtActual+[[lblextraamt.text  substringWithRange:NSMakeRange(1, lblextraamt.text.length-1)] floatValue]];
            float percent=[[lblpercentage.text substringToIndex:lblpercentage.text.length-1] floatValue];
            float amt=[lblbillingamt.text floatValue];
            float servicefee=amt*(percent/100.0);
            lblservicefee.text=[@"$" stringByAppendingString:[NSString stringWithFormat:@"%0.2f",servicefee]];
            amt=amt+servicefee;
            lblbillingamt.text=[@"$" stringByAppendingString:lblbillingamt.text];
            
            lblsubtotal.text=[@"$" stringByAppendingString:[NSString stringWithFormat:@"%0.2f",amt]];
            // checkbox1.frame=CGRectMake(checkbox1.frame.origin.x, checkbox1.frame.origin.y+extraview.frame.size.height, checkbox1.frame.size.width, checkbox1.frame.size.height);

        }

    }
    }
    
    tblcarddetails.frame=CGRectMake(tblcarddetails.frame.origin.x, billmainview.frame.origin.y+billmainview.frame.size.height+10, tblcarddetails.frame.size.width, tblcarddetails.frame.size.height);
    checkbox.frame=CGRectMake(checkbox.frame.origin.x, tblcarddetails.frame.origin.y+tblcarddetails.frame.size.height+10+5, checkbox.frame.size.width, checkbox.frame.size.height);
    btnAgreeExtra.frame=CGRectMake(btnAgreeExtra.frame.origin.x, tblcarddetails.frame.origin.y+tblcarddetails.frame.size.height+10, btnAgreeExtra.frame.size.width, btnAgreeExtra.frame.size.height);
    
lbliagree.frame=CGRectMake(lbliagree.frame.origin.x, tblcarddetails.frame.origin.y+tblcarddetails.frame.size.height+10, lbliagree.frame.size.width, lbliagree.frame.size.height);
    btnpayment.frame=CGRectMake(btnpayment.frame.origin.x, lbliagree.frame.origin.y+lbliagree.frame.size.height+10+5, btnpayment.frame.size.width, btnpayment.frame.size.height);
    update=1;
}
- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField
{
    [mainscroll setContentOffset:CGPointMake(0,250) animated:YES];
   /*
    if(textField==language_spoken || textField==address || textField==city)
    {
        [Main_acroll setContentOffset:CGPointMake(0,100) animated:YES];
    }
    else if (textField==postral_code || textField==country)
    {
        [Main_acroll setContentOffset:CGPointMake(0,240) animated:YES];
    }
    else if (  textField==mobile_number ||  textField==phone_number || textField==email)
    {
        [Main_acroll setContentOffset:CGPointMake(0,400) animated:YES];
    }
    else if (  textField==password ||  textField==confirmpassword)
    {
        [Main_acroll setContentOffset:CGPointMake(0,560) animated:YES];
    }
    */
    return YES;
}
- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    btnupdt.hidden=NO;
    [textField becomeFirstResponder];
}
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    [mainscroll setContentOffset:CGPointMake(0,0) animated:YES];
    return YES;
}


- (IBAction)PaymentClk:(id)sender
{
    if (checkbox.selected==NO)
    {
        UIAlertView *aler=[[UIAlertView alloc] initWithTitle:@"Alert" message:@"Please Agree Terms and Conditions." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [aler show];

    }
    else if (defaultcardid.length==0)
    {
        UIAlertView *aler=[[UIAlertView alloc] initWithTitle:@"Alert" message:@"No default card found." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [aler show];
    }
    else{
        [self FinalPaymentUrl];
    }
}
-(void)FinalPaymentUrl
{
    
    NSString *str=[NSString stringWithFormat:@"%@mark_as_payment_ios/index?task_id=%@&user_id=%@&bidder_id=%@&poster_id=%@&card_id=%@&bid_mode=%@&extra_amount=%@&completion_time=%@&bid_amount=%@&billamount=%@&service_fee=%@&percentage=%@&totalamount=%@",URL_LINK,[taskid stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding],[userid stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding],[bidderid stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding],[userid stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding],[defaultcardid stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding],[bidmode stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding],[lblextraamt.text  substringWithRange:NSMakeRange(1, lblextraamt.text.length-1)],[completiontime stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding],[lblbidamt.text  substringWithRange:NSMakeRange(1, lblbidamt.text.length-1)],[lblbillingamt.text  substringWithRange:NSMakeRange(1, lblbillingamt.text.length-1)],[lblservicefee.text  substringWithRange:NSMakeRange(1, lblservicefee.text.length-1)],[lblpercentage.text stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding],[lblsubtotal.text  substringWithRange:NSMakeRange(1, lblsubtotal.text.length-1)]];
    NSLog(@"str=%@",str);
    
    
    BOOL net=[urlobj connectedToNetwork];
    if (net==YES) {
        [self checkLoader];
        [urlobj global:str typerequest:@"array" withblock:^(id result, NSError *error,BOOL completed) {
            
            //   NSLog(@"event result----- %@", result);
      //      NSMutableDictionary *dic=[[NSMutableDictionary alloc]init];
         //   dic=[result valueForKey:@"response"];
            
            //     NSLog(@"maindictionary %@", mainDic);
            
        //    NSLog(@"values:%@",[dic valueForKey:@"status"]);
            
            
            if ([[result valueForKey:@"status"] isEqualToString:@"Success"]) {
                
                [self checkLoader];
                payment=1;
                UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Success" message:@" Payment done Successfully." delegate:self cancelButtonTitle:@"Review Later" otherButtonTitles:@"Write Review", nil];
                [alertView show];
                
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
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (payment==1)
    {
        if (buttonIndex == [alertView cancelButtonIndex])
        {
            TaskHomeViewController *obj=[self.storyboard instantiateViewControllerWithIdentifier:@"TaskHomeViewControllersid"];
            [self.navigationController pushViewController:obj animated:YES];
        }
        else
        {
            WriteReviewViewController *obj=[self.storyboard instantiateViewControllerWithIdentifier:@"WriteReviewViewControllersid"];
            obj.taskid=taskid;
            [self.navigationController pushViewController:obj animated:YES];
            
        }

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
- (IBAction)AgreeExtraClk:(id)sender
{
    checkBoxSelected = !checkBoxSelected; /* Toggle */
    [checkbox setSelected:checkBoxSelected];
    if(checkBoxSelected==YES)
    {
        terms=@"YES";
    }
    else
    {
        terms=@"NO";
    }

}

- (IBAction)AddextraAmtclk:(id)sender {
    
    checkBox1Selected = !checkBox1Selected; /* Toggle */
    [checkbox1 setSelected:checkBox1Selected];
    if(checkBox1Selected==YES)
    {
        terms1=@"YES";
        txtextraamt.hidden=NO;
        //  btnupdt.hidden=NO;
    }
    else
    {
        terms1=@"NO";
         txtextraamt.hidden=YES;
        btnupdt.hidden=YES;
    }
}
@end
