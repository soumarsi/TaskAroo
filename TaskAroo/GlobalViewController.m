//
//  GlobalViewController.m
//  TaskAroo1
//
//  Created by Prosenjit Kolay on 20/03/15.
//  Copyright (c) 2015 Prosenjit Kolay. All rights reserved.
//

#import "GlobalViewController.h"
#import "FooterView.h"
#import "HeaderView.h"
#import "TaskHomeViewController.h"
#import "SignInViewController.h"
#import "MyAccountViewController.h"
#import "ContactViewController.h"
#import "MessageViewController.h"
@interface GlobalViewController ()<headerDelegate> {
    
    HeaderView *headerView;
}

@end

@implementation GlobalViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Do any additional setup after loading the view.
   
}
-(void)footercall
{
    FooterView *fv = [[FooterView alloc]initWithFrame:CGRectMake(0,self.view.frame.size.height-60, self.view.frame.size.width,60)];
    [fv.btnmenu1 addTarget:self action:@selector(MytaskbuttonTapped:) forControlEvents:UIControlEventTouchUpInside];
     [fv.btnmenu2 addTarget:self action:@selector(MyAccountbuttonTapped:) forControlEvents:UIControlEventTouchUpInside];
    [fv.btnmenu3 addTarget:self action:@selector(MessagebuttonTapped:) forControlEvents:UIControlEventTouchUpInside];
    [fv.btnmenu4 addTarget:self action:@selector(ContactbuttonTapped:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:fv];
}
-(void)headercall
{
    HeaderView *hv = [[HeaderView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 60)];
    hv.userInteractionEnabled = YES;
    hv.lblpagename.hidden=YES;
    hv.myDelegate = self;
    
    [self.view addSubview:hv];
   
}
-(void)homeheadercall
{
    HeaderView *hv = [[HeaderView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 60)];
    hv.userInteractionEnabled = YES;
    hv.myDelegate = self;
    hv.btnlogo1.hidden=YES;
    hv.btnleftmenu.hidden=NO;
    hv.btnsignnout.hidden=YES;
    [self.view addSubview:hv];
    
}
-(void)headerclk:(UIButton *)sender
{
   
      NSLog(@"get value method called");
    long tagId = [sender tag];
    if (tagId==1)
    {
        NSLog(@"go dashboard");
    //    ViewController *obj=[[ViewController alloc]init];
    //     [self.navigationController pushViewController:obj animated:YES];
    //   [self presentViewController:obj animated:YES completion:nil];
        
       ViewController *obj1=[self.storyboard instantiateViewControllerWithIdentifier:@"ViewControllersid"];
        [self.navigationController pushViewController:obj1 animated:YES];
    

    }
    else if (tagId==2)
    {
        NSLog(@"signout clk");
        
       NSString *appDomain = [[NSBundle mainBundle] bundleIdentifier];
        [[NSUserDefaults standardUserDefaults] removePersistentDomainForName:appDomain];
        [self deleteDocDirectory];
        ViewController *obj1=[self.storyboard instantiateViewControllerWithIdentifier:@"ViewControllersid"];
        [self.navigationController pushViewController:obj1 animated:YES];
    }
   
}





-(UIView *)addPaddingView
{
    UIView *paddingViewUser = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 20, 0)];
    return paddingViewUser;
}
-(void)signoutclk:(id)sender
{
    NSLog(@"signout clk");

    NSString *appDomain = [[NSBundle mainBundle] bundleIdentifier];
    [[NSUserDefaults standardUserDefaults] removePersistentDomainForName:appDomain];
    [self deleteDocDirectory];
    ViewController *obj=[[ViewController alloc]init];
    [self.navigationController pushViewController:obj animated:YES];
   }
-(void)godashboardclk:(id)sender
{
    NSLog(@"go dashboard");
    ViewController *obj=[[ViewController alloc]init];
    [self.navigationController pushViewController:obj animated:YES];
}

-(void)MytaskbuttonTapped:(id)sender
{
    NSUserDefaults *prefs = [NSUserDefaults standardUserDefaults];
    NSString *userid=[prefs valueForKey:@"userid"];
    NSLog(@"userid=%@",userid);
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
    /*
    UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"just alert" message:@"first footer clicked" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
    [alert show];
     */
}
-(void)MyAccountbuttonTapped:(id)sender
{
    NSUserDefaults *prefs = [NSUserDefaults standardUserDefaults];
    NSString *userid=[prefs valueForKey:@"userid"];
    NSLog(@"userid=%@",userid);
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
    NSUserDefaults *prefs = [NSUserDefaults standardUserDefaults];
    NSString *userid=[prefs valueForKey:@"userid"];
    NSLog(@"userid=%@",userid);
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

-(void)ContactbuttonTapped:(id)sender
{
   
        ContactViewController *obj=[self.storyboard instantiateViewControllerWithIdentifier:@"ContactViewControllersid"];
        
        [self.navigationController pushViewController:obj animated:NO];
   
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
-(NSString *)changeformate_string24hr:(NSString *)date
{
    
    NSDateFormatter* df = [[NSDateFormatter alloc]init];
    
    [df setTimeZone:[NSTimeZone systemTimeZone]];
    
  //  [df setDateFormat:@"MM/dd/yyyy hh:mm:ss a"];
    [df setDateFormat:@"ddMMyyyyhh:mma"];
    NSDate* wakeTime = [df dateFromString:date];
    
    [df setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    
    
    return [df stringFromDate:wakeTime];
    
}
-(NSString *)changeformate_string12hr:(NSString *)date
{
    
    NSDateFormatter* df = [[NSDateFormatter alloc]init];
    
    [df setTimeZone:[NSTimeZone systemTimeZone]];
    
    [df setDateFormat:@"MM/dd/yyyy HH:mm:ss"];
    NSDate* wakeTime = [df dateFromString:date];
    
    
    [df setDateFormat:@"MM/dd/yyyy hh:mm:ss a"];
    
    
    return [df stringFromDate:wakeTime];
    
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
