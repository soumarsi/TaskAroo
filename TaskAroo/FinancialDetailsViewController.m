//
//  FinancialDetailsViewController.m
//  TaskAroo
//
//  Created by Prosenjit Kolay on 15/05/15.
//  Copyright (c) 2015 Prosenjit Kolay. All rights reserved.
//

#import "FinancialDetailsViewController.h"

@interface FinancialDetailsViewController ()<headerDelegate,leftDelegate,UIPickerViewDataSource,UIPickerViewDelegate,CardIOPaymentViewControllerDelegate,UITextFieldDelegate,UITableViewDataSource,UITableViewDelegate,UIAlertViewDelegate,UIGestureRecognizerDelegate>

@end

@implementation FinancialDetailsViewController
@synthesize tblcarddetails,btnaddcard,btnviewcard,mainview,menuview,btncardtype,btnexpdt,addcardscroll,txtcardholdername,txtcardno,txtcardtype,txtcvv,txtexpdt,underlineimg,lblnodata,btnsetdefault;
- (void)viewDidLoad {
    [super viewDidLoad];
    
    check_mode=0;
    
    // Do any additional setup after loading the view.
    HeaderView *hv = [[HeaderView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 60)];
    hv.userInteractionEnabled = YES;
    hv.myDelegate = self;
    hv.btnlogo1.hidden=YES;
    //  hv.btnlogo1.frame=CGRectMake(self.view.frame.size.width- hv.btnlogo1.frame.size.width-30,  hv.btnlogo1.frame.origin.y-10,  hv.btnlogo1.frame.size.width,  hv.btnlogo1.frame.size.height);
    hv.btnleftmenu.hidden=NO;
    hv.btnleftmenuextra.hidden=NO;
    hv.btnsignnout.hidden=YES;
    hv.lblpagename.text=@"FINANCIAL DETAILS";
    hv.lblpagename.center=CGPointMake(self.view.center.x, hv.lblpagename.center.y);
    //   hv.lblpagename.frame=CGRectMake(hv.lblpagename.frame.origin.x-33,  hv.lblpagename.frame.origin.y,  hv.lblpagename.frame.size.width,  hv.lblpagename.frame.size.height);
    [mainview addSubview:hv];
    
    FooterView *fv = [[FooterView alloc]initWithFrame:CGRectMake(0,self.view.frame.size.height-60, self.view.frame.size.width,60)];
    [fv.btnmenu1 addTarget:self action:@selector(taskbuttonTapped:) forControlEvents:UIControlEventTouchUpInside];
    [fv.btnmenu2 addTarget:self action:@selector(MyAccountbuttonTapped:) forControlEvents:UIControlEventTouchUpInside];
    [mainview addSubview:fv];
    [fv.btnmenu3 addTarget:self action:@selector(MessagebuttonTapped:) forControlEvents:UIControlEventTouchUpInside];
    [fv.btnmenu4 addTarget:self action:@selector(ContactbuttonTapped:) forControlEvents:UIControlEventTouchUpInside];
    
    
    menuview.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"topbar-1"]];
    tblcarddetails.backgroundColor = [UIColor clearColor];
    urlobj=[[UrlconnectionObject alloc]init];
    ArrCard=[[NSMutableArray alloc]init];
    
    NSUserDefaults *prefs = [NSUserDefaults standardUserDefaults];
    userid=[prefs valueForKey:@"userid"];
    btnviewcard.selected=YES;
    btnaddcard.selected=NO;
    //   lblcardheading.text=@"Your credit card details";
    //  tblcarddetails.hidden=NO;
    addcardscroll.hidden=YES;
    UIView *paddingView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 20, 0)];
    txtcardholdername.leftView = paddingView;
    txtcardholdername.leftViewMode = UITextFieldViewModeAlways;
    
    UIView *paddingView1 = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 20, 0)];
    txtcardno.leftView = paddingView1;
    txtcardno.leftViewMode = UITextFieldViewModeAlways;
    
    UIView *paddingView2 = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 20, 0)];
    txtcardtype.leftView = paddingView2;
    txtcardtype.leftViewMode = UITextFieldViewModeAlways;
    
    UIView *paddingView3 = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 20, 0)];
    txtcvv.leftView = paddingView3;
    txtcvv.leftViewMode = UITextFieldViewModeAlways;
    
    UIView *paddingView4 = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 20, 0)];
    txtexpdt.leftView = paddingView4;
    txtexpdt.leftViewMode = UITextFieldViewModeAlways;
    
    ArrCard=[[NSMutableArray alloc]initWithObjects:@"American Express",@"Discover",@"MasterCard",@"Visa",nil];
    arryr=[[NSMutableArray alloc]init];
    ArrCardDetails=[[NSMutableArray alloc]init];
    for (int i=2015; i<=2040; i++) {
        NSString *val=[NSString stringWithFormat:@"%d", i];
        [arryr addObject:val];
    }
    arrmonth=[[NSMutableArray alloc]initWithObjects:@"01",@"02",@"03",@"04",@"05",@"06",@"07",@"08",@"09",@"10",@"11",@"12", nil];
    //done button on numeric keyboard
    
    UIToolbar *toolbar = [[UIToolbar alloc] initWithFrame:CGRectMake(0.0f, 0.0f, 320.0f, 35.0f)];
    toolbar.barStyle=UIBarStyleDefault;
    //    // Create a flexible space to align buttons to the right
    UIBarButtonItem *flexibleSpace = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
    //    // Create a cancel button to dismiss the keyboard
    UIBarButtonItem *barButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(resetView)];
    //    // Add buttons to the toolbar
    [toolbar setItems:[NSArray arrayWithObjects:flexibleSpace, barButtonItem, nil]];
    // Set the toolbar as accessory view of an UITextField object
    txtcardno.inputAccessoryView = toolbar;
    
    UIToolbar *toolbar1 = [[UIToolbar alloc] initWithFrame:CGRectMake(0.0f, 0.0f, 320.0f, 35.0f)];
    toolbar1.barStyle=UIBarStyleDefault;
    //    // Create a flexible space to align buttons to the right
    UIBarButtonItem *flexibleSpace1 = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
    //    // Create a cancel button to dismiss the keyboard
    UIBarButtonItem *barButtonItem1 = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(resetView1)];
    //    // Add buttons to the toolbar
    [toolbar1 setItems:[NSArray arrayWithObjects:flexibleSpace1, barButtonItem1, nil]];
    // Set the toolbar as accessory view of an UITextField object
    txtcvv.inputAccessoryView = toolbar1;
    
    // tblcarddetails.hidden=NO;
    [self defaultcreditShow];
    //   [self ViewCardUrl];
    menuview.frame=CGRectMake(menuview.frame.origin.x, menuview.frame.origin.y,self.view.frame.size.width, menuview.frame.size.height);
    
    /*
     recognizer = [[UISwipeGestureRecognizer alloc] initWithTarget:self
     action:@selector(handleSwipeLeft:)];
     recognizer.delegate = self;
     [recognizer setDirection:(UISwipeGestureRecognizerDirectionLeft)];
     [tblcarddetails addGestureRecognizer:recognizer];
     
     recognizer = [[UISwipeGestureRecognizer alloc] initWithTarget:self
     action:@selector(handleSwipeRight:)];
     recognizer.delegate = self;
     [recognizer setDirection:(UISwipeGestureRecognizerDirectionRight)];
     [tblcarddetails addGestureRecognizer:recognizer];
     */
    
    
    
  //  check_mode=1;
}
/*
 - (void)handleSwipeLeft:(UISwipeGestureRecognizer *)gestureRecognizer
 {
 //Get location of the swipe
 CGPoint location = [gestureRecognizer locationInView:tblcarddetails];
 
 //Get the corresponding index path within the table view
 NSIndexPath *indexPath = [tblcarddetails indexPathForRowAtPoint:location];
 
 //Check if index path is valid
 if(indexPath)
 {
 NSLog(@"left swipe");
 //Get the cell out of the table view
 UITableViewCell *cell1 = [tblcarddetails cellForRowAtIndexPath:indexPath];
 NSLog(@"cell=%f",cell1.center.x);
 if(cell1.center.x==self.view.center.x)
 {
 [UIView beginAnimations:@"ToggleViews" context:nil];
 [UIView setAnimationRepeatCount:1];
 [UIView setAnimationRepeatAutoreverses:NO];
 cell1.center = CGPointMake(cell1.center.x-90,cell1.center.y);
 [UIView commitAnimations];
 NSLog(@"cell=%f",self.view.frame.size.width-90);
 UIView *swipeview = [[UIView alloc] initWithFrame: CGRectMake ( cell1.frame.size.width,  0,90,cell.frame.size.height)];
 [cell1.contentView addSubview: swipeview];
 
 btncelldelete = [UIButton buttonWithType:UIButtonTypeCustom];
 btncelldelete.frame = CGRectMake(0, 0,90,cell.frame.size.height);
 [btncelldelete setBackgroundImage:[UIImage imageNamed:@"delete"] forState:UIControlStateNormal];
 btncelldelete.tag= [[[ArrCardDetails objectAtIndex:indexPath.row] valueForKey:@"cardid"] integerValue];
 btncelldelete.userInteractionEnabled=YES;
 [btncelldelete addTarget:self action:@selector(celldelete:) forControlEvents:UIControlEventTouchUpInside];
 [swipeview addSubview:btncelldelete];
 
 
 }
 
 //Update the cell or model
 //  cell.accessoryType = UITableViewCellAccessoryCheckmark;
 }
 }
 - (void)handleSwipeRight:(UISwipeGestureRecognizer *)gestureRecognizer
 {
 //Get location of the swipe
 CGPoint location = [gestureRecognizer locationInView:tblcarddetails];
 
 //Get the corresponding index path within the table view
 NSIndexPath *indexPath = [tblcarddetails indexPathForRowAtPoint:location];
 
 //Check if index path is valid
 if(indexPath)
 {
 //Get the cell out of the table view
 UITableViewCell *cell1 = [tblcarddetails cellForRowAtIndexPath:indexPath];
 if(cell1.center.x==self.view.center.x-90)
 {
 [UIView beginAnimations:@"ToggleViews" context:nil];
 [UIView setAnimationRepeatCount:1];
 [UIView setAnimationRepeatAutoreverses:NO];
 cell1.center = CGPointMake(cell1.center.x+90,
 cell1.center.y);
 [UIView commitAnimations];
 
 
 }
 
 //Update the cell or model
 //  cell.accessoryType = UITableViewCellAccessoryCheckmark;
 }
 }
 -(void)celldelete:(UIButton*)sender
 {
 NSLog(@"cell delete");
 cardid=[ NSString stringWithFormat:@"%ld",(long)sender.tag];
 UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Alert" message:@" Do you want to delete?" delegate:self cancelButtonTitle:@"NO" otherButtonTitles:@"YES", nil];
 [alertView show];
 
 }
 */
-(void)taskbuttonTapped:(id)sender
{
    if (userid == nil || [userid isEqualToString:@""])
    {
        MyHomeViewController *obj=[self.storyboard instantiateViewControllerWithIdentifier:@"MyHomeViewControllersid"];
        
        [self.navigationController pushViewController:obj animated:NO];
    }
    else
    {
        TaskHomeViewController *obj=[self.storyboard instantiateViewControllerWithIdentifier:@"TaskHomeViewControllersid"];
        
        [self.navigationController pushViewController:obj animated:NO];
    }
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
-(void)MessagebuttonTapped:(id)sender
{
    
    if (userid == nil || [userid isEqualToString:@""])
    {
        SignInViewController *obj=[self.storyboard instantiateViewControllerWithIdentifier:@"SignInViewControllersid"];
        
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

-(void)ContactbuttonTapped:(id)sender
{
    
    ContactViewController *obj=[self.storyboard instantiateViewControllerWithIdentifier:@"ContactViewControllersid"];
    
    [self.navigationController pushViewController:obj animated:NO];
    
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
    
    NSLog(@"get value method called");
    long tagId = [sender tag];
    if (tagId==3 || tagId==4)
    {
        NSLog(@"left menu");
        if(mainview.center.x==self.view.frame.size.width/2)
        {
            
            //            [UIView beginAnimations:@"ToggleViews" context:nil];
            //            [UIView setAnimationRepeatCount:1];
            //            [UIView setAnimationRepeatAutoreverses:NO];
            //            mainview.center = CGPointMake([[UIScreen mainScreen] bounds].size.width+60,
            //                                          self.view.center.y);
            [txtcardholdername resignFirstResponder];
            [txtcardno resignFirstResponder];
            [txtcardtype resignFirstResponder];
            [txtcvv resignFirstResponder];
            [addcardscroll setContentOffset:CGPointMake(0,0) animated:YES];
            [leftView removeFromSuperview];
            leftView = [LeftMenuView leftmenu];
            [leftView leftmenumethod];
            [leftView tapCheck:1];
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

- (IBAction)addcardclk:(id)sender
{
    
    if (btnaddcard.selected==NO) {
        btnaddcard.selected=YES;
        btnviewcard.selected=NO;
        //    lblcardheading.text=@"Set up your credit card";
        tblcarddetails.hidden=YES;
        lblnodata.hidden=YES;
        addcardscroll.hidden=NO;
        underlineimg.frame=CGRectMake(btnaddcard.frame.origin.x-5, btnaddcard.frame.origin.y+btnaddcard.frame.size.height, underlineimg.frame.size.width, underlineimg.frame.size.height);
        btnsetdefault.hidden=YES;
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
-(void)AddCardUrl
{
    
    NSString *str=[NSString stringWithFormat:@"%@add_creditcard_ios/index?bill_name=%@&cc1=%@&expyear=%@&expm=%@&cvvcode=%@&user_id=%@",URL_LINK,[txtcardholdername.text stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding],[txtcardno.text stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding],[expirtyear stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding],[expirymonth stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding],[txtcvv.text stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding],[userid stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
    NSLog(@"str=%@",str);
    BOOL net=[urlobj connectedToNetwork];
    if (net==YES) {
        [self checkLoader];
        [urlobj global:str typerequest:@"array" withblock:^(id result, NSError *error,BOOL completed) {
            
            //   NSLog(@"event result----- %@", result);
            NSMutableDictionary *dic=[[NSMutableDictionary alloc]init];
            dic=[result valueForKey:@"response"];
            
            //     NSLog(@"maindictionary %@", mainDic);
            
            NSLog(@"values:%@",[dic valueForKey:@"status"]);
            
            
            if ([[dic valueForKey:@"status"] isEqualToString:@"Success"]) {
                
                [self checkLoader];
                UIAlertView *aler=[[UIAlertView alloc] initWithTitle:@"Success" message:@"You have Added Your Credit Card." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
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
-(void)ViewCardUrl
{
    @try {
        
        [ArrCardDetails removeAllObjects];
        NSString *str=[NSString stringWithFormat:@"%@add_creditcard_ios/get_card_details?user_id=%@",URL_LINK,[userid stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
        NSLog(@"str=%@",str);
        BOOL net=[urlobj connectedToNetwork];
        if (net==YES) {
            [urlobj global:str typerequest:@"array" withblock:^(id result, NSError *error,BOOL completed) {
                
                //   NSLog(@"event result----- %@", result);
                //  totaldata=[[result objectForKey:@"total"] integerValue];
                //    NSLog(@"total active data=%ld",(long)totaldata);
                
                
                NSMutableArray *array = [[NSMutableArray alloc]init];
                for ( NSDictionary *tempDict in  [result objectForKey:@"usercarddetails"])
                {
                    [array addObject:tempDict];
                    
                }
                //    NSLog(@"fggg=%@",[[[result objectForKey:@"usercarddetails"] valueForKey:@"0"] valueForKey:@"cardnumber"]);
                if ([[result valueForKey:@"status"] isEqualToString:@"Success"]) {
                    
                    if ([array count]==0)
                    {
                        lblnodata.hidden=NO;
                        [tblcarddetails setHidden:YES];
                        btnsetdefault.hidden=YES;
                        
                    }
                    else{
                        int i=0;
                        for ( NSDictionary *tempDict in  [result objectForKey:@"usercarddetails"])
                        {
                            [ArrCardDetails addObject:tempDict];
                            if ([[[ArrCardDetails objectAtIndex:i] valueForKey:@"cardid"] isEqualToString:defaultcreditId])
                            {
                                check_mode=i;
                            }
                            i++;
                        }
                        
                        
                        if ([ArrCardDetails count]==0) {
                            lblnodata.hidden=NO;
                            [tblcarddetails setHidden:YES];
                            btnsetdefault.hidden=YES;
                            
                        }
                        else{
                            
                            lblnodata.hidden=YES;
                            
                            if (btnviewcard.selected==YES) {
                               
                                [tblcarddetails setHidden:NO];
                                
                                
                                [tblcarddetails reloadData];
                                btnsetdefault.hidden=NO;
                            }
                            
                            //    tblcarddetails.frame=CGRectMake(tblcarddetails.frame.origin.x, tblcarddetails.frame.origin.y, tblcarddetails.frame.size.width, ArrCardDetails.count *75+20);
                            
                            //    btnsetdefault.frame=CGRectMake(btnsetdefault.frame.origin.x, tblcarddetails.frame.origin.y+tblcarddetails.frame.size.height+10, btnsetdefault.frame.size.width, btnsetdefault.frame.size.height);
                        }
                    }
                }
                else{
                     if (btnviewcard.selected==YES)
                     {
                    lblnodata.hidden=NO;
                     }
                    [tblcarddetails setHidden:YES];
                    btnsetdefault.hidden=YES;
                    
                }
            }];
        }
        else{
            UIAlertView *aler=[[UIAlertView alloc] initWithTitle:@"Alert" message:@"No Network Connection." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
            [aler show];
        }
    }
    @catch (NSException *exception) {
        lblnodata.hidden=NO;
        [tblcarddetails setHidden:YES];
        btnsetdefault.hidden=YES;
        
    }
    @finally {
        
    }
    
    
    
    
}
- (IBAction)viewcardclk:(id)sender
{
    
    if (btnviewcard.selected==NO) {
        btnviewcard.selected=YES;
        btnaddcard.selected=NO;
        //    lblcardheading.text=@"Your credit card details";
        //    tblcarddetails.hidden=NO;
        [self defaultcreditShow];
        //    [self ViewCardUrl];
        
        addcardscroll.hidden=YES;
        underlineimg.frame=CGRectMake(btnviewcard.frame.origin.x, btnviewcard.frame.origin.y+btnviewcard.frame.size.height, underlineimg.frame.size.width, underlineimg.frame.size.height);
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
             NSLog(@"event result----- %@", result);
             NSMutableDictionary *dic=[[NSMutableDictionary alloc]init];
             dic=[result valueForKey:@"response"];
             
             //     NSLog(@"maindictionary %@", mainDic);
             
             NSLog(@"values:%@",[dic valueForKey:@"status"]);
             
             
             if ([[dic valueForKey:@"status"] isEqualToString:@"Success"])
             {
                 
                 defaultcreditId=[dic valueForKey:@"default_card_id"];
                 //     UIAlertView *aler=[[UIAlertView alloc] initWithTitle:@"Success" message:@"Default card set." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
                 
                 //      [aler show];
             }
             else
             {
                 
                 //       UIAlertView *aler=[[UIAlertView alloc] initWithTitle:@"Error" message:@"Unsucessful...." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
                 //       [aler show];
             }
             [self ViewCardUrl];
         }];
    }
    else{
        //   UIAlertView *aler=[[UIAlertView alloc] initWithTitle:@"Alert" message:@"No Network Connection." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        //   [aler show];
    }
    
}
- (IBAction)expclk:(id)sender {
    [txtcardno resignFirstResponder];
    [dtview removeFromSuperview];
    
    dtview=[[UIView alloc]initWithFrame:CGRectMake(self.view.frame.origin.x, self.view.frame.origin.y, self.view.frame.size.width,self.view.frame.size.height)];
    //    viewrepeattask=[[UIView alloc]initWithFrame:CGRectMake(self.view.frame.origin.x, self.view.frame.size.height-200, self.view.frame.size.width,200)];
    [dtview setBackgroundColor:[[UIColor blackColor]colorWithAlphaComponent:0.8]];
    [self.view addSubview:dtview];
    
    monthpicker=[[UIPickerView alloc]initWithFrame:CGRectMake(self.view.frame.size.width/2-125, 180, 123,150)];
    yrpicker=[[UIPickerView alloc]initWithFrame:CGRectMake(self.view.frame.size.width/2+2, 180, 123,150)];
    
    [monthpicker setBackgroundColor:[UIColor whiteColor]];
    [yrpicker setBackgroundColor:[UIColor whiteColor]];
    monthpicker.delegate=self;
    monthpicker.dataSource=self;
    [dtview addSubview:monthpicker];
    
    yrpicker.delegate=self;
    yrpicker.dataSource=self;
    [dtview addSubview:yrpicker];
    
    btndtsave=[[UIButton alloc] initWithFrame:CGRectMake(monthpicker.frame.origin.x+yrpicker.frame.size.width+monthpicker.frame.size.width+5-50, yrpicker.frame.origin.y-50, 50, 50)];
    //      btnrepeatsave=[[UIButton alloc] initWithFrame:CGRectMake(repeattaskpicker.frame.origin.x+repeattaskpicker.frame.size.width-50,0, 50, 50)];
    //   btncontactpaysave = [UIButton buttonWithType:UIButtonTypeCustom];
    [btndtsave setTitle:@"Save" forState:UIControlStateNormal];
    btndtsave.backgroundColor = [UIColor clearColor];
    [btndtsave setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal ];
    btndtsave.titleLabel.font = [UIFont fontWithName:@"OpenSans-Semibold" size:14.0];
    [btndtsave addTarget:self action:@selector(datepickerChange) forControlEvents:UIControlEventTouchUpInside];
    [dtview addSubview:btndtsave];
    
    btndtcancel=[[UIButton alloc] initWithFrame:CGRectMake(monthpicker.frame.origin.x, yrpicker.frame.origin.y-50, 50, 50)];
    //      btnrepeatsave=[[UIButton alloc] initWithFrame:CGRectMake(repeattaskpicker.frame.origin.x+repeattaskpicker.frame.size.width-50,0, 50, 50)];
    //   btncontactpaysave = [UIButton buttonWithType:UIButtonTypeCustom];
    [btndtcancel setTitle:@"Cancel" forState:UIControlStateNormal];
    btndtcancel.backgroundColor = [UIColor clearColor];
    [btndtcancel setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal ];
    btndtcancel.titleLabel.font = [UIFont fontWithName:@"OpenSans-Semibold" size:14.0];
    [btndtcancel addTarget:self action:@selector(datepickerCancel) forControlEvents:UIControlEventTouchUpInside];
    [dtview addSubview:btndtcancel];
}
-(void)datepickerChange
{
    expirymonth=emonth;
    expirtyear=eyear;
    if ([emonth isEqualToString:@"" ] || emonth ==nil)
    {
        
        expirymonth=[arrmonth objectAtIndex:0];
    }
    if ([eyear isEqualToString:@"" ] || eyear ==nil)
    {
        
        expirtyear=[arryr objectAtIndex:0];
    }
    NSArray *myStrings = [[NSArray alloc] initWithObjects:expirymonth,expirtyear, nil];
    NSString *joinedString = [myStrings componentsJoinedByString:@"/"];
    txtexpdt.text=joinedString;
    [dtview removeFromSuperview];
    emonth=@"";
    eyear=@"";
    [addcardscroll setContentOffset:CGPointMake(0,0) animated:YES];
}
-(void)datepickerCancel
{
    [dtview removeFromSuperview];
    [addcardscroll setContentOffset:CGPointMake(0,0) animated:YES];
}
- (IBAction)cardtypeclk:(id)sender {
    if (btncardtype.selected==NO)
    {
        btncardtype.selected=YES;
        //    [mainscroll setContentOffset:CGPointMake(0,priceview.frame.origin.y+50) animated:YES];
        [cardtypeview removeFromSuperview];
        
        cardtypeview=[[UIView alloc]initWithFrame:CGRectMake(self.view.frame.origin.x, self.view.frame.origin.y, self.view.frame.size.width,self.view.frame.size.height)];
        [cardtypeview setBackgroundColor:[[UIColor blackColor]colorWithAlphaComponent:0.8]];
        [self.view addSubview:cardtypeview];
        
        
        
        //picker create
        
        cardtypepicker=[[UIPickerView alloc]initWithFrame:CGRectMake(self.view.frame.size.width/2-125, 180, 250,150)];
        //   amtpicker=[[UIPickerView alloc]initWithFrame:CGRectMake(self.view.frame.origin.x, 50, self.view.frame.size.width,150)];
        cardtypepicker.delegate=self;
        cardtypepicker.dataSource=self;
        [cardtypepicker setBackgroundColor:[UIColor whiteColor]];
        [cardtypeview addSubview:cardtypepicker];
        
        btncardtypesave=[[UIButton alloc] initWithFrame:CGRectMake(cardtypepicker.frame.origin.x+cardtypepicker.frame.size.width-50, cardtypepicker.frame.origin.y-50, 50, 50)];
        [btncardtypesave setTitle:@"Save" forState:UIControlStateNormal];
        btncardtypesave.backgroundColor = [UIColor clearColor];
        [btncardtypesave setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal ];
        btncardtypesave.titleLabel.font = [UIFont fontWithName:@"OpenSans-Semibold" size:14.0];
        [btncardtypesave addTarget:self action:@selector(cardtypepickerChange) forControlEvents:UIControlEventTouchUpInside];
        [cardtypeview addSubview:btncardtypesave];
        
        btncardtypecancel=[[UIButton alloc] initWithFrame:CGRectMake(cardtypepicker.frame.origin.x, cardtypepicker.frame.origin.y-50, 50, 50)];
        [btncardtypecancel setTitle:@"Cancel" forState:UIControlStateNormal];
        btncardtypecancel.backgroundColor = [UIColor clearColor];
        [btncardtypecancel setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal ];
        btncardtypecancel.titleLabel.font = [UIFont fontWithName:@"OpenSans-Semibold" size:14.0];
        [btncardtypecancel addTarget:self action:@selector(paypickerCancel) forControlEvents:UIControlEventTouchUpInside];
        [cardtypeview addSubview:btncardtypecancel];
        
    }
    else
    {
        btncardtype.selected=NO;
        [cardtypeview removeFromSuperview];
        
    }
    
}

- (IBAction)scancardclk:(id)sender
{
    [self scancard];
}

- (IBAction)cardstoreclk:(id)sender
{
    NSString *validcard;
    NSString *validcvv;
    NSString *validdt;
    validcard=@"NO";
    validcvv=@"NO";
    validdt=@"NO";
    cardno=txtcardno.text;
    
    cvv=txtcvv.text;
    /*    if (txtexpdt.text.length>0)
     {
     expirymonth=[txtexpdt.text substringWithRange:NSMakeRange(0, 2)];
     expirtyear=[txtexpdt.text substringWithRange:NSMakeRange(3, 2)];
     }
     */
    if (txtcardno.text.length>0)
    {
        NSLog(@"check card validation");
        validcard = [self validateCard:txtcardno.text];
        NSLog(@"valid cardno=%@",validcard);
        validcvv=[self validatecvv:txtcvv.text];
        NSLog(@"valid cvvno=%@",validcvv);
        
    }
    else
    {
        validcard=@"NO";
        validcvv=@"NO";
    }
    if (txtexpdt.text.length>0)
    {
        
        validdt=[self validateexpdt:txtexpdt.text];
        NSLog(@"valid dt=%@",validdt);
        
    }
    else
    {
        validdt=@"NO";
        
    }
    
    //    NSString *validdt=[self validateexpdt:txtexpdt.text];
    //    NSLog(@"valid date=%@",validdt);
    
    
    NSLog(@"card info=%lu",(unsigned long)cardno.length);
    if ([txtcardtype.text isEqualToString:@""])
    {
        txtcardtype.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"Please Select Card Type." attributes:@{NSForegroundColorAttributeName: [UIColor redColor]}];
    }
    if ([txtcardholdername.text isEqualToString:@""])
    {
        txtcardholdername.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"Please Enter card holder Name." attributes:@{NSForegroundColorAttributeName: [UIColor redColor]}];
    }
    else if(cardno.length==0 || expirymonth.length==0 || expirtyear.length==0 || cvv.length==0)
    {
        UIAlertView *aler=[[UIAlertView alloc] initWithTitle:@"Error" message:@"Please Provide Card Information." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [aler show];
    }
    else if ([validcard isEqualToString:@"NO"])
    {
        txtcardno.text=@"";
        txtcardno.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"Please Enter Valid Card Number." attributes:@{NSForegroundColorAttributeName: [UIColor redColor]}];
    }
    else if ([validcvv isEqualToString:@"NO"])
    {
        txtcvv.text=@"";
        
        txtcvv.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"Invalid CVV" attributes:@{NSForegroundColorAttributeName: [UIColor redColor]}];
    }
    else if ([validdt isEqualToString:@"NO"])
    {
        txtexpdt.text=@"";
        txtexpdt.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"Invalid Date." attributes:@{NSForegroundColorAttributeName: [UIColor redColor]}];
    }
    else
    {
        
        [self AddCardUrl];
        
    }
}
-(void)cardtypepickerChange
{
    
    if (cardtype.length==0) {
        
        txtcardtype.text=[ArrCard objectAtIndex:0];
    }
    else
    {
        txtcardtype.text=cardtype;
    }
    cardtype=@"";
    btncardtype.selected=NO;
    [cardtypeview removeFromSuperview];
}
-(void)paypickerCancel
{
    btncardtype.selected=NO;
    [cardtypeview removeFromSuperview];
}
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    if(pickerView==cardtypepicker)
    {
        return ArrCard.count;
    }
    else if(pickerView==monthpicker)
    {
        return arrmonth.count;
    }
    else if (pickerView==yrpicker)
    {
        return arryr.count;
    }
    else
    {
        return 0;
    }
}
- (NSString*)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    if(pickerView==cardtypepicker)
    {
        return ArrCard[row];
    }
    else if (pickerView==monthpicker)
    {
        return arrmonth[row];
    }
    else if (pickerView==yrpicker)
    {
        return arryr[row];
    }
    else
    {
        return @"";
    }
    
}
- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    if(pickerView==cardtypepicker){
        
        cardtype= ArrCard[row];
        
        
    }
    else if (pickerView==monthpicker)
    {
        emonth= arrmonth[row];
        
    }
    else if (pickerView==yrpicker)
    {
        eyear= arryr[row];
    }
    
    else
    {
        
    }
}
-(void)resetView
{
    NSLog(@"txtcard done clk");
    [addcardscroll setContentOffset:CGPointMake(0,0) animated:YES];
    [txtcardno resignFirstResponder];
}
-(void)resetView1
{
    
    [addcardscroll setContentOffset:CGPointMake(0,0) animated:YES];
    [txtcvv resignFirstResponder];
}
-(void)scancard
{
    
    
    
    CardIOPaymentViewController *scanViewController = [[CardIOPaymentViewController alloc] initWithPaymentDelegate:self];
    scanViewController.useCardIOLogo=YES;
    scanViewController.disableManualEntryButtons=YES;
    scanViewController.modalPresentationStyle = UIModalPresentationFormSheet;
    [self presentViewController:scanViewController animated:YES completion:nil];
    
    
    
    
}
- (void)userDidProvideCreditCardInfo:(CardIOCreditCardInfo *)info inPaymentViewController:(CardIOPaymentViewController *)paymentViewController {
    NSLog(@"Scan succeeded with info: %@", info);
    // Do whatever needs to be done to deliver the purchased items.
    NSLog(@"Received card info. Number: %@, expiry: %02lu/%lu, cvv: %@.", info.cardNumber, (unsigned long)info.expiryMonth, (unsigned long)info.expiryYear, info.cvv);
    cardno=info.cardNumber;
    expirymonth=[NSString stringWithFormat:@"%02lu",(unsigned long)info.expiryMonth];
    expirtyear=[NSString stringWithFormat:@"%lu",(unsigned long)info.expiryYear];
    cvv=info.cvv;
    txtcardno.text=cardno;
    txtcvv.text=cvv;
    NSLog(@"card type=%ld",info.cardType);
    NSString *card=[NSString stringWithFormat:@"%@",info.cardNumber];
    NSString *recog=[card substringWithRange:NSMakeRange(0, 1)];
    
    if ([recog isEqualToString:@"0"] || [recog isEqualToString:@"1"] ) {
        txtcardtype.text=@"UnRecognized";
    }
    else if ([recog isEqualToString:@"3"])
    {
        txtcardtype.text=@"American Express";
    }
    else if ([recog isEqualToString:@"J"])
    {
        txtcardtype.text=@"JCB";
    }
    else if ([recog isEqualToString:@"4"])
    {
        txtcardtype.text=@"Visa";
    }
    else if ([recog isEqualToString:@"5"])
    {
        txtcardtype.text=@"MasterCard";
    }
    else if ([recog isEqualToString:@"6"])
    {
        txtcardtype.text=@"Discover";
    }
    
    
    NSArray *myStrings = [[NSArray alloc] initWithObjects:expirymonth,expirtyear, nil];
    NSString *joinedString = [myStrings componentsJoinedByString:@"/"];
    txtexpdt.text=joinedString;
    NSLog(@"expiry mnth=%@",expirymonth);
    [self dismissViewControllerAnimated:YES completion:nil];
    
    //    self.infoLabel.text = [NSString stringWithFormat:@"Received card info. Number: %@, expiry: %02lu/%lu, cvv: %@.", info.redactedCardNumber, (unsigned long)info.expiryMonth, (unsigned long)info.expiryYear, info.cvv];
}

- (void)userDidCancelPaymentViewController:(CardIOPaymentViewController *)paymentViewController {
    NSLog(@"User cancelled scan");
    [self dismissViewControllerAnimated:YES completion:nil];
}
//end
- (NSString *) validateCard:(NSString *)ccNumberString
{
    NSString * validCard;
    NSString * isAMEX;
    
    validCard = @"";
    NSString * ccNumberReversed = @"";
    NSString * doubleNumbers = @"";
    NSString * everyOtherNumber = @"";
    NSString * lastChar = @"";
    NSString * intDoubled;
    NSString * stringToSum;
    NSUInteger count = [ccNumberString length];
    NSUInteger len = 1;
    NSRange r;
    
    
    r = NSMakeRange( 0, 1);
    lastChar = [ccNumberString substringWithRange:r];
    if ([lastChar compare:@"3"] ==0) {
        
        isAMEX = @"YES";
        
    }
    else {
        isAMEX = @"NO";
    }
    
    
    
    //reverse the string
    
    for ( int i=0; i<count; i++){
        r = NSMakeRange( count-i-1, len);
        lastChar = [ccNumberString substringWithRange:r];
        ccNumberReversed = [ccNumberReversed stringByAppendingString:lastChar];
    }
    
    //double every other number
    
    NSInteger loc = 1;
    NSInteger ttr = ccNumberReversed.length/2.0;
    for ( int i=0; i<ttr; i++){
        
        r = NSMakeRange( loc, len);
        loc = loc+2;
        lastChar = [ccNumberReversed substringWithRange:r];
        int dv = [lastChar intValue];
        dv = (dv * 2);
        intDoubled = [NSString stringWithFormat:@"%d",dv];
        doubleNumbers = [doubleNumbers stringByAppendingString:intDoubled];
    }
    
    // get every other number starting at index 0
    loc = 0;
    if ([isAMEX compare:@"YES"] ==0) {
        ttr = txtcardno.text.length/2.0+1;
    }
    else {
        ttr = txtcardno.text.length/2.0;
    }
    
    
    for ( int i=0; i<ttr; i++){
        
        r = NSMakeRange( loc, len);
        loc = loc+2;
        lastChar = [ccNumberReversed substringWithRange:r];
        everyOtherNumber = [everyOtherNumber stringByAppendingString:lastChar];
    }
    
    //combine both strings so we can sum them up
    stringToSum = [doubleNumbers stringByAppendingString:everyOtherNumber];
    
    // add all the numbers up one by one and divide by 10... if no remainder - its a valid card
    
    loc = 0;
    ttr = stringToSum.length;
    int stringSum = 0;
    for ( int i=0; i<ttr; i++){
        
        r = NSMakeRange( loc, len);
        lastChar = [stringToSum substringWithRange:r];
        int cc = [lastChar intValue];
        stringSum = stringSum+cc;
        
        loc ++;
    }
    
    if (stringSum%10 == 0) {
        
        NSString *card=[NSString stringWithFormat:@"%@",ccNumberString];
        NSString *recog=[card substringWithRange:NSMakeRange(0, 1)];
        
        if ([recog isEqualToString:@"0"] || [recog isEqualToString:@"1"] ) {
            txtcardtype.text=@"UnRecognized";
        }
        else if ([recog isEqualToString:@"3"])
        {
            txtcardtype.text=@"American Express";
        }
        else if ([recog isEqualToString:@"J"])
        {
            txtcardtype.text=@"JCB";
        }
        else if ([recog isEqualToString:@"4"])
        {
            txtcardtype.text=@"Visa";
        }
        else if ([recog isEqualToString:@"5"])
        {
            txtcardtype.text=@"MasterCard";
        }
        else if ([recog isEqualToString:@"6"])
        {
            txtcardtype.text=@"Discover";
        }
        
        validCard = @"YES";
    }
    else {
        
        validCard = @"NO";
    }
    
    return validCard;
    
}
-(NSString *)validatecvv:(NSString *)cvvno
{
    NSString *first=[txtcardno.text substringWithRange:NSMakeRange(0, 1)];
    NSInteger cardtype1,cvvlength;
    if ([first isEqualToString:@"0"]) {
        cardtype1=CardIOCreditCardTypeUnrecognized;
        cvvlength = -1;
    }
    else if ([first isEqualToString:@"1"]) {
        cardtype1=CardIOCreditCardTypeAmbiguous;
        cvvlength = -1;
    }
    else if ([first isEqualToString:@"3"]) {
        cardtype1=CardIOCreditCardTypeAmex;
        cvvlength = 4;
    }
    else if ([first isEqualToString:@"J"]) {
        cardtype1=CardIOCreditCardTypeJCB;
        cvvlength = 3;
    }
    else if ([first isEqualToString:@"4"]) {
        cardtype1=CardIOCreditCardTypeVisa;
        cvvlength = 3;
    }
    else if ([first isEqualToString:@"5"]) {
        cardtype1=CardIOCreditCardTypeMastercard;
        cvvlength = 3;
    }
    else if ([first isEqualToString:@"6"]) {
        cardtype1=CardIOCreditCardTypeDiscover;
        cvvlength = 3;
    }
    else
    {
        cardtype1=0;
        cvvlength = -1;
    }
    
    if(cardtype1==CardIOCreditCardTypeAmex)
    {
        if (cvvno.length==4) {
            return @"YES";
        }
        
        else
        {
            return @"NO";
        }
        
    }
    else if(cardtype1==CardIOCreditCardTypeJCB || cardtype1==CardIOCreditCardTypeVisa || cardtype1==CardIOCreditCardTypeMastercard || cardtype1==CardIOCreditCardTypeDiscover )
    {
        if (cvvno.length==3) {
            return @"YES";
        }
        
        else
        {
            return @"NO";
        }
        
    }
    else if(cvvno.length==4 || cvvno.length==3)
    {
        return @"YES";
    }
    else
    {
        return @"NO";
    }
}
-(NSString *)validateexpdt:(NSString *)date
{
    NSDateFormatter *dt = [[NSDateFormatter alloc] init];
    [dt setDateFormat:@"MM/yy"];
    NSDate *expdt = [dt dateFromString:date];
    
    
    NSDate *currdate=[dt dateFromString:[dt stringFromDate:[NSDate date]]];
    
    
    NSComparisonResult result;
    result = [currdate compare:expdt];
    
    if(result==NSOrderedDescending)
    {
        return @"NO";
    }
    else if (result==NSOrderedAscending)
    {
        return  @"YES";
    }
    else if (result==NSOrderedSame)
    {
        return  @"YES";
    }
    else
    {
        return  @"NO";
    }
    
}
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [addcardscroll setContentOffset:CGPointMake(0,0) animated:YES];
    [textField resignFirstResponder];
    return YES;
}
- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField
{
    if(textField==txtcardholdername)
    {
        [addcardscroll setContentOffset:CGPointMake(0,txtcardholdername.frame.origin.y+10) animated:YES];
    }
    if(textField==txtcardno || textField==txtcvv)
    {
        [addcardscroll setContentOffset:CGPointMake(0,txtcardholdername.frame.origin.y+40) animated:YES];
    }
    return  YES;
}
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range     replacementString:(NSString *)string
{
    if (textField==txtcvv)
    {
        if (textField.text.length >= 4 && range.length == 0)
            return NO;
    }
    if (textField==txtcardno)
    {
        if (textField.text.length >= 16 && range.length == 0)
            return NO;
    }
    
    return YES;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 75.0f;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    @try {
        cellId = @"cellid";
        cell = [tableView dequeueReusableCellWithIdentifier:cellId];
        
        cell=[[[NSBundle mainBundle] loadNibNamed:@"CreditCardCell" owner:self options:nil] objectAtIndex:0];
        
        //--
        
        check_box_button=[[UIButton alloc]initWithFrame:CGRectMake(cell.frame.size.width-50,20,27, 27)];
        check_box_button.tag=indexPath.row;
        [check_box_button setImage:[UIImage imageNamed:@"tick2"] forState:UIControlStateNormal];
        [cell addSubview:check_box_button];
        
        
        
        cell.lblcardno.text = [[ArrCardDetails objectAtIndex:indexPath.row] valueForKey:@"cardnumber"];
        cell.lblname.text = [[ArrCardDetails objectAtIndex:indexPath.row] valueForKey:@"name"];
        //    NSLog(@"cellForRowAtIndexPath completed");
        //        cell.btnchkbox.tag = [[[ArrCardDetails objectAtIndex:indexPath.row] valueForKey:@"cardid"] integerValue];
        //  NSLog(@"default credit id=%@",defaultcreditId);
       
        
        
        //        else{
        //         //   cell.btnchkbox.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"tick2.png"]];
        //            [check_box_button setImage:[UIImage imageNamed:@"tick2.png"] forState:UIControlStateNormal];
        //        }
        
        //        [cell.btnchkbox addTarget:self action:@selector(ChkboxClicked:) forControlEvents:UIControlEventTouchUpInside];
        //      cell.btnremove.tag = [[[ArrCardDetails objectAtIndex:indexPath.row] valueForKey:@"cardid"] integerValue];
        
        //    [cell.btnremove addTarget:self action:@selector(RemoveClicked:) forControlEvents:UIControlEventTouchUpInside];
        //   row=indexPath.row;
        [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
        [cell setBackgroundColor:[UIColor clearColor]];
        UIView *lineView = [[UIView alloc] initWithFrame:CGRectMake(0, 75, [[UIScreen mainScreen]bounds].size.width, 1.0)];
        lineView.backgroundColor = [UIColor lightGrayColor];
        [cell addSubview:lineView];
    }
    @catch (NSException *exception) {
        
    }
    @finally {
        
    }
    //  NSLog(@"cellForRowAtIndexPath");
    
    
    
    
    
    if (check_mode==indexPath.row)
    {
        [check_box_button setImage:[UIImage imageNamed:@"tick1"] forState:UIControlStateNormal];
    }
    
    
    
    return cell;
}
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return UITableViewCellEditingStyleDelete;
}


// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        cardid=[[ArrCardDetails objectAtIndex:indexPath.row] valueForKey:@"cardid"];
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Alert" message:@" Do you want to delete?" delegate:self cancelButtonTitle:@"NO" otherButtonTitles:@"YES", nil];
        [alertView show];
        //   [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }
}
/*
-(void)RemoveClicked:(UIButton*)sender
{
    cardid=[ NSString stringWithFormat:@"%ld",(long)sender.tag];
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Alert" message:@" Do you want to delete?" delegate:self cancelButtonTitle:@"NO" otherButtonTitles:@"YES", nil];
    [alertView show];
    
}
 */
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    
    if (buttonIndex == [alertView cancelButtonIndex])
    {
        
    }
    else
    {
        [self deletecredit];
    }
    
    
}
-(void)setdefaultcredit
{
    if(cardid.length>0)
    {
        NSString *str=[NSString stringWithFormat:@"%@add_creditcard_ios/make_default?cardid=%@&userid=%@",URL_LINK,[cardid stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding],[userid stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
        NSLog(@"str=%@",str);
        BOOL net=[urlobj connectedToNetwork];
        if (net==YES) {
            [self checkLoader];
            [urlobj global:str typerequest:@"array" withblock:^(id result, NSError *error,BOOL completed) {
                
                //   NSLog(@"event result----- %@", result);
                NSMutableDictionary *dic=[[NSMutableDictionary alloc]init];
                dic=[result valueForKey:@"response"];
                
                //     NSLog(@"maindictionary %@", mainDic);
                
                NSLog(@"values:%@",[dic valueForKey:@"status"]);
                
                
                if ([[dic valueForKey:@"status"] isEqualToString:@"Success"]) {
                    
                    [self checkLoader];
                    UIAlertView *aler=[[UIAlertView alloc] initWithTitle:@"Success" message:@"Default card set." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
                    [self defaultcreditShow];
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
    else{
        UIAlertView *aler=[[UIAlertView alloc] initWithTitle:@"Alert" message:@"Select Card." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [aler show];
    }
}

-(void)deletecredit
{
    
    if (cardid.length>0) {
        
        if ([cardid isEqualToString:defaultcreditId])
        {
            UIAlertView *aler=[[UIAlertView alloc] initWithTitle:@"Alert" message:@"You can't delete default Credit card." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
            [aler show];
        }
        else
        {
        NSString *str=[NSString stringWithFormat:@"%@delete_creditcard_ios/index?cardid=%@&userid=%@",URL_LINK,[cardid stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding],[userid stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
        NSLog(@"str=%@",str);
        BOOL net=[urlobj connectedToNetwork];
        if (net==YES) {
            [self checkLoader];
            [urlobj global:str typerequest:@"array" withblock:^(id result, NSError *error,BOOL completed) {
                
                //   NSLog(@"event result----- %@", result);
                NSMutableDictionary *dic=[[NSMutableDictionary alloc]init];
                dic=[result valueForKey:@"response"];
                
                //     NSLog(@"maindictionary %@", mainDic);
                
                NSLog(@"values:%@",[dic valueForKey:@"status"]);
                
                
                if ([[dic valueForKey:@"status"] isEqualToString:@"Success"]) {
                    
                    [self checkLoader];
                    UIAlertView *aler=[[UIAlertView alloc] initWithTitle:@"Success" message:@"Credit card deleted Successfully." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
                    [self ViewCardUrl];
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
    }
}
-(void)ChkboxClicked:(UIButton*)sender
{
    
    //   NSLog(@"chk");
    cardid=[ NSString stringWithFormat:@"%ld",(long)sender.tag];
    
    //   cell.btnchkbox.selected=NO;
    
    [cell.btnchkbox setImage:[UIImage imageNamed:@"tick2.png"] forState:UIControlStateNormal];
    [sender setImage:[UIImage imageNamed:@"tick1.png"] forState:UIControlStateNormal];
    
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    //  return 10;
    return [ArrCardDetails count];
    
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    
    
    CreditCardCell *getcell=(CreditCardCell *)[tableView cellForRowAtIndexPath:indexPath];
    
    
    NSLog(@"into tap gesture tag:%ld",(long)getcell.tag);
    
    NSArray *subArray=[getcell subviews];
    
    
    
    for (UIButton *btn in subArray)
        
    {
        
        if ([btn isKindOfClass:[UIButton class]])
            
        {
            NSLog(@"## Test Bot .... %ld",btn.tag);
            
            if (btn.tag==indexPath.row)
            {
                [btn setImage:[UIImage imageNamed:@"tick1"] forState:UIControlStateNormal];
                
                check_mode=btn.tag;
                
                cardid=[ NSString stringWithFormat:@"%@",[[ArrCardDetails objectAtIndex:btn.tag] valueForKey:@"cardid"]];
                
                
                [tblcarddetails reloadData];
            }
            else
            {
                [btn setImage:[UIImage imageNamed:@"tick2"] forState:UIControlStateNormal];
                
                [tblcarddetails reloadData];
            }
            
            
            
            
        }
        
        
    }
    
    
    // [sender setImage:[UIImage imageNamed:@"tick1.png"] forState:UIControlStateNormal];
    
    
    /*
     if (cell.btnchkbox.selected==YES) {
     NSLog(@"dont select");
     cell.btnchkbox.selected=NO;
     [cell.btnchkbox setBackgroundImage:[UIImage imageNamed:@"tick2.png"] forState:UIControlStateNormal];
     }
     else
     {
     NSLog(@"select");
     cell.btnchkbox.selected=YES;
     [cell.btnchkbox setBackgroundImage:[UIImage imageNamed:@"tick1.png"] forState:UIControlStateSelected];
     }
     */
}

- (IBAction)setdefaultclk:(id)sender
{
    [self setdefaultcredit];
}
@end
