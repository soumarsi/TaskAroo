//
//  TaskHomeViewController.m
//  TaskAroo
//
//  Created by Prosenjit Kolay on 06/05/15.
//  Copyright (c) 2015 Prosenjit Kolay. All rights reserved.
//

#import "TaskHomeViewController.h"

@interface TaskHomeViewController ()<headerDelegate,leftDelegate,UISearchBarDelegate,UIActionSheetDelegate,UIAlertViewDelegate>

@end

@implementation TaskHomeViewController
@synthesize mainview,menuview,btnactivetask,btncompletetask,tbltask,nodataview,lblnodata,searchbar,underlineimg,tblTaskName,btnarrow,lbltaskname;
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
 //   [self footercall];
  //  [self homeheadercall];
    
    tasktype=0;
    btnarrow.selected=NO;
    [btnarrow setBackgroundImage:[UIImage imageNamed:@"down-arrow2.png"] forState:UIControlStateNormal];
    [btnarrow setBackgroundImage:[UIImage imageNamed:@"down-arrow4.png"] forState:UIControlStateSelected];
    [btnarrow setBackgroundImage:[UIImage imageNamed:@"down-arrow4.png"] forState:UIControlStateHighlighted];
    _activity_indicator.layer.cornerRadius=10;
    
    HeaderView *hv = [[HeaderView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 60)];
    hv.userInteractionEnabled = YES;
    hv.myDelegate = self;
    hv.btnlogo1.hidden=YES;
    hv.lblpagename.center=CGPointMake(self.view.center.x, hv.lblpagename.center.y);
   //  hv.btnlogo1.frame=CGRectMake(self.view.frame.size.width- hv.btnlogo1.frame.size.width-30,  hv.btnlogo1.frame.origin.y-10,  hv.btnlogo1.frame.size.width,  hv.btnlogo1.frame.size.height);
    hv.btnleftmenu.hidden=NO;
    hv.btnleftmenuextra.hidden=NO;
    hv.btnsignnout.hidden=YES;
    [mainview addSubview:hv];
    
    FooterView *fv = [[FooterView alloc]initWithFrame:CGRectMake(0,self.view.frame.size.height-60, self.view.frame.size.width,60)];
 //   [fv.btnmenu1 addTarget:self action:@selector(taskbuttonTapped:) forControlEvents:UIControlEventTouchUpInside];
        [fv.btnmenu2 addTarget:self action:@selector(MyAccountbuttonTapped:) forControlEvents:UIControlEventTouchUpInside];
    [fv.btnmenu3 addTarget:self action:@selector(MessagebuttonTapped:) forControlEvents:UIControlEventTouchUpInside];
    [fv.btnmenu4 addTarget:self action:@selector(ContactbuttonTapped:) forControlEvents:UIControlEventTouchUpInside];

    [mainview addSubview:fv];
    
    menuview.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"topbar-1"]];
    tbltask.backgroundColor = [UIColor clearColor];
    urlobj=[[UrlconnectionObject alloc]init];
    arrtask=[[NSMutableArray alloc]init];
    Arrtaskname=[[NSMutableArray alloc]initWithObjects:@"Active Task",@"Awarded Task",@"Completed Task",@"Canceled Task", nil];
    
    NSUserDefaults *prefs = [NSUserDefaults standardUserDefaults];
    userid=[prefs valueForKey:@"userid"];
   // userid=@"278";
    
    [self activetaskurl:10 :1];
    btnactivetask.selected=YES;
    btncompletetask.selected=NO;
   
    activepageno=10;
    completepageno=10;
    searchpageno=10;
    Issearch=0;
    [searchbar setBackgroundColor:[UIColor clearColor]];
 //   searchbar.barTintColor = [UIColor colorWithRed:(35/255.0f) green:(154/255.0f) blue:(242/255.0f) alpha:1];
    UITextField *searchField = [searchbar valueForKey:@"_searchField"];
    searchField.textColor = [UIColor blackColor];
    [[UIBarButtonItem appearanceWhenContainedIn: [UISearchBar class], nil] setTintColor:[UIColor whiteColor]];
    
    
    
    
//    [[UISearchBar appearance] setSearchFieldBackgroundImage:[UIImage imageNamed:@"custom_srchbar_new"]forState:UIControlStateNormal];
    
    //hides search icon from left of bar
    [[UITextField appearanceWhenContainedIn:[UISearchBar class], nil] setLeftViewMode:UITextFieldViewModeNever];
}
-(void)taskbuttonTapped:(id)sender
{
    if (userid == nil || [userid isEqualToString:@""])
    {
        SignInViewController *obj=[self.storyboard instantiateViewControllerWithIdentifier:@"SignInViewControllersid"];
        
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
            [searchbar resignFirstResponder];
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
/*
-(void)activetaskurl
{
    NSString *str=[NSString stringWithFormat:@"%@tasklist_ios?userid=%@&orderby=task_title&ordertype=asc&limit=10&task=active&page=1",URL_LINK,[userid stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
    NSLog(@"str=%@",str);
    [urlobj global:str typerequest:@"array" withblock:^(id result, NSError *error,BOOL completed) {
        
        //    NSLog(@"event result----- %@", result);
        totaldata=[[result objectForKey:@"total"] integerValue];
        NSLog(@"total data=%d",totaldata);
        NSMutableArray *array = [[NSMutableArray alloc]init];
        for ( NSDictionary *tempDict in  [result objectForKey:@"task"])
        {
            [array addObject:tempDict];
            
        }
        arrtask=[array mutableCopy];
        NSLog(@"array=%@",arrtask);
        if (totaldata==0) {
            [tbltask setHidden:YES];
        }
        else{
             [tbltask setHidden:NO];
            [tbltask reloadData];
        }
        
    }];
}
 */
-(void)activetaskurl:(NSInteger )number :(NSInteger)pg
{
    @try {
        NSString *str=[NSString stringWithFormat:@"%@tasklist_ios?userid=%@&orderby=id&ordertype=desc&limit=%ld&task=active&page=%ld",URL_LINK,[userid stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding],(long)number,(long)pg];
        NSLog(@"str=%@",str);
        BOOL net=[urlobj connectedToNetwork];
        if (net==YES) {
            [urlobj global:str typerequest:@"array" withblock:^(id result, NSError *error,BOOL completed) {
                
                //   NSLog(@"event result----- %@", result);
                totalactivedata=[[result objectForKey:@"total"] integerValue];
                NSLog(@"total active data=%ld",(long)totalactivedata);
                
                
                NSMutableArray *array = [[NSMutableArray alloc]init];
                for ( NSDictionary *tempDict in  [result objectForKey:@"task"])
                {
                    [array addObject:tempDict];
                    
                }
                
                [arrtask removeAllObjects];
                
                
                
                if (totalactivedata==0) {
                    lbltableempty.hidden=NO;
                    [tbltask setHidden:YES];
                }
                else{
                    arrtask=[array mutableCopy];
                    lbltableempty.hidden=YES;
                    [tbltask setHidden:NO];
                    [_activity_indicator setHidden:YES];
                    
                    [tbltask reloadData];
                    
                    
                }
                
            }];
        }
        else{
            UIAlertView *aler=[[UIAlertView alloc] initWithTitle:@"Alert" message:@"No Network Connection." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
            [aler show];
        }
        
    }
    @catch (NSException *exception) {
        lbltableempty.hidden=NO;
        [tbltask setHidden:YES];
    }
    @finally {
       
    }
   
}
-(void)completetaskurl:(NSInteger )number :(NSInteger)pg
{
    @try {
        NSString *str=[NSString stringWithFormat:@"%@tasklist_ios?userid=%@&page=%ld&orderby=id&ordertype=desc&limit=%ld&task=complete",URL_LINK,[userid stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding],(long)pg,(long)number];
        NSLog(@"str=%@",str);
        BOOL net=[urlobj connectedToNetwork];
        if (net==YES) {
        [urlobj global:str typerequest:@"array" withblock:^(id result, NSError *error,BOOL completed) {
            
            //    NSLog(@"event result----- %@", result);
            totalcompletedata=[[result objectForKey:@"total"] integerValue];
            NSLog(@"total data=%ld",(long)totalcompletedata);
            NSMutableArray *array = [[NSMutableArray alloc]init];
            for ( NSDictionary *tempDict in  [result objectForKey:@"task"])
            {
                [array addObject:tempDict];
                
            }
            [arrtask removeAllObjects];
            
            //  NSLog(@"array=%@",arrtask);
            if (totalcompletedata==0) {
                lbltableempty.hidden=NO;
                [tbltask setHidden:YES];
            }
            else{
                arrtask=[array mutableCopy];
                lbltableempty.hidden=YES;
                [tbltask setHidden:NO];
                [_activity_indicator setHidden:YES];
                [tbltask reloadData];
            }
            
        }];
        }
        else{
            UIAlertView *aler=[[UIAlertView alloc] initWithTitle:@"Alert" message:@"No Network Connection." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
            [aler show];
        }
    }
    @catch (NSException *exception) {
        lbltableempty.hidden=NO;
        [tbltask setHidden:YES];
    }
    @finally {
        
    }
   
}
-(void)awardedtaskurl:(NSInteger )number :(NSInteger)pg
{
    @try {
        NSString *str=[NSString stringWithFormat:@"%@tasklist_ios/getawardtask?userid=%@&page=%ld&orderby=id&ordertype=desc&limit=%ld",URL_LINK,[userid stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding],(long)pg,(long)number];
        NSLog(@"str=%@",str);
        BOOL net=[urlobj connectedToNetwork];
        if (net==YES) {
            [urlobj global:str typerequest:@"array" withblock:^(id result, NSError *error,BOOL completed) {
                
                //   NSLog(@"event result----- %@", result);
                totalawardeddata=[[result objectForKey:@"total"] integerValue];
                NSLog(@"total active data=%ld",(long)totalawardeddata);
                
                
                NSMutableArray *array = [[NSMutableArray alloc]init];
                for ( NSDictionary *tempDict in  [result objectForKey:@"task"])
                {
                    [array addObject:tempDict];
                    
                }
                
                [arrtask removeAllObjects];
                
                
                
                if (totalawardeddata==0) {
                    lbltableempty.hidden=NO;
                    [tbltask setHidden:YES];
                }
                else{
                    arrtask=[array mutableCopy];
                    lbltableempty.hidden=YES;
                    [tbltask setHidden:NO];
                    [_activity_indicator setHidden:YES];
                    
                    [tbltask reloadData];
                    
                    
                }
                
            }];
        }
        else{
            UIAlertView *aler=[[UIAlertView alloc] initWithTitle:@"Alert" message:@"No Network Connection." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
            [aler show];
        }
        
    }
    @catch (NSException *exception) {
        lbltableempty.hidden=NO;
        [tbltask setHidden:YES];
    }
    @finally {
        
    }
    
}
-(void)canceledtaskurl:(NSInteger )number :(NSInteger)pg
{
    @try {
        NSString *str=[NSString stringWithFormat:@"%@tasklist_ios/getcanceltask?userid=%@&page=%ld&orderby=id&ordertype=desc&limit=%ld",URL_LINK,[userid stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding],(long)pg,(long)number];
        NSLog(@"str=%@",str);
        BOOL net=[urlobj connectedToNetwork];
        if (net==YES) {
            [urlobj global:str typerequest:@"array" withblock:^(id result, NSError *error,BOOL completed) {
                
                //   NSLog(@"event result----- %@", result);
                totalcanceleddata=[[result objectForKey:@"total"] integerValue];
                NSLog(@"total active data=%ld",(long)totalcanceleddata);
                
                
                NSMutableArray *array = [[NSMutableArray alloc]init];
                for ( NSDictionary *tempDict in  [result objectForKey:@"task"])
                {
                    [array addObject:tempDict];
                    
                }
                
                [arrtask removeAllObjects];
                
                
                
                if (totalcanceleddata==0) {
                    lbltableempty.hidden=NO;
                    [tbltask setHidden:YES];
                }
                else{
                    arrtask=[array mutableCopy];
                    lbltableempty.hidden=YES;
                    [tbltask setHidden:NO];
                    [_activity_indicator setHidden:YES];
                    
                    [tbltask reloadData];
                    
                    
                }
                
            }];
        }
        else{
            UIAlertView *aler=[[UIAlertView alloc] initWithTitle:@"Alert" message:@"No Network Connection." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
            [aler show];
        }
        
    }
    @catch (NSException *exception) {
        lbltableempty.hidden=NO;
        [tbltask setHidden:YES];
    }
    @finally {
        
    }
    
}
- (IBAction)activetaskbtnclk:(id)sender
{
    if (btnarrow.selected==NO)
    {
        tbltask.hidden=YES;
        tblTaskName.hidden=NO;
        btnarrow.selected=YES;
        [btnarrow setBackgroundImage:[UIImage imageNamed:@"down-arrow2.png"] forState:UIControlStateNormal];
        [btnarrow setBackgroundImage:[UIImage imageNamed:@"down-arrow4.png"] forState:UIControlStateSelected];
        [btnarrow setBackgroundImage:[UIImage imageNamed:@"down-arrow4.png"] forState:UIControlStateHighlighted];
    }
    else
    {
       
        tblTaskName.hidden=YES;
        btnarrow.selected=NO;
        if (tasktype==0)
        {
            //  btnactivetask.selected=YES;
            //  btncompletetask.selected=NO;
            searchbar.text=@"";
            Issearch=0;
            [searchbar resignFirstResponder];
            lbltaskname.text=@"Active Task";
            activepageno=10;
            [self activetaskurl:10 :1];
            tasktype=0;
            tblTaskName.hidden=YES;
        }
        else if (tasktype==1)
        {
            lbltaskname.text=@"Awarded Task";
            searchbar.text=@"";
            Issearch=0;
            [searchbar resignFirstResponder];
            awardedpageno=10;
            [self awardedtaskurl:10 :1];
            tblTaskName.hidden=YES;
            tasktype=1;
            
        }
        else if (tasktype==2)
        {
            //  btncompletetask.selected=YES;
            //  btnactivetask.selected=NO;
            searchbar.text=@"";
            Issearch=0;
            [searchbar resignFirstResponder];
            lbltaskname.text=@"Completed Task";
            completepageno=10;
            [self completetaskurl:10 :1];
            tasktype=2;
            tblTaskName.hidden=YES;
        }
        else if (tasktype==3)
        {
            lbltaskname.text=@"Canceled Task";
            searchbar.text=@"";
            Issearch=0;
            [searchbar resignFirstResponder];
            tblTaskName.hidden=YES;
            tasktype=3;
            canceledpageno=10;
            [self canceledtaskurl:10 :1];
            
        }
    }
    /*
    if (btnactivetask.selected==NO) {
        btnactivetask.selected=YES;
        btncompletetask.selected=NO;
        searchbar.text=@"";
        Issearch=0;
        [searchbar resignFirstResponder];
     //   lbltask.text=@"Active Task";
        activepageno=10;
        [self activetaskurl:10 :1];
        underlineimg.hidden=NO;
  underlineimg.frame=CGRectMake(btnactivetask.frame.origin.x+15, btnactivetask.frame.origin.y+btnactivetask.frame.size.height, underlineimg.frame.size.width, underlineimg.frame.size.height);
    }
     */
}

- (IBAction)completetaskbtnclk:(id)sender
{
    if (btncompletetask.selected==NO) {
        btncompletetask.selected=YES;
        btnactivetask.selected=NO;
         searchbar.text=@"";
        Issearch=0;
        [searchbar resignFirstResponder];
    //    lbltask.text=@"Complete Task";
        completepageno=10;
        [self completetaskurl:10 :1];
         underlineimg.hidden=NO;
         underlineimg.frame=CGRectMake(btncompletetask.frame.origin.x+22, btncompletetask.frame.origin.y+btncompletetask.frame.size.height, underlineimg.frame.size.width, underlineimg.frame.size.height);
    }
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (tableView==tbltask) {
        return 120.0f;

    }
    else if (tableView==tblTaskName)
    {
        return 40.0;
    }
    else{
        return 0.0;
    }
    }

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    @try {
        if (tableView==tbltask) {
            
       
        cellId = @"cellid";
        cell = [tableView dequeueReusableCellWithIdentifier:cellId];
        
        cell=[[[NSBundle mainBundle] loadNibNamed:@"TaskCell" owner:self options:nil] objectAtIndex:0];
        
        
        
        cell.lbltaskname.text = [[arrtask objectAtIndex:indexPath.row] valueForKey:@"tasktitle"];
        cell.lbldesc.text = [[arrtask objectAtIndex:indexPath.row] valueForKey:@"description"];
            if (tasktype==1)
            {
               NSString *tid= [NSString stringWithFormat:@"%@",[[arrtask objectAtIndex:indexPath.row] valueForKey:@"id"]];
                cell.btnmarkCompleted.hidden=NO;
                NSLog(@"tid=%lu",(unsigned long)tid.length);
                
          
                         cell.btnmarkCompleted.tag=[[[arrtask objectAtIndex:indexPath.row] valueForKey:@"id"] integerValue];
                         [cell.btnmarkCompleted addTarget:self action:@selector(MarkasCompleteClicked:) forControlEvents:UIControlEventTouchUpInside];
                
                
            }
            else{
                cell.btnmarkCompleted.hidden=YES;
            }
            
    /*        if (Issearch==1) {
                cell.lblbidsname.hidden=YES;
                cell.lblbids.hidden=YES;
                cell.btncancel.hidden=YES;
                cell.btnmarkCompleted.hidden=YES;
            }
            else{
      */
                 cell.lblbidsname.hidden=NO;
        cell.lblbids.text =[NSString stringWithFormat:@"%@",[[arrtask objectAtIndex:indexPath.row] valueForKey:@"total_bid"]];
    //        }
            if (tasktype==0)
            {
                if ([[[arrtask objectAtIndex:indexPath.row] valueForKey:@"total_bid"] integerValue]==0)
                {
                    cell.btncancel.hidden=NO;
                    cell.btncancel.tag=[[[arrtask objectAtIndex:indexPath.row] valueForKey:@"id"] integerValue];
                    [cell.btncancel addTarget:self action:@selector(taskCancelClicked:) forControlEvents:UIControlEventTouchUpInside];
                }
                else if ([[[arrtask objectAtIndex:indexPath.row] valueForKey:@"total_bid"] integerValue]>0)
                {
                    cell.btncancel.hidden=YES;
                }
            }
            else
            {
                 cell.btncancel.hidden=YES;
            }
       //     }
       
       
            if (tasktype==2)
            {
                if ([[[arrtask objectAtIndex:indexPath.row] valueForKey:@"review_status"] isEqualToString:@"No Review"])
                {
                    cell.btnwriteReview.hidden=NO;
                    cell.btnwriteReview.tag=[[[arrtask objectAtIndex:indexPath.row] valueForKey:@"id"] integerValue];
                    [cell.btnwriteReview addTarget:self action:@selector(taskReviewClicked:) forControlEvents:UIControlEventTouchUpInside];
                }
                else
                {
                    cell.btnwriteReview.hidden=YES;
                }
            }
            else
            {
                cell.btnwriteReview.hidden=YES;
            }
        
        [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
        [cell setBackgroundColor:[UIColor clearColor]];
        
        UIView *lineView = [[UIView alloc] initWithFrame:CGRectMake(0, 120, [[UIScreen mainScreen]bounds].size.width, 1.0)];
        lineView.backgroundColor = [UIColor lightGrayColor];
        [cell addSubview:lineView];
        
        return cell;
        }
        else
        {
            static    NSString *hlCellID = @"hlCellID";
            
            UITableViewCell *hlcell = [tableView dequeueReusableCellWithIdentifier:hlCellID];
            if(hlcell == nil) {
                hlcell = [[UITableViewCell alloc]
                          initWithStyle:UITableViewCellStyleDefault reuseIdentifier:hlCellID];
                hlcell.accessoryType = UITableViewCellAccessoryNone;
                hlcell.selectionStyle = UITableViewCellSelectionStyleNone;
                hlcell.textLabel.text=[Arrtaskname objectAtIndex:indexPath.row];
                hlcell.textLabel.font=[UIFont fontWithName:@"OpenSans-Light" size:14];
               
                hlcell.autoresizesSubviews = YES;
                UIView *lineView = [[UIView alloc] initWithFrame:CGRectMake(0, 40, [[UIScreen mainScreen]bounds].size.width, 1.0)];
                lineView.backgroundColor = [UIColor lightGrayColor];
                [hlcell addSubview:lineView];
            }
           return hlcell;
        }
    }
    @catch (NSException *exception) {
        
    }
    @finally {
        
    }
   
}
-(void)taskCancelClicked:(UIButton*)sender
{
    
    taskid=[ NSString stringWithFormat:@"%ld",(long)sender.tag];
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Warning" message:@" Do you want to Cancel Task?" delegate:self cancelButtonTitle:@"NO" otherButtonTitles:@"YES", nil];
    [alertView show];
    
    
    
}
-(void)taskReviewClicked:(UIButton*)sender
{
    
    taskid=[ NSString stringWithFormat:@"%ld",(long)sender.tag];
    WriteReviewViewController *obj=[self.storyboard instantiateViewControllerWithIdentifier:@"WriteReviewViewControllersid"];
    obj.taskid=taskid;
    [self.navigationController pushViewController:obj animated:YES];

    
    
    
}
-(void)MarkasCompleteClicked:(UIButton*)sender
{
    
    taskid=[ NSString stringWithFormat:@"%ld",(long)sender.tag];
    FinalPaymentViewController *obj=[self.storyboard instantiateViewControllerWithIdentifier:@"FinalPaymentViewControllersid"];
    obj.taskid=taskid;
    [self.navigationController pushViewController:obj animated:YES];
    
    
    
    
}
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    
    if (buttonIndex == [alertView cancelButtonIndex])
    {
        
    }
    else
    {
       
            [self TaskCancelUrl];
       
        
    }
    
    
}
-(void)TaskCancelUrl
{
    if(taskid.length>0)
    {
        NSString *str=[NSString stringWithFormat:@"%@taskcancel_ios/cancletask?taskid=%@&posterid=%@",URL_LINK,[taskid stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding],[userid stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
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
                    /*
                    UIAlertView *aler=[[UIAlertView alloc] initWithTitle:@"Success" message:@"Task Canceled." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
                    
                    [aler show];
                    */
                    
                    [self activetaskurl:10 :1];
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
        UIAlertView *aler=[[UIAlertView alloc] initWithTitle:@"Alert" message:@"Select Bid." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [aler show];
    }
}
- (void)tableView:(UITableView *)tableView
  willDisplayCell:(UITableViewCell *)cell
forRowAtIndexPath:(NSIndexPath *)indexPath
{
    // check if indexPath.row is last row
    // Perform operation to load new Cell's.
    
   
    //if ((indexPath.row+1)%5==0)
    
     // {
    
       
       //   NSLog(@"5th row...%ld",(long)indexPath.row);
    
      // [self activetaskurl:indexPath.row+5:1];
       
     //   pageno++;
   // }
 
}

- (void)scrollViewDidEndDragging:(UIScrollView *)aScrollView willDecelerate:(BOOL)decelerate
{
    CGPoint offset = aScrollView.contentOffset; CGRect bounds = aScrollView.bounds; CGSize size = aScrollView.contentSize; UIEdgeInsets inset = aScrollView.contentInset; float y = offset.y + bounds.size.height - inset.bottom; float h = size.height; float reload_distance = 50; if(y > h + reload_distance)
        
{
  
    
    
    
    if(tasktype==0)
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
    if(tasktype==1)
    {
        if(awardedpageno<=totalawardeddata)
        {
            NSLog(@"load more rows");
            [_activity_indicator setHidden:NO];
            awardedpageno=awardedpageno+10;
            // pageno=pageno+1;
            
            [self awardedtaskurl :awardedpageno:1];
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
    else if (tasktype==2)
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
    else if (tasktype==3)
    {
        if(canceledpageno<=totalcanceleddata)
        {
            NSLog(@"load more rows");
            [_activity_indicator setHidden:NO];
            canceledpageno=canceledpageno+10;
           
            
            [self canceledtaskurl:canceledpageno:1];
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
    else if (Issearch==1)
    {
        if(searchpageno<=totalsearchdata)
        {
            NSLog(@"load more rows");
            [_activity_indicator setHidden:NO];
            searchpageno=searchpageno+10;
            // pageno=pageno+1;
            
            [self searchtaskurl:searchbar.text:searchpageno:1];
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
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (tableView==tbltask) {
        return [arrtask count];
    }
    else if (tableView==tblTaskName)
    {
         return [Arrtaskname count];
    }
    else{
        return 0;
    }
    
  //  return pageno*5;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (tableView==tbltask) {
        TaskDetailsViewController *obj=[self.storyboard instantiateViewControllerWithIdentifier:@"TaskDetailsViewControllersid"];
        obj.taskid=[[arrtask objectAtIndex:indexPath.row] valueForKey:@"id"];
        [self.navigationController pushViewController:obj animated:YES];
    }
    else if (tableView==tblTaskName)
    {
        if (indexPath.row==0)
        {
          //  btnactivetask.selected=YES;
          //  btncompletetask.selected=NO;
            searchbar.text=@"";
            Issearch=0;
            [searchbar resignFirstResponder];
            lbltaskname.text=@"Active Task";
            activepageno=10;
            [self activetaskurl:10 :1];
            tasktype=0;
            tblTaskName.hidden=YES;
        }
        else if (indexPath.row==1)
        {
            lbltaskname.text=@"Awarded Task";
            searchbar.text=@"";
            Issearch=0;
            [searchbar resignFirstResponder];
            awardedpageno=10;
            [self awardedtaskurl:10 :1];
            tblTaskName.hidden=YES;
            tasktype=1;
            
        }
        else if (indexPath.row==2)
        {
            //  btncompletetask.selected=YES;
            //  btnactivetask.selected=NO;
            searchbar.text=@"";
            Issearch=0;
            [searchbar resignFirstResponder];
            lbltaskname.text=@"Completed Task";
            completepageno=10;
            [self completetaskurl:10 :1];
            tasktype=2;
            tblTaskName.hidden=YES;
        }
        else if (indexPath.row==3)
        {
            lbltaskname.text=@"Canceled Task";
            searchbar.text=@"";
            Issearch=0;
            [searchbar resignFirstResponder];
            tblTaskName.hidden=YES;
            tasktype=3;
            canceledpageno=10;
            [self canceledtaskurl:10 :1];
            
        }
        btnarrow.selected=NO;
        [btnarrow setBackgroundImage:[UIImage imageNamed:@"down-arrow2.png"] forState:UIControlStateNormal];
        [btnarrow setBackgroundImage:[UIImage imageNamed:@"down-arrow4.png"] forState:UIControlStateSelected];
        [btnarrow setBackgroundImage:[UIImage imageNamed:@"down-arrow4.png"] forState:UIControlStateHighlighted];
    }
    
}
- (BOOL)searchBarShouldBeginEditing:(UISearchBar *)searchBar {
    [searchBar setShowsCancelButton:YES animated:YES];
    btnactivetask.selected=NO;
    btncompletetask.selected=NO;
    underlineimg.hidden=YES;
    tbltask.hidden=YES;
    Issearch=1;
    return YES;
}

- (void)searchBarCancelButtonClicked:(UISearchBar *)searchBar {
    [searchBar resignFirstResponder];
    [searchBar setShowsCancelButton:NO];
    searchBar.text=@"";
 //   searchBar.hidden=YES;
 //   [tbltask setHidden:YES];
    if (tasktype==0)
    {
       
        searchbar.text=@"";
        Issearch=0;
        [searchbar resignFirstResponder];
        lbltaskname.text=@"Active Task";
        activepageno=10;
        [self activetaskurl:10 :1];
        tasktype=0;
        tblTaskName.hidden=YES;
    }
    else if (tasktype==1)
    {
        lbltaskname.text=@"Awarded Task";
        searchbar.text=@"";
        Issearch=0;
        [searchbar resignFirstResponder];
        awardedpageno=10;
        [self awardedtaskurl:10 :1];
        tblTaskName.hidden=YES;
        tasktype=1;
        
    }
    else if (tasktype==2)
    {
        //  btncompletetask.selected=YES;
        //  btnactivetask.selected=NO;
        searchbar.text=@"";
        Issearch=0;
        [searchbar resignFirstResponder];
        lbltaskname.text=@"Completed Task";
        completepageno=10;
        [self completetaskurl:10 :1];
        tasktype=2;
        tblTaskName.hidden=YES;
    }
    else if (tasktype==3)
    {
        lbltaskname.text=@"Canceled Task";
        searchbar.text=@"";
        Issearch=0;
        [searchbar resignFirstResponder];
        tblTaskName.hidden=YES;
        tasktype=3;
        canceledpageno=10;
        [self canceledtaskurl:10 :1];
        
    }
    
}

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar {
    [searchBar resignFirstResponder];
    [searchBar setShowsCancelButton:NO];
}

- (void)searchBarTextDidEndEditing:(UISearchBar *)searchBar {
    
    [searchBar resignFirstResponder];
    [searchBar setShowsCancelButton:NO];
}
- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText {
    
    
    
    
    if(searchBar.text.length > 0) {
        NSLog(@"searchbar is");
        btnactivetask.selected=NO;
        btncompletetask.selected=NO;
         underlineimg.hidden=YES;
        tbltask.hidden=YES;
        Issearch=1;
        [searchBar setShowsCancelButton:YES];
        [self searchtaskurl:searchBar.text:10:1];
    //    NSPredicate *pred = [NSPredicate predicateWithFormat:@"title beginswith[c] %@", searchBar.text];
   //     [self searchtaskurl:10:1];
     
 
   //     arrtask = [[arrtask filteredArrayUsingPredicate:pred] mutableCopy];
        NSLog(@"the count after sorting=%lu",(unsigned long)arrtask.count);
        
/*        float height=[arrsearchresult count]*25;
        if (([arrsearchresult count]*25)>365) {
            height=365;
        }
        
        [tblsearch setFrame: CGRectMake(0, tblsearch.frame.origin.y, tblsearch.frame.size.width, height)];
      */
        [tbltask reloadData];
    }
    else {
        NSLog(@"searchbar is NOT");
        
    //    arrtask = [appDelegate.searchArray copy];
    //    [tbltask reloadData];
        
    }
 
    
    [tbltask setHidden:NO];
    
    }
    
    

-(void)searchtaskurl:(NSString *)searchtext :(NSInteger )number :(NSInteger)pg
{
    @try {
        NSLog(@"fire search url");
        NSString *tasktypename;
        if (tasktype==0)
        {
            tasktypename=@"active";
        }
        else if(tasktype==1)
        {
            tasktypename=@"awarded";
        }
        else if(tasktype==2)
        {
            tasktypename=@"completed";
        }
        else if(tasktype==3)
        {
            tasktypename=@"canceled";
        }
        NSString *str=[NSString stringWithFormat:@"%@tasksearch_ios?searchparams=%@&page=%ld&limit=%ld&terms=%@&user_id=%@",URL_LINK,[searchtext stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding],(long)pg,(long)number,tasktypename,[userid stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
        NSLog(@"str=%@",str);
        [arrtask removeAllObjects];
        BOOL net=[urlobj connectedToNetwork];
        if (net==YES) {

        [urlobj global:str typerequest:@"array" withblock:^(id result, NSError *error,BOOL completed) {
            
            //    NSLog(@"event result----- %@", result);
            totalsearchdata=[[result objectForKey:@"total"] integerValue];
            NSLog(@"total search data=%ld",(long)totalsearchdata);
            
            
            NSMutableArray *array = [[NSMutableArray alloc]init];
            for ( NSDictionary *tempDict in  [result objectForKey:@"task"])
            {
                [array addObject:tempDict];
                
            }
            
            [arrtask removeAllObjects];
            
            
            
            if (totalsearchdata==0) {
                lbltableempty.hidden=NO;
                [tbltask setHidden:YES];
            }
            else{
                arrtask=[array mutableCopy];
                lbltableempty.hidden=YES;
                [tbltask setHidden:NO];
                [_activity_indicator setHidden:YES];
                
                [tbltask reloadData];
                
                
            }
            
        }];
        }
        else{
            UIAlertView *aler=[[UIAlertView alloc] initWithTitle:@"Alert" message:@"No Network Connection." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
            [aler show];
        }
    }
    @catch (NSException *exception) {
        lbltableempty.hidden=NO;
        [tbltask setHidden:YES];
         [_activity_indicator setHidden:YES];
    }
    @finally
    {
        
    }
    
}

- (IBAction)arrowclk:(id)sender {
    if (btnarrow.selected==NO)
    {
        tbltask.hidden=YES;
        tblTaskName.hidden=NO;
        btnarrow.selected=YES;
     //   [btnarrow setBackgroundImage:[UIImage imageNamed:@"down-arrow2.png"] forState:UIControlStateNormal];
        [btnarrow setBackgroundImage:[UIImage imageNamed:@"down-arrow4.png"] forState:UIControlStateSelected];
        [btnarrow setBackgroundImage:[UIImage imageNamed:@"down-arrow4.png"] forState:UIControlStateHighlighted];
    }
    else
    {
        tblTaskName.hidden=YES;
        btnarrow.selected=NO;
        if (tasktype==0)
        {
            //  btnactivetask.selected=YES;
            //  btncompletetask.selected=NO;
            searchbar.text=@"";
            Issearch=0;
            [searchbar resignFirstResponder];
            lbltaskname.text=@"Active Task";
            activepageno=10;
            [self activetaskurl:10 :1];
            tasktype=0;
            tblTaskName.hidden=YES;
        }
        else if (tasktype==1)
        {
            lbltaskname.text=@"Awarded Task";
            searchbar.text=@"";
            Issearch=0;
            [searchbar resignFirstResponder];
            awardedpageno=10;
            [self awardedtaskurl:10 :1];
            tblTaskName.hidden=YES;
            tasktype=1;
            
        }
        else if (tasktype==2)
        {
            //  btncompletetask.selected=YES;
            //  btnactivetask.selected=NO;
            searchbar.text=@"";
            Issearch=0;
            [searchbar resignFirstResponder];
            lbltaskname.text=@"Completed Task";
            completepageno=10;
            [self completetaskurl:10 :1];
            tasktype=2;
            tblTaskName.hidden=YES;
        }
        else if (tasktype==3)
        {
            lbltaskname.text=@"Canceled Task";
            searchbar.text=@"";
            Issearch=0;
            [searchbar resignFirstResponder];
            tblTaskName.hidden=YES;
            tasktype=3;
            canceledpageno=10;
            [self canceledtaskurl:10 :1];
            
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
@end
