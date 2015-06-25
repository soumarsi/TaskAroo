//
//  MyAccountViewController.m
//  TaskAroo
//
//  Created by Rahul Singha Roy on 20/05/15.
//  Copyright (c) 2015 Prosenjit Kolay. All rights reserved.
//

#import "MyAccountViewController.h"

@interface MyAccountViewController ()<UIScrollViewDelegate,UITextFieldDelegate,UITextViewDelegate,headerDelegate,leftDelegate,UIPickerViewDataSource,UIPickerViewDelegate,UIActionSheetDelegate>

@end

@implementation MyAccountViewController
@synthesize mainview,head,firstname,language_spoken,lastname,password,phone_number,postral_code,about_me,address,city,confirmpassword,country,mobile_number,email,Main_acroll,btnprovince,profileimg,lblabtme,txtprovince;
- (void)viewDidLoad {
    [super viewDidLoad];
    
   
   [Main_acroll setContentSize:CGSizeMake([UIScreen mainScreen].bounds.size.width, 1170)];
    
    if ([UIScreen mainScreen].bounds.size.width>320)
    {
        
        [Main_acroll setFrame:CGRectMake(29,60,[UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height)];

    }
    else
    {
       
        [Main_acroll setFrame:CGRectMake(0,60,[UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height)];

    }
    [mainview addSubview:Main_acroll];
    HeaderView *hv = [[HeaderView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 60)];
    hv.userInteractionEnabled = YES;
    hv.myDelegate = self;
      hv.btnlogo1.hidden=YES;
    
   // hv.btnlogo1.frame=CGRectMake(self.view.frame.size.width- hv.btnlogo1.frame.size.width-30,  hv.btnlogo1.frame.origin.y-10,  hv.btnlogo1.frame.size.width,  hv.btnlogo1.frame.size.height);
    hv.btnleftmenu.hidden=NO;
    hv.btnleftmenuextra.hidden=NO;
    hv.btnsignnout.hidden=YES;
    hv.lblpagename.text=@"MY ACCOUNT";
     hv.lblpagename.center=CGPointMake(self.view.center.x, hv.lblpagename.center.y);
 //   hv.lblpagename.frame=CGRectMake(hv.lblpagename.frame.origin.x-15,  hv.lblpagename.frame.origin.y,  hv.lblpagename.frame.size.width,  hv.lblpagename.frame.size.height);
    [mainview addSubview:hv];
    
    FooterView *fv = [[FooterView alloc]initWithFrame:CGRectMake(0,self.view.frame.size.height-60, self.view.frame.size.width,60)];
    [fv.btnmenu1 addTarget:self action:@selector(taskbuttonTapped:) forControlEvents:UIControlEventTouchUpInside];
 //   [fv.btnmenu2 addTarget:self action:@selector(MyAccountbuttonTapped:) forControlEvents:UIControlEventTouchUpInside];
    [fv.btnmenu3 addTarget:self action:@selector(MessagebuttonTapped:) forControlEvents:UIControlEventTouchUpInside];
    [fv.btnmenu4 addTarget:self action:@selector(ContactbuttonTapped:) forControlEvents:UIControlEventTouchUpInside];
    [mainview addSubview:fv];
    
    NSUserDefaults *prefs = [NSUserDefaults standardUserDefaults];
    userid=[prefs valueForKey:@"userid"];
    
    // Creating Left Padding for Textfield
    
    UIView *paddingView = [[UIView alloc] initWithFrame:CGRectMake(0, 0,18, 20)];
    
    UIView *paddingView1 = [[UIView alloc] initWithFrame:CGRectMake(0, 0,18, 20)];

    
    
    firstname.leftView = paddingView;
    firstname.leftViewMode = UITextFieldViewModeAlways;
    
    lastname.leftView = paddingView1;
    lastname.leftViewMode = UITextFieldViewModeAlways;
    
    UIView *paddingView2 = [[UIView alloc] initWithFrame:CGRectMake(0, 0,18, 20)];
    language_spoken.leftView = paddingView2;
    language_spoken.leftViewMode = UITextFieldViewModeAlways;
    
    UIView *paddingView3 = [[UIView alloc] initWithFrame:CGRectMake(0, 0,18, 20)];
    address.leftView = paddingView3;
    address.leftViewMode = UITextFieldViewModeAlways;
    
    UIView *paddingView4 = [[UIView alloc] initWithFrame:CGRectMake(0, 0,18, 20)];
    city.leftView = paddingView4;
    city.leftViewMode = UITextFieldViewModeAlways;
    
    UIView *paddingView5 = [[UIView alloc] initWithFrame:CGRectMake(0, 0,18, 20)];
    password.leftView = paddingView5;
    password.leftViewMode = UITextFieldViewModeAlways;
    
    UIView *paddingView6 = [[UIView alloc] initWithFrame:CGRectMake(0, 0,18, 20)];
    postral_code.leftView = paddingView6;
    postral_code.leftViewMode = UITextFieldViewModeAlways;
    
    UIView *paddingView7 = [[UIView alloc] initWithFrame:CGRectMake(0, 0,18, 20)];
    country.leftView = paddingView7;
    country.leftViewMode = UITextFieldViewModeAlways;
    
    UIView *paddingView8 = [[UIView alloc] initWithFrame:CGRectMake(0, 0,18, 20)];
    phone_number.leftView = paddingView8;
    phone_number.leftViewMode = UITextFieldViewModeAlways;
    
    UIView *paddingView9 = [[UIView alloc] initWithFrame:CGRectMake(0, 0,18, 20)];
    confirmpassword.leftView = paddingView9;
    confirmpassword.leftViewMode = UITextFieldViewModeAlways;
    
    UIView *paddingView10 = [[UIView alloc] initWithFrame:CGRectMake(0, 0,18, 20)];
    email.leftView = paddingView10;
    email.leftViewMode = UITextFieldViewModeAlways;
    
    UIView *paddingView11 = [[UIView alloc] initWithFrame:CGRectMake(0, 0,18, 20)];
    mobile_number.leftView = paddingView11;
    mobile_number.leftViewMode = UITextFieldViewModeAlways;
    
    UIView *paddingView12 = [[UIView alloc] initWithFrame:CGRectMake(0, 0,18, 20)];
    txtprovince.leftView = paddingView12;
    txtprovince.leftViewMode = UITextFieldViewModeAlways;
    
    urlobj=[[UrlconnectionObject alloc]init];
    [self accountdetailUrl];
    
    ArrProvince=[[NSMutableArray alloc]initWithObjects:@"Alberta",@"British Columbia",@"Manitoba",@"New Brunswick", @"Newfoundland and Labrador",@"Northwest Territories",@"Nova Scotia",@"Nunavut",@"Ontario",@"Prince Edward Island",@"Quebec",@"Saskatchewan",@"Yukon", nil];
    
    UIToolbar *toolbar1 = [[UIToolbar alloc] initWithFrame:CGRectMake(0.0f, 0.0f, 320.0f, 35.0f)];
    toolbar1.barStyle=UIBarStyleDefault;
    //    // Create a flexible space to align buttons to the right
    UIBarButtonItem *flexibleSpace1 = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
    //    // Create a cancel button to dismiss the keyboard
    UIBarButtonItem *barButtonItem1 = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(resetView1)];
    //    // Add buttons to the toolbar
    [toolbar1 setItems:[NSArray arrayWithObjects:flexibleSpace1, barButtonItem1, nil]];
    // Set the toolbar as accessory view of an UITextField object
    phone_number.inputAccessoryView = toolbar1;
    
    UIToolbar *toolbar = [[UIToolbar alloc] initWithFrame:CGRectMake(0.0f, 0.0f, 320.0f, 35.0f)];
    toolbar1.barStyle=UIBarStyleDefault;
    //    // Create a flexible space to align buttons to the right
    UIBarButtonItem *flexibleSpace = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
    //    // Create a cancel button to dismiss the keyboard
    UIBarButtonItem *barButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(resetView)];
    //    // Add buttons to the toolbar
    [toolbar setItems:[NSArray arrayWithObjects:flexibleSpace, barButtonItem, nil]];
    // Set the toolbar as accessory view of an UITextField object
    mobile_number.inputAccessoryView = toolbar;
}
-(void)resetView
{
    [mobile_number resignFirstResponder];
}
-(void)resetView1
{
    [phone_number resignFirstResponder];
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
            [firstname resignFirstResponder];
            [lastname resignFirstResponder];
            [language_spoken resignFirstResponder];
            [postral_code resignFirstResponder];
            [phone_number resignFirstResponder];
            [country resignFirstResponder];
            [city resignFirstResponder];
            [password resignFirstResponder];
            [confirmpassword resignFirstResponder];
            [address resignFirstResponder];
            [about_me resignFirstResponder];
            [mobile_number resignFirstResponder];
            [email resignFirstResponder];
            
            [leftView removeFromSuperview];
            leftView = [LeftMenuView leftmenu];
            [leftView leftmenumethod];
            [leftView.btnprofImg addTarget:self action:@selector(ProfilebuttonTapped:) forControlEvents:UIControlEventTouchUpInside];
        //    [leftView tapCheck:3];
            leftView.frame = CGRectMake(-160, 0,[[UIScreen mainScreen] bounds].size.width/2+60, self.view.frame.size.height);
            leftView.leftDelegate=self;
            [self.view addSubview:leftView];
            
            [UIView animateWithDuration:0.5 animations:^{
                
                
                mainview.center = CGPointMake([[UIScreen mainScreen] bounds].size.width+60,mainview.center.y);
                
                leftView.frame = CGRectMake(0, 0,[[UIScreen mainScreen] bounds].size.width/2+60, self.view.frame.size.height);
                
                
            } completion:^(BOOL finished) {
                
                
            }];
            
            
            
            // [UIView commitAnimations];
        }
        else
        {

            
            [UIView animateWithDuration:0.5 animations:^{
                
                
                mainview.center = CGPointMake(self.view.center.x,mainview.center.y);
                
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
-(void)accountdetailUrl
{
    NSString *str=[NSString stringWithFormat:@"%@myaccount_details_ios/index?id=%@",URL_LINK,[userid stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
    NSLog(@"str=%@",str);
    BOOL net=[urlobj connectedToNetwork];
    if (net==YES) {
        
   
    [urlobj global:str typerequest:@"array" withblock:^(id result, NSError *error,BOOL completed) {
        
        //     NSLog(@"event result----- %@", result);
        
        AccDic = [[NSMutableDictionary alloc]init];
        AccDic=[[result valueForKey:@"User"] mutableCopy];
    //    NSLog(@"account details=%@",AccDic);
  
        city.text=[AccDic valueForKey:@"city"];
        country.text=[AccDic valueForKey:@"country"];
        address.text=[AccDic valueForKey:@"address"];
        email.text=[AccDic valueForKey:@"email"];
        firstname.text=[AccDic valueForKey:@"first_name"];
        lastname.text=[AccDic valueForKey:@"last_name"];
        mobile_number.text=[AccDic valueForKey:@"mobile_number"];
        phone_number.text=[AccDic valueForKey:@"phone_number"];
        postral_code.text=[AccDic valueForKey:@"postal_code"];
        txtprovince.text=[AccDic valueForKey:@"province"];
        regtype=[AccDic valueForKey:@"registration_type"];
        usertype=[AccDic valueForKey:@"user_type"];
    //    province=[AccDic valueForKey:@"province"];
        NSString *img=[AccDic valueForKey:@"profile_image"];
        [profileimg sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@",img]] placeholderImage:[UIImage imageNamed:@"no image available"] options:/* DISABLES CODE */ (0) == 0?SDWebImageRefreshCached : 0];
        
    }];
    }
    else{
        UIAlertView *aler=[[UIAlertView alloc] initWithTitle:@"Alert" message:@"No Network Connection." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [aler show];
    }
}
- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField
{
    
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
    return YES;
}
- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    [textField becomeFirstResponder];
}
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    [Main_acroll setContentOffset:CGPointMake(0,0) animated:YES];
    return YES;
}
- (BOOL)textViewShouldBeginEditing:(UITextView *)textView
{
    
    lblabtme.hidden=YES;
    [Main_acroll setContentOffset:CGPointMake(0,660) animated:YES];
    return YES;
}
- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text {
    
    lblabtme.hidden=YES;
    
    if([text isEqualToString:@"\n"]) {
        [textView resignFirstResponder];
      //  [Main_acroll setContentOffset:CGPointMake(0,0) animated:YES];
        if (textView.text.length==0) {
            lblabtme.hidden=NO;
        }
        return NO;
    }
    
    
    return YES;
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

- (IBAction)ProvinceClk:(id)sender
{
    pickView=[[UIView alloc]initWithFrame:CGRectMake(self.view.frame.origin.x, self.view.frame.origin.y, self.view.frame.size.width,self.view.frame.size.height)];
    //    viewrepeattask=[[UIView alloc]initWithFrame:CGRectMake(self.view.frame.origin.x, self.view.frame.size.height-200, self.view.frame.size.width,200)];
    [pickView setBackgroundColor:[[UIColor blackColor]colorWithAlphaComponent:0.8]];
    [self.view addSubview:pickView];
    
    provincePicker=[[UIPickerView alloc]initWithFrame:CGRectMake(self.view.frame.size.width/2-125, 180, 250,150)];
    //     repeattaskpicker=[[UIPickerView alloc]initWithFrame:CGRectMake(self.view.frame.origin.x,50, self.view.frame.size.width,150)];
    [provincePicker setBackgroundColor:[UIColor whiteColor]];
    //    [repeattaskpicker setBackgroundColor:[UIColor colorWithRed:35 green:154 blue:242 alpha:1.0]];
    provincePicker.delegate=self;
    provincePicker.dataSource=self;
    [pickView addSubview:provincePicker];
    
    btnsave=[[UIButton alloc] initWithFrame:CGRectMake(provincePicker.frame.origin.x+provincePicker.frame.size.width-50, provincePicker.frame.origin.y-50, 50, 50)];
    //      btnrepeatsave=[[UIButton alloc] initWithFrame:CGRectMake(repeattaskpicker.frame.origin.x+repeattaskpicker.frame.size.width-50,0, 50, 50)];
    //   btncontactpaysave = [UIButton buttonWithType:UIButtonTypeCustom];
    [btnsave setTitle:@"Save" forState:UIControlStateNormal];
    btnsave.backgroundColor = [UIColor clearColor];
    [btnsave setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal ];
    btnsave.titleLabel.font = [UIFont fontWithName:@"OpenSans-Semibold" size:14.0];
    [btnsave addTarget:self action:@selector(provincepickerChange) forControlEvents:UIControlEventTouchUpInside];
    [pickView addSubview:btnsave];
    
    btncancel=[[UIButton alloc] initWithFrame:CGRectMake(provincePicker.frame.origin.x, provincePicker.frame.origin.y-50, 50, 50)];
    //      btnrepeatsave=[[UIButton alloc] initWithFrame:CGRectMake(repeattaskpicker.frame.origin.x+repeattaskpicker.frame.size.width-50,0, 50, 50)];
    //   btncontactpaysave = [UIButton buttonWithType:UIButtonTypeCustom];
    [btncancel setTitle:@"Cancel" forState:UIControlStateNormal];
    btncancel.backgroundColor = [UIColor clearColor];
    [btncancel setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal ];
    btncancel.titleLabel.font = [UIFont fontWithName:@"OpenSans-Semibold" size:14.0];
    [btncancel addTarget:self action:@selector(provincepickerCancel) forControlEvents:UIControlEventTouchUpInside];
    [pickView addSubview:btncancel];
}
-(void)provincepickerChange
{
    if (province.length==0) {
        
        txtprovince.text=[ArrProvince objectAtIndex:0];
    }
    else
    {
        txtprovince.text=province;
    }
 //   btnprovince.selected=NO;
    province=@"";
    [pickView removeFromSuperview];
    
}
-(void)provincepickerCancel
{
  //  btnprovince.selected=NO;
  //  btnprovince.titleLabel.text=province;
    [pickView removeFromSuperview];
}
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    
        return ArrProvince.count;
   
}
- (NSString*)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    
   if (pickerView==provincePicker)
    {
        return ArrProvince[row];
    }
    else
    {
        return @"";
    }
    
}
- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
     if (pickerView==provincePicker)
    {
        province= ArrProvince[row];
    }
    else
    {
        
    }
}
- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex

{
    UIImagePickerController *picker = [[UIImagePickerController alloc]init];
    picker.delegate = (id)self;
    picker.allowsEditing = YES;
    
    switch (buttonIndex) {
            
        case 0:
            
            
            picker.sourceType = UIImagePickerControllerSourceTypeCamera;
            [self.navigationController presentViewController:picker animated:YES completion:NULL];
            
            break;
            
        case 1:
            picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
            [self.navigationController presentViewController:picker animated:YES completion:NULL];
            break;
            
        default:
            break;
    }
    
}
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    
    //  addimage1 = info[UIImagePickerControllerEditedImage];
    
  
    
        profileimg.image=info[UIImagePickerControllerEditedImage];
        profileimg.contentMode = UIViewContentModeScaleAspectFill;
        profileimg.clipsToBounds=YES;

        [profileimg setUserInteractionEnabled:YES];
    
    
    
    [picker dismissViewControllerAnimated:YES completion:nil];
    
    
    
    
}
- (IBAction)ChoosefileClk:(id)sender
{
    actionsheet=[[UIActionSheet alloc]initWithTitle:@"" delegate:self cancelButtonTitle:@"Cancel" destructiveButtonTitle:nil otherButtonTitles:@"Camera", @"Photo Library", nil];
    [actionsheet showInView:self.view];
}

- (IBAction)UpdateClk:(id)sender
{
    NSString *emailRegEx = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegEx];    if (firstname.text.length==0)
    {
        firstname.text=@"";
        firstname.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"Enter Your First Name" attributes:@{NSForegroundColorAttributeName: [UIColor redColor]}];
        [Main_acroll setContentOffset:CGPointMake(0,0) animated:YES];
    }
    else if (lastname.text.length==0)
    {
        lastname.text=@"";
        lastname.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"Enter Your Last Name" attributes:@{NSForegroundColorAttributeName: [UIColor redColor]}];
        [Main_acroll setContentOffset:CGPointMake(0,0) animated:YES];
    }
    else if (postral_code.text.length==0)
    {
        postral_code.text=@"";
        postral_code.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"Enter Your Postal Code" attributes:@{NSForegroundColorAttributeName: [UIColor redColor]}];
        [Main_acroll setContentOffset:CGPointMake(0,160) animated:YES];
    }
    else if (phone_number.text.length==0)
    {
        phone_number.text=@"";
        phone_number.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"Enter Your Phone No" attributes:@{NSForegroundColorAttributeName: [UIColor redColor]}];
        [Main_acroll setContentOffset:CGPointMake(0,300) animated:YES];
    }
    else if ([emailTest evaluateWithObject:email.text] == NO)
    {
        email.text=@"";
        email.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"Not a valid email" attributes:@{NSForegroundColorAttributeName: [UIColor redColor]}];
        /*   UIAlertView *aler=[[UIAlertView alloc] initWithTitle:@"Error" message:@"Not a valid email" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
         [aler show];
         */
        [Main_acroll setContentOffset:CGPointMake(0,350) animated:YES];
    }

    else if ([password.text isEqualToString:confirmpassword.text] == NO)
    {
        confirmpassword.text=@"";
        confirmpassword.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"Password and confirm password should be same" attributes:@{NSForegroundColorAttributeName: [UIColor redColor]}];
        [Main_acroll setContentOffset:CGPointMake(0,400) animated:YES];
    }
    else
    {
        [self UpdateUrl];
    }
}
-(void)UpdateUrl

{
    
    
    
    NSString *str=[NSString stringWithFormat:@"%@myaccount_details_ios/update_user?user_id=%@&user_type=%@&first_name=%@&last_name=%@&postalcode=%@&address=%@&city=%@&province=%@&country=%@&mobile_number=%@&phone_number=%@&email=%@&password=%@&language_known=%@&registration_type=%@",URL_LINK,[userid stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding],usertype,[firstname.text stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding],[lastname.text stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding],[postral_code.text stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding],[address.text stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding],[city.text stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding],[txtprovince.text stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding],[country.text stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding],[mobile_number.text stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding],[phone_number.text stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding],[email.text stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding],[password.text stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding],[language_spoken.text stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding],regtype];
    
    NSLog(@"str=%@",str);
    
    [self checkLoader];
    
    
    
    NSData *imageData = UIImagePNGRepresentation(profileimg.image);
    
    //    id result=[urlobj GlobalDict_image:str Globalstr_image:@"array" globalimage:imageData];
    
    //    NSLog(@"result=%@",result);
    
    
    
    
    
    AFHTTPClient *client= [AFHTTPClient clientWithBaseURL:[NSURL URLWithString:str]];
    
    
    
    
    
    
    
    NSMutableURLRequest *request = [client multipartFormRequestWithMethod:@"POST" path:nil parameters:nil constructingBodyWithBlock: ^(id <AFMultipartFormData>formData) {
        
              
        NSString *imagename = [NSString stringWithFormat:@"profilepic"];
        
        
        
        [formData appendPartWithFileData:imageData name:imagename fileName:@"temp.jpeg" mimeType:@"image/jpeg"];
        
        
        
        //}
        
        
        
    }];
    
    
    
    
    
    
    
    AFHTTPRequestOperation *operation = [[AFHTTPRequestOperation alloc] initWithRequest:request];
    
    
    
    [operation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation * _operation, id responseObject) {
        
        
        
        NSString *response = [_operation responseString];
        
        
        
        NSLog(@"response: [%@]",response);
        NSError *error;
        NSString *dictString=[NSString stringWithFormat:@"%@", response];//or ur dict reference..
        NSData *jsonData = [dictString dataUsingEncoding:NSUTF8StringEncoding];
        NSDictionary *json = [NSJSONSerialization JSONObjectWithData:jsonData
                                                             options:NSJSONReadingMutableContainers
                                                               error:&error];
        if ([[json valueForKey:@"status"] isEqualToString:@"Success"]) {
            
            [self checkLoader];
            UIAlertView *aler=[[UIAlertView alloc] initWithTitle:@"Success" message:@"Account Successfully Updated." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
            [aler show];
        }
        else
        {
            [self checkLoader];
            UIAlertView *aler=[[UIAlertView alloc] initWithTitle:@"Error" message:@"Unsucessful...." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
            [aler show];
        }

        
        
        
    } failure:^(AFHTTPRequestOperation * _operation, NSError *error) {
        
        
        
        if([_operation.response statusCode] == 403){
            
            
            [self checkLoader];
            NSLog(@"Upload Failed");
            
            
            
            return;
            
            
            
        }
        
        
        
    }];
    
    
    
    [operation start];
    
    
    
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
