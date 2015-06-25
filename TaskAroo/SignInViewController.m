//
//  SignInViewController.m
//  TaskAroo1
//
//  Created by Prosenjit Kolay on 20/03/15.
//  Copyright (c) 2015 Prosenjit Kolay. All rights reserved.
//

#import "SignInViewController.h"

@interface SignInViewController ()<UITextFieldDelegate,NSURLConnectionDelegate>

@end

@implementation SignInViewController
@synthesize txtpassword,txtusername,btnsignin,mainscroll,logoimg,lbldonthvac,lblloginwith,btnsignup,btnfblogin,btnforgotpass,appDelegate,tasktosignin,pagename;
- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSLog(@"SignInViewController -- ");
    NSLog(@"task to signin=%c",tasktosignin);

    mainDic=[[NSMutableDictionary alloc]init];
    arrmain=[[NSMutableArray alloc]init];
    mutDic=[[NSMutableDictionary alloc]init];
    fbdatadic=[[NSMutableDictionary alloc]init];
    
    [[NSUserDefaults standardUserDefaults] setObject:@"" forKey:@"userid"];
    [[NSUserDefaults standardUserDefaults]synchronize];
 
 //   NSUserDefaults *prefs = [NSUserDefaults standardUserDefaults];
  //  txtusername.text=[prefs valueForKey:@"userid"];
    
    //design
  //  [mainview setFrame:CGRectMake(self.view.frame.origin.x, self.view.frame.origin.x, self.view.frame.size.height, self.view.frame.size.height)];
    [mainscroll setFrame:CGRectMake(self.view.layer.frame.origin.x, self.view.layer.frame.origin.y, self.view.bounds.size.width, self.view.bounds.size.height)];
    UIGraphicsBeginImageContext(mainscroll.frame.size);
    [[UIImage imageNamed:@"bg.png"] drawInRect:mainscroll.bounds];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    mainscroll.backgroundColor = [UIColor colorWithPatternImage:image];
    mainscroll.contentSize = CGSizeMake(0, 700);
    
    lbldonthvac.textColor =[UIColor colorWithRed:(155/255.0f) green:(155/255.0f) blue:(155/255.0f) alpha:1];
    txtusername.textColor=[UIColor colorWithRed:(102/255.0f) green:(102/255.0f) blue:(102/255.0f) alpha:1];
    txtpassword.textColor=[UIColor colorWithRed:(102/255.0f) green:(102/255.0f) blue:(102/255.0f) alpha:1];
    btnforgotpass.titleLabel.textColor=[UIColor colorWithRed:(155/255.0f) green:(155/255.0f) blue:(155/255.0f) alpha:1];
    
    placeholdercolor =[UIColor colorWithRed:(102/255.0f) green:(102/255.0f) blue:(102/255.0f) alpha:1];
    txtusername.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"Email" attributes:@{NSForegroundColorAttributeName: placeholdercolor}];
    txtpassword.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"Password" attributes:@{NSForegroundColorAttributeName: placeholdercolor}];
    
    //textfield padding
    UIView *paddingView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 20, 0)];
    txtusername.leftView = paddingView;
    txtusername.leftViewMode = UITextFieldViewModeAlways;
    UIView *paddingView1 = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 20, 0)];
    txtpassword.leftView = paddingView1;
    txtpassword.leftViewMode = UITextFieldViewModeAlways;
    
    //for fb login
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(handleFBSessionStateChangeWithNotification:)
                                                 name:@"SessionStateChangeNotification"
                                               object:nil];
    // Initialize the appDelegate property.
    appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    [mainscroll setContentOffset:CGPointMake(0,0) animated:YES];
    return YES;
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
- (IBAction)signinclk:(id)sender {
    //email validation
    NSString *emailRegEx = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegEx];
    
    if ([emailTest evaluateWithObject:txtusername.text] == NO)
    {
        txtusername.text=@"";
         txtusername.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"Not a valid email" attributes:@{NSForegroundColorAttributeName: placeholdercolor}];
       
    }
    else if(txtpassword.text.length==0){
        txtpassword.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"Please enter password" attributes:@{NSForegroundColorAttributeName: placeholdercolor}];
       
    }
    else
    {
        [self loaddata];
        
    }
   
}


- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
  /*
    if ([[segue identifier] isEqualToString:@"fblogintosignupsegue"])
    {
        // Get reference to the destination view controller
        SignUpViewController *vc = [segue destinationViewController];
        vc.fbdicchk=YES;
        vc.fbdetaildic=[fbdatadic mutableCopy];
    }
   */
}
- (IBAction)signupclk:(id)sender {
    
   //  [self performSegueWithIdentifier:@"logintosignupsegue" sender:self];
    SignUpViewController *obj=[self.storyboard instantiateViewControllerWithIdentifier:@"SignUpViewControllersid"];
  
    if (tasktosignin==YES)
    {
        obj.tasktosignup=YES;
    }
    else
    {
        obj.tasktosignup=NO;
        
    }
    [self.navigationController pushViewController:obj animated:YES];
}

- (IBAction)fbloginclk:(id)sender {
    
 //   [self performSegueWithIdentifier:@"fbloginsegue" sender:self];
    
    
        [[FBSession activeSession] closeAndClearTokenInformation];
        [[FBSession activeSession] close];
        [FBSession setActiveSession:nil];
        
        if (FBSession.activeSession.state == FBSessionStateOpen
            || FBSession.activeSession.state == FBSessionStateOpenTokenExtended) {
            
            // Close the session and remove the access token from the cache
            // The session state handler (in the app delegate) will be called automatically
            [FBSession.activeSession closeAndClearTokenInformation];
            
            // If the session state is not any of the two "open" states when the button is clicked
        } else {
            // Open a session showing the user the login UI
            // You must ALWAYS ask for public_profile permissions when opening a session
            [FBSession openActiveSessionWithReadPermissions:@[@"public_profile",@"email"]
                                               allowLoginUI:YES
                                          completionHandler:^(FBSession *session, FBSessionState state, NSError *error) {
                                              
                                              [self updateView:session state:state error:error];
                                          }];
        }
        
}

- (IBAction)godashboardclk:(id)sender
{
    ViewController *obj=[self.storyboard instantiateViewControllerWithIdentifier:@"ViewControllersid"];
    [self.navigationController pushViewController:obj animated:YES];
}

- (IBAction)forgetpasswordClk:(id)sender
{
    ForgotPasswordViewController *obj=[self.storyboard instantiateViewControllerWithIdentifier:@"ForgotPasswordViewControllersid"];
    [self.navigationController pushViewController:obj animated:YES];
}



-(void)loaddata
{
    //  NSError *error;
    NSString *str=[NSString stringWithFormat:@"http://www.esolz.co.in/lab3/taskaroo/index.php/login_ios?username=%@&password=%@",txtusername.text,txtpassword.text];
    NSURL *url=[NSURL URLWithString:str];
    NSURLRequest *request=[NSURLRequest requestWithURL:url];
    NSURLConnection *connection=[NSURLConnection connectionWithRequest:request delegate:self];
    connection=nil;
    
}
- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    DATA=[data mutableCopy];
}
-(void) connection:(NSURLConnection *)connection didFailWithError:(NSError *)error
{
    
    
    // If we get any connection error we can manage it here…
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Alert" message:@"No Network Connection" delegate:self cancelButtonTitle:nil otherButtonTitles:@"OK",nil];
    [alertView show];
    
    return;
}
- (void)connectionDidFinishLoading:(NSURLConnection *)connection
{
    NSError *error;
    mainDic=[NSJSONSerialization JSONObjectWithData:DATA options:kNilOptions error:&error];
    NSLog(@"user data=%@",mainDic);
    mutDic=[mainDic valueForKey:@"response"];
   NSLog(@"values:%@",[mutDic valueForKey:@"status"]);

    if ([[mutDic valueForKey:@"status"] isEqualToString:@"Success"]) {
        
     //   UIAlertView *aler=[[UIAlertView alloc] initWithTitle:@"Success" message:@"Login success.." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
    //    [aler show];
        NSLog(@"userid=%@",[mainDic valueForKey:@"userid"]);
        [[NSUserDefaults standardUserDefaults] setObject:[mainDic valueForKey:@"userid"] forKey:@"userid"];
        [[NSUserDefaults standardUserDefaults] setObject:txtusername.text forKey:@"email"];
        [[NSUserDefaults standardUserDefaults] setObject:[mainDic valueForKey:@"paymentstatus"] forKey:@"paymentstatus"];
         [[NSUserDefaults standardUserDefaults] setObject:[mainDic valueForKey:@"username"] forKey:@"username"];
         [[NSUserDefaults standardUserDefaults] setObject:[mainDic valueForKey:@"smalluserimage"] forKey:@"smalluserimage"];
        txtpassword.text=@"";
        txtusername.text=@"";
       // [self performSegueWithIdentifier:@"logintohomesegue" sender:self];
        
        if ([pagename isEqualToString:@"account"])
        {
            MyAccountViewController *obj=[self.storyboard instantiateViewControllerWithIdentifier:@"MyAccountViewControllersid"];
            [self.navigationController pushViewController:obj animated:YES];
        }
        else if ([pagename isEqualToString:@"message"])
        {
            MessageViewController *obj=[self.storyboard instantiateViewControllerWithIdentifier:@"MessageViewControllersid"];
            [self.navigationController pushViewController:obj animated:YES];
        }
        else
        {
       TaskHomeViewController *obj=[self.storyboard instantiateViewControllerWithIdentifier:@"TaskHomeViewControllersid"];
        [self.navigationController pushViewController:obj animated:YES];
        }
 
  
  /*       MyHomeViewController *obj=[self.storyboard instantiateViewControllerWithIdentifier:@"MyHomeViewControllersid"];
        if (tasktosignin==YES)
        {
             obj.taskfilled=YES;
        }
       else
       {
           obj.taskfilled=NO;

       }
    [self.navigationController pushViewController:obj animated:YES];
   */
    }
    else
    {
        UIAlertView *aler=[[UIAlertView alloc] initWithTitle:@"Error" message:@"Login fail.." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [aler show];
    }
    
}
- (void)updateView:(FBSession *)session state:(FBSessionState) state error:(NSError *)error
{
    // get the app delegate, so that we can reference the session property
    
    NSLog(@"UPDATEVIEW=======================>>>>>");
    
    if (state == FBSessionStateOpen) {
        // valid account UI is shown whenever the session is open
        
        NSMutableDictionary *resultfb; //fb detail will store here
  //      NSString *profileimageURL;     //fb profile pic will store here
        
        
        //fetch fb details
        
        NSString *urlString;
        NSError *error = nil;
        urlString = [NSString stringWithFormat:@"https://graph.facebook.com/me?access_token=%@",
                     [FBSession activeSession].accessTokenData.accessToken];
        NSURL *requestURL = [NSURL URLWithString:urlString];
        NSData *signeddataURL1 =  [NSData dataWithContentsOfURL:requestURL options:NSDataReadingUncached error:&error];
        resultfb = [NSJSONSerialization JSONObjectWithData:signeddataURL1 options:kNilOptions error:&error];
     //   NSLog(@"fb details--->%@",resultfb);
        [fbdatadic setObject:[resultfb objectForKey:@"first_name"] forKey:@"first_name"];
         [fbdatadic setObject:[resultfb objectForKey:@"last_name"] forKey:@"last_name"];
        [fbdatadic setObject:[resultfb objectForKey:@"id"] forKey:@"fbid"];
         [fbdatadic setObject:[resultfb objectForKey:@"email"] forKey:@"email"];
       
        
        
        
        //For Profile Image
        
        NSString *urlString_img = [NSString stringWithFormat:@"https://graph.facebook.com/%@/picture?width=200&height=200&redirect=false",[resultfb objectForKey:@"id"]];
   //      NSString *urlString_img = [NSString stringWithFormat:@"https://graph.facebook.com/%@/picture?type=large",[resultfb objectForKey:@"id"]];
        NSURL *requestURL_img = [NSURL URLWithString:urlString_img];
        NSData *signeddataURL1_img =  [NSData dataWithContentsOfURL:requestURL_img options:NSDataReadingUncached error:&error];
        NSDictionary  *image_result = [NSJSONSerialization JSONObjectWithData:signeddataURL1_img options:kNilOptions error:&error];
        NSDictionary *picturedata = [image_result objectForKey:@"data"];
   //     profileimageURL = [picturedata objectForKey:@"url"];
   //     [fbdatadic setObject:[picturedata objectForKey:@"url"] forKey:@"profileimageURL"];
     
        [fbdatadic setObject:urlString_img forKey:@"profileimageURL"];
        
        
        
        
        //-----check this fb id is already exist or not?
        
        NSLog(@"fbid is %@",[resultfb valueForKey:@"id"]);
        NSString *urlString1;
        urlString1 = [NSString stringWithFormat:@"http://www.esolz.co.in/lab3/taskaroo/index.php/postersignup_ios/checkfacebookid?facebook_id=%@",
                      [resultfb valueForKey:@"id"]];
        NSURL *requestURL1 = [NSURL URLWithString:urlString1];
        NSData *data =  [NSData dataWithContentsOfURL:requestURL1 options:NSDataReadingUncached error:&error];
        NSMutableDictionary *fbchkdic = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&error];
         NSLog(@"fb check--->%@",fbchkdic);
        NSDictionary  *responsedic=[fbchkdic valueForKey:@"response"];
        NSLog(@"this fb id exist:%@",[responsedic valueForKey:@"status"]);
         NSLog(@"response=%@",responsedic);
        if ([[responsedic valueForKey:@"status"] isEqualToString:@"Success"]) {
            
            //this fb user already registered so go home page
            NSLog(@"userid=%@",[responsedic valueForKey:@"userid"]);
            [[NSUserDefaults standardUserDefaults] setObject:[responsedic valueForKey:@"userid"] forKey:@"userid"];
             [[NSUserDefaults standardUserDefaults] setObject:[resultfb objectForKey:@"email"] forKey:@"email"];
            [[NSUserDefaults standardUserDefaults] setObject:[responsedic valueForKey:@"paymentstatus"] forKey:@"paymentstatus"];
          //  NSString *name=[[resultfb objectForKey:@"first_name"] stringByAppendingString:[resultfb objectForKey:@"last_name"]];
            [[NSUserDefaults standardUserDefaults] setObject:[responsedic valueForKey:@"username"] forKey:@"username"];
            [[NSUserDefaults standardUserDefaults] setObject:[responsedic valueForKey:@"profile_image"]  forKey:@"smalluserimage"];
        //    [[NSUserDefaults standardUserDefaults] setObject:[picturedata objectForKey:@"url"]  forKey:@"smalluserimage"];
        //    NSLog(@"image=%@",[picturedata objectForKey:@"url"]);
            TaskHomeViewController *obj=[self.storyboard instantiateViewControllerWithIdentifier:@"TaskHomeViewControllersid"];
            [self.navigationController pushViewController:obj animated:YES];
          //  [self performSegueWithIdentifier:@"logintohomesegue" sender:self];
        /*    MyHomeViewController *obj=[self.storyboard instantiateViewControllerWithIdentifier:@"MyHomeViewControllersid"];
            if (tasktosignin==YES)
            {
                obj.taskfilled=YES;
            }
            else
            {
                obj.taskfilled=NO;
                
            }
            [self.navigationController pushViewController:obj animated:YES];
         */
        }
        else
        {
            //this fb user not registered so go sign up page
            
          //  [self performSegueWithIdentifier:@"fblogintosignupsegue" sender:self];
            SignUpViewController *obj=[self.storyboard instantiateViewControllerWithIdentifier:@"SignUpViewControllersid"];
            obj.fbdicchk=YES;
            obj.fbdetaildic=[fbdatadic mutableCopy];
            if (tasktosignin==YES)
            {
                obj.tasktosignup=YES;
            }
            else
            {
                obj.tasktosignup=NO;
                
            }
            [self.navigationController pushViewController:obj animated:YES];
            
        }
        
        
        
        
    }
    else
    {
        
        NSLog(@"coming logout");
        
    }
}
- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField
{
   
        [mainscroll setContentOffset:CGPointMake(0,50) animated:YES];
   
    return YES;
}
/*
-(void)handleFBSessionStateChangeWithNotification:(NSNotification *)notification{
    // Get the session, state and error values from the notification's userInfo dictionary.
    
    NSDictionary *userInfo = [notification userInfo];
    
    FBSessionState sessionState = [[userInfo objectForKey:@"state"] integerValue];
    NSError *error = [userInfo objectForKey:@"error"];
    
      [myspinn  startAnimating];
    myspinn.hidden = NO;
    
    if (!error) {
        
        if (sessionState == FBSessionStateOpen) {
            // The session is open. Get the user information and update the UI.
      
            [FBRequestConnection startWithGraphPath:@"me"
                                         parameters:@{@"fields": @"first_name, last_name, picture.type(normal), email"}
                                         HTTPMethod:@"GET"
                                  completionHandler:^(FBRequestConnection *connection, id result, NSError *error) {
                                      if (!error) {
                                          
                                         
                                    NSLog(@"fullname=%@",[NSString stringWithFormat:@"%@ %@",
                                    [result objectForKey:@"first_name"],
                                    [result objectForKey:@"last_name"]]);
                                          NSLog(@"Email=%@",[result objectForKey:@"email"]);
                                         
                                          
                                          // Get the user's profile picture.
                                          NSURL *pictureURL = [NSURL URLWithString:[[[result objectForKey:@"picture"] objectForKey:@"data"] objectForKey:@"url"]];
                                          NSLog(@"image url=%@",pictureURL);
                                    //      profileimg.image = [UIImage imageWithData:[NSData dataWithContentsOfURL:pictureURL]];
                                        
                                          [self performSegueWithIdentifier:@"fbloginsegue" sender:self];
                                          [myspinn stopAnimating];
                                          myspinn.hidden = YES;
                                      }
                                      else{
                                          NSLog(@"%@", [error localizedDescription]);
                                      }
                                  }];
            
            
        //    [btntogglelogin setTitle:@"Logout" forState:UIControlStateNormal];
        
            
           

            
            
            
        }
        else if (sessionState == FBSessionStateClosed || sessionState == FBSessionStateClosedLoginFailed){
            // A session was closed or the login was failed. Update the UI accordingly.
        //    lblstatus.text = @"You are not logged in.";
            myspinn.hidden = YES;
        }
    }
    else{
        // In case an error has occurred, then just log the error and update the UI accordingly.
        NSLog(@"Error: %@", [error localizedDescription]);
     
      
    }
    
   
}
 */


@end
