//
//  NewOrExistingUserViewController.m
//  TaskAroo
//
//  Created by Prosenjit Kolay on 20/04/15.
//  Copyright (c) 2015 Prosenjit Kolay. All rights reserved.
//

#import "NewOrExistingUserViewController.h"

@interface NewOrExistingUserViewController ()<UITextFieldDelegate,NSURLConnectionDelegate>

@end

@implementation NewOrExistingUserViewController
@synthesize mainscroll,btnexistinguser,btnexistinguserextra,btnlogin,btnnewuser,btnnewuserextra,signinview,signupview,txtemail,txtpassword,txtconfirmpass,txtemail1,txtfirstname,txtlang,txtlastname,txtpass,txtpcode,txtph,txtsecurityans,txtsecurityques,btnsignup,myspinner;
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    mainscroll.contentSize=CGSizeMake(0, 1200);
    
    UIGraphicsBeginImageContext(mainscroll.frame.size);
    [[UIImage imageNamed:@"bg.png"] drawInRect:mainscroll.bounds];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    mainscroll.backgroundColor = [UIColor colorWithPatternImage:image];
    
    //radio button new or existing
    
    [btnnewuser setBackgroundImage:[UIImage imageNamed:@"rediobutton1.png"] forState:UIControlStateNormal];
    
    [btnnewuser setBackgroundImage:[UIImage imageNamed:@"rediobutton2.png"] forState:UIControlStateSelected];
    
    [btnnewuser setBackgroundImage:[UIImage imageNamed:@"rediobutton2.png"] forState:UIControlStateHighlighted];
    
    [btnexistinguser setBackgroundImage:[UIImage imageNamed:@"rediobutton1.png"] forState:UIControlStateNormal];
    
    [btnexistinguser setBackgroundImage:[UIImage imageNamed:@"rediobutton2.png"] forState:UIControlStateSelected];
    
    [btnexistinguser setBackgroundImage:[UIImage imageNamed:@"rediobutton2.png"] forState:UIControlStateHighlighted];
    
    [btnexistinguserextra setBackgroundImage:[UIImage imageNamed:@"bg3.png"] forState:UIControlStateNormal];
    
    [btnexistinguserextra setBackgroundImage:[UIImage imageNamed:@"bg1.png"] forState:UIControlStateSelected];
    
    [btnexistinguserextra setBackgroundImage:[UIImage imageNamed:@"bg1.png"] forState:UIControlStateHighlighted];
    
    btnexistinguser.selected=YES;
    btnexistinguserextra.selected=YES;
    signupview.hidden=YES;
    signinview.hidden=NO;
     mainscroll.contentSize=CGSizeMake(0, 500);
     btnlogin.backgroundColor=[UIColor colorWithRed:(235.0/255) green:(66.0/255) blue:(32.0/255) alpha:1.0];
     btnsignup.backgroundColor=[UIColor colorWithRed:(235.0/255) green:(66.0/255) blue:(32.0/255) alpha:1.0];
    
    //text padding
    
    txtemail.leftView = [self addPaddingView];
    txtemail.leftViewMode = UITextFieldViewModeAlways;
    txtpassword.leftView = [self addPaddingView];
    txtpassword.leftViewMode = UITextFieldViewModeAlways;
    txtemail1.leftView = [self addPaddingView];
    txtemail1.leftViewMode = UITextFieldViewModeAlways;
    txtpass.leftView = [self addPaddingView];
    txtpass.leftViewMode = UITextFieldViewModeAlways;
    txtfirstname.leftView = [self addPaddingView];
    txtfirstname.leftViewMode = UITextFieldViewModeAlways;
    txtlastname.leftView = [self addPaddingView];
    txtlastname.leftViewMode = UITextFieldViewModeAlways;
    txtlang.leftView = [self addPaddingView];
    txtlang.leftViewMode = UITextFieldViewModeAlways;
    txtpcode.leftView = [self addPaddingView];
    txtpcode.leftViewMode = UITextFieldViewModeAlways;
    txtph.leftView = [self addPaddingView];
    txtph.leftViewMode = UITextFieldViewModeAlways;
    txtsecurityans.leftView = [self addPaddingView];
    txtsecurityans.leftViewMode = UITextFieldViewModeAlways;
    txtsecurityques.leftView = [self addPaddingView];
    txtsecurityques.leftViewMode = UITextFieldViewModeAlways;
    txtconfirmpass.leftView = [self addPaddingView];
    txtconfirmpass.leftViewMode = UITextFieldViewModeAlways;
    
    //placeholder color
    placeholdercolor =[UIColor colorWithRed:(102/255.0f) green:(102/255.0f) blue:(102/255.0f) alpha:1];
    txtemail.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"Email" attributes:@{NSForegroundColorAttributeName: placeholdercolor}];
    txtpassword.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"Password" attributes:@{NSForegroundColorAttributeName: placeholdercolor}];
    
    //initialization
    
    mainDic=[[NSMutableDictionary alloc]init];
    arrmain=[[NSMutableArray alloc]init];
    mutDic=[[NSMutableDictionary alloc]init];
    signin=NO;
    myspinner.hidden=YES;
    
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
    txtph.inputAccessoryView = toolbar1;

}
-(void)resetView
{
    [txtpcode resignFirstResponder];
}
-(void)resetView1
{
    [txtph resignFirstResponder];
}
-(void)existinguser
{
    
    if (btnexistinguser.selected==YES)
    {
        
        
    }
    else
    {
        [UIView beginAnimations:@"ShowHideView" context:NULL];
        [UIView setAnimationDuration:0.3];
        //existing user button selected
        mainscroll.contentSize=CGSizeMake(0, 500);

        signinview.hidden=NO;
        signupview.hidden=YES;
        btnexistinguser.selected=YES;
        btnexistinguserextra.selected=YES;
        [btnexistinguserextra setBackgroundImage:[UIImage imageNamed:@"bg3.png"] forState:UIControlStateNormal];
        
        [btnexistinguserextra setBackgroundImage:[UIImage imageNamed:@"bg1.png"] forState:UIControlStateSelected];
        
        [btnexistinguserextra setBackgroundImage:[UIImage imageNamed:@"bg1.png"] forState:UIControlStateHighlighted];
        
        [btnexistinguser setBackgroundImage:[UIImage imageNamed:@"rediobutton1.png"] forState:UIControlStateNormal];
        
        [btnexistinguser setBackgroundImage:[UIImage imageNamed:@"rediobutton2.png"] forState:UIControlStateSelected];
        
        [btnexistinguser setBackgroundImage:[UIImage imageNamed:@"rediobutton2.png"] forState:UIControlStateHighlighted];
        
        
        //new user button reset
        btnnewuser.selected=NO;
        btnnewuserextra.selected=NO;
        [btnnewuserextra setBackgroundImage:[UIImage imageNamed:@"bg3.png"] forState:UIControlStateNormal];
        
        [btnnewuserextra setBackgroundImage:[UIImage imageNamed:@"bg1.png"] forState:UIControlStateSelected];
        
        [btnnewuserextra setBackgroundImage:[UIImage imageNamed:@"bg1.png"] forState:UIControlStateHighlighted];
        
        [btnnewuser setBackgroundImage:[UIImage imageNamed:@"rediobutton1.png"] forState:UIControlStateNormal];
        
        [btnnewuser setBackgroundImage:[UIImage imageNamed:@"rediobutton2.png"] forState:UIControlStateSelected];
        
        [btnnewuser setBackgroundImage:[UIImage imageNamed:@"rediobutton2.png"] forState:UIControlStateHighlighted];
        [UIView commitAnimations];
    }

}
-(void)newuser
{
    
    if (btnnewuser.selected==YES)
    {
        
        
    }
    else
    {
        [UIView beginAnimations:@"ShowHideView" context:NULL];
        [UIView setAnimationDuration:0.3];
        //existing user button selected
        signinview.hidden=YES;
        signupview.hidden=NO;
        btnnewuser.selected=YES;
        btnnewuserextra.selected=YES;
        mainscroll.contentSize=CGSizeMake(0, 1200);

        signupview.frame=CGRectMake(signinview.frame.origin.x, signinview.frame.origin.y,signinview.frame.size.width, 550);
        [btnnewuserextra setBackgroundImage:[UIImage imageNamed:@"bg3.png"] forState:UIControlStateNormal];
        
        [btnnewuserextra setBackgroundImage:[UIImage imageNamed:@"bg1.png"] forState:UIControlStateSelected];
        
        [btnnewuserextra setBackgroundImage:[UIImage imageNamed:@"bg1.png"] forState:UIControlStateHighlighted];
        
        [btnnewuser setBackgroundImage:[UIImage imageNamed:@"rediobutton1.png"] forState:UIControlStateNormal];
        
        [btnnewuser setBackgroundImage:[UIImage imageNamed:@"rediobutton2.png"] forState:UIControlStateSelected];
        
        [btnnewuser setBackgroundImage:[UIImage imageNamed:@"rediobutton2.png"] forState:UIControlStateHighlighted];
        
        
        //new user button reset
        btnexistinguser.selected=NO;
        btnexistinguserextra.selected=NO;
        [btnexistinguserextra setBackgroundImage:[UIImage imageNamed:@"bg3.png"] forState:UIControlStateNormal];
        
        [btnexistinguserextra setBackgroundImage:[UIImage imageNamed:@"bg1.png"] forState:UIControlStateSelected];
        
        [btnexistinguserextra setBackgroundImage:[UIImage imageNamed:@"bg1.png"] forState:UIControlStateHighlighted];
        
        [btnexistinguser setBackgroundImage:[UIImage imageNamed:@"rediobutton1.png"] forState:UIControlStateNormal];
        
        [btnexistinguser setBackgroundImage:[UIImage imageNamed:@"rediobutton2.png"] forState:UIControlStateSelected];
        
        [btnexistinguser setBackgroundImage:[UIImage imageNamed:@"rediobutton2.png"] forState:UIControlStateHighlighted];
        [UIView commitAnimations];
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

- (IBAction)newuserbtnextraclk:(id)sender
{
    [self newuser];
}

- (IBAction)existinguserbtnextraclk:(id)sender
{
    [self existinguser];
}

- (IBAction)exsistinguserclk:(id)sender
{
    [self existinguser];
}

- (IBAction)newuserbtnclk:(id)sender {
     [self newuser];
}
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    if( textField==txtsecurityans || textField==txtsecurityques || textField==txtph|| textField==txtpcode|| textField==txtpass|| textField==txtlastname|| textField==txtlang|| textField==txtfirstname|| textField==txtemail1|| textField==txtconfirmpass)
    {
        [mainscroll setContentOffset:CGPointMake(0,signinview.frame.origin.y+50) animated:YES];
    }
    else if(textField==txtpassword )
    {
        [mainscroll setContentOffset:CGPointMake(0,signinview.frame.origin.y-100) animated:YES];
    }
  
    [textField resignFirstResponder];
    return YES;
}
- (IBAction)signinclk:(id)sender
{
    //email validation
    NSString *emailRegEx = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegEx];
    
    if ([emailTest evaluateWithObject:txtemail.text] == NO)
    {
        txtemail.text=@"";
        txtemail.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"Not a valid email" attributes:@{NSForegroundColorAttributeName: placeholdercolor}];
        
    }
    else if(txtpassword.text.length==0){
        txtpassword.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"Please enter password" attributes:@{NSForegroundColorAttributeName: placeholdercolor}];
        
    }
    else
    {
        [self loaddata];
        
    }
}
-(void)loaddata
{
    //  NSError *error;
    NSString *str=[NSString stringWithFormat:@"http://www.esolz.co.in/lab3/taskaroo/index.php/login_ios?username=%@&password=%@",txtemail.text,txtpassword.text];
    NSURL *url=[NSURL URLWithString:str];
    signin=YES;
    NSURLRequest *request=[NSURLRequest requestWithURL:url];
    NSURLConnection *connection=[NSURLConnection connectionWithRequest:request delegate:self];
    connection=nil;
    
}
- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    if (signin==YES) {
        DATA=[data mutableCopy];
    }
    else if (signin==NO)
    {
         [mutableData appendData:data];
    }
    
}
-(void) connection:(NSURLConnection *) connection didReceiveResponse:(NSURLResponse *)response
{
    if (signin==NO)
    {
    [mutableData setLength:0];
    }
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
    if (signin==YES)
    {
    NSError *error;
    mainDic=[NSJSONSerialization JSONObjectWithData:DATA options:kNilOptions error:&error];
    mutDic=[mainDic valueForKey:@"response"];
    NSLog(@"values:%@",[mutDic valueForKey:@"status"]);
    
    if ([[mutDic valueForKey:@"status"] isEqualToString:@"Success"]) {
        
        //   UIAlertView *aler=[[UIAlertView alloc] initWithTitle:@"Success" message:@"Login success.." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        //    [aler show];
        NSLog(@"userid=%@",[mainDic valueForKey:@"userid"]);
        [[NSUserDefaults standardUserDefaults] setObject:[mainDic valueForKey:@"userid"] forKey:@"userid"];
        [[NSUserDefaults standardUserDefaults] setObject:txtemail.text forKey:@"email"];
        [[NSUserDefaults standardUserDefaults] setObject:[mainDic valueForKey:@"paymentstatus"] forKey:@"paymentstatus"];
        [[NSUserDefaults standardUserDefaults] setObject:[mainDic valueForKey:@"username"] forKey:@"username"];
        [[NSUserDefaults standardUserDefaults] setObject:[mainDic valueForKey:@"smalluserimage"] forKey:@"smalluserimage"];
        txtpassword.text=@"";
        txtemail.text=@"";
        
        MyHomeViewController *obj=[self.storyboard instantiateViewControllerWithIdentifier:@"MyHomeViewControllersid"];
        obj.taskfilled=YES;
    /*    if (tasktosignin==YES)
        {
            obj.taskfilled=YES;
        }
        else
        {
            obj.taskfilled=NO;
            
        } */
        [self.navigationController pushViewController:obj animated:YES];
        
    }
    else
    {
        UIAlertView *aler=[[UIAlertView alloc] initWithTitle:@"Error" message:@"Login fail.." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [aler show];
    }
    }
    else if (signin==NO)
    {
        NSError *error;
        mainDic=[NSJSONSerialization JSONObjectWithData:mutableData options:kNilOptions error:&error];
        NSLog(@"maindic=%@",mainDic);
        mutDic=[mainDic valueForKey:@"response"];
        NSLog(@"values:%@",[mutDic valueForKey:@"status"]);
        
        if ([[mutDic valueForKey:@"status"] isEqualToString:@"Success"]) {
            [self checkLoader];
        //    [myspinner stopAnimating];
        //    myspinner.hidden=YES;
            
            NSLog(@"userid=%@",[mainDic valueForKey:@"userid"]);
            [[NSUserDefaults standardUserDefaults] setObject:[mainDic valueForKey:@"userid"] forKey:@"userid"];
            [[NSUserDefaults standardUserDefaults] setObject:txtemail1.text forKey:@"email"];
            [[NSUserDefaults standardUserDefaults] setObject:[mainDic valueForKey:@"paymentstatus"] forKey:@"paymentstatus"];
            [[NSUserDefaults standardUserDefaults] setObject:[mainDic valueForKey:@"username"]  forKey:@"username"];
            [[NSUserDefaults standardUserDefaults] setObject:[mainDic valueForKey:@"smalluserimage"]  forKey:@"smalluserimage"];
            MyHomeViewController *obj=[self.storyboard instantiateViewControllerWithIdentifier:@"MyHomeViewControllersid"];
              obj.taskfilled=YES;
      /*      if (tasktosignup==YES)
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
         //   [myspinner stopAnimating];
         //   myspinner.hidden=YES;
            UIAlertView *aler=[[UIAlertView alloc] initWithTitle:@"Error" message:@"Sign Up fail.." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
            [aler show];
        }

    }
    
}

- (IBAction)signupclk:(id)sender
{
    NSString *emailRegEx = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegEx];
    
    if(txtfirstname.text.length==0){
        
        txtfirstname.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"Please Enter Your First Name" attributes:@{NSForegroundColorAttributeName: [UIColor redColor]}];
        [mainscroll setContentOffset:CGPointMake(0,txtfirstname.frame.origin.y-50) animated:YES];
        //  UIAlertView *aler=[[UIAlertView alloc] initWithTitle:@"Error" message:@"Please Enter your first name." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        //  [aler show];
    }
    else if(txtlastname.text.length==0){
        txtlastname.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"Please Enter Your last name." attributes:@{NSForegroundColorAttributeName: [UIColor redColor]}];
        [mainscroll setContentOffset:CGPointMake(0,txtlastname.frame.origin.y-50) animated:YES];
        
    }
    else if(txtpcode.text.length==0){
        txtpcode.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"Please Enter Your postal code." attributes:@{NSForegroundColorAttributeName: [UIColor redColor]}];
        [mainscroll setContentOffset:CGPointMake(0,txtpcode.frame.origin.y-50) animated:YES];
    }
    else if(txtph.text.length==0){
        txtph.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"Please Enter your phone number" attributes:@{NSForegroundColorAttributeName: [UIColor redColor]}];
        [mainscroll setContentOffset:CGPointMake(0,txtph.frame.origin.y-50) animated:YES];
    }
    else if(txtemail1.text.length==0){
        txtemail1.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"Please Enter your email address" attributes:@{NSForegroundColorAttributeName: [UIColor redColor]}];
        [mainscroll setContentOffset:CGPointMake(0,txtemail1.frame.origin.y-50) animated:YES];
    }
    else if ([emailTest evaluateWithObject:txtemail1.text] == NO)
    {
        txtemail1.text=@"";
        txtemail1.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"Not a valid email" attributes:@{NSForegroundColorAttributeName: [UIColor redColor]}];
        /*   UIAlertView *aler=[[UIAlertView alloc] initWithTitle:@"Error" message:@"Not a valid email" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
         [aler show];
         */
        [mainscroll setContentOffset:CGPointMake(0,txtemail1.frame.origin.y-50) animated:YES];
    }
    
    else if(txtpass.text.length==0){
        txtpass.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"Please Enter password" attributes:@{NSForegroundColorAttributeName: [UIColor redColor]}];
        
    }
    else if(txtpass.text.length<6){
        txtpass.text=@"";
        txtpass.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"Password shouldn't be less than 6 characters" attributes:@{NSForegroundColorAttributeName: [UIColor redColor]}];
        
    }
    else if ([txtpass.text isEqualToString:txtconfirmpass.text] == NO)
    {
        txtconfirmpass.text=@"";
        txtconfirmpass.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"Password and confirm password should be same" attributes:@{NSForegroundColorAttributeName: [UIColor redColor]}];
        
    }
    else if(txtsecurityques.text.length==0){
        txtsecurityques.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"Please Enter a security question" attributes:@{NSForegroundColorAttributeName: [UIColor redColor]}];
        
    }
    
    else if(txtsecurityans.text.length==0){
        txtsecurityans.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"Please Enter security answar" attributes:@{NSForegroundColorAttributeName: [UIColor redColor]}];
        
    }
    else
    {
     //   myspinner.hidden=NO;
     //  [myspinner startAnimating];
        [self checkLoader];
        NSString *urlString;
        NSString *parameter;
        
            //user sign up
            
            urlString = [NSString stringWithFormat:@"http://www.esolz.co.in/lab3/taskaroo/index.php/postersignup_ios"];
            parameter = [NSString stringWithFormat:@ "&first_name=%@&last_name=%@&language=%@&postal_code=%@&phone_number=%@&email=%@&password=%@&security_question_1=%@&security_answer_1=%@",txtfirstname.text,txtlastname.text,txtlang.text,txtpcode.text,txtph.text,txtemail1.text,txtpass.text,txtsecurityques.text,txtsecurityans.text];
     
      
        
        NSData *parameterData = [parameter dataUsingEncoding:NSASCIIStringEncoding allowLossyConversion:YES];
        
        NSURL *url = [NSURL URLWithString:urlString];
        NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
        [theRequest addValue: @"application/x-www-form-urlencoded; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
        [theRequest setHTTPMethod:@"POST"];
        [theRequest setHTTPBody:parameterData];
        NSURLConnection *connection = [[NSURLConnection alloc] initWithRequest:theRequest delegate:self];
        
        if( connection )
        {
            mutableData = [[NSMutableData alloc] init];
            signin=NO;
            
        }
        
        
    }

}
- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField
{
    if(textField==txtpassword)
    {
        [mainscroll setContentOffset:CGPointMake(0,signinview.frame.origin.y-50) animated:YES];
    }
    if(textField==txtpcode)
    {
        [mainscroll setContentOffset:CGPointMake(0,signupview.frame.origin.y+100) animated:YES];
    }
    if(textField==txtpass)
    {
        [mainscroll setContentOffset:CGPointMake(0,mainscroll.frame.origin.y+70) animated:YES];
    }
    if(textField==txtpcode)
    {
        [mainscroll setContentOffset:CGPointMake(0,signupview.frame.origin.y+100) animated:YES];
    }
    if(textField==txtlastname)
    {
        [mainscroll setContentOffset:CGPointMake(0,signupview.frame.origin.y+10) animated:YES];
    }
    if(textField==txtlang)
    {
        [mainscroll setContentOffset:CGPointMake(0,signupview.frame.origin.y+20) animated:YES];
    }
    if(textField==txtph)
    {
        [mainscroll setContentOffset:CGPointMake(0,signupview.frame.origin.y+100) animated:YES];
    }
    if(textField==txtemail1)
    {
        [mainscroll setContentOffset:CGPointMake(0,signupview.frame.origin.y+100) animated:YES];
    }
    if(textField==txtpass)
    {
        [mainscroll setContentOffset:CGPointMake(0,signupview.frame.origin.y+140) animated:YES];
    }
    if(textField==txtconfirmpass)
    {
        [mainscroll setContentOffset:CGPointMake(0,signupview.frame.origin.y+180) animated:YES];
    }
    if(textField==txtsecurityques)
    {
        [mainscroll setContentOffset:CGPointMake(0,signupview.frame.origin.y+200) animated:YES];
    }
    if(textField==txtsecurityans)
    {
        [mainscroll setContentOffset:CGPointMake(0,signupview.frame.origin.y+250) animated:YES];
    }
    return YES;
}
- (IBAction)logoclk:(id)sender
{
    ViewController *obj=[self.storyboard instantiateViewControllerWithIdentifier:@"ViewControllersid"];
    [self.navigationController pushViewController:obj animated:YES];
}

- (IBAction)headsigninclk:(id)sender
{
    SignInViewController *obj=[self.storyboard instantiateViewControllerWithIdentifier:@"SignInViewControllersid"];
    [self.navigationController pushViewController:obj animated:YES];
}

- (IBAction)headsignupclk:(id)sender
{
    SignUpViewController *obj=[self.storyboard instantiateViewControllerWithIdentifier:@"SignUpViewControllersid"];
    [self.navigationController pushViewController:obj animated:YES];
}
@end
