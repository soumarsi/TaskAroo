//
//  MyTransactionViewController.m
//  TaskAroo
//
//  Created by Prosenjit Kolay on 18/05/15.
//  Copyright (c) 2015 Prosenjit Kolay. All rights reserved.
//

#import "MyTransactionViewController.h"

@interface MyTransactionViewController ()<headerDelegate,leftDelegate,UITableViewDataSource,UITableViewDelegate>
{
    NSMutableArray *jsonarray;
}

@end

@implementation MyTransactionViewController
@synthesize mainview,transactiontable,lblnodata,titleview;
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    transactiontable.hidden=YES;
    urlobj = [[UrlconnectionObject alloc]init];
    
    HeaderView *hv = [[HeaderView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 60)];
    hv.userInteractionEnabled = YES;
    hv.myDelegate = self;
      hv.btnlogo1.hidden=YES;
    
    hv.btnlogo1.frame=CGRectMake(self.view.frame.size.width- hv.btnlogo1.frame.size.width-30,  hv.btnlogo1.frame.origin.y-10,  hv.btnlogo1.frame.size.width,  hv.btnlogo1.frame.size.height);
    hv.btnleftmenu.hidden=NO;
    hv.btnleftmenuextra.hidden=NO;
    hv.btnsignnout.hidden=YES;
    hv.lblpagename.text=@"MY TRANSACTION";
     hv.lblpagename.center=CGPointMake(self.view.center.x, hv.lblpagename.center.y);
 //   hv.lblpagename.frame=CGRectMake(hv.lblpagename.frame.origin.x-30,  hv.lblpagename.frame.origin.y,  hv.lblpagename.frame.size.width,  hv.lblpagename.frame.size.height);
    [mainview addSubview:hv];
    [mainview addSubview:hv];
    
    FooterView *fv = [[FooterView alloc]initWithFrame:CGRectMake(0,self.view.frame.size.height-60, self.view.frame.size.width,60)];
    [fv.btnmenu1 addTarget:self action:@selector(taskbuttonTapped:) forControlEvents:UIControlEventTouchUpInside];
    [fv.btnmenu2 addTarget:self action:@selector(MyAccountbuttonTapped:) forControlEvents:UIControlEventTouchUpInside];
    [fv.btnmenu3 addTarget:self action:@selector(MessagebuttonTapped:) forControlEvents:UIControlEventTouchUpInside];
    [fv.btnmenu4 addTarget:self action:@selector(ContactbuttonTapped:) forControlEvents:UIControlEventTouchUpInside];
    
    [mainview addSubview:fv];
    NSUserDefaults *prefs = [NSUserDefaults standardUserDefaults];
    userid=[prefs valueForKey:@"userid"];
     titleview.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"topbar-1"]];
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
    else if (sender==1) {
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
            [leftView removeFromSuperview];
            leftView = [LeftMenuView leftmenu];
            [leftView leftmenumethod];
            [leftView tapCheck:2];
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

-(void) viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    NSString *urlstring = [NSString stringWithFormat:@"http://www.esolz.co.in/lab3/taskaroo/index.php/transaction_ios/get_transaction?user_id=%@",userid];
    
    NSLog(@"url is: %@",urlstring);
    BOOL net=[urlobj connectedToNetwork];
    if (net==YES) {
    [urlobj global:urlstring typerequest:@"array" withblock:^(id result, NSError *error,BOOL completed)
     {
         NSMutableDictionary *maindic = [result mutableCopy];
         if ([[maindic valueForKey:@"total"] integerValue]==0) {
             transactiontable.hidden=YES;
             lblnodata.hidden=NO;
         }
         else{
         jsonarray = [maindic valueForKey:@"task"];
         transactiontable.hidden=NO;
    //     NSLog(@"Desired array is: %@",jsonarray);
         lblnodata.hidden=YES;
             [transactiontable reloadData];
        
         }
         
     }];
    }
    else{
        UIAlertView *aler=[[UIAlertView alloc] initWithTitle:@"Alert" message:@"No Network Connection." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [aler show];
    }
}



- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 127.0f;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    @try {
        cellId = @"cellid";
        cell = [tableView dequeueReusableCellWithIdentifier:cellId];
        
        cell=[[[NSBundle mainBundle] loadNibNamed:@"TransactionCell" owner:self options:nil] objectAtIndex:0];
        
        cell.taskname.text = [[jsonarray objectAtIndex:indexPath.row]valueForKey:@"task_title"];
        cell.paidto.text = [[jsonarray objectAtIndex:indexPath.row]valueForKey:@"paid_to_name"];
        cell.date_txt.text = [[jsonarray objectAtIndex:indexPath.row]valueForKey:@"payment_date"];
        cell.amount_txt.text = [[jsonarray objectAtIndex:indexPath.row]valueForKey:@"payment_amount"];
        
        //  cell.lbltaskname.text = [[arrtask objectAtIndex:indexPath.row] valueForKey:@"tasktitle"];
        //  cell.lbldesc.text = [[arrtask objectAtIndex:indexPath.row] valueForKey:@"description"];
        //    NSLog(@"cellForRowAtIndexPath completed");
        UIView *lineView = [[UIView alloc] initWithFrame:CGRectMake(0, 127, [[UIScreen mainScreen]bounds].size.width, 1.0)];
        lineView.backgroundColor = [UIColor lightGrayColor];
        [cell addSubview:lineView];
        
        [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
        [cell setBackgroundColor:[UIColor clearColor]];
        
        return cell;
    }
    @catch (NSException *exception) {
        
    }
    @finally {
        
    }
    //  NSLog(@"cellForRowAtIndexPath");
    
}
/*
 
 - (void)scrollViewDidEndDragging:(UIScrollView *)aScrollView willDecelerate:(BOOL)decelerate
 {
 CGPoint offset = aScrollView.contentOffset; CGRect bounds = aScrollView.bounds; CGSize size = aScrollView.contentSize; UIEdgeInsets inset = aScrollView.contentInset; float y = offset.y + bounds.size.height - inset.bottom; float h = size.height; float reload_distance = 50; if(y > h + reload_distance)
 
 {
 
 
 
 
 if(btnactivetask.selected==YES)
 {
 if(activepageno<=totalactivedata)
 {
 NSLog(@"load more rows");
 [_activity_indicator setHidden:NO];
 activepageno=activepageno+10;
 // pageno=pageno+1;
 
 [self activetaskurl:activepageno:1];
 }
 else{
 nodataview.hidden=NO;
 [lblnodata setAlpha:0.0f];
 
 //fade in
 [UIView animateWithDuration:2.0f animations:^{
 
 [lblnodata setAlpha:1.0f];
 
 } completion:^(BOOL finished) {
 
 //fade out
 [UIView animateWithDuration:2.0f animations:^{
 
 [lblnodata setAlpha:0.0f];
 
 } completion:nil];
 
 }];
 //  nodataview.hidden=YES;
 }
 }
 else if (btncompletetask.selected==YES)
 {
 if(completepageno<=totalcompletedata)
 {
 NSLog(@"load more rows");
 [_activity_indicator setHidden:NO];
 completepageno=completepageno+10;
 // pageno=pageno+1;
 
 [self completetaskurl:completepageno:1];
 }
 else{
 nodataview.hidden=NO;
 [lblnodata setAlpha:0.0f];
 
 //fade in
 [UIView animateWithDuration:2.0f animations:^{
 
 [lblnodata setAlpha:1.0f];
 
 } completion:^(BOOL finished) {
 
 //fade out
 [UIView animateWithDuration:2.0f animations:^{
 
 [lblnodata setAlpha:0.0f];
 
 } completion:nil];
 
 }];
 //  nodataview.hidden=YES;
 }
 
 }
 }
 
 }
 */
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [jsonarray count];
    //    return [arrtask count];
    
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

@end
