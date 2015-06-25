//
//  MessageViewController.m
//  TaskAroo
//
//  Created by Prosenjit Kolay on 21/05/15.
//  Copyright (c) 2015 Prosenjit Kolay. All rights reserved.
//

#import "MessageViewController.h"

@interface MessageViewController ()<headerDelegate,leftDelegate,UITableViewDataSource,UITableViewDelegate>

@end

@implementation MessageViewController
@synthesize mainview,tblmesg,lblnodata,lblnomore,nomoredataview,titleview;
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
    }else
    {
        hv.btnlogo1.hidden=YES;
      //  hv.btnlogo1.frame=CGRectMake(self.view.frame.size.width- hv.btnlogo1.frame.size.width-30,  hv.btnlogo1.frame.origin.y-10,  hv.btnlogo1.frame.size.width,  hv.btnlogo1.frame.size.height);
        hv.btnleftmenu.hidden=NO;
        hv.btnleftmenuextra.hidden=NO;
        hv.lblpagename.text=@"MESSAGE INBOX";
         hv.lblpagename.center=CGPointMake(self.view.center.x, hv.lblpagename.center.y);
    //    hv.lblpagename.frame=CGRectMake(hv.lblpagename.frame.origin.x-24,  hv.lblpagename.frame.origin.y,  hv.lblpagename.frame.size.width,  hv.lblpagename.frame.size.height);
    }
    
    hv.btnsignnout.hidden=YES;
    [mainview addSubview:hv];
    
    FooterView *fv = [[FooterView alloc]initWithFrame:CGRectMake(0,self.view.frame.size.height-60, self.view.frame.size.width,60)];
    [fv.btnmenu1 addTarget:self action:@selector(taskbuttonTapped:) forControlEvents:UIControlEventTouchUpInside];
    [fv.btnmenu2 addTarget:self action:@selector(MyAccountbuttonTapped:) forControlEvents:UIControlEventTouchUpInside];
 //   [fv.btnmenu3 addTarget:self action:@selector(MessagebuttonTapped:) forControlEvents:UIControlEventTouchUpInside];
    [fv.btnmenu4 addTarget:self action:@selector(ContactbuttonTapped:) forControlEvents:UIControlEventTouchUpInside];
    
    [mainview addSubview:fv];
    
    
    urlobj=[[UrlconnectionObject alloc]init];
    ArrMesg=[[NSMutableArray alloc]init];
    pageno=10;
    [self Messageurl:10 :1];
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


-(void)Messageurl:(NSInteger )number :(NSInteger)pg
{
    @try {
        NSString *str=[NSString stringWithFormat:@"%@message_ios/get_message?user_id=%@&page=%ld&limit=%ld",URL_LINK,[userid stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding],(long)pg,(long)number];
        NSLog(@"str=%@",str);
        BOOL net=[urlobj connectedToNetwork];
        if (net==YES) {
        [urlobj global:str typerequest:@"array" withblock:^(id result, NSError *error,BOOL completed) {
            
            //   NSLog(@"event result----- %@", result);
            totaldata=[[result objectForKey:@"total"] integerValue];
            NSLog(@"total active data=%ld",(long)totaldata);
            
            
            NSMutableArray *array = [[NSMutableArray alloc]init];
            for ( NSDictionary *tempDict in  [result objectForKey:@"response"])
            {
                [array addObject:tempDict];
                
            }
            
            [ArrMesg removeAllObjects];
            
            
            
            if (totaldata==0) {
                lblnodata.hidden=NO;
                [tblmesg setHidden:YES];
            }
            else{
                ArrMesg=[array mutableCopy];
                lblnodata.hidden=YES;
                [tblmesg setHidden:NO];
                [_activity_indicator setHidden:YES];
                
                [tblmesg reloadData];
                
                
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
        [tblmesg setHidden:YES];
    }
    @finally {
        
    }
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 124.0f;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    @try {
        cellId = @"cellid";
        cell = [tableView dequeueReusableCellWithIdentifier:cellId];
        
        cell=[[[NSBundle mainBundle] loadNibNamed:@"MessageInboxCell" owner:self options:nil] objectAtIndex:0];
        
        
        
        cell.lblsender.text = [[ArrMesg objectAtIndex:indexPath.row] valueForKey:@"name"];
        cell.lbltaskcode.text = [[ArrMesg objectAtIndex:indexPath.row] valueForKey:@"task_code"];
        cell.lbldetails.text = [[ArrMesg objectAtIndex:indexPath.row] valueForKey:@"message"];
        cell.lbldate.text = [[ArrMesg objectAtIndex:indexPath.row] valueForKey:@"message_date"];
        NSString *file = [[ArrMesg objectAtIndex:indexPath.row] valueForKey:@"attach_file"];
        if (file.length==0)
        {
            cell.btnattachment.hidden=YES;
        }
        else
        {
            cell.btnattachment.hidden=NO;
            cell.btnattachment.tag=indexPath.row;
            [cell.btnattachment addTarget:self action:@selector(DownloadattachmentClicked:) forControlEvents:UIControlEventTouchUpInside];
        }
        NSString *complete = [[ArrMesg objectAtIndex:indexPath.row] valueForKey:@"message_type"];
        if ([complete isEqualToString:@"0"])
        {
            cell.lblrequest.hidden=YES;
        }
        
        [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
        [cell setBackgroundColor:[UIColor clearColor]];
        
        UIView *lineView = [[UIView alloc] initWithFrame:CGRectMake(0, 124, [[UIScreen mainScreen]bounds].size.width, 1.0)];
        lineView.backgroundColor = [UIColor lightGrayColor];
        [cell addSubview:lineView];
        
        return cell;
    }
    @catch (NSException *exception) {
        
    }
    @finally {
        
    }
    
}
-(void)DownloadattachmentClicked:(UIButton*)sender
{
    
    UIImageView *downloadimg=[[UIImageView alloc]init];
    [downloadimg sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@",[[ArrMesg objectAtIndex:sender.tag] valueForKey:@"attach_file"]]] placeholderImage:[UIImage imageNamed:@"no image"] options:/* DISABLES CODE */ (0) == 0?SDWebImageRefreshCached : 0];
    NSLog(@"file=%@",[[ArrMesg objectAtIndex:sender.tag] valueForKey:@"attach_file"]);
    NSLog(@"image=%@",downloadimg);
    ALAssetsLibrary *library = [[ALAssetsLibrary alloc] init];
    [library saveImage:downloadimg.image toAlbum:@"TaskArooFile" withCompletionBlock:^(NSError *error) {
        
        if (error!=nil)
        {
            NSLog(@"Noooo error: %@", [error description]);
            
            //  [busyview removeFromSuperview];
        }
        else{
            if (downloadimg.image)
            {
                NSLog(@"image null");
                UIImageView *downloadimg=[[UIImageView alloc]init];
                [downloadimg sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@",[[ArrMesg objectAtIndex:sender.tag] valueForKey:@"attach_file"]]] placeholderImage:[UIImage imageNamed:@"no image"] options:/* DISABLES CODE */ (0) == 0?SDWebImageRefreshCached : 0];
                NSLog(@"file=%@",[[ArrMesg objectAtIndex:sender.tag] valueForKey:@"attach_file"]);
                NSLog(@"final image=%@",downloadimg.image);
                ALAssetsLibrary *library = [[ALAssetsLibrary alloc] init];
                [library saveImage:downloadimg.image toAlbum:@"TaskArooFile" withCompletionBlock:^(NSError *error) {
                    
                    if (error!=nil)
                    {
                        NSLog(@"Noooo error: %@", [error description]);
                        
                        //  [busyview removeFromSuperview];
                    }
                    else{
                        //  [busyview removeFromSuperview];
                        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Success" message:@"Image saved successfully" delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil];
                        [alert show];
                    }
                }];
            }
            else
            {
                UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Success" message:@"Image saved successfully" delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil];
                [alert show];
            }
        }
    }];
    
}
- (void)scrollViewDidEndDragging:(UIScrollView *)aScrollView willDecelerate:(BOOL)decelerate
{
    CGPoint offset = aScrollView.contentOffset; CGRect bounds = aScrollView.bounds; CGSize size = aScrollView.contentSize; UIEdgeInsets inset = aScrollView.contentInset; float y = offset.y + bounds.size.height - inset.bottom; float h = size.height; float reload_distance = 50; if(y > h + reload_distance)
        
    {
        
        
        
        
       
            if(pageno<=totaldata)
            {
                NSLog(@"load more rows");
                [_activity_indicator setHidden:NO];
                pageno=pageno+10;
                // pageno=pageno+1;
                
                [self Messageurl:pageno:1];
            }
            else{
                nomoredataview.hidden=NO;
                [lblnodata setAlpha:0.0f];
                
                //fade in
                [UIView animateWithDuration:2.0f animations:^{
                    
                    [lblnomore setAlpha:1.0f];
                    
                } completion:^(BOOL finished) {
                    
                    //fade out
                    [UIView animateWithDuration:2.0f animations:^{
                        
                        [lblnomore setAlpha:0.0f];
                        
                    } completion:nil];
                    
                }];
                //  nomoredataview.hidden=YES;
            }
       
   
    }
    
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    return [ArrMesg count];
    //  return pageno*5;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    MessageDetailsViewController *obj=[self.storyboard instantiateViewControllerWithIdentifier:@"MessageDetailsViewControllersid"];
    obj.messageid=[[ArrMesg objectAtIndex:indexPath.row] valueForKey:@"message_id"];
    [self.navigationController pushViewController:obj animated:YES];
     
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
