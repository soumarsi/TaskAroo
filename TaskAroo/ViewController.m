//
//  ViewController.m
//  TaskAroo
//
//  Created by Prosenjit Kolay on 26/03/15.
//  Copyright (c) 2015 Prosenjit Kolay. All rights reserved.
//

#import "ViewController.h"
#import "FooterView.h"
#import "TaskCell.h"

//cardIO Implementation
#import "CardIOPaymentViewControllerDelegate.h"
#import "CardIO.h"

#define  IsIphone6 (([[UIScreen mainScreen] bounds].size.height)>600)?true:false
@interface ViewController ()<UITextFieldDelegate,UITableViewDelegate,UITableViewDataSource, CardIOPaymentViewControllerDelegate>

@end

@implementation ViewController

- (void) viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:YES animated:animated];
    
    //cardIO Implementation
    [CardIOUtilities preload];
    
}

//cardIO Implementation Start
#pragma mark - CardIOPaymentViewControllerDelegate

- (void)userDidProvideCreditCardInfo:(CardIOCreditCardInfo *)info inPaymentViewController:(CardIOPaymentViewController *)paymentViewController {
    NSLog(@"Scan succeeded with info: %@", info);
    // Do whatever needs to be done to deliver the purchased items.
    [self dismissViewControllerAnimated:YES completion:nil];
    
//    self.infoLabel.text = [NSString stringWithFormat:@"Received card info. Number: %@, expiry: %02lu/%lu, cvv: %@.", info.redactedCardNumber, (unsigned long)info.expiryMonth, (unsigned long)info.expiryYear, info.cvv];
}

- (void)userDidCancelPaymentViewController:(CardIOPaymentViewController *)paymentViewController {
    NSLog(@"User cancelled scan");
    [self dismissViewControllerAnimated:YES completion:nil];
}
//cardIO Implementation End



- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    NSLog(@"ViewController --");
 //   NSLog(@"declared in pch=%@",URL_LINK);
    k=0;
    mainview = [[UIView alloc] initWithFrame: CGRectMake ( 0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    [self.view addSubview: mainview];
  //  NSLog(@"width=%f",self.view.frame.size.width);
  //  NSLog(@"height=%f",self.view.frame.size.height);
    if (IsIphone6) {
        
    }
    else
    {
        
    }
    topview = [[UIView alloc] initWithFrame: CGRectMake ( 0,  0, self.view.frame.size.width, 70)];
    [mainview addSubview: topview];
    UIGraphicsBeginImageContext(topview.frame.size);
    [[UIImage imageNamed:@"topbar.png"] drawInRect:topview.bounds];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    topview.backgroundColor = [UIColor colorWithPatternImage:image];
    
    logoimg =[[UIImageView alloc] initWithFrame:CGRectMake(25,15,109,49)];
    logoimg.image=[UIImage imageNamed:@"logo.png"];
    [topview addSubview:logoimg];
    
    btnsignin = [UIButton buttonWithType:UIButtonTypeCustom];
    btnsignin.frame = CGRectMake(self.view.frame.size.width-150, 38, 60,20);
    [btnsignin setTitle:@"Sign in" forState:UIControlStateNormal];
    btnsignin.backgroundColor = [UIColor clearColor];
    [btnsignin setTitleColor:[UIColor blackColor] forState:UIControlStateNormal ];
    btnsignin.titleLabel.font = [UIFont fontWithName:@"OpenSans-Semibold" size:14.0];
    [btnsignin addTarget:self action:@selector(signinclk) forControlEvents:UIControlEventTouchUpInside];
    [topview addSubview:btnsignin];
    
    btnsignup = [UIButton buttonWithType:UIButtonTypeCustom];
    btnsignup.frame = CGRectMake(btnsignin.frame.origin.x+70, 38, 65,20);
    [btnsignup setTitle:@"Sign up" forState:UIControlStateNormal];
    btnsignup.backgroundColor = [UIColor clearColor];
    [btnsignup setTitleColor:[UIColor blackColor] forState:UIControlStateNormal ];
    btnsignup.titleLabel.font = [UIFont fontWithName:@"OpenSans-Semibold" size:14.0];
    [btnsignup addTarget:self action:@selector(signupclk) forControlEvents:UIControlEventTouchUpInside];
    [topview addSubview:btnsignup];
    
    bodyview = [[UIView alloc] initWithFrame: CGRectMake ( 0, 70, self.view.frame.size.width, mainview.frame.size.height-125)];
    [mainview addSubview: bodyview];
    UIGraphicsBeginImageContext(bodyview.frame.size);
    [[UIImage imageNamed:@"bg.png"] drawInRect:bodyview.bounds];
    UIImage *image1 = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    bodyview.backgroundColor = [UIColor colorWithPatternImage:image1];
    float textwidth=self.view.frame.size.width-110;
    txttask = [[UITextField alloc] initWithFrame:CGRectMake(20, 15, textwidth, 32)];
    txttask.textColor = [UIColor blackColor];
    txttask.font = [UIFont fontWithName:@"MyriadPro-Semibold" size:15.0];
    //  txtemail.placeholder = @"Email";
    UIColor *color = [UIColor grayColor];
    //  txttask.placeholder=@" Enter your task here";
    txttask.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"  Enter your task here" attributes:@{NSForegroundColorAttributeName: color}];
    txttask.borderStyle=NO;
    UIGraphicsBeginImageContext(txttask.frame.size);
    [[UIImage imageNamed:@"input-field.png"] drawInRect:txttask.bounds];
    UIImage *image2 = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    txttask.backgroundColor = [UIColor colorWithPatternImage:image2];
    txttask.delegate = self;
    [bodyview addSubview:txttask];
    
    btnpost = [UIButton buttonWithType:UIButtonTypeCustom];
    btnpost.frame = CGRectMake(txttask.frame.origin.x+txttask.frame.size.width+2, 15, 70, 32);
    [btnpost setBackgroundImage:[UIImage imageNamed:@"post-button.png"] forState:UIControlStateNormal];
    [btnpost addTarget:self action:@selector(postclk) forControlEvents:UIControlEventTouchUpInside];
    [bodyview addSubview:btnpost];
    
     lblor = [[UILabel alloc]initWithFrame:CGRectMake(35, 47, 30, 28)];
   // lblor = [[UILabel alloc]initWithFrame:CGRectMake(self.view.frame.size.width-290, 47, 30, 28)];
    lblor.text = @"or";
    lblor.font = [UIFont fontWithName:@"OpenSans-Light" size:30.0];
    //  UIFont* boldFont = [UIFont boldSystemFontOfSize:[UIFont systemFontSize]];
    //  [lbllogin setFont:boldFont];
    lblor.numberOfLines = 0;
    lblor.baselineAdjustment = YES;
    lblor.adjustsFontSizeToFitWidth = YES;
    lblor.clipsToBounds = YES;
    lblor.backgroundColor = [UIColor clearColor];
    lblor.textColor = [UIColor grayColor];
    lblor.textAlignment = NSTextAlignmentLeft;
    [bodyview addSubview:lblor];
    
    lbltask = [[UILabel alloc]initWithFrame:CGRectMake(lblor.frame.origin.x+26, 50, 195, 24)];
    lbltask.text = @"Tap Your Task Below";
    lbltask.font = [UIFont fontWithName:@"OpenSans-Semibold" size:24.0];
    //  UIFont* boldFont = [UIFont boldSystemFontOfSize:[UIFont systemFontSize]];
    //  [lbllogin setFont:boldFont];
    lbltask.numberOfLines = 0;
    lbltask.baselineAdjustment = YES;
    lbltask.adjustsFontSizeToFitWidth = YES;
    lbltask.clipsToBounds = YES;
    lbltask.backgroundColor = [UIColor clearColor];
    lbltask.textColor =[UIColor colorWithRed:(27/255.0f) green:(120/255.0f) blue:(205/255.0f) alpha:1];
    lbltask.textAlignment = NSTextAlignmentLeft;
    [bodyview addSubview:lbltask];
    
    
    tbltask = [self makeTableView];
    [tbltask registerClass:[UITableViewCell class] forCellReuseIdentifier:@"Cell"];
    [bodyview addSubview:tbltask];
    
    
    sections = [[NSMutableArray alloc] init];
    sections1 = [[NSMutableArray alloc] init];
    tasktype = [[NSMutableArray alloc] initWithObjects:@"icon1.png",@"icon3.png",@"icon5.png",@"icon7.png",@"icon9.png",@"icon11.png",@"icon13.png",@"icon15.png",@"icon17.png",@"icon19.png",@"icon21.png",@"icon23.png", nil];
    selectedtasktype = [[NSMutableArray alloc] initWithObjects:@"icon2.png",@"icon4.png",@"icon6.png",@"icon8.png",@"icon10.png",@"icon12.png",@"icon14.png",@"icon16.png",@"icon18.png",@"icon20.png",@"icon22.png",@"icon24.png", nil];
    [sections addObject:tasktype];
    [sections1 addObject:selectedtasktype];
    
    txttask.leftView = [self addPaddingView];
    txttask.leftViewMode = UITextFieldViewModeAlways;
 //   FooterView *fv = [[FooterView alloc]initWithFrame:CGRectMake(0,mainview.frame.size.height-60, self.view.frame.size.width,60)];
 //   [mainview addSubview:fv];
    [self footercall];
    NSUserDefaults *prefs = [NSUserDefaults standardUserDefaults];
    NSString *userid=[prefs valueForKey:@"userid"];
    NSLog(@"userid=%@",userid);
    if (userid == nil || [userid isEqualToString:@""])
    {
        
    }
    else
    {
        btnsignup.hidden=YES;
        [btnsignin setTitle:@"Sign Out" forState:UIControlStateNormal];
        btnsignin.frame=CGRectMake(btnsignin.frame.origin.x+70, btnsignin.frame.origin.y, btnsignin.frame.size.width, btnsignin.frame.size.height);
    }
}
-(UITableView *)makeTableView
{
    
    
    CGRect tableFrame = CGRectMake(5, 80, mainview.frame.size.width-10, mainview.frame.size.height-90);
    NSLog(@"table height=%f",tableFrame.size.height);
    UITableView *tableView = [[UITableView alloc]initWithFrame:tableFrame style:UITableViewStylePlain];
    
    //  tableView.rowHeight = 70;
  //  tableView.sectionFooterHeight = 22;
 //   tableView.sectionHeaderHeight = 22;
    tableView.scrollEnabled = YES;
    tableView.showsVerticalScrollIndicator = YES;
    tableView.userInteractionEnabled = YES;
    tableView.bounces = YES;
    
    tableView.delegate = self;
    tableView.dataSource = self;
    
    return tableView;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
   // return 1;
    
    
    
  //   NSLog(@"array size=%d",tasktype.count);
  //  NSLog(@"No of row=%Lf",ceill([tasktype count]/3.0));
  return ceill([tasktype count]/3.0);
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
  //  return [sections count];
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    static    NSString *hlCellID = @"hlCellID";
    
    UITableViewCell *hlcell = [tableView dequeueReusableCellWithIdentifier:hlCellID];
    if(hlcell == nil) {
        hlcell = [[UITableViewCell alloc]
                  initWithStyle:UITableViewCellStyleDefault reuseIdentifier:hlCellID];
        hlcell.accessoryType = UITableViewCellAccessoryNone;
        hlcell.selectionStyle = UITableViewCellSelectionStyleNone;
        
        hlcell.autoresizesSubviews = YES;
    }
    
    long section = indexPath.section;
    NSMutableArray *sectionItems = [sections objectAtIndex:section];
    NSMutableArray *selectedsectionItems = [sections1 objectAtIndex:section];
  //  long n = [sectionItems count];
 //   int i=0,i1=0;
    //  NSLog(@"n=%ld",n);
    
    
    
      //    float x=(tableView.frame.size.width/3.0)-2;
    CGRect cellframe = [tableView rectForRowAtIndexPath:indexPath];
    float x=(cellframe.size.width/3.0)-2;
    
    
   // long myindexpath=indexPath.row*3;

        int j=0;
        for(j=0; j<3;j++)
        {
            if (sectionItems.count<=k) {
                break;
            }
         //  NSLog(@"row height : %f", cellframe.size.height);
          CGRect rect  = CGRectMake((x+3)*j, 3, x,  cellframe.size.height-3);
            UIButton *buttonImage=[[UIButton alloc] initWithFrame:rect];
            [buttonImage setFrame:rect];
          //   NSLog(@"index path=%@",[NSString stringWithFormat:@"%ld", (long)indexPath.row] );
          //   buttonImage.tag = [[[NSString stringWithFormat:@"%ld", (long)indexPath.row] stringByAppendingString:[NSString stringWithFormat:@"%d", j]] integerValue];
        //    NSLog(@"tag=%ld",(long)buttonImage.tag);
            UIImage *buttonImageNormal=[UIImage imageNamed:[sectionItems objectAtIndex:k]];
            UIImage *buttonImageselected=[UIImage imageNamed:[selectedsectionItems objectAtIndex:k]];
            [buttonImage setBackgroundImage:buttonImageNormal forState:UIControlStateNormal];
            [buttonImage setBackgroundImage:buttonImageselected forState:UIControlStateSelected];
            [buttonImage setBackgroundImage:buttonImageselected forState:UIControlStateHighlighted];
            [buttonImage setContentMode:UIViewContentModeCenter];
            //Clip/Clear the other pieces whichever outside the rounded corner
            buttonImage.clipsToBounds = YES;
            [buttonImage.layer setBorderWidth:1.2];
            [buttonImage.layer setBorderColor:[[UIColor colorWithRed:(147/255.0f) green:(167/255.0f) blue:(90/255.0f) alpha:1] CGColor]];
            buttonImage.tag =k;
            //    NSString *tagValue = [NSString stringWithFormat:@"%ld%d", indexPath.section+1, i];
            //   buttonImage.tag = [tagValue intValue];
           
         //   NSLog(@"tag….%ld",(long)buttonImage.tag);
            [buttonImage addTarget:self action:@selector(gridbuttonPressed:)forControlEvents:UIControlEventTouchUpInside];
            [hlcell.contentView addSubview:buttonImage];
            k++;
           // NSLog(@"k=%d",k);
        }
    
   
    
    
    
    
    
   /*
    
    
    while(i<n){
         float y=((tableView.frame.size.height)/5.4)-3;
     //   NSLog(@"table height=%f",tableView.frame.size.height);
     //    NSLog(@"y=%f",y);
         int yy = i1*(y+3);
      //  int yy = i1*88;
        int j=0;
        for(j=0; j<3;j++){
            
            if (i>=n) break;
            float x=(tableView.frame.size.width/3.0)-2;
             CGRect rect  = CGRectMake((x+3)*j, yy, x, y);
        //    CGRect rect  = CGRectMake(3+103*j, yy, 100, 85);
            UIButton *buttonImage=[[UIButton alloc] initWithFrame:rect];
            [buttonImage setFrame:rect];
            
            UIImage *buttonImageNormal=[UIImage imageNamed:[sectionItems objectAtIndex:i]];
            UIImage *buttonImageselected=[UIImage imageNamed:[selectedsectionItems objectAtIndex:i]];
            [buttonImage setBackgroundImage:buttonImageNormal forState:UIControlStateNormal];
            [buttonImage setBackgroundImage:buttonImageselected forState:UIControlStateSelected];
            [buttonImage setBackgroundImage:buttonImageselected forState:UIControlStateHighlighted];
            [buttonImage setContentMode:UIViewContentModeCenter];
            //Clip/Clear the other pieces whichever outside the rounded corner
            buttonImage.clipsToBounds = YES;
            [buttonImage.layer setBorderWidth:1.2];
            [buttonImage.layer setBorderColor:[[UIColor colorWithRed:(147/255.0f) green:(167/255.0f) blue:(90/255.0f) alpha:1] CGColor]];
        //    NSString *tagValue = [NSString stringWithFormat:@"%ld%d", indexPath.section+1, i];
         //   buttonImage.tag = [tagValue intValue];
            buttonImage.tag = i;
            //NSLog(@tag….%d", button.tag);
            [buttonImage addTarget:self action:@selector(gridbuttonPressed:)forControlEvents:UIControlEventTouchUpInside];
            [hlcell.contentView addSubview:buttonImage];
            
            i++;
        }
        i1 = i1+1;
    }
    
    */
   
    return hlcell;
    
}
-(void)gridbuttonPressed:(UIButton *)sender {
    
    NSString *taskname;
    long tagId = [sender tag];
    if (tagId==0) {
        taskname=@"Handyman";
    }
    else if (tagId==1) {
        taskname=@"House Cleaning";
    }
    else if (tagId==2) {
        taskname=@"Delivery";
    }
    else if (tagId==3) {
        taskname=@"Virtual";
    }
    else if (tagId==4) {
        taskname=@"Caregiver";
    }
    else if (tagId==5) {
        taskname=@"Yardwork";
    }
    else if (tagId==6) {
        taskname=@"Computer Repair";
    }
    else if (tagId==7) {
        taskname=@"Furniture Assembly";
    }
    else if (tagId==8) {
        taskname=@"Grocery Shopping";
    }
    else if (tagId==9) {
        taskname=@"Moving";
    }
    else if (tagId==10) {
        taskname=@"Dog Walking";
    }
    else if (tagId==11) {
        taskname=@"Driver";
    }
   
    
 //   NSLog(@"selected button=%ld",tagId);
    if (sender.selected==NO)
    {
        sender.selected = YES;
        [[NSUserDefaults standardUserDefaults] setObject:taskname forKey:@"taskname"];
        [self performSegueWithIdentifier:@"tasksegue" sender:self];
    }
    else
    {
        sender.selected = NO;
    }
    
}

//cardIO Implementation
-(void)postclk {
    
    [[NSUserDefaults standardUserDefaults] setObject:txttask.text forKey:@"taskname"];
    [self performSegueWithIdentifier:@"tasksegue" sender:self];
   

    
}
-(void)signupclk
{
  //  [self performSegueWithIdentifier:@"Signupsegue" sender:self];
    SignUpViewController *obj=[self.storyboard instantiateViewControllerWithIdentifier:@"SignUpViewControllersid"];
    [self.navigationController pushViewController:obj animated:YES];
}
-(void)signinclk
{
  
    NSUserDefaults *prefs = [NSUserDefaults standardUserDefaults];
    NSString *userid=[prefs valueForKey:@"userid"];
    if (userid == nil || [userid isEqualToString:@""])
    {
        //working as signin button
      //    [self performSegueWithIdentifier:@"Signinsegue" sender:self];
        SignInViewController *obj=[self.storyboard instantiateViewControllerWithIdentifier:@"SignInViewControllersid"];
        [self.navigationController pushViewController:obj animated:YES];
    }
    else
    {
        //working as signout button
        NSString *appDomain = [[NSBundle mainBundle] bundleIdentifier];
        [[NSUserDefaults standardUserDefaults] removePersistentDomainForName:appDomain];
      //  [self.navigationController popViewControllerAnimated:YES];
        [self deleteDocDirectory];
        btnsignup.hidden=NO;
        [btnsignin setTitle:@"Sign In" forState:UIControlStateNormal];
        btnsignin.frame=CGRectMake(btnsignin.frame.origin.x-70, btnsignin.frame.origin.y, btnsignin.frame.size.width, btnsignin.frame.size.height);
        NSUserDefaults *prefs = [NSUserDefaults standardUserDefaults];
        NSString *userid=[prefs valueForKey:@"userid"];
         NSLog(@"userid=%@",userid);
    }
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
   float y=((tableView.frame.size.height)/5.4);
   //  NSLog(@"height of y : %f", y);
    return y;
    
    
    
   /*
    NSMutableArray *sectionItems = [sections objectAtIndex:indexPath.section];
    long numRows =ceill([sectionItems count]/3.0);
 //  NSLog(@"row height=%f",numRows * 120.0);
    return numRows * 120.0;
    */
    
   }
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
  //  [mainscroll setContentOffset:CGPointMake(0,0) animated:YES];
    return YES;
}
- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField
{
    textField.autocorrectionType = UITextAutocorrectionTypeNo;
    return YES;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
