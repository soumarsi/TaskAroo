//
//  SignUpViewController.m
//  TaskAroo1
//
//  Created by Prosenjit Kolay on 20/03/15.
//  Copyright (c) 2015 Prosenjit Kolay. All rights reserved.
//

#import "SignUpViewController.h"
#import "TermsView.h"
@interface SignUpViewController ()<UITextFieldDelegate,NSURLConnectionDelegate,termsDelegate>
{
 
}

@end

@implementation SignUpViewController
@synthesize txtemail,txtfirstname,txtlang,txtlastname,txtpassword,txtpcode,txtphno,txtsques1,txtsques2,btnsignup,mainscroll,txtconfirmpass,btnfblogin,btnchk,lblloginwith,lblagree,lblor,myspinner,fbdetaildic,fbdicchk,passwordview,buttonview,appDelegate,tasktosignup,btnback;
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:YES];
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(receiveTestNotification:)
                                                 name:@"TestNotification"
                                               object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(receiveagreeNotification:)
                                                 name:@"agreeNotification"
                                               object:nil];
}
- (void) receiveagreeNotification:(NSNotification *) notification
{
    [btnchk setImage:[UIImage imageNamed:@"check.png"]
            forState:UIControlStateNormal];
    [tm removeFromSuperview];
     [screenview removeFromSuperview];
}
- (void) receiveTestNotification:(NSNotification *) notification
{
    [tm removeFromSuperview];
    [screenview removeFromSuperview];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    NSLog(@"SignUpViewController --");
    NSLog(@"task to signup=%c",tasktosignup);
    
    [[NSUserDefaults standardUserDefaults] setObject:@"" forKey:@"userid"];
    [[NSUserDefaults standardUserDefaults]synchronize];
 
    CGAffineTransform transform = CGAffineTransformMakeRotation(M_PI_2);//180 degree rotation of a button
    btnback.transform = transform;
   
    
    //design
    
//    [mainscroll setFrame:CGRectMake(self.view.frame.origin.x, self.view.frame.origin.y, self.view.frame.size.width, 800)];txt
    mainscroll.contentSize = CGSizeMake(0, mainscroll.bounds.size.height * 1.5);
    UIGraphicsBeginImageContext(mainscroll.frame.size);
    [[UIImage imageNamed:@"bg.png"] drawInRect:mainscroll.bounds];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    mainscroll.backgroundColor = [UIColor colorWithPatternImage:image];
    
    UIGraphicsBeginImageContext(passwordview.frame.size);
    [[UIImage imageNamed:@"bg.png"] drawInRect:passwordview.bounds];
    UIImage *image1 = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    passwordview.backgroundColor = [UIColor colorWithPatternImage:image1];
    
    UIGraphicsBeginImageContext(buttonview.frame.size);
    [[UIImage imageNamed:@"bg.png"] drawInRect:buttonview.bounds];
    UIImage *image2 = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    buttonview.backgroundColor = [UIColor colorWithPatternImage:image2];
    
    lblagree.textColor=[UIColor colorWithRed:(102/255.0f) green:(102/255.0f) blue:(102/255.0f) alpha:1];
    lblor.textColor=[UIColor colorWithRed:(102/255.0f) green:(102/255.0f) blue:(102/255.0f) alpha:1];
    [btnchk setImage:[UIImage imageNamed:@"uncheck.png"] forState:UIControlStateNormal];
    
    placeholdercolor =[UIColor colorWithRed:(102/255.0f) green:(102/255.0f) blue:(102/255.0f) alpha:1];
    txtfirstname.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"First Name" attributes:@{NSForegroundColorAttributeName: placeholdercolor}];
    txtlastname.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"Last Name" attributes:@{NSForegroundColorAttributeName: placeholdercolor}];
     txtlang.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"Languages Spoken" attributes:@{NSForegroundColorAttributeName: placeholdercolor}];
     txtpcode.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"Postal Code" attributes:@{NSForegroundColorAttributeName: placeholdercolor}];
     txtphno.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"Enter Your Number Without Space" attributes:@{NSForegroundColorAttributeName: placeholdercolor}];
     txtemail.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"Email" attributes:@{NSForegroundColorAttributeName: placeholdercolor}];
     txtpassword.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"Password" attributes:@{NSForegroundColorAttributeName: placeholdercolor}];
     txtconfirmpass.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"Confirm Password" attributes:@{NSForegroundColorAttributeName: placeholdercolor}];
     txtsques1.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"Security Question1" attributes:@{NSForegroundColorAttributeName: placeholdercolor}];
     txtsques2.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"Security Answar1" attributes:@{NSForegroundColorAttributeName: placeholdercolor}];
    
    
    //initialization
    
    mainDic=[[NSMutableDictionary alloc]init];
    arrmain=[[NSMutableArray alloc]init];
    mutDic=[[NSMutableDictionary alloc]init];
    fbdatadic=[[NSMutableDictionary alloc]init];

    myspinner.hidden=YES;
    
    //sign up from fb or not
    if (fbdicchk==YES) {
        NSLog(@"facebook sign up");
        NSLog(@"facebook details=%@",fbdetaildic);
        txtfirstname.text=[fbdetaildic valueForKey:@"first_name"];
        txtlastname.text=[fbdetaildic valueForKey:@"last_name"];
        txtemail.text=[fbdetaildic valueForKey:@"email"];
        txtpassword.enabled=NO;
        txtconfirmpass.enabled=NO;
        txtsques1.enabled=NO;
        txtsques2.enabled=NO;
        [passwordview setHidden:YES];
//        buttonview.frame = CGRectMake( -15, 329, buttonview.frame.size.width, buttonview.frame.size.height);
        buttonview.frame = CGRectMake( 0, 329+25, buttonview.frame.size.width, buttonview.frame.size.height);
      //  txtlang.enabled=NO;
    }
    else{
        NSLog(@"normal sign up");
        txtpassword.enabled=YES;
        txtconfirmpass.enabled=YES;
        txtsques1.enabled=YES;
        txtsques1.enabled=YES;
        [passwordview setHidden:NO];
        
        passwordview.clipsToBounds = YES;
        
       
        
//        buttonview.frame = CGRectMake( -15, 484, buttonview.frame.size.width, buttonview.frame.size.height);
        buttonview.frame = CGRectMake( 0, 484+25, buttonview.frame.size.width, buttonview.frame.size.height);

    }
    
    //textfield padding
    
    UIView *paddingView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 5, 20)];
    txtfirstname.leftView = paddingView;
    txtfirstname.leftViewMode = UITextFieldViewModeAlways;
    UIView *paddingView1 = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 5, 20)];
    txtlastname.leftView = paddingView1;
    txtlastname.leftViewMode = UITextFieldViewModeAlways;
    UIView *paddingView2 = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 5, 20)];
    txtlang.leftView = paddingView2;
    txtlang.leftViewMode = UITextFieldViewModeAlways;
    UIView *paddingView3 = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 5, 20)];
    txtemail.leftView = paddingView3;
    txtemail.leftViewMode = UITextFieldViewModeAlways;
    UIView *paddingView4 = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 5, 20)];
    txtconfirmpass.leftView = paddingView4;
    txtconfirmpass.leftViewMode = UITextFieldViewModeAlways;
    UIView *paddingView5 = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 5, 20)];
    txtpassword.leftView = paddingView5;
    txtpassword.leftViewMode = UITextFieldViewModeAlways;
    UIView *paddingView6 = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 5, 20)];
    txtpcode.leftView = paddingView6;
    txtpcode.leftViewMode = UITextFieldViewModeAlways;
    UIView *paddingView7 = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 5, 20)];
    txtphno.leftView = paddingView7;
    txtphno.leftViewMode = UITextFieldViewModeAlways;
    UIView *paddingView8 = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 5, 20)];
    txtsques1.leftView = paddingView8;
    txtsques1.leftViewMode = UITextFieldViewModeAlways;
    UIView *paddingView9 = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 5, 20)];
    txtsques2.leftView = paddingView9;
    txtsques2.leftViewMode = UITextFieldViewModeAlways;
    
    //done button on numeric keyboard
 /*
    UIToolbar *toolbar = [[UIToolbar alloc] initWithFrame:CGRectMake(0.0f, 0.0f, 320.0f, 35.0f)];
    toolbar.barStyle=UIBarStyleDefault;
    //    // Create a flexible space to align buttons to the right
    UIBarButtonItem *flexibleSpace = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
    //    // Create a cancel button to dismiss the keyboard
    UIBarButtonItem *barButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(resetView)];
    //    // Add buttons to the toolbar
    [toolbar setItems:[NSArray arrayWithObjects:flexibleSpace, barButtonItem, nil]];
    // Set the toolbar as accessory view of an UITextField object
    txtpcode.inputAccessoryView = toolbar;
*/
    UIToolbar *toolbar1 = [[UIToolbar alloc] initWithFrame:CGRectMake(0.0f, 0.0f, 320.0f, 35.0f)];
    toolbar1.barStyle=UIBarStyleDefault;
    //    // Create a flexible space to align buttons to the right
    UIBarButtonItem *flexibleSpace1 = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
    //    // Create a cancel button to dismiss the keyboard
    UIBarButtonItem *barButtonItem1 = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(resetView1)];
    //    // Add buttons to the toolbar
    [toolbar1 setItems:[NSArray arrayWithObjects:flexibleSpace1, barButtonItem1, nil]];
    // Set the toolbar as accessory view of an UITextField object
    txtphno.inputAccessoryView = toolbar1;
    
    // Initialize the appDelegate property.
    appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];

}
- (IBAction)checkclk:(id)sender {
    //agree terms and conditions
    
    if([btnchk.currentImage isEqual:[UIImage imageNamed:@"check.png"]])
    {
        [btnchk setImage:[UIImage imageNamed:@"uncheck.png"]
                     forState:UIControlStateNormal];
    }
    else{
        [btnchk setImage:[UIImage imageNamed:@"check.png"]
                     forState:UIControlStateNormal];
        
        
    }

}

- (IBAction)btnchkextraclk:(id)sender
{
   /*
    screenview=[[UIView alloc]init];
    [screenview setFrame:CGRectMake(0,0, [UIScreen mainScreen].bounds.size.width,[UIScreen mainScreen].bounds.size.height)];
    screenview.backgroundColor=[[UIColor blackColor]colorWithAlphaComponent:0.65];
    [self.view addSubview:screenview];
   
    tm=[[TermsView alloc]init];
      [tm setFrame:CGRectMake(self.view.frame.origin.x+50,self.view.frame.origin.y+27, [UIScreen mainScreen].bounds.size.width-100,[UIScreen mainScreen].bounds.size.height-170)];
        tm.myDelegate=self;
        [screenview addSubview:tm];

    
    NSLog(@"testing width.....%f,%f",[UIScreen mainScreen].bounds.size.width,tm.frame.size.width);
       */
    screenview=[[UIView alloc]init];
    [screenview setFrame:CGRectMake(0,0, [UIScreen mainScreen].bounds.size.width,[UIScreen mainScreen].bounds.size.height)];
  //  screenview.backgroundColor=[[UIColor blackColor]colorWithAlphaComponent:0.65];
     screenview.backgroundColor=[UIColor whiteColor];
    [self.view addSubview:screenview];
    
  UIButton *btnWebback=[[UIButton alloc] initWithFrame:CGRectMake(0, 10, 50, 50)];
    [btnWebback setImage:[UIImage imageNamed:@"pb_back"] forState:UIControlStateNormal];
    btnWebback.backgroundColor = [UIColor clearColor];
  //  [btnWebback setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal ];
 //   btnWebback.titleLabel.font = [UIFont fontWithName:@"OpenSans-Semibold" size:14.0];
    [btnWebback addTarget:self action:@selector(webBackClick) forControlEvents:UIControlEventTouchUpInside];
    [screenview addSubview:btnWebback];
    
    UIWebView *webview=[[UIWebView alloc]initWithFrame:CGRectMake(0, 50, screenview.frame.size.width,screenview.frame.size.height)];
    NSString *url=@"http://www.esolz.co.in/lab3/taskaroo/index.php/terms/index";
    NSURL *nsurl=[NSURL URLWithString:url];
    NSURLRequest *nsrequest=[NSURLRequest requestWithURL:nsurl];
    [webview loadRequest:nsrequest];
    [screenview addSubview:webview];
}
-(void)webBackClick
{
    [screenview removeFromSuperview];
}
- (IBAction)signuppressed:(id)sender
{
    
    NSString *emailRegEx = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegEx];
  
    if(txtfirstname.text.length==0){
       
        txtfirstname.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"Please Enter your First Name" attributes:@{NSForegroundColorAttributeName: [UIColor redColor]}];
        [mainscroll setContentOffset:CGPointMake(0,txtfirstname.frame.origin.y-50) animated:YES];
      //  UIAlertView *aler=[[UIAlertView alloc] initWithTitle:@"Error" message:@"Please Enter your first name." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
      //  [aler show];
    }
    else if(txtlastname.text.length==0){
        txtlastname.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"Please Enter your last name." attributes:@{NSForegroundColorAttributeName: [UIColor redColor]}];
         [mainscroll setContentOffset:CGPointMake(0,txtlastname.frame.origin.y-50) animated:YES];
       
    }
    else if(txtpcode.text.length==0){
        txtpcode.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"Please Enter your postal code." attributes:@{NSForegroundColorAttributeName: [UIColor redColor]}];
        [mainscroll setContentOffset:CGPointMake(0,txtpcode.frame.origin.y-50) animated:YES];
    }
    else if(txtphno.text.length==0){
        txtphno.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"Please Enter your phone number" attributes:@{NSForegroundColorAttributeName: [UIColor redColor]}];
        [mainscroll setContentOffset:CGPointMake(0,txtphno.frame.origin.y-50) animated:YES];
           }
    else if(txtemail.text.length==0){
        txtemail.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"Please Enter your email address" attributes:@{NSForegroundColorAttributeName: [UIColor redColor]}];
       [mainscroll setContentOffset:CGPointMake(0,txtemail.frame.origin.y-50) animated:YES];
    }
    else if ([emailTest evaluateWithObject:txtemail.text] == NO)
    {
        txtemail.text=@"";
        txtemail.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"Not a valid email" attributes:@{NSForegroundColorAttributeName: [UIColor redColor]}];
     /*   UIAlertView *aler=[[UIAlertView alloc] initWithTitle:@"Error" message:@"Not a valid email" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [aler show];
      */
        [mainscroll setContentOffset:CGPointMake(0,txtemail.frame.origin.y-50) animated:YES];
    }

    else if(txtpassword.text.length==0 && fbdicchk==NO){
        txtpassword.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"Please Enter password" attributes:@{NSForegroundColorAttributeName: [UIColor redColor]}];
        
    }
    else if(txtpassword.text.length<6 && fbdicchk==NO){
        txtpassword.text=@"";
        txtpassword.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"Password shouldn't be less than 6 characters" attributes:@{NSForegroundColorAttributeName: [UIColor redColor]}];
      
    }
    else if ([txtpassword.text isEqualToString:txtconfirmpass.text] == NO && fbdicchk==NO)
    {
        txtconfirmpass.text=@"";
        txtconfirmpass.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"Password and confirm password should be same" attributes:@{NSForegroundColorAttributeName: [UIColor redColor]}];
       
    }
    else if(txtsques1.text.length==0 && fbdicchk==NO && fbdicchk==NO){
        txtsques1.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"Please Enter a security question" attributes:@{NSForegroundColorAttributeName: [UIColor redColor]}];
        
    }
   
    else if(txtsques2.text.length==0 && fbdicchk==NO){
        txtsques2.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"Please Enter security answar" attributes:@{NSForegroundColorAttributeName: [UIColor redColor]}];
        
    }
    else if([btnchk.currentImage isEqual:[UIImage imageNamed:@"uncheck.png"]])
    {
       
        UIAlertView *aler=[[UIAlertView alloc] initWithTitle:@"Error" message:@"Please agree Terms and Conditions." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [aler show];
        
    }
    else
    {
        [self checkLoader];
      //  myspinner.hidden=NO;
      //  [myspinner startAnimating];
        NSString *urlString;
        NSString *parameter;
        if (fbdicchk==NO) {
            
            //user sign up
            
       urlString = [NSString stringWithFormat:@"http://www.esolz.co.in/lab3/taskaroo/index.php/postersignup_ios"];
       parameter = [NSString stringWithFormat:@ "http://www.esolz.co.in/lab3/taskaroo/index.php/postersignup_ios?first_name=%@&last_name=%@&language=%@&postal_code=%@&phone_number=%@&email=%@&password=%@&security_question_1=%@&security_answer_1=%@",txtfirstname.text,txtlastname.text,txtlang.text,txtpcode.text,txtphno.text,txtemail.text,txtpassword.text,txtsques1.text,txtsques2.text];
        }
        else if (fbdicchk==YES){
            
            //sign up for fb login
            
            NSLog(@"sign up for fb login");
            urlString = [NSString stringWithFormat:@"http://www.esolz.co.in/lab3/taskaroo/index.php/postersignup_ios/facebooksignup"];
             parameter = [NSString stringWithFormat:@"http://www.esolz.co.in/lab3/taskaroo/index.php/postersignup_ios/facebooksignup?first_name=%@&last_name=%@&postal_code=%@&phone_number=%@&email=%@&facebook_id=%@&facebook_image=%@",[txtfirstname.text stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding],[txtlastname.text stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding],[txtpcode.text stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding],[txtphno.text stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding],[txtemail.text stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding],[fbdetaildic valueForKey:@"fbid"],[[fbdetaildic valueForKey:@"profileimageURL"] stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
         //   NSString *str=[urlString stringByAppendingString:parameter];
            NSLog(@"str=%@",parameter);
        }
        else
        {
            
        }
       
        NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
        
        [request setCachePolicy:NSURLRequestReloadIgnoringLocalCacheData];
        
        [request setHTTPShouldHandleCookies:NO];
        
        [request setURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@", parameter]]];
        
        [request setTimeoutInterval:30];
        
        [request setHTTPMethod:@"POST"];
        

        NSURLConnection *connection = [[NSURLConnection alloc] initWithRequest:request delegate:self];
        
        if( connection )
        {
            mutableData = [[NSMutableData alloc] init];
            NSLog(@"mutable data=%@",mutableData);
            
        }
        

    }

    
}

- (IBAction)fbloginclkj:(id)sender {
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

- (IBAction)backclk:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}


-(void) connection:(NSURLConnection *) connection didReceiveResponse:(NSURLResponse *)response
{
    [mutableData setLength:0];
}

-(void) connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    [mutableData appendData:data];
}

-(void) connection:(NSURLConnection *)connection didFailWithError:(NSError *)error
{
    
    
    // If we get any connection error we can manage it here…
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Alert" message:@"No Network Connection" delegate:self cancelButtonTitle:nil otherButtonTitles:@"OK",nil];
    [alertView show];
    
    return;
}

-(void)connectionDidFinishLoading:(NSURLConnection *)connection
{
      NSError *error;
    mainDic=[NSJSONSerialization JSONObjectWithData:mutableData options:kNilOptions error:&error];
  //   NSLog(@"values:%@",mainDic);
    //   NSLog(@"values:%@",[mainDic valueForKey:@"userid"]);
    mutDic=[mainDic valueForKey:@"response"];
    NSLog(@"values:%@",[mutDic valueForKey:@"status"]);
    
    if ([[mutDic valueForKey:@"status"] isEqualToString:@"Success"]) {
        
         [self checkLoader];
    
        NSLog(@"userid=%@",[mainDic valueForKey:@"userid"]);
        [[NSUserDefaults standardUserDefaults] setObject:[mainDic valueForKey:@"userid"] forKey:@"userid"];
        [[NSUserDefaults standardUserDefaults] setObject:txtemail.text forKey:@"email"];
         [[NSUserDefaults standardUserDefaults] setObject:[mainDic valueForKey:@"paymentstatus"] forKey:@"paymentstatus"];
     //   NSString *name=[txtfirstname.text stringByAppendingString:txtlastname.text];
        [[NSUserDefaults standardUserDefaults] setObject:[mainDic valueForKey:@"username"]  forKey:@"username"];
        [[NSUserDefaults standardUserDefaults] setObject:[mainDic valueForKey:@"smalluserimage"]  forKey:@"smalluserimage"];
     /*
        NSLog(@"userid=%@",[[[mainDic valueForKey:@"userdetails"] objectAtIndex:0] valueForKey:@"id"]);
        [[NSUserDefaults standardUserDefaults] setObject:[[[mainDic valueForKey:@"userdetails"] objectAtIndex:0] valueForKey:@"id"] forKey:@"userid"];
        [[NSUserDefaults standardUserDefaults] setObject:[[[mainDic valueForKey:@"userdetails"] objectAtIndex:0] valueForKey:@"email"] forKey:@"email"];
        [[NSUserDefaults standardUserDefaults] setObject:[[[mainDic valueForKey:@"userdetails"] objectAtIndex:0] valueForKey:@"payment_verification_status"] forKey:@"paymentstatus"];
        NSString *name=[[[[mainDic valueForKey:@"userdetails"] objectAtIndex:0] valueForKey:@"first_name"] stringByAppendingString:[[[mainDic valueForKey:@"userdetails"] objectAtIndex:0] valueForKey:@"last_name"]];
     
        [[NSUserDefaults standardUserDefaults] setObject:name forKey:@"username"];
     */
        TaskHomeViewController *obj=[self.storyboard instantiateViewControllerWithIdentifier:@"TaskHomeViewControllersid"];
   /*     if (tasktosignup==YES)
        {
            obj.taskfilled=YES;
        }
        else
        {
            obj.taskfilled=NO;
            
        }
    */
        [self.navigationController pushViewController:obj animated:YES];
    }
    else
    {
         [self checkLoader];
      //  [myspinner stopAnimating];
     //   myspinner.hidden=YES;
        UIAlertView *aler=[[UIAlertView alloc] initWithTitle:@"Error" message:@"Sign Up fail.." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [aler show];
    }
}
-(void)resetView
{
    [txtpcode resignFirstResponder];
}
-(void)resetView1
{
    [txtphno resignFirstResponder];
}
- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField
{
    
    if(textField==txtpassword || textField==txtconfirmpass ||  textField==txtemail || textField==txtphno)
    {
    [mainscroll setContentOffset:CGPointMake(0,140) animated:YES];
    }
    else if (textField==txtsques1 || textField==txtsques2)
    {
        [mainscroll setContentOffset:CGPointMake(0,240) animated:YES];
    }
    return YES;
}
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    
    [textField resignFirstResponder];
    if(textField==txtpassword || textField==txtconfirmpass || textField==txtsques1 || textField==txtemail || textField==txtphno)
    {
    [mainscroll setContentOffset:CGPointMake(0,0) animated:YES];
    }
    return YES;
}
- (void)updateView:(FBSession *)session state:(FBSessionState) state error:(NSError *)error{
    // get the app delegate, so that we can reference the session property
    
    NSLog(@"UPDATEVIEW=======================>>>>>");
    
    if (state == FBSessionStateOpen) {
        // valid account UI is shown whenever the session is open
        
        NSMutableDictionary *resultfb; //fb detail will store here
        NSString *profileimageURL;     //fb profile pic will store here
        
        
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
        
    //    NSString *urlString_img = [NSString stringWithFormat:@"https://graph.facebook.com/%@/picture?width=200&height=200&redirect=false",[resultfb objectForKey:@"id"]];
        NSString *urlString_img = [NSString stringWithFormat:@"https://graph.facebook.com/%@/picture?type=large",[resultfb objectForKey:@"id"]];
        NSURL *requestURL_img = [NSURL URLWithString:urlString_img];
        NSData *signeddataURL1_img =  [NSData dataWithContentsOfURL:requestURL_img options:NSDataReadingUncached error:&error];
        NSDictionary  *image_result = [NSJSONSerialization JSONObjectWithData:signeddataURL1_img options:kNilOptions error:&error];
        NSDictionary *picturedata = [image_result objectForKey:@"data"];
        profileimageURL = [picturedata objectForKey:@"url"];
     //   [fbdatadic setObject:[picturedata objectForKey:@"url"] forKey:@"profileimageURL"];
          [fbdatadic setObject:urlString_img forKey:@"profileimageURL"];
        
        
        
        
        
        //-----check this fb id is already exist or not?
        
        NSLog(@"fbid is %@",[resultfb valueForKey:@"id"]);
        NSString *urlString1;
        urlString1 = [NSString stringWithFormat:@"http://www.esolz.co.in/lab3/taskaroo/index.php/postersignup_ios/checkfacebookid?facebook_id=%@",
                      [resultfb valueForKey:@"id"]];
        NSLog(@"is id present=%@",urlString1);
        NSURL *requestURL1 = [NSURL URLWithString:urlString1];
        NSData *data =  [NSData dataWithContentsOfURL:requestURL1 options:NSDataReadingUncached error:&error];
        NSMutableDictionary *fbchkdic = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&error];
        //   NSLog(@"fb check--->%@",fbchkdic);
        NSDictionary  *responsedic=[fbchkdic valueForKey:@"response"];
        NSLog(@"this fb id exist:%@",[responsedic valueForKey:@"status"]);
         NSLog(@"response:%@",responsedic);
        if ([[responsedic valueForKey:@"status"] isEqualToString:@"Success"]) {
            
            //this fb user already registered so go home page
            /*
            NSLog(@"userid=%@",[fbchkdic valueForKey:@"userid"]);
            [[NSUserDefaults standardUserDefaults] setObject:[fbchkdic valueForKey:@"userid"] forKey:@"userid"];
            [[NSUserDefaults standardUserDefaults] setObject:[resultfb objectForKey:@"email"] forKey:@"email"];
             [[NSUserDefaults standardUserDefaults] setObject:[fbchkdic valueForKey:@"paymentstatus"] forKey:@"paymentstatus"];
            NSString *name=[[resultfb objectForKey:@"first_name"] stringByAppendingString:[resultfb objectForKey:@"last_name"]];
            [[NSUserDefaults standardUserDefaults] setObject:name forKey:@"username"];
            [[NSUserDefaults standardUserDefaults] setObject:[picturedata objectForKey:@"url"] forKey:@"smalluserimage"];
             */
            NSLog(@"userid=%@",[responsedic valueForKey:@"userid"]);
            [[NSUserDefaults standardUserDefaults] setObject:[responsedic valueForKey:@"userid"] forKey:@"userid"];
            [[NSUserDefaults standardUserDefaults] setObject:[resultfb objectForKey:@"email"] forKey:@"email"];
            [[NSUserDefaults standardUserDefaults] setObject:[responsedic valueForKey:@"paymentstatus"] forKey:@"paymentstatus"];
           
            [[NSUserDefaults standardUserDefaults] setObject:[responsedic valueForKey:@"username"] forKey:@"username"];
               [[NSUserDefaults standardUserDefaults] setObject:[responsedic valueForKey:@"profile_image"]  forKey:@"smalluserimage"];
            [[NSUserDefaults standardUserDefaults] setObject:[picturedata objectForKey:@"url"]  forKey:@"smalluserimage"];
            
          //  [self performSegueWithIdentifier:@"signuptohomesegue" sender:self];
            TaskHomeViewController *obj=[self.storyboard instantiateViewControllerWithIdentifier:@"TaskHomeViewControllersid"];
     /*       if (tasktosignup==YES)
            {
                obj.taskfilled=YES;
            }
            else
            {
                obj.taskfilled=NO;
                
            }
      */
            [self.navigationController pushViewController:obj animated:YES];
        }
        else{
            //this fb user not registered so go sign up page
            fbdicchk=YES;
            NSLog(@"facebook sign up");
            fbdetaildic=[fbdatadic mutableCopy];
            NSLog(@"facebook details=%@",fbdetaildic);
             [mainscroll setContentOffset:CGPointMake(0,0) animated:YES];
            txtfirstname.text=[fbdetaildic valueForKey:@"first_name"];
            txtlastname.text=[fbdetaildic valueForKey:@"last_name"];
            txtemail.text=[fbdetaildic valueForKey:@"email"];
            txtpassword.enabled=NO;
            txtconfirmpass.enabled=NO;
            txtsques1.enabled=NO;
            txtsques2.enabled=NO;
            [passwordview setHidden:YES];
//            buttonview.frame = CGRectMake( -15, 329, buttonview.frame.size.width, buttonview.frame.size.height);
            buttonview.frame = CGRectMake( 0, 329, buttonview.frame.size.width, buttonview.frame.size.height);
            
            
        }
        
        
        
        
    } else {
        
        NSLog(@"coming logout");
        
    }
}

-(void)termsclk:(UIButton *)sender
{
    
    NSLog(@"get value method called=%ld",(long)sender.tag);
    long tagId = [sender tag];
    if (tagId==1)
    {
        NSLog(@"agree check");
        
        [btnchk setImage:[UIImage imageNamed:@"check.png"]
                forState:UIControlStateNormal];
        
        
    }
    else if (tagId==2)
    {
        NSLog(@"cancel clk");
        
        [tm removeFromSuperview];
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
