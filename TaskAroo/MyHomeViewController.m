//
//  MyHomeViewController.m
//  TaskAroo1
//
//  Created by Prosenjit Kolay on 24/03/15.
//  Copyright (c) 2015 Prosenjit Kolay. All rights reserved.
//

#import "MyHomeViewController.h"

//cardIO Implementation
#import "CardIOPaymentViewControllerDelegate.h"
#import "CardIO.h"

@interface MyHomeViewController ()<UIImagePickerControllerDelegate,UINavigationControllerDelegate,UITableViewDataSource,UITableViewDelegate,UITextFieldDelegate,UITextViewDelegate,UIPickerViewDataSource,UIPickerViewDelegate,UIActionSheetDelegate,UIGestureRecognizerDelegate,UIAlertViewDelegate,CardIOPaymentViewControllerDelegate,NSURLConnectionDelegate,leftDelegate>

@end

@implementation MyHomeViewController
@synthesize btnsignin,mainscroll,taskdescmainview,taskdescview,txtphoto,txtvwtaskdesc,lblrepeattask,txtday,txtcity,txtpcode,txtprovince,txtvwaddress,deadlineview,deadlinemainview,bidclsdeadview,btnbusiness,btncityarrow,btndeliverychk,btnindividual,btnradiobusi,btnradioindiv,btntaskdescarrow,btntasklocationarrow,taskcompdtview,tasklocationmainview,tasklocationview,btncontractpayarrow,btndeadlinearrow,btnpayarrow,btnpaydetail,btnpricearrow,taskdesctopimg,pricemainview,priceview,tasklocationtopimg,deadlinetopimg,pricetopimg,lblprice,lbldeadline,lbltasklocation,camerabtn,addedimg,btnbidtick,btnphtick,btnvehicletick,btnestimateddayarrow,txtcontractorpay,txtperjob,txttaskname,btnperhour,btnperjob,btnradioperhour,btnradioperjob,lblcontactorpay,contratorlineimg,btndeadlineextra,btnpriceextra,btntasklocationextra,btnrepeattaskarrow,txtrepeattask,lbltaskcompletiondt,lblbiddt,lblbidmonth,lblbidtime,lblbidyr,lbltaskdt,lbltaskmonth,lbltasktime,lbltaskyr,btnbidclosedeadline,btnbidclosedeadline1,btntaskcompdt,txttime,imgtimearrow,btntime,img,img1,lbltaskdesc,lbladdress,taskdetaildic,taskfilled,btnsignup,btnrepeattaskextra,btnday,btnprovinceextra,btncontractorpayamt,btnpayamt,btnbid,btndonebyph,btnvehicle,editview,imgagreetick,btnagreetick,btnedit,myspinner,lblno,lbltaskrequire,camerabtnextra,logoimage,btnleftview,btnleftviewextra,btnlogo,headerview,deliveryview,txtdroplocation,lbldroplocation,lblpagename,btndeliveryextra,Twoview,threeView,fourView,lbltwo,lblfour,lblthree,lbltasktop,TaskRequirementView,taskreviewView,OneView,threeViewReview,fromNewOrExisting,taskreview3View,fourviewReview,OneViewReview,TwoViewReview;

- (void) viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:YES animated:animated];
    
    //cardIO Implementation
    [CardIOUtilities preload];
    
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
    btnagreetick.selected=YES;
    imgagreetick.image=[UIImage imageNamed:@"tick1"];
    [tm removeFromSuperview];
     [screenview removeFromSuperview];
}
- (void) receiveTestNotification:(NSNotification *) notification
{
    btnagreetick.selected=NO;
    imgagreetick.image=[UIImage imageNamed:@"tick2"];
    [tm removeFromSuperview];
    [screenview removeFromSuperview];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    NSLog(@"task already filled=%c",taskfilled);
    
    //initialization
    
    mainDic=[[NSMutableDictionary alloc]init];
    mutDic=[[NSMutableDictionary alloc]init];
   
    Twoview.layer.borderColor = [UIColor blackColor].CGColor;
    Twoview.layer.borderWidth = 0.5f;
    Twoview.layer.cornerRadius=Twoview.frame.size.width/2;
    
    threeView.layer.borderColor = [UIColor blackColor].CGColor;
    threeView.layer.borderWidth = 0.5f;
    threeView.layer.cornerRadius=Twoview.frame.size.width/2;
    
    fourView.layer.borderColor = [UIColor blackColor].CGColor;
    fourView.layer.borderWidth = 0.5f;
    fourView.layer.cornerRadius=Twoview.frame.size.width/2;
    
    OneView.layer.borderColor = [UIColor blackColor].CGColor;
    OneView.layer.borderWidth = 0.5f;
    OneView.layer.cornerRadius=OneView.frame.size.width/2;
    
    threeViewReview.layer.borderColor = [UIColor blackColor].CGColor;
    threeViewReview.layer.borderWidth = 0.5f;
    threeViewReview.layer.cornerRadius=threeViewReview.frame.size.width/2;
    
    fourviewReview.layer.borderColor = [UIColor blackColor].CGColor;
    fourviewReview.layer.borderWidth = 0.5f;
    fourviewReview.layer.cornerRadius=fourviewReview.frame.size.width/2;
    
    OneViewReview.layer.borderColor = [UIColor blackColor].CGColor;
    OneViewReview.layer.borderWidth = 0.5f;
    OneViewReview.layer.cornerRadius=OneViewReview.frame.size.width/2;
    
    TwoViewReview.layer.borderColor = [UIColor blackColor].CGColor;
    TwoViewReview.layer.borderWidth = 0.5f;
    TwoViewReview.layer.cornerRadius=TwoViewReview.frame.size.width/2;
    
    NSUserDefaults *prefs = [NSUserDefaults standardUserDefaults];
    userid=[prefs valueForKey:@"userid"];
    NSLog(@"userid=%@",userid);
    
    if (userid == nil || [userid isEqualToString:@""])
    {
        lblpagename.hidden=YES;
      
        
       
    }
    else
    {
       
       lblpagename.hidden=NO;
        btnsignup.hidden=YES;
        btnsignin.hidden=YES;
        [btnsignin setTitle:@"Sign Out" forState:UIControlStateNormal];
        btnsignin.frame=CGRectMake(btnsignin.frame.origin.x+70, btnsignin.frame.origin.y, btnsignin.frame.size.width, btnsignin.frame.size.height);
        logoimage.hidden=YES;
        btnlogo.hidden=YES;
        
   //     logoimage.frame=CGRectMake(headerview.frame.size.width-logoimage.frame.size.width-30, logoimage.frame.origin.y, logoimage.frame.size.width, logoimage.frame.size.height);
   //     btnlogo.frame=CGRectMake(headerview.frame.size.width-btnlogo.frame.size.width-30, btnlogo.frame.origin.y, btnlogo.frame.size.width, btnlogo.frame.size.height);
        btnleftview.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"menu-icon"]];
        btnleftview.hidden=NO;
        btnleftviewextra.hidden=NO;
    }
    
    
    //design
    [self footercall];
    myspinner.hidden=YES;
    mainscroll.contentSize = CGSizeMake(0, 1900);
    UIGraphicsBeginImageContext(mainscroll.frame.size);
    [[UIImage imageNamed:@"bg.png"] drawInRect:mainscroll.bounds];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    mainscroll.backgroundColor = [UIColor colorWithPatternImage:image];
    
    //  txtvwtaskdesc.frame = CGRectMake( 4, 100, txtphoto.frame.size.width, 80);
    [txtvwtaskdesc setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"bg3.png"]]];
    [lblrepeattask setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"input-field5.png"]]];
    [txtday setValue:[UIColor redColor] forKeyPath:@"_placeholderLabel.textColor"];
    [txttime setValue:[UIColor redColor] forKeyPath:@"_placeholderLabel.textColor"];
    [txtvwaddress setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"bg3.png"]]];
    [txtdroplocation setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"bg3.png"]]];
    [deliveryview setHidden:YES];
    // addedimg.frame = CGRectMake( 225, 205, 71, 39);
    
    UIGraphicsBeginImageContext(bidclsdeadview.frame.size);
    [[UIImage imageNamed:@"bg.png"] drawInRect:bidclsdeadview.bounds];
    UIImage *image1 = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    bidclsdeadview.backgroundColor = [UIColor colorWithPatternImage:image1];
    
    UIGraphicsBeginImageContext(taskcompdtview.frame.size);
    [[UIImage imageNamed:@"bg.png"] drawInRect:taskcompdtview.bounds];
    UIImage *image2 = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    taskcompdtview.backgroundColor = [UIColor colorWithPatternImage:image2];
    
    btnpaydetail.backgroundColor=[UIColor colorWithRed:(235.0/255) green:(66.0/255) blue:(32.0/255) alpha:1.0];
     btnedit.backgroundColor=[UIColor colorWithRed:(235.0/255) green:(66.0/255) blue:(32.0/255) alpha:1.0];
    //task desc arrow button
    
    btntaskdescarrow.tag=1;
    btntaskdescarrow.selected=NO;
    
    //task location arrow button
   
    btntasklocationarrow.tag=2;
    btntasklocationarrow.selected=NO;
    
    //deadline arrow button
    
    btndeadlinearrow.tag=3;
    btndeadlinearrow.selected=NO;
    
    //price arrow button
    
    btnpricearrow.tag=4;
    btnpricearrow.selected=NO;
    
    
    
    
    //radio button individual or business
    btnradioindiv.selected=YES;
    btnindividual.selected=YES;
    btnradiobusi.selected=NO;
    btnbusiness.selected=NO;
   
    
    //radio button per job or per location
    btnradioperjob.selected=YES;
    btnperjob.selected=YES;
    btnradioperhour.selected=NO;
    btnperhour.selected=NO;
    
    
    //bid tick
    btnbidtick.selected=YES;
    
    //vehicle tick
    btnvehicletick.selected=YES;
   
    
    //ph tick
    btnphtick.selected=YES;
   
    
    //delivery tick
    btndeliverychk.selected=NO;
    
    
    //estimated day arrow
    btnestimateddayarrow.selected=NO;
    
    
    //city  arrow
    btncityarrow.selected=NO;
    
    
    //day array
    arrday=[[NSMutableArray alloc]init];
    for (int i=0; i<=31; i++) {
        NSString *val=[NSString stringWithFormat:@"%d", i];
        [arrday addObject:val];
    }
    
    //time array
    arrtime=[[NSMutableArray alloc]init];
    for (int i=0; i<=23; i++) {
        NSString *val=[NSString stringWithFormat:@"%d", i];
        [arrtime addObject:val];
    }
    
     arrimage=[[NSMutableArray alloc]init];
    //text padding
    
    txtday.leftView = [self addPaddingView];
    txtday.leftViewMode = UITextFieldViewModeAlways;
    txttime.leftView = [self addPaddingView];
    txttime.leftViewMode = UITextFieldViewModeAlways;
    txtcity.leftView = [self addPaddingView];
    txtcity.leftViewMode = UITextFieldViewModeAlways;
    txtpcode.leftView = [self addPaddingView];
    txtpcode.leftViewMode = UITextFieldViewModeAlways;
    txtphoto.leftView = [self addPaddingView];
    txtphoto.leftViewMode = UITextFieldViewModeAlways;
    txtprovince.leftView = [self addPaddingView];
    txtprovince.leftViewMode = UITextFieldViewModeAlways;
    txtperjob.leftView = [self addPaddingView];
    txtperjob.leftViewMode = UITextFieldViewModeAlways;
    txtcontractorpay.leftView = [self addPaddingView];
    txtcontractorpay.leftViewMode = UITextFieldViewModeAlways;
    txttaskname.leftView = [self addPaddingView];
    txttaskname.leftViewMode = UITextFieldViewModeAlways;
    txtrepeattask.leftView = [self addPaddingView];
    txtrepeattask.leftViewMode = UITextFieldViewModeAlways;
    
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
    
    //radio button per job or per hour
    btnradioperjob.selected=YES;
    btnperjob.selected=YES;
    btnradioperhour.selected=NO;
    btnperhour.selected=NO;
   
    
    //pay arrow
    btnpayarrow.selected=NO;
    
    
    //contactor pay arrow
    btncontractpayarrow.selected=NO;
   
    
    //repeat task arrow
    btnrepeattaskarrow.selected=NO;
   
    
    //amt array
    arramt=[[NSMutableArray alloc]init];
    for (int i=0; i<=5000; i++) {
        NSString *val=[NSString stringWithFormat:@"%d", i];
        [arramt addObject:val];
    }
    
    arrContractoramt=[[NSMutableArray alloc]init];
    
    [arrContractoramt addObject:@"None"];
    for (int i=1; i<=2000; i++) {
        NSString *val=[NSString stringWithFormat:@"%d", i];
        [arrContractoramt addObject:val];
    }
    
    arrcity=[[NSMutableArray alloc]initWithObjects:@"Alberta",@"British Columbia",@"Manitoba",@"New Brunswick", @"Newfoundland and Labrador",@"Northwest Territories",@"Nova Scotia",@"Nunavut",@"Ontario",@"Prince Edward Island",@"Quebec",@"Saskatchewan",@"Yukon", nil];
    
    //repeat task array
    arrrepeattask=[[NSMutableArray alloc]init];
    for (int i=1; i<=8; i++) {
        NSString *val=[NSString stringWithFormat:@"%d", i];
        [arrrepeattask addObject:val];
    }
    
    
    btnbidclosedeadline.selected=NO;
     btntaskcompdt.selected=NO;
    
    
    //set current date to bid date and task completion date
   
    NSDate *currDate = [NSDate date];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc]init];
    [dateFormatter setDateFormat:@"ddMMyyyyhh:mma"];
    biddatetime = [dateFormatter stringFromDate:currDate];
    taskclsdatetime = [dateFormatter stringFromDate:currDate];

    NSLog(@"%@",biddatetime);
  
    lblbiddt.text=[biddatetime substringWithRange:NSMakeRange(0, 2)];
    lblbidmonth.text=[biddatetime substringWithRange:NSMakeRange(2, 2)];
    lblbidyr.text=[biddatetime substringWithRange:NSMakeRange(4, 4)];
    lblbidtime.text=[biddatetime substringWithRange:NSMakeRange(8, 7)];
    
    lbltaskdt.text=[taskclsdatetime substringWithRange:NSMakeRange(0, 2)];
    lbltaskmonth.text=[taskclsdatetime substringWithRange:NSMakeRange(2, 2)];
    lbltaskyr.text=[taskclsdatetime substringWithRange:NSMakeRange(4, 4)];
    lbltasktime.text=[taskclsdatetime substringWithRange:NSMakeRange(8, 7)];
    
    btntime.selected=NO;
    [imgtimearrow setImage:[UIImage imageNamed:@"down-arrow2.png"]];
    imgcount=0;
    user=NO;
    taskdetaildic=[[NSMutableDictionary alloc]init];
    /*   UITapGestureRecognizer *daytap=[[UITapGestureRecognizer alloc]init];
     [daytap addTarget:self action:@selector(daytapclk)];
     [txtday setUserInteractionEnabled:YES];
     [txtday addGestureRecognizer:daytap];
     */
    
    [self NewOrEditTask];
    
    
    
    //task is filled or not
       [btnradioperjob setBackgroundImage:[UIImage imageNamed:@"rediobutton1.png"] forState:UIControlStateNormal];
    
    [btnradioperjob setBackgroundImage:[UIImage imageNamed:@"rediobutton2.png"] forState:UIControlStateSelected];
    
    [btnradioperjob setBackgroundImage:[UIImage imageNamed:@"rediobutton2.png"] forState:UIControlStateHighlighted];
    [btnradioperhour setBackgroundImage:[UIImage imageNamed:@"rediobutton1.png"] forState:UIControlStateNormal];
    
    [btnradioperhour setBackgroundImage:[UIImage imageNamed:@"rediobutton2.png"] forState:UIControlStateSelected];
    
    [btnradioperhour setBackgroundImage:[UIImage imageNamed:@"rediobutton2.png"] forState:UIControlStateHighlighted];
    
    [btnperjob setBackgroundImage:[UIImage imageNamed:@"bg1.png"] forState:UIControlStateNormal];
    
    [btnperjob setBackgroundImage:[UIImage imageNamed:@"bg3.png"] forState:UIControlStateSelected];
    
    [btnperjob setBackgroundImage:[UIImage imageNamed:@"bg3.png"] forState:UIControlStateHighlighted];
    
    //bid tick
   
    [btnbidtick setBackgroundImage:[UIImage imageNamed:@"tick2.png"] forState:UIControlStateNormal];
    
    [btnbidtick setBackgroundImage:[UIImage imageNamed:@"tick1.png"] forState:UIControlStateSelected];
    
    [btnbidtick setBackgroundImage:[UIImage imageNamed:@"tick1.png"] forState:UIControlStateHighlighted];
    
    //vehicle tick
 
    [btnvehicletick setBackgroundImage:[UIImage imageNamed:@"tick2.png"] forState:UIControlStateNormal];
    
    [btnvehicletick setBackgroundImage:[UIImage imageNamed:@"tick1.png"] forState:UIControlStateSelected];
    
    [btnvehicletick setBackgroundImage:[UIImage imageNamed:@"tick1.png"] forState:UIControlStateHighlighted];
    
    //ph tick
  
    [btnphtick setBackgroundImage:[UIImage imageNamed:@"tick2.png"] forState:UIControlStateNormal];
    
    [btnphtick setBackgroundImage:[UIImage imageNamed:@"tick1.png"] forState:UIControlStateSelected];
    
    [btnphtick setBackgroundImage:[UIImage imageNamed:@"tick1.png"] forState:UIControlStateHighlighted];
    
    //delivery tick
  
    [btndeliverychk setBackgroundImage:[UIImage imageNamed:@"tick2.png"] forState:UIControlStateNormal];
    
    [btndeliverychk setBackgroundImage:[UIImage imageNamed:@"tick1.png"] forState:UIControlStateSelected];
    
    [btndeliverychk setBackgroundImage:[UIImage imageNamed:@"tick1.png"] forState:UIControlStateHighlighted];
    
    //estimated day arrow
  
    [btnestimateddayarrow setBackgroundImage:[UIImage imageNamed:@"down-arrow2.png"] forState:UIControlStateNormal];
    [btnestimateddayarrow setBackgroundImage:[UIImage imageNamed:@"down-arrow4.png"] forState:UIControlStateSelected];
    [btnestimateddayarrow setBackgroundImage:[UIImage imageNamed:@"down-arrow4.png"] forState:UIControlStateHighlighted];
    
    //city  arrow
  
    [btncityarrow setBackgroundImage:[UIImage imageNamed:@"down-arrow2.png"] forState:UIControlStateNormal];
    [btncityarrow setBackgroundImage:[UIImage imageNamed:@"down-arrow4.png"] forState:UIControlStateSelected];
    [btncityarrow setBackgroundImage:[UIImage imageNamed:@"down-arrow4.png"] forState:UIControlStateHighlighted];
    
    [btnradioperjob setBackgroundImage:[UIImage imageNamed:@"rediobutton1.png"] forState:UIControlStateNormal];
    
    [btnradioperjob setBackgroundImage:[UIImage imageNamed:@"rediobutton2.png"] forState:UIControlStateSelected];
    
    [btnradioperjob setBackgroundImage:[UIImage imageNamed:@"rediobutton2.png"] forState:UIControlStateHighlighted];
    [btnradioperhour setBackgroundImage:[UIImage imageNamed:@"rediobutton1.png"] forState:UIControlStateNormal];
    
    [btnradioperhour setBackgroundImage:[UIImage imageNamed:@"rediobutton2.png"] forState:UIControlStateSelected];
    
    [btnradioperhour setBackgroundImage:[UIImage imageNamed:@"rediobutton2.png"] forState:UIControlStateHighlighted];
    
    //pay arrow
   
    [btnpayarrow setBackgroundImage:[UIImage imageNamed:@"down-arrow2.png"] forState:UIControlStateNormal];
    [btnpayarrow setBackgroundImage:[UIImage imageNamed:@"down-arrow4.png"] forState:UIControlStateSelected];
    [btnpayarrow setBackgroundImage:[UIImage imageNamed:@"down-arrow4.png"] forState:UIControlStateHighlighted];
    
    //contactor pay arrow
   
    [btncontractpayarrow setBackgroundImage:[UIImage imageNamed:@"down-arrow2.png"] forState:UIControlStateNormal];
    [btncontractpayarrow setBackgroundImage:[UIImage imageNamed:@"down-arrow4.png"] forState:UIControlStateSelected];
    [btncontractpayarrow setBackgroundImage:[UIImage imageNamed:@"down-arrow4.png"] forState:UIControlStateHighlighted];
    
    //repeat task arrow
  
    [btnrepeattaskarrow setBackgroundImage:[UIImage imageNamed:@"down-arrow2.png"] forState:UIControlStateNormal];
    [btnrepeattaskarrow setBackgroundImage:[UIImage imageNamed:@"down-arrow4.png"] forState:UIControlStateSelected];
    [btnrepeattaskarrow setBackgroundImage:[UIImage imageNamed:@"down-arrow4.png"] forState:UIControlStateHighlighted];
    
    //task desc arrow button
    [btntaskdescarrow setBackgroundImage:[UIImage imageNamed:@"uparrow.png"] forState:UIControlStateNormal];
    
    [btntaskdescarrow setBackgroundImage:[UIImage imageNamed:@"down-arrow.png"] forState:UIControlStateSelected];
    
    [btntaskdescarrow setBackgroundImage:[UIImage imageNamed:@"down-arrow.png"] forState:UIControlStateHighlighted];
  
    
    //task location arrow button
    [btntasklocationarrow setBackgroundImage:[UIImage imageNamed:@"uparrow.png"] forState:UIControlStateNormal];
    
    [btntasklocationarrow setBackgroundImage:[UIImage imageNamed:@"down-arrow.png"] forState:UIControlStateSelected];
    
    [btntasklocationarrow setBackgroundImage:[UIImage imageNamed:@"down-arrow.png"] forState:UIControlStateHighlighted];
   

    
       [btndeadlinearrow setBackgroundImage:[UIImage imageNamed:@"uparrow.png"] forState:UIControlStateNormal];
    
    [btndeadlinearrow setBackgroundImage:[UIImage imageNamed:@"down-arrow.png"] forState:UIControlStateSelected];
    
    [btndeadlinearrow setBackgroundImage:[UIImage imageNamed:@"down-arrow.png"] forState:UIControlStateHighlighted];
   
    
    //price arrow button
    [btnpricearrow setBackgroundImage:[UIImage imageNamed:@"uparrow.png"] forState:UIControlStateNormal];
    
    [btnpricearrow setBackgroundImage:[UIImage imageNamed:@"down-arrow.png"] forState:UIControlStateSelected];
    
    [btnpricearrow setBackgroundImage:[UIImage imageNamed:@"down-arrow.png"] forState:UIControlStateHighlighted];
    
    
    
    
    //radio button individual or business
  
    [btnradioindiv setBackgroundImage:[UIImage imageNamed:@"rediobutton1.png"] forState:UIControlStateNormal];
    
    [btnradioindiv setBackgroundImage:[UIImage imageNamed:@"rediobutton2.png"] forState:UIControlStateSelected];
    
    [btnradioindiv setBackgroundImage:[UIImage imageNamed:@"rediobutton2.png"] forState:UIControlStateHighlighted];
    [btnradiobusi setBackgroundImage:[UIImage imageNamed:@"rediobutton1.png"] forState:UIControlStateNormal];
    
    [btnradiobusi setBackgroundImage:[UIImage imageNamed:@"rediobutton2.png"] forState:UIControlStateSelected];
    
    [btnradiobusi setBackgroundImage:[UIImage imageNamed:@"rediobutton2.png"] forState:UIControlStateHighlighted];
    
    [btnindividual setBackgroundImage:[UIImage imageNamed:@"bg1.png"] forState:UIControlStateNormal];
    
    [btnindividual setBackgroundImage:[UIImage imageNamed:@"bg3.png"] forState:UIControlStateSelected];
    
    [btnindividual setBackgroundImage:[UIImage imageNamed:@"bg3.png"] forState:UIControlStateHighlighted];
}

-(void)NewOrEditTask
{
    if (taskfilled==NO)
    {
        NSUserDefaults *prefs = [NSUserDefaults standardUserDefaults];
        txttaskname.text=[prefs valueForKey:@"taskname"];
      //  lblno.text=@"1";
      //  lbltaskrequire.text=@"REQUIREMENT";
        
        //task header requirement head
        if (userid == nil || [userid isEqualToString:@""])
        {
           //4 steps---1.requirement 2. login 3. review 4. payment --now requirement
            taskreview3View.hidden=YES;
            taskreviewView.hidden=YES;
            TaskRequirementView.hidden=NO;
            TaskRequirementView.frame=CGRectMake(TaskRequirementView.frame.origin.x
                                                 , 0, TaskRequirementView.frame.size.width, TaskRequirementView.frame.size.height);
            
        }
        else
        {
            
            NSUserDefaults *prefs = [NSUserDefaults standardUserDefaults];
            NSString *paystatus=[prefs valueForKey:@"paymentstatus"];
            if ([paystatus isEqualToString:@"1"])
            {
                //2 steps  1.requirement 2.  review --now requirement
                taskreview3View.hidden=YES;
                taskreviewView.hidden=YES;
                TaskRequirementView.hidden=NO;
                TaskRequirementView.frame=CGRectMake(TaskRequirementView.frame.origin.x
                                                     , 0, TaskRequirementView.frame.size.width, TaskRequirementView.frame.size.height);
                threeView.hidden=YES;
                fourView.hidden=YES;
            }
            else if ([paystatus isEqualToString:@"0"])
            {
                //3 steps  1.requirement 2. review 3. payment --now requirement
                taskreview3View.hidden=YES;
                taskreviewView.hidden=YES;
                TaskRequirementView.hidden=NO;
                TaskRequirementView.frame=CGRectMake(TaskRequirementView.frame.origin.x
                                                     , 0, TaskRequirementView.frame.size.width, TaskRequirementView.frame.size.height);
                fourView.hidden=YES;
                
            }
        }
        
        [self deleteDocDirectory];
    }
    else if (taskfilled==YES)
    {
        //task header review head
        if (userid == nil || [userid isEqualToString:@""])
        {
            //never be this branch because if task is filled, it already signed in
            
            
        }
        else
        {
            if (fromNewOrExisting==YES)
            {
                NSUserDefaults *prefs = [NSUserDefaults standardUserDefaults];
                NSString *paystatus=[prefs valueForKey:@"paymentstatus"];
                if ([paystatus isEqualToString:@"1"])
                {
                    //2 steps  1.requirement 2. review --now review
                    taskreviewView.hidden=YES;
                    TaskRequirementView.hidden=YES;
                    taskreview3View.hidden=NO;
                    taskreview3View.frame=CGRectMake(taskreview3View.frame.origin.x
                                                     , 0, taskreview3View.frame.size.width, taskreview3View.frame.size.height);
                   fourviewReview.hidden=YES;
                }
                else if ([paystatus isEqualToString:@"0"])
                {
                     //4 steps  1.requirement 2. login 3. review 4. payment --now review
                    NSLog(@"payment status=%@",paystatus);
                    
                    taskreviewView.hidden=YES;
                    TaskRequirementView.hidden=YES;
                    taskreview3View.hidden=NO;
                    taskreview3View.frame=CGRectMake(taskreview3View.frame.origin.x
                                                    , 0, taskreview3View.frame.size.width, taskreview3View.frame.size.height);
                    fourviewReview.hidden=NO;
                }
            }
            else
            {
                NSUserDefaults *prefs = [NSUserDefaults standardUserDefaults];
                NSString *paystatus=[prefs valueForKey:@"paymentstatus"];
                if ([paystatus isEqualToString:@"1"])
                {
                   //2 steps  1.requirement 2. review  --now review
                   taskreview3View.hidden=YES;
                    taskreviewView.hidden=NO;
                    TaskRequirementView.hidden=YES;
                    taskreviewView.frame=CGRectMake(taskreviewView.frame.origin.x
                                                    , 0, taskreviewView.frame.size.width, taskreviewView.frame.size.height);
                    threeViewReview.hidden=YES;
                }
                else if ([paystatus isEqualToString:@"0"])
                {
                    NSLog(@"payment status=%@",paystatus);
                    //3 steps  1.requirement 2.  review 3. payment --now review
                    taskreview3View.hidden=YES;
                    taskreviewView.hidden=NO;
                    TaskRequirementView.hidden=YES;
                    taskreviewView.frame=CGRectMake(taskreviewView.frame.origin.x
                                                    , 0, taskreviewView.frame.size.width, taskreviewView.frame.size.height);
                    threeViewReview.hidden=NO;
                }

            }
            
        }
        
        btnsignup.hidden=YES;
        [btnsignin setTitle:@"Sign Out" forState:UIControlStateNormal];
        
        /*
        fourView.frame=CGRectMake(Twoview.frame.origin.x, fourView.frame.origin.y, fourView.frame.size.width, fourView.frame.size.height);
         NSUserDefaults *prefs1 = [NSUserDefaults standardUserDefaults];
        if ([[prefs1 valueForKey:@"paymentstatus"] isEqualToString:@"1"])
        {
            threeView.hidden=YES;
        }
        else
        {
            threeView.hidden=NO;
        }
        Twoview.frame=CGRectMake(self.view.frame.origin.x+10, Twoview.frame.origin.y, Twoview.frame.size.width, Twoview.frame.size.height);
        lbltwo.text=@"1";
        threeView.frame=CGRectMake(Twoview.frame.origin.x+Twoview.frame.size.width+14, threeView.frame.origin.y, threeView.frame.size.width, threeView.frame.size.height);
        lblthree.text=@"2";
         lblno.frame=CGRectMake(lblno.frame.origin.x+30, lblno.frame.origin.y, lblno.frame.size.width, lblno.frame.size.height);
         lbltasktop.frame=CGRectMake(lbltasktop.frame.origin.x+30, lbltasktop.frame.origin.y, lbltasktop.frame.size.width, lbltasktop.frame.size.height);
        lbltaskrequire.frame=CGRectMake(lbltaskrequire.frame.origin.x+30, lbltaskrequire.frame.origin.y, lbltaskrequire.frame.size.width, lbltaskrequire.frame.size.height);
        lblno.text=@"3";
        lbltaskrequire.text=@"REVIEW";
         */
        txtphoto.placeholder=@"";
        
        //fetch task value from user default
        NSUserDefaults *prefs = [NSUserDefaults standardUserDefaults];
        NSLog(@"detail=%@",[prefs valueForKey:@"taskdetaildic"]);
        txtvwtaskdesc.text=[[prefs valueForKey:@"taskdetaildic"] valueForKey:@"taskdesc"];
        txttaskname.text=[[prefs valueForKey:@"taskdetaildic"] valueForKey:@"taskname"];
        if([[[prefs valueForKey:@"taskdetaildic"] valueForKey:@"individual"] isEqualToString:@"individual"])
        {
            btnradioindiv.selected=YES;
            btnradiobusi.selected=NO;
            btnindividual.selected=YES;
            btnbusiness.selected=NO;
            
        }
        else if([[[prefs valueForKey:@"taskdetaildic"] valueForKey:@"individual"] isEqualToString:@"business"])
        {
            NSLog(@"business selected");
            btnradioindiv.selected=NO;
            btnradiobusi.selected=YES;
            btnbusiness.selected=YES;
            btnindividual.selected=NO;

        }
        txtday.text=[[prefs valueForKey:@"taskdetaildic"] valueForKey:@"estimatedday"];
        txttime.text=[[prefs valueForKey:@"taskdetaildic"] valueForKey:@"estimatedtime"];
        if([[[prefs valueForKey:@"taskdetaildic"] valueForKey:@"donebyphone"] isEqualToString:@"phone"])
        {
            btnphtick.selected=YES;
            
        }
        else if([[[prefs valueForKey:@"taskdetaildic"] valueForKey:@"donebyphone"] isEqualToString:@"online"])
        {
            btnphtick.selected=NO;
            
        }
        if([[[prefs valueForKey:@"taskdetaildic"] valueForKey:@"vehicle"] isEqualToString:@"yes"])
        {
            btnvehicletick.selected=YES;
            
        }
        else if([[[prefs valueForKey:@"taskdetaildic"] valueForKey:@"vehicle"] isEqualToString:@"no"])
        {
            btnvehicletick.selected=NO;
            
        }
        if([[[prefs valueForKey:@"taskdetaildic"] valueForKey:@"nobid"] isEqualToString:@"yes"])
        {
            btnbidtick.selected=YES;
            
        }
        else if([[[prefs valueForKey:@"taskdetaildic"] valueForKey:@"nobid"] isEqualToString:@"no"])
        {
            btnbidtick.selected=NO;
            
        }
        if([[[prefs valueForKey:@"taskdetaildic"] valueForKey:@"delivery"] isEqualToString:@"yes"])
        {
            btndeliverychk.selected=YES;
            [deliveryview setHidden:NO];
            lbldroplocation.hidden=YES;
            //mainscroll and location view side increase
            mainscroll.contentSize = CGSizeMake(0, mainscroll.contentSize.height+deliveryview.frame.size.height+5);
            tasklocationview.frame=CGRectMake(tasklocationview.frame.origin.x, tasklocationview.frame.origin.y, tasklocationview.frame.size.width, tasklocationview.frame.size.height+deliveryview.frame.size.height+5);
            tasklocationmainview.frame=CGRectMake(tasklocationmainview.frame.origin.x, tasklocationmainview.frame.origin.y, tasklocationmainview.frame.size.width, tasklocationmainview.frame.size.height+deliveryview.frame.size.height+5);
            deliveryview.frame=CGRectMake(txtpcode.frame.origin.x-7, btndeliverychk.frame.origin.y+btndeliverychk.frame.size.height+5, deliveryview.frame.size.width,deliveryview.frame.size.height);
            [tasklocationview addSubview:deliveryview];
            
            //deadlineview goes down
            deadlinetopimg.frame = CGRectMake( deadlinetopimg.frame.origin.x, tasklocationview.frame.origin.y+tasklocationview.frame.size.height+2, deadlinetopimg.frame.size.width, deadlinetopimg.frame.size.height);
            btndeadlinearrow.frame = CGRectMake( btndeadlinearrow.frame.origin.x, deadlinetopimg.frame.origin.y+17, btndeadlinearrow.frame.size.width, btndeadlinearrow.frame.size.height);
            btndeadlineextra.frame = CGRectMake( btndeadlineextra.frame.origin.x, deadlinetopimg.frame.origin.y, btndeadlineextra.frame.size.width, btndeadlineextra.frame.size.height);
            lbldeadline.frame = CGRectMake( lbldeadline.frame.origin.x, deadlinetopimg.frame.origin.y+15, lbldeadline.frame.size.width, lbldeadline.frame.size.height);
            deadlineview.frame=CGRectMake(deadlineview.frame.origin.x, deadlinetopimg.frame.origin.y+deadlinetopimg.frame.size.height, deadlineview.frame.size.width, deadlineview.frame.size.height);
            
            //priceview goes down
            pricetopimg.frame = CGRectMake( pricetopimg.frame.origin.x, deadlineview.frame.origin.y+deadlineview.frame.size.height, pricetopimg.frame.size.width, pricetopimg.frame.size.height);
            btnpricearrow.frame = CGRectMake( btnpricearrow.frame.origin.x, pricetopimg.frame.origin.y+17, btnpricearrow.frame.size.width, btnpricearrow.frame.size.height);
            btnpriceextra.frame = CGRectMake( btnpriceextra.frame.origin.x, pricetopimg.frame.origin.y, btnpriceextra.frame.size.width, btnpriceextra.frame.size.height);
            lblprice.frame = CGRectMake( lblprice.frame.origin.x, pricetopimg.frame.origin.y+15, lblprice.frame.size.width, lblprice.frame.size.height);
            priceview.frame = CGRectMake( priceview.frame.origin.x, pricetopimg.frame.origin.y+pricetopimg.frame.size.height, priceview.frame.size.width, priceview.frame.size.height);
            
        }
        else if([[[prefs valueForKey:@"taskdetaildic"] valueForKey:@"delivery"] isEqualToString:@"no"])
        {
            btndeliverychk.selected=NO;
            
        }
        
        txtrepeattask.text=[[prefs valueForKey:@"taskdetaildic"] valueForKey:@"repeattask"];
        txtvwaddress.text=[[prefs valueForKey:@"taskdetaildic"] valueForKey:@"address"];
        txtcity.text=[[prefs valueForKey:@"taskdetaildic"] valueForKey:@"city"];
        txtprovince.text=[[prefs valueForKey:@"taskdetaildic"] valueForKey:@"province"];
        txtpcode.text=[[prefs valueForKey:@"taskdetaildic"] valueForKey:@"pcode"];
        txtdroplocation.text=[[prefs valueForKey:@"taskdetaildic"] valueForKey:@"droplocation"];
        NSNumber *num=[[prefs valueForKey:@"taskdetaildic"] valueForKey:@"imagecount"];
        NSLog(@"image count num=%@",num);
        imgcount=[num integerValue];
        NSLog(@"image count=%ld",(long)imgcount);
        if([[[prefs valueForKey:@"taskdetaildic"] valueForKey:@"perjob"] isEqualToString:@"yes"])
        {
            btnradioperjob.selected=YES;
            btnradioperhour.selected=NO;
            btnperjob.selected=YES;
            btnperhour.selected=NO;
            
        }
        else if([[[prefs valueForKey:@"taskdetaildic"] valueForKey:@"perjob"] isEqualToString:@"no"])
        {
            btnradioperjob.selected=NO;
            btnradioperhour.selected=YES;
            btnperjob.selected=NO;
            btnperhour.selected=YES;
        }
        
        txtperjob.text=[[prefs valueForKey:@"taskdetaildic"] valueForKey:@"payamt"];
        txtcontractorpay.text=[[prefs valueForKey:@"taskdetaildic"] valueForKey:@"contractorpay"];
        
        lblbiddt.text=[[[prefs valueForKey:@"taskdetaildic"] valueForKey:@"bidclosedt"] substringWithRange:NSMakeRange(0, 2)];
        lblbidmonth.text=[[[prefs valueForKey:@"taskdetaildic"] valueForKey:@"bidclosedt"] substringWithRange:NSMakeRange(2, 2)];
        lblbidyr.text=[[[prefs valueForKey:@"taskdetaildic"] valueForKey:@"bidclosedt"] substringWithRange:NSMakeRange(4, 4)];
        lblbidtime.text=[[[prefs valueForKey:@"taskdetaildic"] valueForKey:@"bidclosedt"] substringWithRange:NSMakeRange(8, 7)];
        
        lbltaskdt.text=[[[prefs valueForKey:@"taskdetaildic"] valueForKey:@"taskcompletedt"] substringWithRange:NSMakeRange(0, 2)];
        lbltaskmonth.text=[[[prefs valueForKey:@"taskdetaildic"] valueForKey:@"taskcompletedt"] substringWithRange:NSMakeRange(2, 2)];
        lbltaskyr.text=[[[prefs valueForKey:@"taskdetaildic"] valueForKey:@"taskcompletedt"] substringWithRange:NSMakeRange(4, 4)];
        lbltasktime.text=[[[prefs valueForKey:@"taskdetaildic"] valueForKey:@"taskcompletedt"] substringWithRange:NSMakeRange(8, 7)];
        
        biddatetime=[[prefs valueForKey:@"taskdetaildic"] valueForKey:@"bidclosedt"];
        taskclsdatetime=[[prefs valueForKey:@"taskdetaildic"] valueForKey:@"taskcompletedt"];
        
        btntaskcompdt.userInteractionEnabled=NO;
        //  btntaskdescarrow.enabled=NO;
        //   btntasklocationarrow.enabled=NO;
        //   btntasklocationextra.enabled=NO;
        btntime.userInteractionEnabled=NO;
        btnvehicletick.userInteractionEnabled=NO;
        btnrepeattaskarrow.userInteractionEnabled=NO;
        btnradioperjob.userInteractionEnabled=NO;
        btnradioperhour.userInteractionEnabled=NO;
        
        //    btnpriceextra.enabled=NO;
        //     btnpricearrow.enabled=NO;
        btnphtick.userInteractionEnabled=NO;
        btnperjob.userInteractionEnabled=NO;
        btnperhour.userInteractionEnabled=NO;
        btnpaysave.userInteractionEnabled=NO;
        btnpayarrow.userInteractionEnabled=NO;
        btnindividual.userInteractionEnabled=NO;
        btnestimateddayarrow.userInteractionEnabled=NO;
        btndtsave.userInteractionEnabled=NO;
        btndtcompsave.userInteractionEnabled=NO;
        btndeliverychk.userInteractionEnabled=NO;
        btndeliveryextra.userInteractionEnabled=NO;
        //      btndeadlineextra.enabled=NO;
        //       btndeadlinearrow.enabled=NO;
        btncontractpayarrow.userInteractionEnabled=NO;
        btncontactpaysave.userInteractionEnabled=NO;
        btncityarrow.userInteractionEnabled=NO;
        btnbusiness.userInteractionEnabled=NO;
        btnbidtick.userInteractionEnabled=NO;
        btnbidclosedeadline1.userInteractionEnabled=NO;
        btnbidclosedeadline.userInteractionEnabled=NO;
        btnradiobusi.userInteractionEnabled=NO;
        btnradioindiv.userInteractionEnabled=NO;
        btnradioperhour.userInteractionEnabled=NO;
        btnradioperjob.userInteractionEnabled=NO;
        camerabtn.userInteractionEnabled=NO;
        btnrepeattaskextra.userInteractionEnabled=NO;
        btnday.userInteractionEnabled=NO;
        btnprovinceextra.userInteractionEnabled=NO;
        btnpayamt.userInteractionEnabled=NO;
        btncontractorpayamt.userInteractionEnabled=NO;
        btnvehicle.userInteractionEnabled=NO;
        btndonebyph.userInteractionEnabled=NO;
        btnbid.userInteractionEnabled=NO;
        camerabtnextra.userInteractionEnabled=NO;
        
        txtcity.enabled=NO;
        txtcontractorpay.enabled=NO;
        txtday.enabled=NO;
        txtpcode.enabled=NO;
        txtperjob.enabled=NO;
        //  txtphoto.userInteractionEnabled=NO;
        txtprovince.enabled=NO;
        txtrepeattask.enabled=NO;
        txttaskname.enabled=NO;
        txttime.enabled=NO;
        txtvwaddress.editable=NO;
        txtvwtaskdesc.editable=NO;
        txttaskname.enabled=NO;
        txtdroplocation.editable=NO;
        //set images
        
        
        [arrimage removeAllObjects];
        NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,     NSUserDomainMask, YES);
        
        for (int i=0; i<imgcount; i++)
        {
            NSString *documentsDirectory = [paths objectAtIndex:0];
            NSString *taskimg=[@"taskimage" stringByAppendingString:[NSString stringWithFormat:@"%d", i+1]];
            NSString *taskimg1=[taskimg stringByAppendingString:@".png"];
            NSString *getImagePath = [documentsDirectory stringByAppendingPathComponent:taskimg1];
            UIImage *tskimg = [UIImage imageWithContentsOfFile:getImagePath];
            [arrimage addObject:tskimg];
            
            
            
        }
        NSLog(@"arr image=%@",arrimage);
        
        NSString *documentsDirectory = [paths objectAtIndex:0];
        NSString *getImagePath = [documentsDirectory stringByAppendingPathComponent:@"taskimage1.png"];
        UIImage *tskimg = [UIImage imageWithContentsOfFile:getImagePath];
        addedimg.image=tskimg;
        addedimg.contentMode=UIViewContentModeScaleAspectFit;
        
        NSString *getImagePath1 = [documentsDirectory stringByAppendingPathComponent:@"taskimage2.png"];
        UIImage *tskimg1 = [UIImage imageWithContentsOfFile:getImagePath1];
        img.image=tskimg1;
        img.contentMode=UIViewContentModeScaleAspectFit;
        
        NSString *getImagePath2 = [documentsDirectory stringByAppendingPathComponent:@"taskimage3.png"];
        UIImage *tskimg2 = [UIImage imageWithContentsOfFile:getImagePath2];
        img1.image=tskimg2;
        img1.contentMode=UIViewContentModeScaleAspectFit;
        
        
        
        //edit view
        editview.frame=CGRectMake(pricemainview.frame.origin.x, txtcontractorpay.frame.origin.y + txtcontractorpay.frame.size.height, pricemainview.frame.size.width, editview.frame.size.height);
        editview.hidden=NO;
        [pricemainview addSubview:editview];
        btnpaydetail.frame = CGRectMake( btnpaydetail.frame.origin.x, editview.frame.origin.y+editview.frame.size.height, btnpaydetail.frame.size.width, btnpaydetail.frame.size.height);
        pricemainview.frame = CGRectMake( pricemainview.frame.origin.x, pricemainview.frame.origin.y, pricemainview.frame.size.width, pricemainview.frame.size.height+editview.frame.size.height);
        priceview.frame = CGRectMake( priceview.frame.origin.x, priceview.frame.origin.y, priceview.frame.size.width, priceview.frame.size.height+editview.frame.size.height);
        mainscroll.contentSize = CGSizeMake(0, mainscroll.contentSize.height+editview.frame.size.height);
        btnagreetick.selected=NO;
        imgagreetick.image=[UIImage imageNamed:@"tick2"];
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
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    if (tableView==estimatedaytable)
    {
        return arrday.count;
    }
    else if (tableView==estimatetimetable)
    {
        return arrtime.count;
    }
    else if (tableView==citytable)
    {
        return arrcity.count;
    }
    else if (tableView==repeattasktable)
    {
        return arrrepeattask.count;
    }
    else
    {
        return 0;
    }
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView
                             dequeueReusableCellWithIdentifier:CellIdentifier];
  //  [cell setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"bg3.png"]]];
    
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    if (tableView==estimatedaytable)
    {
        cell.textLabel.text = [arrday objectAtIndex: [indexPath row]];
        cell.textLabel.font=[UIFont fontWithName:@"Helvetica" size:15.0];;
    }
    if (tableView==estimatetimetable)
    {
        cell.textLabel.text = [arrtime objectAtIndex: [indexPath row]];
        cell.textLabel.font=[UIFont fontWithName:@"Helvetica" size:15.0];;
    }

    else if (tableView==citytable)
    {
        cell.textLabel.text = [arrcity objectAtIndex: [indexPath row]];
        cell.textLabel.font=[UIFont fontWithName:@"Helvetica" size:15.0];;
    }
    else if (tableView==repeattasktable)
    {
        cell.textLabel.text = [arrrepeattask objectAtIndex: [indexPath row]];
        cell.textLabel.font=[UIFont fontWithName:@"Helvetica" size:15.0];;
    }
    
    return cell;
    
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (tableView==estimatedaytable)
    {
        txtday.text=[arrday objectAtIndex:indexPath.row];
        [estimatedaytable setHidden:YES];
        [estimatedaytable removeFromSuperview];
        btnestimateddayarrow.selected=NO;
    }
    else if (tableView==estimatetimetable)
    {
        txttime.text=[arrtime objectAtIndex:indexPath.row];
        [estimatetimetable setHidden:YES];
        [estimatetimetable removeFromSuperview];
        btntime.selected=NO;
         [imgtimearrow setImage:[UIImage imageNamed:@"down-arrow2.png"]];
    }
    else if (tableView==citytable)
    {
        txtprovince.text=[arrcity objectAtIndex:indexPath.row];
        [citytable setHidden:YES];
        [citytable removeFromSuperview];
        btncityarrow.selected=NO;
    }
    else if (tableView==repeattasktable)
    {
        txtrepeattask.text=[arrrepeattask objectAtIndex:indexPath.row];
        [repeattasktable setHidden:YES];
        [repeattasktable removeFromSuperview];
        btnrepeattaskarrow.selected=NO;
    }
    
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 30.0;
}
- (IBAction)taskdescarrowclk:(id)sender
{
    NSLog(@"task desc view");
    if (btntaskdescarrow.selected==YES)
    {
        
        [self expandtaskdesc];
    }
    else
    {
        
        [self collapsetaskdesc];
    }
}

- (IBAction)taskdescbtnextraclk:(id)sender {
    NSLog(@"task desc view");
    if (btntaskdescarrow.selected==YES)
    {
        
        [self expandtaskdesc];
    }
    else
    {
        
        [self collapsetaskdesc];
    }
    
}
-(void)expandtaskdesc
{
    [UIView beginAnimations:@"ShowHideView" context:NULL];
    [UIView setAnimationDuration:0.3];
    
    btntaskdescarrow.selected=NO;
    [btntaskdescarrow setBackgroundImage:[UIImage imageNamed:@"uparrow.png"] forState:UIControlStateNormal];
    
    [btntaskdescarrow setBackgroundImage:[UIImage imageNamed:@"down-arrow.png"] forState:UIControlStateSelected];
    
    [btntaskdescarrow setBackgroundImage:[UIImage imageNamed:@"down-arrow.png"] forState:UIControlStateHighlighted];
    [taskdescmainview setHidden:NO];
    [taskdescview setHidden:NO];
    
    //task location view position change
    tasklocationtopimg.frame = CGRectMake( tasklocationtopimg.frame.origin.x, taskdescview.frame.origin.y+taskdescview.frame.size.height+2, tasklocationtopimg.frame.size.width, tasklocationtopimg.frame.size.height);
    btntasklocationarrow.frame = CGRectMake( btntasklocationarrow.frame.origin.x, tasklocationtopimg.frame.origin.y+17, btntasklocationarrow.frame.size.width, btntasklocationarrow.frame.size.height);
    btntasklocationextra.frame = CGRectMake( btntasklocationextra.frame.origin.x, tasklocationtopimg.frame.origin.y, btntasklocationextra.frame.size.width, btntasklocationextra.frame.size.height);
    lbltasklocation.frame = CGRectMake( lbltasklocation.frame.origin.x, tasklocationtopimg.frame.origin.y+17, lbltasklocation.frame.size.width, lbltasklocation.frame.size.height);
    tasklocationview.frame = CGRectMake( tasklocationview.frame.origin.x, tasklocationtopimg.frame.origin.y+tasklocationtopimg.frame.size.height, tasklocationview.frame.size.width, tasklocationview.frame.size.height);
    
    ////deadline view position change
    if (btntasklocationarrow.selected==NO) {
        deadlinetopimg.frame = CGRectMake( deadlinetopimg.frame.origin.x, tasklocationview.frame.origin.y+tasklocationview.frame.size.height+2, deadlinetopimg.frame.size.width, deadlinetopimg.frame.size.height);
    }
    else{
        
        deadlinetopimg.frame = CGRectMake( deadlinetopimg.frame.origin.x, tasklocationview.frame.origin.y+2, deadlinetopimg.frame.size.width, deadlinetopimg.frame.size.height);
    }
    
    btndeadlinearrow.frame = CGRectMake( btndeadlinearrow.frame.origin.x, deadlinetopimg.frame.origin.y+17, btndeadlinearrow.frame.size.width, btndeadlinearrow.frame.size.height);
    btndeadlineextra.frame = CGRectMake( btndeadlineextra.frame.origin.x, deadlinetopimg.frame.origin.y, btndeadlineextra.frame.size.width, btndeadlineextra.frame.size.height);
    lbldeadline.frame = CGRectMake( lbldeadline.frame.origin.x, deadlinetopimg.frame.origin.y+17, lbldeadline.frame.size.width, lbldeadline.frame.size.height);
    deadlineview.frame = CGRectMake( deadlineview.frame.origin.x, deadlinetopimg.frame.origin.y+deadlinetopimg.frame.size.height, deadlineview.frame.size.width, deadlineview.frame.size.height);
    
    //price view position change
    if (btndeadlinearrow.selected==NO) {
        pricetopimg.frame = CGRectMake( pricetopimg.frame.origin.x, deadlineview.frame.origin.y+deadlineview.frame.size.height+2, pricetopimg.frame.size.width, pricetopimg.frame.size.height);
    }
    else
    {
        pricetopimg.frame = CGRectMake( pricetopimg.frame.origin.x, deadlineview.frame.origin.y+2, pricetopimg.frame.size.width, pricetopimg.frame.size.height);
    }
    btnpricearrow.frame = CGRectMake( btnpricearrow.frame.origin.x, pricetopimg.frame.origin.y+17, btnpricearrow.frame.size.width, btnpricearrow.frame.size.height);
    btnpriceextra.frame = CGRectMake( btnpriceextra.frame.origin.x, pricetopimg.frame.origin.y, btnpriceextra.frame.size.width, btnpriceextra.frame.size.height);
    lblprice.frame = CGRectMake( lblprice.frame.origin.x, pricetopimg.frame.origin.y+17, lblprice.frame.size.width, lblprice.frame.size.height);
    priceview.frame = CGRectMake( priceview.frame.origin.x, pricetopimg.frame.origin.y+pricetopimg.frame.size.height, priceview.frame.size.width, priceview.frame.size.height);
    mainscroll.contentSize = CGSizeMake(0, mainscroll.contentSize.height+taskdescview.frame.size.height);
    
     [UIView commitAnimations];
}
-(void)collapsetaskdesc
{
    [UIView beginAnimations:@"ShowHideView" context:NULL];
    [UIView setAnimationDuration:0.3];

    btntaskdescarrow.selected=YES;
    [btntaskdescarrow setBackgroundImage:[UIImage imageNamed:@"uparrow.png"] forState:UIControlStateNormal];
    
    [btntaskdescarrow setBackgroundImage:[UIImage imageNamed:@"down-arrow.png"] forState:UIControlStateSelected];
    
    [btntaskdescarrow setBackgroundImage:[UIImage imageNamed:@"down-arrow.png"] forState:UIControlStateHighlighted];
    [taskdescmainview setHidden:YES];
    [taskdescview setHidden:YES];
    
    //task location view position change
    tasklocationtopimg.frame = CGRectMake( tasklocationtopimg.frame.origin.x, tasklocationtopimg.frame.origin.y-taskdescview.frame.size.height, tasklocationtopimg.frame.size.width, tasklocationtopimg.frame.size.height);
    btntasklocationarrow.frame = CGRectMake( btntasklocationarrow.frame.origin.x, tasklocationtopimg.frame.origin.y+17, btntasklocationarrow.frame.size.width, btntasklocationarrow.frame.size.height);
    btntasklocationextra.frame = CGRectMake( btntasklocationextra.frame.origin.x, tasklocationtopimg.frame.origin.y, btntasklocationextra.frame.size.width, btntasklocationextra.frame.size.height);
    lbltasklocation.frame = CGRectMake( lbltasklocation.frame.origin.x, tasklocationtopimg.frame.origin.y+17, lbltasklocation.frame.size.width, lbltasklocation.frame.size.height);
    tasklocationview.frame = CGRectMake( tasklocationview.frame.origin.x, tasklocationtopimg.frame.origin.y+tasklocationtopimg.frame.size.height, tasklocationview.frame.size.width, tasklocationview.frame.size.height);
    
    //deadline view position change
    if (btntasklocationarrow.selected==NO) {
        
        deadlinetopimg.frame = CGRectMake( deadlinetopimg.frame.origin.x, tasklocationview.frame.origin.y+tasklocationview.frame.size.height+2, deadlinetopimg.frame.size.width, deadlinetopimg.frame.size.height);
    }
    else{
        
        deadlinetopimg.frame = CGRectMake( deadlinetopimg.frame.origin.x, tasklocationview.frame.origin.y+2, deadlinetopimg.frame.size.width, deadlinetopimg.frame.size.height);
        
    }
    
    btndeadlinearrow.frame = CGRectMake( btndeadlinearrow.frame.origin.x, deadlinetopimg.frame.origin.y+17, btndeadlinearrow.frame.size.width, btndeadlinearrow.frame.size.height);
    btndeadlineextra.frame = CGRectMake( btndeadlineextra.frame.origin.x, deadlinetopimg.frame.origin.y, btndeadlineextra.frame.size.width, btndeadlineextra.frame.size.height);
    lbldeadline.frame = CGRectMake( lbldeadline.frame.origin.x, deadlinetopimg.frame.origin.y+17, lbldeadline.frame.size.width, lbldeadline.frame.size.height);
    deadlineview.frame = CGRectMake( deadlineview.frame.origin.x, deadlinetopimg.frame.origin.y+deadlinetopimg.frame.size.height, deadlineview.frame.size.width, deadlineview.frame.size.height);
    
    //price view position change
    if (btndeadlinearrow.selected==NO) {
        pricetopimg.frame = CGRectMake( pricetopimg.frame.origin.x, deadlineview.frame.origin.y+deadlineview.frame.size.height+2, pricetopimg.frame.size.width, pricetopimg.frame.size.height);
    }
    else
    {
        pricetopimg.frame = CGRectMake( pricetopimg.frame.origin.x, deadlineview.frame.origin.y+2, pricetopimg.frame.size.width, pricetopimg.frame.size.height);
    }
    btnpricearrow.frame = CGRectMake( btnpricearrow.frame.origin.x, pricetopimg.frame.origin.y+17, btnpricearrow.frame.size.width, btnpricearrow.frame.size.height);
    btnpriceextra.frame = CGRectMake( btnpriceextra.frame.origin.x, pricetopimg.frame.origin.y, btnpriceextra.frame.size.width, btnpriceextra.frame.size.height);
    lblprice.frame = CGRectMake( lblprice.frame.origin.x, pricetopimg.frame.origin.y+17, lblprice.frame.size.width, lblprice.frame.size.height);
    priceview.frame = CGRectMake( priceview.frame.origin.x, pricetopimg.frame.origin.y+pricetopimg.frame.size.height, priceview.frame.size.width, priceview.frame.size.height);
    mainscroll.contentSize = CGSizeMake(0, mainscroll.contentSize.height-taskdescview.frame.size.height);
    
     [UIView commitAnimations];
}
- (IBAction)signout:(id)sender
{
  /*  NSString *appDomain = [[NSBundle mainBundle] bundleIdentifier];
    [[NSUserDefaults standardUserDefaults] removePersistentDomainForName:appDomain];
    [self.navigationController popViewControllerAnimated:YES];
   */
 /*   NSString *appDomain = [[NSBundle mainBundle] bundleIdentifier];
    [[NSUserDefaults standardUserDefaults] removePersistentDomainForName:appDomain];
    [self deleteDocDirectory];
    ViewController *obj1=[self.storyboard instantiateViewControllerWithIdentifier:@"ViewControllersid"];
    [self.navigationController pushViewController:obj1 animated:YES];
    */
    SignInViewController *obj=[self.storyboard instantiateViewControllerWithIdentifier:@"SignInViewControllersid"];
    [self.navigationController pushViewController:obj animated:YES];
    
}

- (IBAction)txtestimatedayextraclk:(id)sender
{
    [self daytapclk];
}

- (IBAction)phtickbtnextraclk:(id)sender {
    if (btnphtick.selected==YES)
    {
        btnphtick.selected=NO;
    }
    else
    {
        btnphtick.selected=YES;
        
    }
    [btnphtick setBackgroundImage:[UIImage imageNamed:@"tick2.png"] forState:UIControlStateNormal];
    [btnphtick setBackgroundImage:[UIImage imageNamed:@"tick1.png"] forState:UIControlStateSelected];
    [btnphtick setBackgroundImage:[UIImage imageNamed:@"tick1.png"] forState:UIControlStateHighlighted];
}

- (IBAction)vehicletickextraclk:(id)sender {
    if (btnvehicletick.selected==YES)
    {
        btnvehicletick.selected=NO;
    }
    else
    {
        btnvehicletick.selected=YES;
        
    }
    [btnvehicletick setBackgroundImage:[UIImage imageNamed:@"tick2.png"] forState:UIControlStateNormal];
    [btnvehicletick setBackgroundImage:[UIImage imageNamed:@"tick1.png"] forState:UIControlStateSelected];
    [btnvehicletick setBackgroundImage:[UIImage imageNamed:@"tick1.png"] forState:UIControlStateHighlighted];
    
}

- (IBAction)bidtickextraclk:(id)sender {
    if (btnbidtick.selected==YES)
    {
        btnbidtick.selected=NO;
    }
    else
    {
        btnbidtick.selected=YES;
        
    }
    [btnbidtick setBackgroundImage:[UIImage imageNamed:@"tick2.png"] forState:UIControlStateNormal];
    [btnbidtick setBackgroundImage:[UIImage imageNamed:@"tick1.png"] forState:UIControlStateSelected];
    [btnbidtick setBackgroundImage:[UIImage imageNamed:@"tick1.png"] forState:UIControlStateHighlighted];
    
}

- (IBAction)repeattaskclk:(id)sender {
    if (btnrepeattaskarrow.selected==NO)
    {
        btnrepeattaskarrow.selected=YES;
        
       
        [viewrepeattask removeFromSuperview];
        [viewtime removeFromSuperview];
         [viewday removeFromSuperview];
        [repeattaskpicker removeFromSuperview];
        [btnrepeatsave removeFromSuperview];
        
        viewrepeattask=[[UIView alloc]initWithFrame:CGRectMake(self.view.frame.origin.x, self.view.frame.origin.y, self.view.frame.size.width,self.view.frame.size.height)];
    //    viewrepeattask=[[UIView alloc]initWithFrame:CGRectMake(self.view.frame.origin.x, self.view.frame.size.height-200, self.view.frame.size.width,200)];
        [viewrepeattask setBackgroundColor:[[UIColor blackColor]colorWithAlphaComponent:0.8]];
        [self.view addSubview:viewrepeattask];
        
      repeattaskpicker=[[UIPickerView alloc]initWithFrame:CGRectMake(self.view.frame.size.width/2-125, 180, 250,150)];
   //     repeattaskpicker=[[UIPickerView alloc]initWithFrame:CGRectMake(self.view.frame.origin.x,50, self.view.frame.size.width,150)];
        [repeattaskpicker setBackgroundColor:[UIColor whiteColor]];
//    [repeattaskpicker setBackgroundColor:[UIColor colorWithRed:35 green:154 blue:242 alpha:1.0]];
        repeattaskpicker.delegate=self;
        repeattaskpicker.dataSource=self;
        [viewrepeattask addSubview:repeattaskpicker];
        
        btnrepeatsave=[[UIButton alloc] initWithFrame:CGRectMake(repeattaskpicker.frame.origin.x+repeattaskpicker.frame.size.width-50, repeattaskpicker.frame.origin.y-50, 50, 50)];
  //      btnrepeatsave=[[UIButton alloc] initWithFrame:CGRectMake(repeattaskpicker.frame.origin.x+repeattaskpicker.frame.size.width-50,0, 50, 50)];
        //   btncontactpaysave = [UIButton buttonWithType:UIButtonTypeCustom];
        [btnrepeatsave setTitle:@"Save" forState:UIControlStateNormal];
        btnrepeatsave.backgroundColor = [UIColor clearColor];
        [btnrepeatsave setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal ];
        btnrepeatsave.titleLabel.font = [UIFont fontWithName:@"OpenSans-Semibold" size:14.0];
        [btnrepeatsave addTarget:self action:@selector(repeatpickerChange) forControlEvents:UIControlEventTouchUpInside];
        [viewrepeattask addSubview:btnrepeatsave];
        
        btnrepeatcancel=[[UIButton alloc] initWithFrame:CGRectMake(repeattaskpicker.frame.origin.x, repeattaskpicker.frame.origin.y-50, 50, 50)];
        //      btnrepeatsave=[[UIButton alloc] initWithFrame:CGRectMake(repeattaskpicker.frame.origin.x+repeattaskpicker.frame.size.width-50,0, 50, 50)];
        //   btncontactpaysave = [UIButton buttonWithType:UIButtonTypeCustom];
        [btnrepeatcancel setTitle:@"Cancel" forState:UIControlStateNormal];
        btnrepeatcancel.backgroundColor = [UIColor clearColor];
        [btnrepeatcancel setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal ];
        btnrepeatcancel.titleLabel.font = [UIFont fontWithName:@"OpenSans-Semibold" size:14.0];
        [btnrepeatcancel addTarget:self action:@selector(repeatpickerCancel) forControlEvents:UIControlEventTouchUpInside];
        [viewrepeattask addSubview:btnrepeatcancel];
     /*
        [repeattasktable removeFromSuperview];
        repeattasktable=[[UITableView alloc]initWithFrame:CGRectMake(txtrepeattask.frame.origin.x, txtrepeattask.frame.origin.y+txtrepeattask.frame.size.height, txtrepeattask.frame.size.width+30,50)];
        repeattasktable.delegate=self;
        repeattasktable.dataSource=self;
        repeattasktable.separatorStyle=NO;
        repeattasktable.userInteractionEnabled=YES;
        [repeattasktable reloadData];
        [taskdescmainview addSubview:repeattasktable];
      */
    }
    else
    {
        btnrepeattaskarrow.selected=NO;
        [self viewremove];
      //  [repeattasktable removeFromSuperview];
    }
    [btnrepeattaskarrow setBackgroundImage:[UIImage imageNamed:@"down-arrow2.png"] forState:UIControlStateNormal];
    [btnrepeattaskarrow setBackgroundImage:[UIImage imageNamed:@"down-arrow4.png"] forState:UIControlStateSelected];
    [btnrepeattaskarrow setBackgroundImage:[UIImage imageNamed:@"down-arrow4.png"] forState:UIControlStateHighlighted];
}
-(void)repeatpickerCancel
{
    btnrepeattaskarrow.selected=NO;
    [self viewremove];
  
 [btnrepeattaskarrow setBackgroundImage:[UIImage imageNamed:@"down-arrow2.png"] forState:UIControlStateNormal];
[btnrepeattaskarrow setBackgroundImage:[UIImage imageNamed:@"down-arrow4.png"] forState:UIControlStateSelected];
[btnrepeattaskarrow setBackgroundImage:[UIImage imageNamed:@"down-arrow4.png"] forState:UIControlStateHighlighted];
}



- (IBAction)btnindividualclk:(id)sender {
    
    if (btnindividual.selected==YES)
    {
        
        
    }
    else
    {
        //individual button selected
        btnindividual.selected=YES;
        btnradioindiv.selected=YES;
        [btnindividual setBackgroundImage:[UIImage imageNamed:@"bg1.png"] forState:UIControlStateNormal];
        
        [btnindividual setBackgroundImage:[UIImage imageNamed:@"bg3.png"] forState:UIControlStateSelected];
        
        [btnindividual setBackgroundImage:[UIImage imageNamed:@"bg3.png"] forState:UIControlStateHighlighted];
        
        [btnradioindiv setBackgroundImage:[UIImage imageNamed:@"rediobutton1.png"] forState:UIControlStateNormal];
        
        [btnradioindiv setBackgroundImage:[UIImage imageNamed:@"rediobutton2.png"] forState:UIControlStateSelected];
        
        [btnradioindiv setBackgroundImage:[UIImage imageNamed:@"rediobutton2.png"] forState:UIControlStateHighlighted];
        
        
        //business button reset
        btnbusiness.selected=NO;
        btnradiobusi.selected=NO;
        [btnbusiness setBackgroundImage:[UIImage imageNamed:@"bg1.png"] forState:UIControlStateNormal];
        
        [btnbusiness setBackgroundImage:[UIImage imageNamed:@"bg3.png"] forState:UIControlStateSelected];
        
        [btnbusiness setBackgroundImage:[UIImage imageNamed:@"bg3.png"] forState:UIControlStateHighlighted];
        
        [btnradiobusi setBackgroundImage:[UIImage imageNamed:@"rediobutton1.png"] forState:UIControlStateNormal];
        
        [btnradiobusi setBackgroundImage:[UIImage imageNamed:@"rediobutton2.png"] forState:UIControlStateSelected];
        
        [btnradiobusi setBackgroundImage:[UIImage imageNamed:@"rediobutton2.png"] forState:UIControlStateHighlighted];
    }
}


- (IBAction)btnbusinessclk:(id)sender {
    
    
    if (btnbusiness.selected==YES)
    {
        
        
    }
    else
    {
        //business button selected
        btnbusiness.selected=YES;
        btnradiobusi.selected=YES;
        
        [btnbusiness setBackgroundImage:[UIImage imageNamed:@"bg1.png"] forState:UIControlStateNormal];
        [btnbusiness setBackgroundImage:[UIImage imageNamed:@"bg3.png"] forState:UIControlStateSelected];
        
        [btnbusiness setBackgroundImage:[UIImage imageNamed:@"bg3.png"] forState:UIControlStateHighlighted];
        
        [btnradiobusi setBackgroundImage:[UIImage imageNamed:@"rediobutton1.png"] forState:UIControlStateNormal];
        
        [btnradiobusi setBackgroundImage:[UIImage imageNamed:@"rediobutton2.png"] forState:UIControlStateSelected];
        
        [btnradiobusi setBackgroundImage:[UIImage imageNamed:@"rediobutton2.png"] forState:UIControlStateHighlighted];
        
        
        //individual button reset
        btnindividual.selected=NO;
        btnradioindiv.selected=NO;
        [btnindividual setBackgroundImage:[UIImage imageNamed:@"bg1.png"] forState:UIControlStateNormal];
        [btnindividual setBackgroundImage:[UIImage imageNamed:@"bg3.png"] forState:UIControlStateSelected];
        
        [btnindividual setBackgroundImage:[UIImage imageNamed:@"bg3.png"] forState:UIControlStateHighlighted];
        
        [btnradioindiv setBackgroundImage:[UIImage imageNamed:@"rediobutton1.png"] forState:UIControlStateNormal];
        
        [btnradioindiv setBackgroundImage:[UIImage imageNamed:@"rediobutton2.png"] forState:UIControlStateSelected];
        
        [btnradioindiv setBackgroundImage:[UIImage imageNamed:@"rediobutton2.png"] forState:UIControlStateHighlighted];
    }
    
}


- (IBAction)repeattaskextra:(id)sender {
    if (btnrepeattaskarrow.selected==NO)
    {
        btnrepeattaskarrow.selected=YES;
        
        
        [self viewremove];
        
        viewrepeattask=[[UIView alloc]initWithFrame:CGRectMake(self.view.frame.origin.x, self.view.frame.origin.y, self.view.frame.size.width,self.view.frame.size.height)];
    //    viewrepeattask=[[UIView alloc]initWithFrame:CGRectMake(self.view.frame.origin.x, self.view.frame.size.height-200, self.view.frame.size.width,200)];
        [viewrepeattask setBackgroundColor:[[UIColor blackColor]colorWithAlphaComponent:0.8]];
        [self.view addSubview:viewrepeattask];
        
         repeattaskpicker=[[UIPickerView alloc]initWithFrame:CGRectMake(self.view.frame.size.width/2-125, 180, 250,150)];
   //     repeattaskpicker=[[UIPickerView alloc]initWithFrame:CGRectMake(self.view.frame.origin.x,50, self.view.frame.size.width,150)];
        [repeattaskpicker setBackgroundColor:[UIColor whiteColor]];
        
        repeattaskpicker.delegate=self;
        repeattaskpicker.dataSource=self;
        [viewrepeattask addSubview:repeattaskpicker];
        
       btnrepeatsave=[[UIButton alloc] initWithFrame:CGRectMake(repeattaskpicker.frame.origin.x+repeattaskpicker.frame.size.width-50, repeattaskpicker.frame.origin.y-50, 50, 50)];
   //     btnrepeatsave=[[UIButton alloc] initWithFrame:CGRectMake(repeattaskpicker.frame.origin.x+repeattaskpicker.frame.size.width-50,0, 50, 50)];
        //   btncontactpaysave = [UIButton buttonWithType:UIButtonTypeCustom];
        [btnrepeatsave setTitle:@"Save" forState:UIControlStateNormal];
        btnrepeatsave.backgroundColor = [UIColor clearColor];
        [btnrepeatsave setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal ];
        btnrepeatsave.titleLabel.font = [UIFont fontWithName:@"OpenSans-Semibold" size:14.0];
        [btnrepeatsave addTarget:self action:@selector(repeatpickerChange) forControlEvents:UIControlEventTouchUpInside];
        [viewrepeattask addSubview:btnrepeatsave];
        
        btnrepeatcancel=[[UIButton alloc] initWithFrame:CGRectMake(repeattaskpicker.frame.origin.x, repeattaskpicker.frame.origin.y-50, 50, 50)];
        //      btnrepeatsave=[[UIButton alloc] initWithFrame:CGRectMake(repeattaskpicker.frame.origin.x+repeattaskpicker.frame.size.width-50,0, 50, 50)];
        //   btncontactpaysave = [UIButton buttonWithType:UIButtonTypeCustom];
        [btnrepeatcancel setTitle:@"Cancel" forState:UIControlStateNormal];
        btnrepeatcancel.backgroundColor = [UIColor clearColor];
        [btnrepeatcancel setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal ];
        btnrepeatcancel.titleLabel.font = [UIFont fontWithName:@"OpenSans-Semibold" size:14.0];
        [btnrepeatcancel addTarget:self action:@selector(repeatpickerCancel) forControlEvents:UIControlEventTouchUpInside];
        [viewrepeattask addSubview:btnrepeatcancel];
        
        /*
         [repeattasktable removeFromSuperview];
         repeattasktable=[[UITableView alloc]initWithFrame:CGRectMake(txtrepeattask.frame.origin.x, txtrepeattask.frame.origin.y+txtrepeattask.frame.size.height, txtrepeattask.frame.size.width+30,50)];
         repeattasktable.delegate=self;
         repeattasktable.dataSource=self;
         repeattasktable.separatorStyle=NO;
         repeattasktable.userInteractionEnabled=YES;
         [repeattasktable reloadData];
         [taskdescmainview addSubview:repeattasktable];
         */
    }
    else
    {
        btnrepeattaskarrow.selected=NO;
        [viewrepeattask removeFromSuperview];
        //  [repeattasktable removeFromSuperview];
    }
    [btnrepeattaskarrow setBackgroundImage:[UIImage imageNamed:@"down-arrow2.png"] forState:UIControlStateNormal];
    [btnrepeattaskarrow setBackgroundImage:[UIImage imageNamed:@"down-arrow4.png"] forState:UIControlStateSelected];
    [btnrepeattaskarrow setBackgroundImage:[UIImage imageNamed:@"down-arrow4.png"] forState:UIControlStateHighlighted];
}

- (IBAction)timebtnclk:(id)sender
{
    [txtvwtaskdesc resignFirstResponder];
    if (btntime.selected==NO)
    {
        btntime.selected=YES;
        [self viewremove];
        
         viewtime=[[UIView alloc]initWithFrame:CGRectMake(self.view.frame.origin.x, self.view.frame.origin.y, self.view.frame.size.width,self.view.frame.size.height)];
   //     viewtime=[[UIView alloc]initWithFrame:CGRectMake(self.view.frame.origin.x, self.view.frame.size.height-200, self.view.frame.size.width,200)];
        [viewtime setBackgroundColor:[[UIColor blackColor]colorWithAlphaComponent:0.8]];
        [self.view addSubview:viewtime];
        
       estimatetimepicker=[[UIPickerView alloc]initWithFrame:CGRectMake(self.view.frame.size.width/2-125, 180, 250,150)];
  //      estimatetimepicker=[[UIPickerView alloc]initWithFrame:CGRectMake(self.view.frame.origin.x,50, self.view.frame.size.width,150)];
        [estimatetimepicker setBackgroundColor:[UIColor whiteColor]];
        estimatetimepicker.delegate=self;
        estimatetimepicker.dataSource=self;
        [viewtime addSubview:estimatetimepicker];
        
        btntimesave=[[UIButton alloc] initWithFrame:CGRectMake(estimatetimepicker.frame.origin.x+estimatetimepicker.frame.size.width-50, estimatetimepicker.frame.origin.y-50, 50, 50)];
   //     btntimesave=[[UIButton alloc] initWithFrame:CGRectMake(estimatetimepicker.frame.origin.x+estimatetimepicker.frame.size.width-50,0, 50, 50)];
        //   btncontactpaysave = [UIButton buttonWithType:UIButtonTypeCustom];
        [btntimesave setTitle:@"Save" forState:UIControlStateNormal];
        btntimesave.backgroundColor = [UIColor clearColor];
        [btntimesave setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal ];
        btntimesave.titleLabel.font = [UIFont fontWithName:@"OpenSans-Semibold" size:14.0];
        [btntimesave addTarget:self action:@selector(timepickerChange) forControlEvents:UIControlEventTouchUpInside];
        [viewtime addSubview:btntimesave];
         [imgtimearrow setImage:[UIImage imageNamed:@"down-arrow4.png"]];
        
        btntimecancel=[[UIButton alloc] initWithFrame:CGRectMake(estimatetimepicker.frame.origin.x, estimatetimepicker.frame.origin.y-50, 50, 50)];
        //     btntimesave=[[UIButton alloc] initWithFrame:CGRectMake(estimatetimepicker.frame.origin.x+estimatetimepicker.frame.size.width-50,0, 50, 50)];
        //   btncontactpaysave = [UIButton buttonWithType:UIButtonTypeCustom];
        [btntimecancel setTitle:@"Cancel" forState:UIControlStateNormal];
        btntimecancel.backgroundColor = [UIColor clearColor];
        [btntimecancel setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal ];
        btntimecancel.titleLabel.font = [UIFont fontWithName:@"OpenSans-Semibold" size:14.0];
        [btntimecancel addTarget:self action:@selector(timepickerCancel) forControlEvents:UIControlEventTouchUpInside];
        [viewtime addSubview:btntimecancel];
        [imgtimearrow setImage:[UIImage imageNamed:@"down-arrow4.png"]];
        
        
     /*   [estimatetimetable removeFromSuperview];
        estimatetimetable=[[UITableView alloc]initWithFrame:CGRectMake(txttime.frame.origin.x, txttime.frame.origin.y+txttime.frame.size.height, txttime.frame.size.width,150)];
        estimatetimetable.delegate=self;
        estimatetimetable.dataSource=self;
        estimatetimetable.separatorStyle=NO;
        estimatetimetable.userInteractionEnabled=YES;
        [estimatetimetable reloadData];
        [taskdescmainview addSubview:estimatetimetable];
        [imgtimearrow setImage:[UIImage imageNamed:@"down-arrow4.png"]];
      */
    }
    else
    {
        btntime.selected=NO;
        [self viewremove];
        [imgtimearrow setImage:[UIImage imageNamed:@"down-arrow2.png"]];
    }
   
}
-(void)timepickerCancel
{
    btntime.selected=NO;
    [self viewremove];
    [imgtimearrow setImage:[UIImage imageNamed:@"down-arrow2.png"]];
}
- (IBAction)Signup:(id)sender
{
    if (taskfilled==NO)
    {
        //workng as sign up button
        SignUpViewController *obj=[self.storyboard instantiateViewControllerWithIdentifier:@"SignUpViewControllersid"];
        [self.navigationController pushViewController:obj animated:YES];
    }
    else if (taskfilled==YES)
    {
        //workng as sign out button
        NSString *appDomain = [[NSBundle mainBundle] bundleIdentifier];
        [[NSUserDefaults standardUserDefaults] removePersistentDomainForName:appDomain];
        [self.navigationController popViewControllerAnimated:YES];
         [self deleteDocDirectory];
        taskfilled=NO;
        
    }
    
}

- (IBAction)camerabtnextraclk:(id)sender
{
    [txtvwtaskdesc resignFirstResponder];
    if(imgcount<3)
    {
        actionsheet=[[UIActionSheet alloc]initWithTitle:@"" delegate:self cancelButtonTitle:@"Cancel" destructiveButtonTitle:nil otherButtonTitles:@"Camera", @"Photo Library", nil];
        [actionsheet showInView:self.view];
    }
    else
    {
        UIAlertView *aler=[[UIAlertView alloc] initWithTitle:@"Alert" message:@"You can't add more images." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [aler show];
    }

}

- (IBAction)godashboardclk:(id)sender {
    
    ViewController *obj=[self.storyboard instantiateViewControllerWithIdentifier:@"ViewControllersid"];
    [self.navigationController pushViewController:obj animated:YES];
}

- (IBAction)btnradioindivclk:(id)sender
{
    if (btnradioindiv.selected==YES)
    {
        
        
    }
    else
    {
        //individual button selected
        btnindividual.selected=YES;
        btnradioindiv.selected=YES;
        [btnindividual setBackgroundImage:[UIImage imageNamed:@"bg1.png"] forState:UIControlStateNormal];
        
        [btnindividual setBackgroundImage:[UIImage imageNamed:@"bg3.png"] forState:UIControlStateSelected];
        
        [btnindividual setBackgroundImage:[UIImage imageNamed:@"bg3.png"] forState:UIControlStateHighlighted];
        
        [btnradioindiv setBackgroundImage:[UIImage imageNamed:@"rediobutton1.png"] forState:UIControlStateNormal];
        
        [btnradioindiv setBackgroundImage:[UIImage imageNamed:@"rediobutton2.png"] forState:UIControlStateSelected];
        
        [btnradioindiv setBackgroundImage:[UIImage imageNamed:@"rediobutton2.png"] forState:UIControlStateHighlighted];
        
        
        //business button reset
        btnbusiness.selected=NO;
        btnradiobusi.selected=NO;
        [btnbusiness setBackgroundImage:[UIImage imageNamed:@"bg1.png"] forState:UIControlStateNormal];
        
        [btnbusiness setBackgroundImage:[UIImage imageNamed:@"bg3.png"] forState:UIControlStateSelected];
        
        [btnbusiness setBackgroundImage:[UIImage imageNamed:@"bg3.png"] forState:UIControlStateHighlighted];
        
        [btnradiobusi setBackgroundImage:[UIImage imageNamed:@"rediobutton1.png"] forState:UIControlStateNormal];
        
        [btnradiobusi setBackgroundImage:[UIImage imageNamed:@"rediobutton2.png"] forState:UIControlStateSelected];
        
        [btnradiobusi setBackgroundImage:[UIImage imageNamed:@"rediobutton2.png"] forState:UIControlStateHighlighted];
    }
    
    
}



- (IBAction)btnradiobusinessclk:(id)sender {
    
    if (btnradiobusi.selected==YES)
    {
        
        
    }
    else
    {
        //business button selected
        btnbusiness.selected=YES;
        btnradiobusi.selected=YES;
        
        [btnbusiness setBackgroundImage:[UIImage imageNamed:@"bg1.png"] forState:UIControlStateNormal];
        [btnbusiness setBackgroundImage:[UIImage imageNamed:@"bg3.png"] forState:UIControlStateSelected];
        
        [btnbusiness setBackgroundImage:[UIImage imageNamed:@"bg3.png"] forState:UIControlStateHighlighted];
        
        [btnradiobusi setBackgroundImage:[UIImage imageNamed:@"rediobutton1.png"] forState:UIControlStateNormal];
        
        [btnradiobusi setBackgroundImage:[UIImage imageNamed:@"rediobutton2.png"] forState:UIControlStateSelected];
        
        [btnradiobusi setBackgroundImage:[UIImage imageNamed:@"rediobutton2.png"] forState:UIControlStateHighlighted];
        
        
        //individual button reset
        btnindividual.selected=NO;
        btnradioindiv.selected=NO;
        [btnindividual setBackgroundImage:[UIImage imageNamed:@"bg1.png"] forState:UIControlStateNormal];
        [btnindividual setBackgroundImage:[UIImage imageNamed:@"bg3.png"] forState:UIControlStateSelected];
        
        [btnindividual setBackgroundImage:[UIImage imageNamed:@"bg3.png"] forState:UIControlStateHighlighted];
        
        [btnradioindiv setBackgroundImage:[UIImage imageNamed:@"rediobutton1.png"] forState:UIControlStateNormal];
        
        [btnradioindiv setBackgroundImage:[UIImage imageNamed:@"rediobutton2.png"] forState:UIControlStateSelected];
        
        [btnradioindiv setBackgroundImage:[UIImage imageNamed:@"rediobutton2.png"] forState:UIControlStateHighlighted];
    }
    
}

- (IBAction)camerabtnclk:(id)sender
{
    [txtvwtaskdesc resignFirstResponder];
    if(imgcount<3)
    {
    actionsheet=[[UIActionSheet alloc]initWithTitle:@"" delegate:self cancelButtonTitle:@"Cancel" destructiveButtonTitle:nil otherButtonTitles:@"Camera", @"Photo Library", nil];
    [actionsheet showInView:self.view];
    }
    else
    {
        UIAlertView *aler=[[UIAlertView alloc] initWithTitle:@"Alert" message:@"You can't add more images." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
          [aler show];
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
- (IBAction)bidtickclk:(id)sender {
    
    if (btnbidtick.selected==YES)
    {
        btnbidtick.selected=NO;
    }
    else
    {
        btnbidtick.selected=YES;
        
    }
    [btnbidtick setBackgroundImage:[UIImage imageNamed:@"tick2.png"] forState:UIControlStateNormal];
    [btnbidtick setBackgroundImage:[UIImage imageNamed:@"tick1.png"] forState:UIControlStateSelected];
    [btnbidtick setBackgroundImage:[UIImage imageNamed:@"tick1.png"] forState:UIControlStateHighlighted];
    
}

- (IBAction)vehicletickclk:(id)sender {
    
    if (btnvehicletick.selected==YES)
    {
        btnvehicletick.selected=NO;
    }
    else
    {
        btnvehicletick.selected=YES;
        
    }
    [btnvehicletick setBackgroundImage:[UIImage imageNamed:@"tick2.png"] forState:UIControlStateNormal];
    [btnvehicletick setBackgroundImage:[UIImage imageNamed:@"tick1.png"] forState:UIControlStateSelected];
    [btnvehicletick setBackgroundImage:[UIImage imageNamed:@"tick1.png"] forState:UIControlStateHighlighted];
}

- (IBAction)phtickbtnclk:(id)sender {
    
    if (btnphtick.selected==YES)
    {
        btnphtick.selected=NO;
    }
    else
    {
        btnphtick.selected=YES;
        
    }
    [btnphtick setBackgroundImage:[UIImage imageNamed:@"tick2.png"] forState:UIControlStateNormal];
    [btnphtick setBackgroundImage:[UIImage imageNamed:@"tick1.png"] forState:UIControlStateSelected];
    [btnphtick setBackgroundImage:[UIImage imageNamed:@"tick1.png"] forState:UIControlStateHighlighted];
}
-(void)daytapclk
{
    [txtvwtaskdesc resignFirstResponder];
    if (btnestimateddayarrow.selected==NO)
    {
        btnestimateddayarrow.selected=YES;
        [self viewremove];
        
         viewday=[[UIView alloc]initWithFrame:CGRectMake(self.view.frame.origin.x, self.view.frame.origin.y, self.view.frame.size.width,self.view.frame.size.height)];
   //    viewday=[[UIView alloc]initWithFrame:CGRectMake(self.view.frame.origin.x, self.view.frame.size.height-200, self.view.frame.size.width,200)];
        [viewday setBackgroundColor:[[UIColor blackColor]colorWithAlphaComponent:0.8]];
        [self.view addSubview:viewday];
     
     estimatedaypicker=[[UIPickerView alloc]initWithFrame:CGRectMake(self.view.frame.size.width/2-125, 180, 250,150)];
  //      estimatedaypicker=[[UIPickerView alloc]initWithFrame:CGRectMake(self.view.frame.origin.x,50, self.view.frame.size.width,150)];
        [estimatedaypicker setBackgroundColor:[UIColor whiteColor]];
        estimatedaypicker.delegate=self;
        estimatedaypicker.dataSource=self;
        [viewday addSubview:estimatedaypicker];
        
    btndaysave=[[UIButton alloc] initWithFrame:CGRectMake(estimatedaypicker.frame.origin.x+estimatedaypicker.frame.size.width-50, estimatedaypicker.frame.origin.y-50, 50, 50)];
   //     btndaysave=[[UIButton alloc] initWithFrame:CGRectMake(estimatedaypicker.frame.origin.x+estimatedaypicker.frame.size.width-50,0, 50, 50)];
        //   btncontactpaysave = [UIButton buttonWithType:UIButtonTypeCustom];
        [btndaysave setTitle:@"Save" forState:UIControlStateNormal];
        btndaysave.backgroundColor = [UIColor clearColor];
        [btndaysave setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal ];
        btndaysave.titleLabel.font = [UIFont fontWithName:@"OpenSans-Semibold" size:14.0];
        [btndaysave addTarget:self action:@selector(daypickerChange) forControlEvents:UIControlEventTouchUpInside];
        [viewday addSubview:btndaysave];
        
        btndaycancel=[[UIButton alloc] initWithFrame:CGRectMake(estimatedaypicker.frame.origin.x, estimatedaypicker.frame.origin.y-50, 50, 50)];
        //     btndaysave=[[UIButton alloc] initWithFrame:CGRectMake(estimatedaypicker.frame.origin.x+estimatedaypicker.frame.size.width-50,0, 50, 50)];
        //   btncontactpaysave = [UIButton buttonWithType:UIButtonTypeCustom];
        [btndaycancel setTitle:@"Cancel" forState:UIControlStateNormal];
        btndaycancel.backgroundColor = [UIColor clearColor];
        [btndaycancel setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal ];
        btndaycancel.titleLabel.font = [UIFont fontWithName:@"OpenSans-Semibold" size:14.0];
        [btndaycancel addTarget:self action:@selector(daypickerCancel) forControlEvents:UIControlEventTouchUpInside];
        [viewday addSubview:btndaycancel];
        
        /*
        [estimatedaytable removeFromSuperview];
        estimatedaytable=[[UITableView alloc]initWithFrame:CGRectMake(txtday.frame.origin.x, txtday.frame.origin.y+txtday.frame.size.height, txtday.frame.size.width,150)];
        estimatedaytable.delegate=self;
        estimatedaytable.dataSource=self;
        estimatedaytable.separatorStyle=NO;
        estimatedaytable.userInteractionEnabled=YES;
        [estimatedaytable reloadData];
        [taskdescmainview addSubview:estimatedaytable];
         */
    }
    else
    {
        btnestimateddayarrow.selected=NO;
        [self viewremove];

      //  [estimatedaytable removeFromSuperview];
    }
    [btnestimateddayarrow setBackgroundImage:[UIImage imageNamed:@"down-arrow2.png"] forState:UIControlStateNormal];
    [btnestimateddayarrow setBackgroundImage:[UIImage imageNamed:@"down-arrow4.png"] forState:UIControlStateSelected];
    [btnestimateddayarrow setBackgroundImage:[UIImage imageNamed:@"down-arrow4.png"] forState:UIControlStateHighlighted];
}
-(void)daypickerCancel
{
    btnestimateddayarrow.selected=NO;
    [self viewremove];
    
  [btnestimateddayarrow setBackgroundImage:[UIImage imageNamed:@"down-arrow2.png"] forState:UIControlStateNormal];
[btnestimateddayarrow setBackgroundImage:[UIImage imageNamed:@"down-arrow4.png"] forState:UIControlStateSelected];
[btnestimateddayarrow setBackgroundImage:[UIImage imageNamed:@"down-arrow4.png"] forState:UIControlStateHighlighted];
}
- (IBAction)estimatedayarrowclk:(id)sender
{
    [self daytapclk];
}


- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{

  //  addimage1 = info[UIImagePickerControllerEditedImage];
    
    NSLog(@"imagecount=%ld",(long)imgcount);
    if (imgcount==0) {
        txtphoto.placeholder=@"               Add more photos";
        txtphoto.font=[UIFont fontWithName:@"OpenSans-Light" size:14];
         addedimg.image=info[UIImagePickerControllerEditedImage];
        addedimg.contentMode = UIViewContentModeScaleAspectFit;
        addedimg.clipsToBounds=YES;
        imggesture1=[[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(handleLongPressGestures1:)];
        imggesture1.delegate = self;
        [addedimg addGestureRecognizer:imggesture1];
        [addedimg setUserInteractionEnabled:YES];
    }
   
    
       if (imgcount==1)
       {
            txtphoto.placeholder=@"                         Add more photos";
            txtphoto.font=[UIFont fontWithName:@"OpenSans-Light" size:10];
           //  img =[[UIImageView alloc] initWithFrame:CGRectMake(70,5,63,45)];
        //   img =[[UIImageView alloc] initWithFrame:CGRectMake(70,257,63,45)];
            img.image=info[UIImagePickerControllerOriginalImage];
         //  [taskdescmainview addSubview:img];

            //          [txtphoto addSubview:img];
          // [txtphoto bringSubviewToFront:img];
         
            img.contentMode = UIViewContentModeScaleAspectFit;
            img.clipsToBounds=YES;
            imggesture2=[[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(handleLongPressGestures2:)];
             imggesture2.delegate = self;
            
            [img addGestureRecognizer:imggesture2];
        
             [img setUserInteractionEnabled:YES];
        }
       else if (imgcount==2)
       {
           txtphoto.placeholder=@"";
       
        //    img1 =[[UIImageView alloc] initWithFrame:CGRectMake(136,5,63,45)];
         //   img1 =[[UIImageView alloc] initWithFrame:CGRectMake(136,257,63,45)];
       //    [taskdescmainview addSubview:img1];
           img1.image=info[UIImagePickerControllerOriginalImage];
       //    [txtphoto addSubview:img1];
           img1.contentMode = UIViewContentModeScaleAspectFit;
           img1.clipsToBounds=YES;
           
           imggesture3=[[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(handleLongPressGestures3:)];
           imggesture3.delegate = self;
           [img1 setUserInteractionEnabled:YES];
           [img1 addGestureRecognizer:imggesture3];
       }
//    [arrimage insertObject:info[UIImagePickerControllerOriginalImage] atIndex:imgcount];
    
    [arrimage insertObject:info[UIImagePickerControllerOriginalImage] atIndex:imgcount];
    
    NSLog(@"arrimage=%@",arrimage);
    [picker dismissViewControllerAnimated:YES completion:nil];
    
    imgcount++;
    
    
}

- (void)handleLongPressGestures1:(UILongPressGestureRecognizer *)sender
{
    NSLog(@"gesture1");
    
    if ([sender isEqual:imggesture1]) {
        if (sender.state == UIGestureRecognizerStateBegan)
        {
            clickedimg=1;
            user=NO;
            UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Alert" message:@" Do you want to delete?" delegate:self cancelButtonTitle:@"NO" otherButtonTitles:@"YES", nil];
            [alertView show];
        }
    }
}
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    //for delete image
    if(user==NO)
    {
    
        if (buttonIndex == [alertView cancelButtonIndex])
        {
        clickedimg=0;
        }
        else
        {
        imgcount--;
         [arrimage removeObjectAtIndex:clickedimg-1];
    
          NSLog(@"arrimage=%@",arrimage);
    //    NSLog(@"arrimage at last position=%@",[arrimage objectAtIndex:1]);
        
        if (clickedimg==1)
        {
           
            NSLog(@"delete First image");
                      //image shift
         
            addedimg.image=img.image;
            img.image=img1.image;
            [img1 setImage:[UIImage imageNamed:@""]];
        }
        else  if (clickedimg==2)
        {
            NSLog(@"delete 2nd image");
         
            img.image=img1.image;
            [img1 setImage:[UIImage imageNamed:@""]];
         
        }
        else  if (clickedimg==3)
        {
         
            [img1 setImage:[UIImage imageNamed:@""]];
         
        }
         
      }
    }
    //for nornal or existing user
    else if (user==YES)
    {
        if (buttonIndex == [alertView cancelButtonIndex])
        {
            SignUpViewController *obj=[self.storyboard instantiateViewControllerWithIdentifier:@"SignUpViewControllersid"];
            obj.tasktosignup=YES;
            [self.navigationController pushViewController:obj animated:YES];
        }
        else
        {
            SignInViewController *obj=[self.storyboard instantiateViewControllerWithIdentifier:@"SignInViewControllersid"];
            obj.tasktosignin=YES;
            [self.navigationController pushViewController:obj animated:YES];
        }

    }
}
- (void)handleLongPressGestures2:(UILongPressGestureRecognizer *)sender
{
    NSLog(@"gesture2");
    if ([sender isEqual:imggesture2]) {
        if (sender.state == UIGestureRecognizerStateBegan)
        {
            clickedimg=2;
            UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Alert" message:@" Do you want to delete?" delegate:self cancelButtonTitle:@"NO" otherButtonTitles:@"YES", nil];
            [alertView show];

        }
    }
}
- (void)handleLongPressGestures3:(UILongPressGestureRecognizer *)sender
{
     NSLog(@"gesture3");
    if ([sender isEqual:imggesture3]) {
        if (sender.state == UIGestureRecognizerStateBegan)
        {
            clickedimg=3;
            UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Alert" message:@" Do you want to delete?" delegate:self cancelButtonTitle:@"NO" otherButtonTitles:@"YES", nil];
            [alertView show];

        }
    }
}
- (IBAction)tasklocationarrowclk:(id)sender {
    NSLog(@"task location view");
    if (btntasklocationarrow.selected==YES)
    {
        
        [self expandtasklocationview];
        
    }
    else
    {
        
        [self collapsetasklocationview];
        
    }
    
}

- (IBAction)tasklocationbtnextraclk:(id)sender {
    NSLog(@"task location view");
    if (btntasklocationarrow.selected==YES)
    {
        [self expandtasklocationview];
        
    }
    else
    {
        [self collapsetasklocationview];
        
        
    }
    
}

- (IBAction)deliverychkextraclk:(id)sender {
    if (btndeliverychk.selected==YES)
    {
        btndeliverychk.selected=NO;
        [deliveryview setHidden:YES];
        
        //mainscroll and location view side increase
        mainscroll.contentSize = CGSizeMake(0, mainscroll.contentSize.height-deliveryview.frame.size.height-5);
        tasklocationview.frame=CGRectMake(tasklocationview.frame.origin.x, tasklocationview.frame.origin.y, tasklocationview.frame.size.width, tasklocationview.frame.size.height-deliveryview.frame.size.height-5);
        tasklocationmainview.frame=CGRectMake(tasklocationmainview.frame.origin.x, tasklocationmainview.frame.origin.y, tasklocationmainview.frame.size.width, tasklocationmainview.frame.size.height-deliveryview.frame.size.height-5);
        
        
        //deadlineview goes down
        deadlinetopimg.frame = CGRectMake( deadlinetopimg.frame.origin.x, tasklocationview.frame.origin.y+tasklocationview.frame.size.height+2, deadlinetopimg.frame.size.width, deadlinetopimg.frame.size.height);
        btndeadlinearrow.frame = CGRectMake( btndeadlinearrow.frame.origin.x, deadlinetopimg.frame.origin.y+17, btndeadlinearrow.frame.size.width, btndeadlinearrow.frame.size.height);
        btndeadlineextra.frame = CGRectMake( btndeadlineextra.frame.origin.x, deadlinetopimg.frame.origin.y, btndeadlineextra.frame.size.width, btndeadlineextra.frame.size.height);
        lbldeadline.frame = CGRectMake( lbldeadline.frame.origin.x, deadlinetopimg.frame.origin.y+15, lbldeadline.frame.size.width, lbldeadline.frame.size.height);
        deadlineview.frame=CGRectMake(deadlineview.frame.origin.x, deadlinetopimg.frame.origin.y+deadlinetopimg.frame.size.height, deadlineview.frame.size.width, deadlineview.frame.size.height);
        
        //priceview goes down
        pricetopimg.frame = CGRectMake( pricetopimg.frame.origin.x, deadlineview.frame.origin.y+deadlineview.frame.size.height, pricetopimg.frame.size.width, pricetopimg.frame.size.height);
        btnpricearrow.frame = CGRectMake( btnpricearrow.frame.origin.x, pricetopimg.frame.origin.y+17, btnpricearrow.frame.size.width, btnpricearrow.frame.size.height);
        btnpriceextra.frame = CGRectMake( btnpriceextra.frame.origin.x, pricetopimg.frame.origin.y, btnpriceextra.frame.size.width, btnpriceextra.frame.size.height);
        lblprice.frame = CGRectMake( lblprice.frame.origin.x, pricetopimg.frame.origin.y+15, lblprice.frame.size.width, lblprice.frame.size.height);
        priceview.frame = CGRectMake( priceview.frame.origin.x, pricetopimg.frame.origin.y+pricetopimg.frame.size.height, priceview.frame.size.width, priceview.frame.size.height);
    }
    else
    {
        btndeliverychk.selected=YES;
        [deliveryview setHidden:NO];
        if (txtdroplocation.text.length==0) {
            lbldroplocation.hidden=NO;
        }
        //mainscroll and location view side increase
        mainscroll.contentSize = CGSizeMake(0, mainscroll.contentSize.height+deliveryview.frame.size.height+5);
        tasklocationview.frame=CGRectMake(tasklocationview.frame.origin.x, tasklocationview.frame.origin.y, tasklocationview.frame.size.width, tasklocationview.frame.size.height+deliveryview.frame.size.height+5);
        tasklocationmainview.frame=CGRectMake(tasklocationmainview.frame.origin.x, tasklocationmainview.frame.origin.y, tasklocationmainview.frame.size.width, tasklocationmainview.frame.size.height+deliveryview.frame.size.height+5);
        deliveryview.frame=CGRectMake(txtpcode.frame.origin.x-7, btndeliverychk.frame.origin.y+btndeliverychk.frame.size.height+5, deliveryview.frame.size.width,deliveryview.frame.size.height);
        [tasklocationview addSubview:deliveryview];
        
        //deadlineview goes down
        deadlinetopimg.frame = CGRectMake( deadlinetopimg.frame.origin.x, tasklocationview.frame.origin.y+tasklocationview.frame.size.height+2, deadlinetopimg.frame.size.width, deadlinetopimg.frame.size.height);
        btndeadlinearrow.frame = CGRectMake( btndeadlinearrow.frame.origin.x, deadlinetopimg.frame.origin.y+17, btndeadlinearrow.frame.size.width, btndeadlinearrow.frame.size.height);
        btndeadlineextra.frame = CGRectMake( btndeadlineextra.frame.origin.x, deadlinetopimg.frame.origin.y, btndeadlineextra.frame.size.width, btndeadlineextra.frame.size.height);
        lbldeadline.frame = CGRectMake( lbldeadline.frame.origin.x, deadlinetopimg.frame.origin.y+15, lbldeadline.frame.size.width, lbldeadline.frame.size.height);
        deadlineview.frame=CGRectMake(deadlineview.frame.origin.x, deadlinetopimg.frame.origin.y+deadlinetopimg.frame.size.height, deadlineview.frame.size.width, deadlineview.frame.size.height);
        
        //priceview goes down
        pricetopimg.frame = CGRectMake( pricetopimg.frame.origin.x, deadlineview.frame.origin.y+deadlineview.frame.size.height, pricetopimg.frame.size.width, pricetopimg.frame.size.height);
        btnpricearrow.frame = CGRectMake( btnpricearrow.frame.origin.x, pricetopimg.frame.origin.y+17, btnpricearrow.frame.size.width, btnpricearrow.frame.size.height);
        btnpriceextra.frame = CGRectMake( btnpriceextra.frame.origin.x, pricetopimg.frame.origin.y, btnpriceextra.frame.size.width, btnpriceextra.frame.size.height);
        lblprice.frame = CGRectMake( lblprice.frame.origin.x, pricetopimg.frame.origin.y+15, lblprice.frame.size.width, lblprice.frame.size.height);
        priceview.frame = CGRectMake( priceview.frame.origin.x, pricetopimg.frame.origin.y+pricetopimg.frame.size.height, priceview.frame.size.width, priceview.frame.size.height);
    }
    [btndeliverychk setBackgroundImage:[UIImage imageNamed:@"tick2.png"] forState:UIControlStateNormal];
    [btndeliverychk setBackgroundImage:[UIImage imageNamed:@"tick1.png"] forState:UIControlStateSelected];
    [btndeliverychk setBackgroundImage:[UIImage imageNamed:@"tick1.png"] forState:UIControlStateHighlighted];
}

- (IBAction)cityarrowclk:(id)sender {
    if (btncityarrow.selected==NO)
    {
        [txtcity resignFirstResponder];
        btncityarrow.selected=YES;
        /*
        NSLog(@"city arrow clk");
        [citytable removeFromSuperview];
        citytable=[[UITableView alloc]initWithFrame:CGRectMake(txtprovince.frame.origin.x, txtprovince.frame.origin.y+txtprovince.frame.size.height, txtprovince.frame.size.width,150)];
        citytable.delegate=self;
        citytable.dataSource=self;
        citytable.separatorStyle=NO;
        citytable.userInteractionEnabled=YES;
        [citytable reloadData];
        [tasklocationview addSubview:citytable];
         */
        [self viewremove];
        
        viewprovince=[[UIView alloc]initWithFrame:CGRectMake(self.view.frame.origin.x, self.view.frame.origin.y, self.view.frame.size.width,self.view.frame.size.height)];
    //    viewprovince=[[UIView alloc]initWithFrame:CGRectMake(self.view.frame.origin.x, self.view.frame.size.height-200, self.view.frame.size.width,200)];
        [viewprovince setBackgroundColor:[[UIColor blackColor]colorWithAlphaComponent:0.8]];
        [self.view addSubview:viewprovince];
        
        provincepicker=[[UIPickerView alloc]initWithFrame:CGRectMake(self.view.frame.size.width/2-125, 180, 250,150)];
     //   provincepicker=[[UIPickerView alloc]initWithFrame:CGRectMake(self.view.frame.origin.x,50, self.view.frame.size.width,150)];
        [provincepicker setBackgroundColor:[UIColor whiteColor]];
        provincepicker.delegate=self;
        provincepicker.dataSource=self;
        [viewprovince addSubview:provincepicker];
        
         btnprovincesave=[[UIButton alloc] initWithFrame:CGRectMake(provincepicker.frame.origin.x+provincepicker.frame.size.width-50, provincepicker.frame.origin.y-50, 50, 50)];
  //      btnprovincesave=[[UIButton alloc] initWithFrame:CGRectMake(provincepicker.frame.origin.x+provincepicker.frame.size.width-50,0, 50, 50)];
        //   btncontactpaysave = [UIButton buttonWithType:UIButtonTypeCustom];
        [btnprovincesave setTitle:@"Save" forState:UIControlStateNormal];
        btnprovincesave.backgroundColor = [UIColor clearColor];
        [btnprovincesave setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal ];
        btnprovincesave.titleLabel.font = [UIFont fontWithName:@"OpenSans-Semibold" size:14.0];
        [btnprovincesave addTarget:self action:@selector(provincepickerChange) forControlEvents:UIControlEventTouchUpInside];
        [viewprovince addSubview:btnprovincesave];
        
        btnprovincecancel=[[UIButton alloc] initWithFrame:CGRectMake(provincepicker.frame.origin.x, provincepicker.frame.origin.y-50, 50, 50)];
        //      btnprovincesave=[[UIButton alloc] initWithFrame:CGRectMake(provincepicker.frame.origin.x+provincepicker.frame.size.width-50,0, 50, 50)];
        //   btncontactpaysave = [UIButton buttonWithType:UIButtonTypeCustom];
        [btnprovincecancel setTitle:@"Cancel" forState:UIControlStateNormal];
        btnprovincecancel.backgroundColor = [UIColor clearColor];
        [btnprovincecancel setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal ];
        btnprovincecancel.titleLabel.font = [UIFont fontWithName:@"OpenSans-Semibold" size:14.0];
        [btnprovincecancel addTarget:self action:@selector(provincepickerCancel) forControlEvents:UIControlEventTouchUpInside];
        [viewprovince addSubview:btnprovincecancel];
    }
    else
    {
        btncityarrow.selected=NO;
      //  [citytable removeFromSuperview];
        [self viewremove];
    }
    [btncityarrow setBackgroundImage:[UIImage imageNamed:@"down-arrow2.png"] forState:UIControlStateNormal];
    [btncityarrow setBackgroundImage:[UIImage imageNamed:@"down-arrow4.png"] forState:UIControlStateSelected];
    [btncityarrow setBackgroundImage:[UIImage imageNamed:@"down-arrow4.png"] forState:UIControlStateHighlighted];
}
-(void)provincepickerCancel
{
    btncityarrow.selected=NO;
    //  [citytable removeFromSuperview];
    [self viewremove];

[btncityarrow setBackgroundImage:[UIImage imageNamed:@"down-arrow2.png"] forState:UIControlStateNormal];
[btncityarrow setBackgroundImage:[UIImage imageNamed:@"down-arrow4.png"] forState:UIControlStateSelected];
[btncityarrow setBackgroundImage:[UIImage imageNamed:@"down-arrow4.png"] forState:UIControlStateHighlighted];
}


- (IBAction)cityarrowextraclk:(id)sender {
    if (btncityarrow.selected==NO)
    {
        [txtcity resignFirstResponder];
        btncityarrow.selected=YES;
        /*
         NSLog(@"city arrow clk");
         [citytable removeFromSuperview];
         citytable=[[UITableView alloc]initWithFrame:CGRectMake(txtprovince.frame.origin.x, txtprovince.frame.origin.y+txtprovince.frame.size.height, txtprovince.frame.size.width,150)];
         citytable.delegate=self;
         citytable.dataSource=self;
         citytable.separatorStyle=NO;
         citytable.userInteractionEnabled=YES;
         [citytable reloadData];
         [tasklocationview addSubview:citytable];
         */
        [self viewremove];
        
        viewprovince=[[UIView alloc]initWithFrame:CGRectMake(self.view.frame.origin.x, self.view.frame.origin.y, self.view.frame.size.width,self.view.frame.size.height)];
    //    viewprovince=[[UIView alloc]initWithFrame:CGRectMake(self.view.frame.origin.x, self.view.frame.size.height-200, self.view.frame.size.width,200)];
        [viewprovince setBackgroundColor:[[UIColor blackColor]colorWithAlphaComponent:0.8]];
        [self.view addSubview:viewprovince];
        
        
    provincepicker=[[UIPickerView alloc]initWithFrame:CGRectMake(self.view.frame.size.width/2-150, 180, 300,150)];
        [provincepicker setBackgroundColor:[UIColor whiteColor]];
        provincepicker.delegate=self;
        provincepicker.dataSource=self;
        [viewprovince addSubview:provincepicker];
        
         btnprovincesave=[[UIButton alloc] initWithFrame:CGRectMake(provincepicker.frame.origin.x+provincepicker.frame.size.width-50, provincepicker.frame.origin.y-50, 50, 50)];
    //    btnprovincesave=[[UIButton alloc] initWithFrame:CGRectMake(provincepicker.frame.origin.x+provincepicker.frame.size.width-50,0, 50, 50)];
        //   btncontactpaysave = [UIButton buttonWithType:UIButtonTypeCustom];
        [btnprovincesave setTitle:@"Save" forState:UIControlStateNormal];
        btnprovincesave.backgroundColor = [UIColor clearColor];
        [btnprovincesave setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal ];
        btnprovincesave.titleLabel.font = [UIFont fontWithName:@"OpenSans-Semibold" size:14.0];
        [btnprovincesave addTarget:self action:@selector(provincepickerChange) forControlEvents:UIControlEventTouchUpInside];
        [viewprovince addSubview:btnprovincesave];
        
        btnprovincecancel=[[UIButton alloc] initWithFrame:CGRectMake(provincepicker.frame.origin.x, provincepicker.frame.origin.y-50, 50, 50)];
        //      btnprovincesave=[[UIButton alloc] initWithFrame:CGRectMake(provincepicker.frame.origin.x+provincepicker.frame.size.width-50,0, 50, 50)];
        //   btncontactpaysave = [UIButton buttonWithType:UIButtonTypeCustom];
        [btnprovincecancel setTitle:@"Cancel" forState:UIControlStateNormal];
        btnprovincecancel.backgroundColor = [UIColor clearColor];
        [btnprovincecancel setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal ];
        btnprovincecancel.titleLabel.font = [UIFont fontWithName:@"OpenSans-Semibold" size:14.0];
        [btnprovincecancel addTarget:self action:@selector(provincepickerCancel) forControlEvents:UIControlEventTouchUpInside];
        [viewprovince addSubview:btnprovincecancel];
    }
    else
    {
        btncityarrow.selected=NO;
        //  [citytable removeFromSuperview];
        [viewprovince removeFromSuperview];
    }
    [btncityarrow setBackgroundImage:[UIImage imageNamed:@"down-arrow2.png"] forState:UIControlStateNormal];
    [btncityarrow setBackgroundImage:[UIImage imageNamed:@"down-arrow4.png"] forState:UIControlStateSelected];
    [btncityarrow setBackgroundImage:[UIImage imageNamed:@"down-arrow4.png"] forState:UIControlStateHighlighted];
    
}
-(void)expandtasklocationview
{
    [UIView beginAnimations:@"ShowHideView" context:NULL];
    [UIView setAnimationDuration:0.3];
    
    btntasklocationarrow.selected=NO;
    [btntasklocationarrow setBackgroundImage:[UIImage imageNamed:@"uparrow.png"] forState:UIControlStateNormal];
    
    [btntasklocationarrow setBackgroundImage:[UIImage imageNamed:@"down-arrow.png"] forState:UIControlStateSelected];
    
    [btntasklocationarrow setBackgroundImage:[UIImage imageNamed:@"down-arrow.png"] forState:UIControlStateHighlighted];
    [tasklocationmainview setHidden:NO];
    [tasklocationview setHidden:NO];
    
    ////deadline view position change
    deadlinetopimg.frame = CGRectMake( deadlinetopimg.frame.origin.x, tasklocationview.frame.origin.y+tasklocationview.frame.size.height+2, deadlinetopimg.frame.size.width, deadlinetopimg.frame.size.height);
    btndeadlinearrow.frame = CGRectMake( btndeadlinearrow.frame.origin.x, deadlinetopimg.frame.origin.y+17, btndeadlinearrow.frame.size.width, btndeadlinearrow.frame.size.height);
    btndeadlineextra.frame = CGRectMake( btndeadlineextra.frame.origin.x, deadlinetopimg.frame.origin.y, btndeadlineextra.frame.size.width, btndeadlineextra.frame.size.height);
    lbldeadline.frame = CGRectMake( lbldeadline.frame.origin.x, deadlinetopimg.frame.origin.y+17, lbldeadline.frame.size.width, lbldeadline.frame.size.height);
    deadlineview.frame = CGRectMake( deadlineview.frame.origin.x, deadlinetopimg.frame.origin.y+deadlinetopimg.frame.size.height, deadlineview.frame.size.width, deadlineview.frame.size.height);
    
    //price view position change
    if (btndeadlinearrow.selected==NO) {
        pricetopimg.frame = CGRectMake( pricetopimg.frame.origin.x, deadlineview.frame.origin.y+deadlineview.frame.size.height+2, pricetopimg.frame.size.width, pricetopimg.frame.size.height);
    }
    else
    {
        pricetopimg.frame = CGRectMake( pricetopimg.frame.origin.x, deadlineview.frame.origin.y+2, pricetopimg.frame.size.width, pricetopimg.frame.size.height);
    }
    btnpricearrow.frame = CGRectMake( btnpricearrow.frame.origin.x, pricetopimg.frame.origin.y+17, btnpricearrow.frame.size.width, btnpricearrow.frame.size.height);
    btnpriceextra.frame = CGRectMake( btnpriceextra.frame.origin.x, pricetopimg.frame.origin.y, btnpriceextra.frame.size.width, btnpriceextra.frame.size.height);
    lblprice.frame = CGRectMake( lblprice.frame.origin.x, pricetopimg.frame.origin.y+17, lblprice.frame.size.width, lblprice.frame.size.height);
    priceview.frame = CGRectMake( priceview.frame.origin.x, pricetopimg.frame.origin.y+pricetopimg.frame.size.height, priceview.frame.size.width, priceview.frame.size.height);
    mainscroll.contentSize = CGSizeMake(0, mainscroll.contentSize.height+tasklocationview.frame.size.height);
    [UIView commitAnimations];
}
-(void)collapsetasklocationview
{
    
    [UIView beginAnimations:@"ShowHideView" context:NULL];
    [UIView setAnimationDuration:0.3];
    
    btntasklocationarrow.selected=YES;
    [btntasklocationarrow setBackgroundImage:[UIImage imageNamed:@"uparrow.png"] forState:UIControlStateNormal];
    
    [btntasklocationarrow setBackgroundImage:[UIImage imageNamed:@"down-arrow.png"] forState:UIControlStateSelected];
    
    [btntasklocationarrow setBackgroundImage:[UIImage imageNamed:@"down-arrow.png"] forState:UIControlStateHighlighted];
    [tasklocationmainview setHidden:YES];
    [tasklocationview setHidden:YES];
    
    //deadline view position change
    deadlinetopimg.frame = CGRectMake( deadlinetopimg.frame.origin.x, deadlinetopimg.frame.origin.y-tasklocationview.frame.size.height, deadlinetopimg.frame.size.width, deadlinetopimg.frame.size.height);
    btndeadlinearrow.frame = CGRectMake( btndeadlinearrow.frame.origin.x, deadlinetopimg.frame.origin.y+17, btndeadlinearrow.frame.size.width, btndeadlinearrow.frame.size.height);
    btndeadlineextra.frame = CGRectMake( btndeadlineextra.frame.origin.x, deadlinetopimg.frame.origin.y, btndeadlineextra.frame.size.width, btndeadlineextra.frame.size.height);
    lbldeadline.frame = CGRectMake( lbldeadline.frame.origin.x, deadlinetopimg.frame.origin.y+17, lbldeadline.frame.size.width, lbldeadline.frame.size.height);
    deadlineview.frame = CGRectMake( deadlineview.frame.origin.x, deadlinetopimg.frame.origin.y+deadlinetopimg.frame.size.height, deadlineview.frame.size.width, deadlineview.frame.size.height);
    
    //price view position change
    if (btndeadlinearrow.selected==NO) {
        pricetopimg.frame = CGRectMake( pricetopimg.frame.origin.x, deadlineview.frame.origin.y+deadlineview.frame.size.height+2, pricetopimg.frame.size.width, pricetopimg.frame.size.height);
    }
    else
    {
        pricetopimg.frame = CGRectMake( pricetopimg.frame.origin.x, deadlineview.frame.origin.y+2, pricetopimg.frame.size.width, pricetopimg.frame.size.height);
    }
    btnpricearrow.frame = CGRectMake( btnpricearrow.frame.origin.x, pricetopimg.frame.origin.y+17, btnpricearrow.frame.size.width, btnpricearrow.frame.size.height);
    lblprice.frame = CGRectMake( lblprice.frame.origin.x, pricetopimg.frame.origin.y+17, lblprice.frame.size.width, lblprice.frame.size.height);
    btnpriceextra.frame = CGRectMake( btnpriceextra.frame.origin.x, pricetopimg.frame.origin.y, btnpriceextra.frame.size.width, btnpriceextra.frame.size.height);
    priceview.frame = CGRectMake( priceview.frame.origin.x, pricetopimg.frame.origin.y+pricetopimg.frame.size.height, priceview.frame.size.width, priceview.frame.size.height);
    mainscroll.contentSize = CGSizeMake(0, mainscroll.contentSize.height-tasklocationview.frame.size.height);
    
    [UIView commitAnimations];
}
- (IBAction)deliverychkclk:(id)sender
{
    if (btndeliverychk.selected==YES)
    {
        btndeliverychk.selected=NO;
        [deliveryview setHidden:YES];
        
        //mainscroll and location view side increase
        mainscroll.contentSize = CGSizeMake(0, mainscroll.contentSize.height-deliveryview.frame.size.height-5);
        tasklocationview.frame=CGRectMake(tasklocationview.frame.origin.x, tasklocationview.frame.origin.y, tasklocationview.frame.size.width, tasklocationview.frame.size.height-deliveryview.frame.size.height-5);
        tasklocationmainview.frame=CGRectMake(tasklocationmainview.frame.origin.x, tasklocationmainview.frame.origin.y, tasklocationmainview.frame.size.width, tasklocationmainview.frame.size.height-deliveryview.frame.size.height-5);
       
        
        //deadlineview goes down
        deadlinetopimg.frame = CGRectMake( deadlinetopimg.frame.origin.x, tasklocationview.frame.origin.y+tasklocationview.frame.size.height+2, deadlinetopimg.frame.size.width, deadlinetopimg.frame.size.height);
        btndeadlinearrow.frame = CGRectMake( btndeadlinearrow.frame.origin.x, deadlinetopimg.frame.origin.y+17, btndeadlinearrow.frame.size.width, btndeadlinearrow.frame.size.height);
        btndeadlineextra.frame = CGRectMake( btndeadlineextra.frame.origin.x, deadlinetopimg.frame.origin.y, btndeadlineextra.frame.size.width, btndeadlineextra.frame.size.height);
        lbldeadline.frame = CGRectMake( lbldeadline.frame.origin.x, deadlinetopimg.frame.origin.y+15, lbldeadline.frame.size.width, lbldeadline.frame.size.height);
        deadlineview.frame=CGRectMake(deadlineview.frame.origin.x, deadlinetopimg.frame.origin.y+deadlinetopimg.frame.size.height, deadlineview.frame.size.width, deadlineview.frame.size.height);
        
        //priceview goes down
        pricetopimg.frame = CGRectMake( pricetopimg.frame.origin.x, deadlineview.frame.origin.y+deadlineview.frame.size.height, pricetopimg.frame.size.width, pricetopimg.frame.size.height);
        btnpricearrow.frame = CGRectMake( btnpricearrow.frame.origin.x, pricetopimg.frame.origin.y+17, btnpricearrow.frame.size.width, btnpricearrow.frame.size.height);
        btnpriceextra.frame = CGRectMake( btnpriceextra.frame.origin.x, pricetopimg.frame.origin.y, btnpriceextra.frame.size.width, btnpriceextra.frame.size.height);
        lblprice.frame = CGRectMake( lblprice.frame.origin.x, pricetopimg.frame.origin.y+15, lblprice.frame.size.width, lblprice.frame.size.height);
        priceview.frame = CGRectMake( priceview.frame.origin.x, pricetopimg.frame.origin.y+pricetopimg.frame.size.height, priceview.frame.size.width, priceview.frame.size.height);
    }
    else
    {
        btndeliverychk.selected=YES;
       [deliveryview setHidden:NO];
        if (txtdroplocation.text.length==0) {
            lbldroplocation.hidden=NO;
        }
        //mainscroll and location view side increase
         mainscroll.contentSize = CGSizeMake(0, mainscroll.contentSize.height+deliveryview.frame.size.height+5);
        tasklocationview.frame=CGRectMake(tasklocationview.frame.origin.x, tasklocationview.frame.origin.y, tasklocationview.frame.size.width, tasklocationview.frame.size.height+deliveryview.frame.size.height+5);
        tasklocationmainview.frame=CGRectMake(tasklocationmainview.frame.origin.x, tasklocationmainview.frame.origin.y, tasklocationmainview.frame.size.width, tasklocationmainview.frame.size.height+deliveryview.frame.size.height+5);
        deliveryview.frame=CGRectMake(txtpcode.frame.origin.x-7, btndeliverychk.frame.origin.y+btndeliverychk.frame.size.height+5, deliveryview.frame.size.width,deliveryview.frame.size.height);
        [tasklocationview addSubview:deliveryview];
        
        //deadlineview goes down
        deadlinetopimg.frame = CGRectMake( deadlinetopimg.frame.origin.x, tasklocationview.frame.origin.y+tasklocationview.frame.size.height+2, deadlinetopimg.frame.size.width, deadlinetopimg.frame.size.height);
        btndeadlinearrow.frame = CGRectMake( btndeadlinearrow.frame.origin.x, deadlinetopimg.frame.origin.y+17, btndeadlinearrow.frame.size.width, btndeadlinearrow.frame.size.height);
        btndeadlineextra.frame = CGRectMake( btndeadlineextra.frame.origin.x, deadlinetopimg.frame.origin.y, btndeadlineextra.frame.size.width, btndeadlineextra.frame.size.height);
        lbldeadline.frame = CGRectMake( lbldeadline.frame.origin.x, deadlinetopimg.frame.origin.y+15, lbldeadline.frame.size.width, lbldeadline.frame.size.height);
 deadlineview.frame=CGRectMake(deadlineview.frame.origin.x, deadlinetopimg.frame.origin.y+deadlinetopimg.frame.size.height, deadlineview.frame.size.width, deadlineview.frame.size.height);
     
        //priceview goes down
        pricetopimg.frame = CGRectMake( pricetopimg.frame.origin.x, deadlineview.frame.origin.y+deadlineview.frame.size.height, pricetopimg.frame.size.width, pricetopimg.frame.size.height);
        btnpricearrow.frame = CGRectMake( btnpricearrow.frame.origin.x, pricetopimg.frame.origin.y+17, btnpricearrow.frame.size.width, btnpricearrow.frame.size.height);
        btnpriceextra.frame = CGRectMake( btnpriceextra.frame.origin.x, pricetopimg.frame.origin.y, btnpriceextra.frame.size.width, btnpriceextra.frame.size.height);
        lblprice.frame = CGRectMake( lblprice.frame.origin.x, pricetopimg.frame.origin.y+15, lblprice.frame.size.width, lblprice.frame.size.height);
        priceview.frame = CGRectMake( priceview.frame.origin.x, pricetopimg.frame.origin.y+pricetopimg.frame.size.height, priceview.frame.size.width, priceview.frame.size.height);
            }
    [btndeliverychk setBackgroundImage:[UIImage imageNamed:@"tick2.png"] forState:UIControlStateNormal];
    [btndeliverychk setBackgroundImage:[UIImage imageNamed:@"tick1.png"] forState:UIControlStateSelected];
    [btndeliverychk setBackgroundImage:[UIImage imageNamed:@"tick1.png"] forState:UIControlStateHighlighted];
}


- (IBAction)deadlinearrowclk:(id)sender {
    NSLog(@"deadline view");
    if (btndeadlinearrow.selected==YES)
    {
        
        [self expanddeadlineview];
        
    }
    else
    {
        
        [self collapsedeadlineview];
        
    }
}

- (IBAction)deadlinebtnextraclk:(id)sender {
    
    NSLog(@"deadline view");
    if (btndeadlinearrow.selected==YES)
    {
        
        [self expanddeadlineview];
        
    }
    else
    {
        
        [self collapsedeadlineview];
        
    }
    
}



- (IBAction)bidclosedeadlineclk:(id)sender {
    if (btnbidclosedeadline.selected==NO) {
        NSLog(@"btnbidclosedeadline not selected");
    [datepicker removeFromSuperview];

        [txtpcode resignFirstResponder];
        [mainscroll setContentOffset:CGPointMake(0,deadlineview.frame.origin.y-40) animated:YES];

        [self viewremove];
         viewbidcls=[[UIView alloc]initWithFrame:CGRectMake(self.view.frame.origin.x, self.view.frame.origin.y, self.view.frame.size.width,self.view.frame.size.height)];
     //   viewbidcls=[[UIView alloc]initWithFrame:CGRectMake(self.view.frame.origin.x, self.view.frame.size.height-200, self.view.frame.size.width,200)];
        [viewbidcls setBackgroundColor:[[UIColor blackColor]colorWithAlphaComponent:0.8]];
   //      [viewbidcls setBackgroundColor:[UIColor grayColor]];
        [self.view addSubview:viewbidcls];

        
        
   
  
 //   datepicker=[[UIDatePicker alloc] initWithFrame:CGRectMake(self.view.frame.origin.x, self.view.frame.origin.y+self.view.frame.size.height-150, self.view.frame.size.width-200,150)];
        datepicker=[[UIDatePicker alloc] initWithFrame:CGRectMake(self.view.frame.origin.x, 180, self.view.frame.size.width-300,150)];
    datepicker.datePickerMode = UIDatePickerModeDateAndTime;
        [datepicker setBackgroundColor:[UIColor whiteColor]];
        datepicker.tag=111;
        //current date
        NSDate *currDate = [NSDate date];
        NSDateFormatter *dateFormatter = [[NSDateFormatter alloc]init];
        [dateFormatter setDateFormat:@"ddMMyyyyhh:mma"];
        NSString *dateString = [dateFormatter stringFromDate:currDate];
        NSLog(@"%@",dateString);
      //  NSLog(@"current date=%@",currDate);
        [datepicker setMinimumDate:currDate];
    datepicker.hidden = NO;
    datepicker.date = [NSDate date];
    
    //   [datepicker addTarget:self action:@selector(biddateChange) forControlEvents:UIControlEventValueChanged];
    [viewbidcls addSubview:datepicker];
   
        btndtsave = [UIButton buttonWithType:UIButtonTypeCustom];
        btndtsave.frame = CGRectMake(datepicker.frame.origin.x+datepicker.frame.size.width-50,datepicker.frame.origin.y-50, 50, 20);
     //   btndtsave.frame = CGRectMake(datepicker.frame.origin.x+datepicker.frame.size.width-50, 0, 50, 20);
        [btndtsave setTitle:@"Save" forState:UIControlStateNormal];
    //   btndtsave.backgroundColor = [UIColor whiteColor];
        [btndtsave setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal ];
        btndtsave.titleLabel.font = [UIFont fontWithName:@"OpenSans-Semibold" size:14.0];
        [btndtsave addTarget:self action:@selector(biddateChange) forControlEvents:UIControlEventTouchUpInside];
        [viewbidcls addSubview:btndtsave];
        [viewbidcls bringSubviewToFront:btndtsave];
        
        btndtcancel = [UIButton buttonWithType:UIButtonTypeCustom];
        btndtcancel.frame = CGRectMake(datepicker.frame.origin.x,datepicker.frame.origin.y-50, 50, 20);
        //   btndtsave.frame = CGRectMake(datepicker.frame.origin.x+datepicker.frame.size.width-50, 0, 50, 20);
        [btndtcancel setTitle:@"Cancel" forState:UIControlStateNormal];
        //   btndtsave.backgroundColor = [UIColor whiteColor];
        [btndtcancel setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal ];
        btndtcancel.titleLabel.font = [UIFont fontWithName:@"OpenSans-Semibold" size:14.0];
        [btndtcancel addTarget:self action:@selector(biddateCancel) forControlEvents:UIControlEventTouchUpInside];
        [viewbidcls addSubview:btndtcancel];
        [viewbidcls bringSubviewToFront:btndtcancel];
    
    NSDateFormatter * df = [[NSDateFormatter alloc] init];
    [df setDateFormat:@"ddMMyyyyhh:mma"]; // from here u can change format..
    biddatetime=[df stringFromDate:datepicker.date];
    lblbiddt.text=[biddatetime substringWithRange:NSMakeRange(0, 2)];
    lblbidmonth.text=[biddatetime substringWithRange:NSMakeRange(2, 2)];
    lblbidyr.text=[biddatetime substringWithRange:NSMakeRange(4, 4)];
    lblbidtime.text=[biddatetime substringWithRange:NSMakeRange(8, 7)];
    NSLog(@"date=%@",biddatetime);
 /*
    deadlineview.frame = CGRectMake( deadlineview.frame.origin.x, deadlineview.frame.origin.y, deadlineview.frame.size.width, deadlineview.frame.size.height+datepicker.frame.size.height+btndtsave.frame.size.height);
    deadlinemainview.frame = CGRectMake( deadlinemainview.frame.origin.x, deadlinemainview.frame.origin.y, deadlinemainview.frame.size.width, deadlinemainview.frame.size.height+datepicker.frame.size.height+btndtsave.frame.size.height);
    lbltaskcompletiondt.frame = CGRectMake( lbltaskcompletiondt.frame.origin.x, lbltaskcompletiondt.frame.origin.y+datepicker.frame.size.height+btndtsave.frame.size.height, lbltaskcompletiondt.frame.size.width, lbltaskcompletiondt.frame.size.height);
    taskcompdtview.frame = CGRectMake( taskcompdtview.frame.origin.x, taskcompdtview.frame.origin.y+datepicker.frame.size.height+btndtsave.frame.size.height, taskcompdtview.frame.size.width, taskcompdtview.frame.size.height);
       
        btntaskcompdt.frame = CGRectMake( btntaskcompdt.frame.origin.x, btntaskcompdt.frame.origin.y+datepicker.frame.size.height+btndtsave.frame.size.height, btntaskcompdt.frame.size.width, btntaskcompdt.frame.size.height);
    taskcompdatepicker.frame=CGRectMake(taskcompdtview.frame.origin.x, taskcompdtview.frame.origin.y+taskcompdtview.frame.size.height+btndtsave.frame.size.height, taskcompdtview.frame.size.width, 100);
 btndtcompsave.frame=CGRectMake(taskcompdtview.frame.origin.x+taskcompdtview.frame.size.width-50, taskcompdtview.frame.origin.y+taskcompdtview.frame.size.height, 50, 20);
    //price view position change
    pricetopimg.frame = CGRectMake( pricetopimg.frame.origin.x, deadlineview.frame.origin.y+deadlineview.frame.size.height+2, pricetopimg.frame.size.width, pricetopimg.frame.size.height);
    btnpricearrow.frame = CGRectMake( btnpricearrow.frame.origin.x, pricetopimg.frame.origin.y+17, btnpricearrow.frame.size.width, btnpricearrow.frame.size.height);
    btnpriceextra.frame = CGRectMake( btnpriceextra.frame.origin.x, pricetopimg.frame.origin.y, btnpriceextra.frame.size.width, btnpriceextra.frame.size.height);
    lblprice.frame = CGRectMake( lblprice.frame.origin.x, pricetopimg.frame.origin.y+17, lblprice.frame.size.width, lblprice.frame.size.height);
    priceview.frame = CGRectMake( priceview.frame.origin.x, pricetopimg.frame.origin.y+pricetopimg.frame.size.height, priceview.frame.size.width, priceview.frame.size.height);
    mainscroll.contentSize = CGSizeMake(0, mainscroll.contentSize.height+datepicker.frame.size.height);
  */
         btnbidclosedeadline.selected=YES;
    }
    else
    {
         btnbidclosedeadline.selected=NO;
        [self viewremove];        /*
        deadlineview.frame = CGRectMake( deadlineview.frame.origin.x, deadlineview.frame.origin.y, deadlineview.frame.size.width, deadlineview.frame.size.height-datepicker.frame.size.height-btndtsave.frame.size.height);
        deadlinemainview.frame = CGRectMake( deadlinemainview.frame.origin.x, deadlinemainview.frame.origin.y, deadlinemainview.frame.size.width, deadlinemainview.frame.size.height-datepicker.frame.size.height-btndtsave.frame.size.height);
        lbltaskcompletiondt.frame = CGRectMake( lbltaskcompletiondt.frame.origin.x, lbltaskcompletiondt.frame.origin.y-datepicker.frame.size.height-btndtsave.frame.size.height, lbltaskcompletiondt.frame.size.width, lbltaskcompletiondt.frame.size.height);
        taskcompdtview.frame = CGRectMake( taskcompdtview.frame.origin.x, taskcompdtview.frame.origin.y-datepicker.frame.size.height-btndtsave.frame.size.height, taskcompdtview.frame.size.width, taskcompdtview.frame.size.height);
        
         btntaskcompdt.frame = CGRectMake( btntaskcompdt.frame.origin.x, btntaskcompdt.frame.origin.y-datepicker.frame.size.height-btndtsave.frame.size.height, btntaskcompdt.frame.size.width, btntaskcompdt.frame.size.height);
        taskcompdatepicker.frame=CGRectMake(taskcompdtview.frame.origin.x, taskcompdtview.frame.origin.y+taskcompdtview.frame.size.height+btndtsave.frame.size.height, taskcompdtview.frame.size.width, 100);
        btndtcompsave.frame=CGRectMake(taskcompdtview.frame.origin.x+taskcompdtview.frame.size.width-50, taskcompdtview.frame.origin.y+taskcompdtview.frame.size.height, 50, 20);
        //price view position change
        pricetopimg.frame = CGRectMake( pricetopimg.frame.origin.x, deadlineview.frame.origin.y+deadlineview.frame.size.height+2, pricetopimg.frame.size.width, pricetopimg.frame.size.height);
        btnpricearrow.frame = CGRectMake( btnpricearrow.frame.origin.x, pricetopimg.frame.origin.y+17, btnpricearrow.frame.size.width, btnpricearrow.frame.size.height);
        btnpriceextra.frame = CGRectMake( btnpriceextra.frame.origin.x, pricetopimg.frame.origin.y, btnpriceextra.frame.size.width, btnpriceextra.frame.size.height);
        lblprice.frame = CGRectMake( lblprice.frame.origin.x, pricetopimg.frame.origin.y+17, lblprice.frame.size.width, lblprice.frame.size.height);
        priceview.frame = CGRectMake( priceview.frame.origin.x, pricetopimg.frame.origin.y+pricetopimg.frame.size.height, priceview.frame.size.width, priceview.frame.size.height);
        mainscroll.contentSize = CGSizeMake(0, mainscroll.contentSize.height-datepicker.frame.size.height);
         */
    }
}
-(void)biddateCancel
{
    btnbidclosedeadline.selected=NO;
    [self viewremove];
}
- (IBAction)taskcompdeadclk:(id)sender {
    
    if (btntaskcompdt.selected==NO) {
       
     [mainscroll setContentOffset:CGPointMake(0,deadlineview.frame.origin.y+150) animated:YES];
        [self viewremove];
    btntaskcompdt.selected=YES;
        
        viewtaskcls=[[UIView alloc]initWithFrame:CGRectMake(self.view.frame.origin.x, self.view.frame.origin.y, self.view.frame.size.width,self.view.frame.size.height)];
        //   viewbidcls=[[UIView alloc]initWithFrame:CGRectMake(self.view.frame.origin.x, self.view.frame.size.height-200, self.view.frame.size.width,200)];
        [viewtaskcls setBackgroundColor:[[UIColor blackColor]colorWithAlphaComponent:0.8]];
        //      [viewbidcls setBackgroundColor:[UIColor grayColor]];
        [self.view addSubview:viewtaskcls];
        
    

    taskcompdatepicker=[[UIDatePicker alloc] initWithFrame:CGRectMake(self.view.frame.origin.x, 180, self.view.frame.size.width-300,150)];
    taskcompdatepicker.datePickerMode = UIDatePickerModeDateAndTime;
        //current date
        NSDate *currDate = [NSDate date];
        NSDateFormatter *dateFormatter = [[NSDateFormatter alloc]init];
        [dateFormatter setDateFormat:@"ddMMyyyyhh:mma"];
        NSString *dateString = [dateFormatter stringFromDate:currDate];
        NSLog(@"%@",dateString);
        [taskcompdatepicker setBackgroundColor:[UIColor whiteColor]];
        //  NSLog(@"current date=%@",currDate);
        [taskcompdatepicker setMinimumDate:currDate];
    taskcompdatepicker.hidden = NO;
    taskcompdatepicker.date = [NSDate date];
    
    //   [datepicker addTarget:self action:@selector(biddateChange) forControlEvents:UIControlEventValueChanged];
    [viewtaskcls addSubview:taskcompdatepicker];
    
        btndtcompsave=[[UIButton alloc] initWithFrame:CGRectMake(taskcompdatepicker.frame.origin.x+taskcompdatepicker.frame.size.width-50, taskcompdatepicker.frame.origin.y-50, 50, 20)];
        // btndtcompsave = [UIButton buttonWithType:UIButtonTypeCustom];
        [btndtcompsave setTitle:@"Save" forState:UIControlStateNormal];
        btndtcompsave.backgroundColor = [UIColor clearColor];
        [btndtcompsave setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal ];
        btndtcompsave.titleLabel.font = [UIFont fontWithName:@"OpenSans-Semibold" size:14.0];
        [btndtcompsave addTarget:self action:@selector(taskcompdateChange) forControlEvents:UIControlEventTouchUpInside];
        [viewtaskcls addSubview:btndtcompsave];
        
        btndtcompcancel=[[UIButton alloc] initWithFrame:CGRectMake(taskcompdatepicker.frame.origin.x, taskcompdatepicker.frame.origin.y-50, 50, 20)];
        // btndtcompsave = [UIButton buttonWithType:UIButtonTypeCustom];
        [btndtcompcancel setTitle:@"Cancel" forState:UIControlStateNormal];
        btndtcompcancel.backgroundColor = [UIColor clearColor];
        [btndtcompcancel setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal ];
        btndtcompcancel.titleLabel.font = [UIFont fontWithName:@"OpenSans-Semibold" size:14.0];
        [btndtcompcancel addTarget:self action:@selector(taskcompdateCancel) forControlEvents:UIControlEventTouchUpInside];
        [viewtaskcls addSubview:btndtcompcancel];
    
    NSDateFormatter * df = [[NSDateFormatter alloc] init];
    [df setDateFormat:@"ddMMyyyyhh:mma"]; // from here u can change format..
    taskclsdatetime=[df stringFromDate:taskcompdatepicker.date];
    lbltaskdt.text=[taskclsdatetime substringWithRange:NSMakeRange(0, 2)];
    lbltaskmonth.text=[taskclsdatetime substringWithRange:NSMakeRange(2, 2)];
    lbltaskyr.text=[taskclsdatetime substringWithRange:NSMakeRange(4, 4)];
    lbltasktime.text=[taskclsdatetime substringWithRange:NSMakeRange(8, 7)];
    NSLog(@"date=%@",taskclsdatetime);
/*
    deadlineview.frame = CGRectMake( deadlineview.frame.origin.x, deadlineview.frame.origin.y, deadlineview.frame.size.width, deadlineview.frame.size.height+taskcompdatepicker.frame.size.height+btndtcompsave.frame.size.height);
    deadlinemainview.frame = CGRectMake( deadlinemainview.frame.origin.x, deadlinemainview.frame.origin.y, deadlinemainview.frame.size.width, deadlinemainview.frame.size.height+taskcompdatepicker.frame.size.height+btndtcompsave.frame.size.height);
   
    //price view position change
    pricetopimg.frame = CGRectMake( pricetopimg.frame.origin.x, deadlineview.frame.origin.y+deadlineview.frame.size.height+2, pricetopimg.frame.size.width, pricetopimg.frame.size.height);
    btnpricearrow.frame = CGRectMake( btnpricearrow.frame.origin.x, pricetopimg.frame.origin.y+17, btnpricearrow.frame.size.width, btnpricearrow.frame.size.height);
    btnpriceextra.frame = CGRectMake( btnpriceextra.frame.origin.x, pricetopimg.frame.origin.y, btnpriceextra.frame.size.width, btnpriceextra.frame.size.height);
    lblprice.frame = CGRectMake( lblprice.frame.origin.x, pricetopimg.frame.origin.y+17, lblprice.frame.size.width, lblprice.frame.size.height);
    priceview.frame = CGRectMake( priceview.frame.origin.x, pricetopimg.frame.origin.y+pricetopimg.frame.size.height, priceview.frame.size.width, priceview.frame.size.height);
    mainscroll.contentSize = CGSizeMake(0, mainscroll.contentSize.height+taskcompdatepicker.frame.size.height);
 */
    }
    else{
        btntaskcompdt.selected=NO;
        [self viewremove];
        /*
        deadlineview.frame = CGRectMake( deadlineview.frame.origin.x, deadlineview.frame.origin.y, deadlineview.frame.size.width, deadlineview.frame.size.height-taskcompdatepicker.frame.size.height-btndtcompsave.frame.size.height);
        deadlinemainview.frame = CGRectMake( deadlinemainview.frame.origin.x, deadlinemainview.frame.origin.y, deadlinemainview.frame.size.width, deadlinemainview.frame.size.height-taskcompdatepicker.frame.size.height-btndtcompsave.frame.size.height);
        
        //price view position change
        pricetopimg.frame = CGRectMake( pricetopimg.frame.origin.x, deadlineview.frame.origin.y+deadlineview.frame.size.height+2, pricetopimg.frame.size.width, pricetopimg.frame.size.height);
        btnpricearrow.frame = CGRectMake( btnpricearrow.frame.origin.x, pricetopimg.frame.origin.y+17, btnpricearrow.frame.size.width, btnpricearrow.frame.size.height);
        btnpriceextra.frame = CGRectMake( btnpriceextra.frame.origin.x, pricetopimg.frame.origin.y, btnpriceextra.frame.size.width, btnpriceextra.frame.size.height);
        lblprice.frame = CGRectMake( lblprice.frame.origin.x, pricetopimg.frame.origin.y+17, lblprice.frame.size.width, lblprice.frame.size.height);
        priceview.frame = CGRectMake( priceview.frame.origin.x, pricetopimg.frame.origin.y+pricetopimg.frame.size.height, priceview.frame.size.width, priceview.frame.size.height);
        mainscroll.contentSize = CGSizeMake(0, mainscroll.contentSize.height-taskcompdatepicker.frame.size.height);
         */
    }
}
-(void)taskcompdateCancel
{
    btntaskcompdt.selected=NO;
    [self viewremove];
}

-(void)biddateChange
{
    btnbidclosedeadline.selected=NO;
    NSDateFormatter * df = [[NSDateFormatter alloc] init];
    [df setDateFormat:@"ddMMyyyyhh:mma"]; // from here u can change format..
    biddatetime=[df stringFromDate:datepicker.date];
    lblbiddt.text=[biddatetime substringWithRange:NSMakeRange(0, 2)];
    lblbidmonth.text=[biddatetime substringWithRange:NSMakeRange(2, 2)];
    lblbidyr.text=[biddatetime substringWithRange:NSMakeRange(4, 4)];
    lblbidtime.text=[biddatetime substringWithRange:NSMakeRange(8, 7)];
    NSLog(@"date=%@",biddatetime);
    [datepicker removeFromSuperview];
    [btndtsave removeFromSuperview];
    [viewbidcls removeFromSuperview];
    /*
    deadlineview.frame = CGRectMake( deadlineview.frame.origin.x, deadlineview.frame.origin.y, deadlineview.frame.size.width, deadlineview.frame.size.height-datepicker.frame.size.height-btndtsave.frame.size.height);
    deadlinemainview.frame = CGRectMake( deadlinemainview.frame.origin.x, deadlinemainview.frame.origin.y, deadlinemainview.frame.size.width, deadlinemainview.frame.size.height-datepicker.frame.size.height-btndtsave.frame.size.height);
    lbltaskcompletiondt.frame = CGRectMake( lbltaskcompletiondt.frame.origin.x, lbltaskcompletiondt.frame.origin.y-datepicker.frame.size.height-btndtsave.frame.size.height, lbltaskcompletiondt.frame.size.width, lbltaskcompletiondt.frame.size.height);
    taskcompdtview.frame = CGRectMake( taskcompdtview.frame.origin.x, taskcompdtview.frame.origin.y-datepicker.frame.size.height-btndtsave.frame.size.height, taskcompdtview.frame.size.width, taskcompdtview.frame.size.height);
    
    btntaskcompdt.frame = CGRectMake( btntaskcompdt.frame.origin.x, btntaskcompdt.frame.origin.y-datepicker.frame.size.height-btndtsave.frame.size.height, btntaskcompdt.frame.size.width, btntaskcompdt.frame.size.height);
    taskcompdatepicker.frame=CGRectMake(taskcompdtview.frame.origin.x, taskcompdtview.frame.origin.y+taskcompdtview.frame.size.height+btndtsave.frame.size.height, taskcompdtview.frame.size.width, 100);
    btndtcompsave.frame=CGRectMake(taskcompdtview.frame.origin.x+taskcompdtview.frame.size.width-50, taskcompdtview.frame.origin.y+taskcompdtview.frame.size.height, 50, 20);
    //price view position change
    pricetopimg.frame = CGRectMake( pricetopimg.frame.origin.x, deadlineview.frame.origin.y+deadlineview.frame.size.height+2, pricetopimg.frame.size.width, pricetopimg.frame.size.height);
    btnpricearrow.frame = CGRectMake( btnpricearrow.frame.origin.x, pricetopimg.frame.origin.y+17, btnpricearrow.frame.size.width, btnpricearrow.frame.size.height);
    btnpriceextra.frame = CGRectMake( btnpriceextra.frame.origin.x, pricetopimg.frame.origin.y, btnpriceextra.frame.size.width, btnpriceextra.frame.size.height);
    lblprice.frame = CGRectMake( lblprice.frame.origin.x, pricetopimg.frame.origin.y+17, lblprice.frame.size.width, lblprice.frame.size.height);
    priceview.frame = CGRectMake( priceview.frame.origin.x, pricetopimg.frame.origin.y+pricetopimg.frame.size.height, priceview.frame.size.width, priceview.frame.size.height);
    mainscroll.contentSize = CGSizeMake(0, mainscroll.contentSize.height-datepicker.frame.size.height);
     */
    
}
-(void)taskcompdateChange
{
    NSLog(@"task comp save clk");
    btntaskcompdt.selected=NO;
    NSDateFormatter * df = [[NSDateFormatter alloc] init];
    [df setDateFormat:@"ddMMyyyyhh:mma"]; // from here u can change format..
    taskclsdatetime=[df stringFromDate:taskcompdatepicker.date];
    lbltaskdt.text=[taskclsdatetime substringWithRange:NSMakeRange(0, 2)];
    lbltaskmonth.text=[taskclsdatetime substringWithRange:NSMakeRange(2, 2)];
    lbltaskyr.text=[taskclsdatetime substringWithRange:NSMakeRange(4, 4)];
    lbltasktime.text=[taskclsdatetime substringWithRange:NSMakeRange(8, 7)];
    NSLog(@"date=%@",taskclsdatetime);
    
    [self viewremove];
    /*
    deadlineview.frame = CGRectMake( deadlineview.frame.origin.x, deadlineview.frame.origin.y, deadlineview.frame.size.width, deadlineview.frame.size.height-taskcompdatepicker.frame.size.height-btndtcompsave.frame.size.height);
    deadlinemainview.frame = CGRectMake( deadlinemainview.frame.origin.x, deadlinemainview.frame.origin.y, deadlinemainview.frame.size.width, deadlinemainview.frame.size.height-taskcompdatepicker.frame.size.height-btndtcompsave.frame.size.height);
    
    //price view position change
    pricetopimg.frame = CGRectMake( pricetopimg.frame.origin.x, deadlineview.frame.origin.y+deadlineview.frame.size.height+2, pricetopimg.frame.size.width, pricetopimg.frame.size.height);
    btnpricearrow.frame = CGRectMake( btnpricearrow.frame.origin.x, pricetopimg.frame.origin.y+17, btnpricearrow.frame.size.width, btnpricearrow.frame.size.height);
    btnpriceextra.frame = CGRectMake( btnpriceextra.frame.origin.x, pricetopimg.frame.origin.y, btnpriceextra.frame.size.width, btnpriceextra.frame.size.height);
    lblprice.frame = CGRectMake( lblprice.frame.origin.x, pricetopimg.frame.origin.y+17, lblprice.frame.size.width, lblprice.frame.size.height);
    priceview.frame = CGRectMake( priceview.frame.origin.x, pricetopimg.frame.origin.y+pricetopimg.frame.size.height, priceview.frame.size.width, priceview.frame.size.height);
    mainscroll.contentSize = CGSizeMake(0, mainscroll.contentSize.height-taskcompdatepicker.frame.size.height);
     */
}
-(void)expanddeadlineview
{
    [UIView beginAnimations:@"ToggleViews" context:nil];
    [UIView setAnimationRepeatCount:1];
    [UIView setAnimationRepeatAutoreverses:NO];
    
    btndeadlinearrow.selected=NO;
    [btndeadlinearrow setBackgroundImage:[UIImage imageNamed:@"uparrow.png"] forState:UIControlStateNormal];
    
    [btndeadlinearrow setBackgroundImage:[UIImage imageNamed:@"down-arrow.png"] forState:UIControlStateSelected];
    
    [btndeadlinearrow setBackgroundImage:[UIImage imageNamed:@"down-arrow.png"] forState:UIControlStateHighlighted];
    [deadlinemainview setHidden:NO];
    [deadlineview setHidden:NO];
    
    //price view position change
    pricetopimg.frame = CGRectMake( pricetopimg.frame.origin.x, deadlineview.frame.origin.y+deadlineview.frame.size.height+2, pricetopimg.frame.size.width, pricetopimg.frame.size.height);
    btnpricearrow.frame = CGRectMake( btnpricearrow.frame.origin.x, pricetopimg.frame.origin.y+17, btnpricearrow.frame.size.width, btnpricearrow.frame.size.height);
    btnpriceextra.frame = CGRectMake( btnpriceextra.frame.origin.x, pricetopimg.frame.origin.y, btnpriceextra.frame.size.width, btnpriceextra.frame.size.height);
    lblprice.frame = CGRectMake( lblprice.frame.origin.x, pricetopimg.frame.origin.y+17, lblprice.frame.size.width, lblprice.frame.size.height);
    priceview.frame = CGRectMake( priceview.frame.origin.x, pricetopimg.frame.origin.y+pricetopimg.frame.size.height, priceview.frame.size.width, priceview.frame.size.height);
    mainscroll.contentSize = CGSizeMake(0, mainscroll.contentSize.height+deadlineview.frame.size.height);
    [UIView commitAnimations];
}
-(void)collapsedeadlineview
{
    
    
    [UIView beginAnimations:@"ToggleViews" context:nil];
    [UIView setAnimationRepeatCount:1];
    [UIView setAnimationRepeatAutoreverses:NO];
    
    btndeadlinearrow.selected=YES;
    [btndeadlinearrow setBackgroundImage:[UIImage imageNamed:@"uparrow.png"] forState:UIControlStateNormal];
    
    [btndeadlinearrow setBackgroundImage:[UIImage imageNamed:@"down-arrow.png"] forState:UIControlStateSelected];
    
    [btndeadlinearrow setBackgroundImage:[UIImage imageNamed:@"down-arrow.png"] forState:UIControlStateHighlighted];
    [deadlinemainview setHidden:YES];
    [deadlineview setHidden:YES];
    
    //price view position change
    pricetopimg.frame = CGRectMake( pricetopimg.frame.origin.x, pricetopimg.frame.origin.y-deadlineview.frame.size.height, pricetopimg.frame.size.width, pricetopimg.frame.size.height);
    btnpricearrow.frame = CGRectMake( btnpricearrow.frame.origin.x, pricetopimg.frame.origin.y+17, btnpricearrow.frame.size.width, btnpricearrow.frame.size.height);
    btnpriceextra.frame = CGRectMake( btnpriceextra.frame.origin.x, pricetopimg.frame.origin.y, btnpriceextra.frame.size.width, btnpriceextra.frame.size.height);
    lblprice.frame = CGRectMake( lblprice.frame.origin.x, pricetopimg.frame.origin.y+17, lblprice.frame.size.width, lblprice.frame.size.height);
    priceview.frame = CGRectMake( priceview.frame.origin.x, pricetopimg.frame.origin.y+pricetopimg.frame.size.height, priceview.frame.size.width, priceview.frame.size.height);
    
    mainscroll.contentSize = CGSizeMake(0, mainscroll.contentSize.height-deadlineview.frame.size.height);
    [UIView commitAnimations];
}
- (IBAction)pricearrowclk:(id)sender {
    NSLog(@"price view");
    if (btnpricearrow.selected==YES)
    {
        
        [self expandpriceview];
    }
    else
    {
        [self collapsepriceview];
        
    }
    
}

- (IBAction)perjobclk:(id)sender {
    
    if (btnperjob.selected==YES)
    {
        
        
    }
    else
    {
        //per job button selected
        btnperjob.selected=YES;
        btnradioperjob.selected=YES;
        [btnperjob setBackgroundImage:[UIImage imageNamed:@"bg1.png"] forState:UIControlStateNormal];
        
        [btnperjob setBackgroundImage:[UIImage imageNamed:@"bg3.png"] forState:UIControlStateSelected];
        
        [btnperjob setBackgroundImage:[UIImage imageNamed:@"bg3.png"] forState:UIControlStateHighlighted];
        
        [btnradioperjob setBackgroundImage:[UIImage imageNamed:@"rediobutton1.png"] forState:UIControlStateNormal];
        
        [btnradioperjob setBackgroundImage:[UIImage imageNamed:@"rediobutton2.png"] forState:UIControlStateSelected];
        
        [btnradioperjob setBackgroundImage:[UIImage imageNamed:@"rediobutton2.png"] forState:UIControlStateHighlighted];
        txtperjob.placeholder=@"     Amount in $";
        
        //per hour button reset
        btnperhour.selected=NO;
        btnradioperhour.selected=NO;
        [btnperhour setBackgroundImage:[UIImage imageNamed:@"bg1.png"] forState:UIControlStateNormal];
        
        [btnperhour setBackgroundImage:[UIImage imageNamed:@"bg3.png"] forState:UIControlStateSelected];
        
        [btnperhour setBackgroundImage:[UIImage imageNamed:@"bg3.png"] forState:UIControlStateHighlighted];
        
        [btnradioperhour setBackgroundImage:[UIImage imageNamed:@"rediobutton1.png"] forState:UIControlStateNormal];
        
        [btnradioperhour setBackgroundImage:[UIImage imageNamed:@"rediobutton2.png"] forState:UIControlStateSelected];
        
        [btnradioperhour setBackgroundImage:[UIImage imageNamed:@"rediobutton2.png"] forState:UIControlStateHighlighted];
    }
    
}

- (IBAction)perhourclk:(id)sender {
    if (btnperhour.selected==YES)
    {
        
        
    }
    else
    {
        //per hour button selected
        btnperhour.selected=YES;
        btnradioperhour.selected=YES;
        
        [btnperhour setBackgroundImage:[UIImage imageNamed:@"bg1.png"] forState:UIControlStateNormal];
        [btnperhour setBackgroundImage:[UIImage imageNamed:@"bg3.png"] forState:UIControlStateSelected];
        
        [btnperhour setBackgroundImage:[UIImage imageNamed:@"bg3.png"] forState:UIControlStateHighlighted];
        
        [btnradioperhour setBackgroundImage:[UIImage imageNamed:@"rediobutton1.png"] forState:UIControlStateNormal];
        
        [btnradioperhour setBackgroundImage:[UIImage imageNamed:@"rediobutton2.png"] forState:UIControlStateSelected];
        
        [btnradioperhour setBackgroundImage:[UIImage imageNamed:@"rediobutton2.png"] forState:UIControlStateHighlighted];
        txtperjob.placeholder=@"     Amount in $/hr";
        
        //per job button reset
        btnperjob.selected=NO;
        btnradioperjob.selected=NO;
        [btnperjob setBackgroundImage:[UIImage imageNamed:@"bg1.png"] forState:UIControlStateNormal];
        [btnperjob setBackgroundImage:[UIImage imageNamed:@"bg3.png"] forState:UIControlStateSelected];
        
        [btnperjob setBackgroundImage:[UIImage imageNamed:@"bg3.png"] forState:UIControlStateHighlighted];
        
        [btnradioperjob setBackgroundImage:[UIImage imageNamed:@"rediobutton1.png"] forState:UIControlStateNormal];
        
        [btnradioperjob setBackgroundImage:[UIImage imageNamed:@"rediobutton2.png"] forState:UIControlStateSelected];
        
        [btnradioperjob setBackgroundImage:[UIImage imageNamed:@"rediobutton2.png"] forState:UIControlStateHighlighted];
    }
    
    
}

- (IBAction)perjobradioclk:(id)sender {
    
    if (btnperjob.selected==YES)
    {
        
        
    }
    else
    {
        //per job button selected
        btnperjob.selected=YES;
        btnradioperjob.selected=YES;
        [btnperjob setBackgroundImage:[UIImage imageNamed:@"bg1.png"] forState:UIControlStateNormal];
        
        [btnperjob setBackgroundImage:[UIImage imageNamed:@"bg3.png"] forState:UIControlStateSelected];
        
        [btnperjob setBackgroundImage:[UIImage imageNamed:@"bg3.png"] forState:UIControlStateHighlighted];
        
        [btnradioperjob setBackgroundImage:[UIImage imageNamed:@"rediobutton1.png"] forState:UIControlStateNormal];
        
        [btnradioperjob setBackgroundImage:[UIImage imageNamed:@"rediobutton2.png"] forState:UIControlStateSelected];
        
        [btnradioperjob setBackgroundImage:[UIImage imageNamed:@"rediobutton2.png"] forState:UIControlStateHighlighted];
        txtperjob.placeholder=@"     Amount in $";
        
        //per hour button reset
        btnperhour.selected=NO;
        btnradioperhour.selected=NO;
        [btnperhour setBackgroundImage:[UIImage imageNamed:@"bg1.png"] forState:UIControlStateNormal];
        
        [btnperhour setBackgroundImage:[UIImage imageNamed:@"bg3.png"] forState:UIControlStateSelected];
        
        [btnperhour setBackgroundImage:[UIImage imageNamed:@"bg3.png"] forState:UIControlStateHighlighted];
        
        [btnradioperhour setBackgroundImage:[UIImage imageNamed:@"rediobutton1.png"] forState:UIControlStateNormal];
        
        [btnradioperhour setBackgroundImage:[UIImage imageNamed:@"rediobutton2.png"] forState:UIControlStateSelected];
        
        [btnradioperhour setBackgroundImage:[UIImage imageNamed:@"rediobutton2.png"] forState:UIControlStateHighlighted];
    }
    
    
}

- (IBAction)perhourradioclk:(id)sender {
    if (btnperhour.selected==YES)
    {
        
        
    }
    else
    {
        //per hour button selected
        btnperhour.selected=YES;
        btnradioperhour.selected=YES;
        
        [btnperhour setBackgroundImage:[UIImage imageNamed:@"bg1.png"] forState:UIControlStateNormal];
        [btnperhour setBackgroundImage:[UIImage imageNamed:@"bg3.png"] forState:UIControlStateSelected];
        
        [btnperhour setBackgroundImage:[UIImage imageNamed:@"bg3.png"] forState:UIControlStateHighlighted];
        
        [btnradioperhour setBackgroundImage:[UIImage imageNamed:@"rediobutton1.png"] forState:UIControlStateNormal];
        
        [btnradioperhour setBackgroundImage:[UIImage imageNamed:@"rediobutton2.png"] forState:UIControlStateSelected];
        
        [btnradioperhour setBackgroundImage:[UIImage imageNamed:@"rediobutton2.png"] forState:UIControlStateHighlighted];
        txtperjob.placeholder=@"     Amount in $/hr";
        
        //per job button reset
        btnperjob.selected=NO;
        btnradioperjob.selected=NO;
        [btnperjob setBackgroundImage:[UIImage imageNamed:@"bg1.png"] forState:UIControlStateNormal];
        [btnperjob setBackgroundImage:[UIImage imageNamed:@"bg3.png"] forState:UIControlStateSelected];
        
        [btnperjob setBackgroundImage:[UIImage imageNamed:@"bg3.png"] forState:UIControlStateHighlighted];
        
        [btnradioperjob setBackgroundImage:[UIImage imageNamed:@"rediobutton1.png"] forState:UIControlStateNormal];
        
        [btnradioperjob setBackgroundImage:[UIImage imageNamed:@"rediobutton2.png"] forState:UIControlStateSelected];
        
        [btnradioperjob setBackgroundImage:[UIImage imageNamed:@"rediobutton2.png"] forState:UIControlStateHighlighted];
    }
}
-(void)payclk
{
    if (btnpayarrow.selected==NO)
    {
        btnpayarrow.selected=YES;
     //    [mainscroll setContentOffset:CGPointMake(0,priceview.frame.origin.y+50) animated:YES];
        [self viewremove];
        
        viewpay=[[UIView alloc]initWithFrame:CGRectMake(self.view.frame.origin.x, self.view.frame.origin.y, self.view.frame.size.width,self.view.frame.size.height)];
     //   viewpay=[[UIView alloc]initWithFrame:CGRectMake(self.view.frame.origin.x, self.view.frame.size.height-200, self.view.frame.size.width,200)];
        [viewpay setBackgroundColor:[[UIColor blackColor]colorWithAlphaComponent:0.8]];
        [self.view addSubview:viewpay];
        
        
        
        //picker create
        [amtpicker removeFromSuperview];
        amtpicker=[[UIPickerView alloc]initWithFrame:CGRectMake(self.view.frame.size.width/2-125, 180, 250,150)];
     //   amtpicker=[[UIPickerView alloc]initWithFrame:CGRectMake(self.view.frame.origin.x, 50, self.view.frame.size.width,150)];
        amtpicker.delegate=self;
        amtpicker.dataSource=self;
        [amtpicker setBackgroundColor:[UIColor whiteColor]];
        [viewpay addSubview:amtpicker];
        
        btnpaysave=[[UIButton alloc] initWithFrame:CGRectMake(amtpicker.frame.origin.x+amtpicker.frame.size.width-50, amtpicker.frame.origin.y-50, 50, 50)];
        [btnpaysave setTitle:@"Save" forState:UIControlStateNormal];
        btnpaysave.backgroundColor = [UIColor clearColor];
        [btnpaysave setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal ];
        btnpaysave.titleLabel.font = [UIFont fontWithName:@"OpenSans-Semibold" size:14.0];
        [btnpaysave addTarget:self action:@selector(paypickerChange) forControlEvents:UIControlEventTouchUpInside];
        [viewpay addSubview:btnpaysave];
        
         btnpaycancel=[[UIButton alloc] initWithFrame:CGRectMake(amtpicker.frame.origin.x, amtpicker.frame.origin.y-50, 50, 50)];
        [btnpaycancel setTitle:@"Cancel" forState:UIControlStateNormal];
        btnpaycancel.backgroundColor = [UIColor clearColor];
        [btnpaycancel setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal ];
        btnpaycancel.titleLabel.font = [UIFont fontWithName:@"OpenSans-Semibold" size:14.0];
        [btnpaycancel addTarget:self action:@selector(paypickerCancel) forControlEvents:UIControlEventTouchUpInside];
        [viewpay addSubview:btnpaycancel];
        /*
        //view change
        priceview.frame = CGRectMake( priceview.frame.origin.x, priceview.frame.origin.y, priceview.frame.size.width, priceview.frame.size.height+amtpicker.frame.size.height+btnpaysave.frame.size.height);
        pricemainview.frame = CGRectMake( pricemainview.frame.origin.x, pricemainview.frame.origin.y, pricemainview.frame.size.width, pricemainview.frame.size.height+amtpicker.frame.size.height+btnpaysave.frame.size.height);
        contactoramtpicker.frame = CGRectMake( contactoramtpicker.frame.origin.x, contactoramtpicker.frame.origin.y+amtpicker.frame.size.height+btnpaysave.frame.size.height, contactoramtpicker.frame.size.width, contactoramtpicker.frame.size.height);
        btncontactpaysave.frame = CGRectMake( btncontactpaysave.frame.origin.x, btncontactpaysave.frame.origin.y+amtpicker.frame.size.height+btnpaysave.frame.size.height, btncontactpaysave.frame.size.width, btncontactpaysave.frame.size.height);
        lblcontactorpay.frame = CGRectMake( lblcontactorpay.frame.origin.x, lblcontactorpay.frame.origin.y+amtpicker.frame.size.height+btnpaysave.frame.size.height, lblcontactorpay.frame.size.width, lblcontactorpay.frame.size.height);
        contratorlineimg.frame = CGRectMake( contratorlineimg.frame.origin.x, contratorlineimg.frame.origin.y+amtpicker.frame.size.height+btnpaysave.frame.size.height, contratorlineimg.frame.size.width, contratorlineimg.frame.size.height);
        txtcontractorpay.frame = CGRectMake( txtcontractorpay.frame.origin.x, txtcontractorpay.frame.origin.y+amtpicker.frame.size.height+btnpaysave.frame.size.height, txtcontractorpay.frame.size.width, txtcontractorpay.frame.size.height);
        btncontractpayarrow.frame = CGRectMake( btncontractpayarrow.frame.origin.x, btncontractpayarrow.frame.origin.y+amtpicker.frame.size.height+btnpaysave.frame.size.height, btncontractpayarrow.frame.size.width, btncontractpayarrow.frame.size.height);
        btncontractorpayamt.frame = CGRectMake( btncontractorpayamt.frame.origin.x, btncontractorpayamt.frame.origin.y+amtpicker.frame.size.height+btnpaysave.frame.size.height, btncontractorpayamt.frame.size.width, btncontractorpayamt.frame.size.height);
        if (taskfilled==YES)
        {
            editview.frame=CGRectMake(editview.frame.origin.x, editview.frame.origin.y + amtpicker.frame.size.height+btnpaysave.frame.size.height, editview.frame.size.width, editview.frame.size.height);
            btnpaydetail.frame = CGRectMake( btnpaydetail.frame.origin.x, editview.frame.origin.y+editview.frame.size.height, btnpaydetail.frame.size.width, btnpaydetail.frame.size.height);
        }
        else
        {
             btnpaydetail.frame = CGRectMake( btnpaydetail.frame.origin.x, btnpaydetail.frame.origin.y+amtpicker.frame.size.height+btnpaysave.frame.size.height, btnpaydetail.frame.size.width, btnpaydetail.frame.size.height);
        }
       
        mainscroll.contentSize = CGSizeMake(0, mainscroll.contentSize.height+amtpicker.frame.size.height+btnpaysave.frame.size.height);
         */
    }
    else
    {
        btnpayarrow.selected=NO;
        [self viewremove];
        //view change
  /*      priceview.frame = CGRectMake( priceview.frame.origin.x, priceview.frame.origin.y, priceview.frame.size.width, priceview.frame.size.height-amtpicker.frame.size.height-btnpaysave.frame.size.height);
        pricemainview.frame = CGRectMake( pricemainview.frame.origin.x, pricemainview.frame.origin.y, pricemainview.frame.size.width, pricemainview.frame.size.height-amtpicker.frame.size.height-btnpaysave.frame.size.height);
        contactoramtpicker.frame = CGRectMake( contactoramtpicker.frame.origin.x, contactoramtpicker.frame.origin.y-amtpicker.frame.size.height-btnpaysave.frame.size.height, contactoramtpicker.frame.size.width, contactoramtpicker.frame.size.height);
        btncontactpaysave.frame = CGRectMake( btncontactpaysave.frame.origin.x, btncontactpaysave.frame.origin.y-amtpicker.frame.size.height-btnpaysave.frame.size.height, btncontactpaysave.frame.size.width, btncontactpaysave.frame.size.height);
        lblcontactorpay.frame = CGRectMake( lblcontactorpay.frame.origin.x, lblcontactorpay.frame.origin.y-amtpicker.frame.size.height-btnpaysave.frame.size.height, lblcontactorpay.frame.size.width, lblcontactorpay.frame.size.height);
        contratorlineimg.frame = CGRectMake( contratorlineimg.frame.origin.x, contratorlineimg.frame.origin.y-amtpicker.frame.size.height-btnpaysave.frame.size.height, contratorlineimg.frame.size.width, contratorlineimg.frame.size.height);
        txtcontractorpay.frame = CGRectMake( txtcontractorpay.frame.origin.x, txtcontractorpay.frame.origin.y-amtpicker.frame.size.height-btnpaysave.frame.size.height, txtcontractorpay.frame.size.width, txtcontractorpay.frame.size.height);
        btncontractpayarrow.frame = CGRectMake( btncontractpayarrow.frame.origin.x, btncontractpayarrow.frame.origin.y-amtpicker.frame.size.height-btnpaysave.frame.size.height, btncontractpayarrow.frame.size.width, btncontractpayarrow.frame.size.height);
        btncontractorpayamt.frame = CGRectMake( btncontractorpayamt.frame.origin.x, btncontractorpayamt.frame.origin.y-amtpicker.frame.size.height-btnpaysave.frame.size.height, btncontractorpayamt.frame.size.width, btncontractorpayamt.frame.size.height);
        if (taskfilled==YES)
        {
            editview.frame=CGRectMake(editview.frame.origin.x, editview.frame.origin.y -amtpicker.frame.size.height-btnpaysave.frame.size.height, editview.frame.size.width, editview.frame.size.height);
            btnpaydetail.frame = CGRectMake( btnpaydetail.frame.origin.x, editview.frame.origin.y+editview.frame.size.height, btnpaydetail.frame.size.width, btnpaydetail.frame.size.height);
        }
        else
        {
           btnpaydetail.frame = CGRectMake( btnpaydetail.frame.origin.x, btnpaydetail.frame.origin.y-amtpicker.frame.size.height-btnpaysave.frame.size.height, btnpaydetail.frame.size.width, btnpaydetail.frame.size.height);
        }
        
        mainscroll.contentSize = CGSizeMake(0, mainscroll.contentSize.height-amtpicker.frame.size.height-btnpaysave.frame.size.height);
   */
    }
   
    [btnpayarrow setBackgroundImage:[UIImage imageNamed:@"down-arrow2.png"] forState:UIControlStateNormal];
    [btnpayarrow setBackgroundImage:[UIImage imageNamed:@"down-arrow4.png"] forState:UIControlStateSelected];
    [btnpayarrow setBackgroundImage:[UIImage imageNamed:@"down-arrow4.png"] forState:UIControlStateHighlighted];
}
-(void)paypickerCancel
{
    btnpayarrow.selected=NO;
    [self viewremove];
    [btnpayarrow setBackgroundImage:[UIImage imageNamed:@"down-arrow2.png"] forState:UIControlStateNormal];
    [btnpayarrow setBackgroundImage:[UIImage imageNamed:@"down-arrow4.png"] forState:UIControlStateSelected];
    [btnpayarrow setBackgroundImage:[UIImage imageNamed:@"down-arrow4.png"] forState:UIControlStateHighlighted];
    
}
- (IBAction)payarrowclk:(id)sender
{
    [self payclk];
    
}
-(void)daypickerChange
{
    if ([day isEqualToString:@"" ] || day ==nil) {
        
        txtday.text=[arrday objectAtIndex:0];
    }
    else
    {
    txtday.text=day;
    }
    btnestimateddayarrow.selected=NO;
    day=@"";
  
    [estimatedaypicker removeFromSuperview];
    [btndaysave removeFromSuperview];
    [viewday removeFromSuperview];
}
-(void)repeatpickerChange
{
    if ([repeattask isEqualToString:@"" ] || repeattask ==nil) {
      
        txtrepeattask.text=[arrrepeattask objectAtIndex:0];
    }
    else
    {
          txtrepeattask.text=repeattask;
    }
    btnrepeattaskarrow.selected=NO;
    repeattask=@"";
    [self viewremove];
    
}
-(void)provincepickerChange
{
    btncityarrow.selected=NO;
    if ([province isEqualToString:@"" ] || province ==nil) {
        
        txtprovince.text=[arrcity objectAtIndex:0];
    }
    else
    {
    txtprovince.text=province;
    }
    province=@"";
    
    
    [provincepicker removeFromSuperview];
    [btnprovincesave removeFromSuperview];
    [viewprovince removeFromSuperview];
}
-(void)timepickerChange
{
    btntime.selected=NO;
   
    [imgtimearrow setImage:[UIImage imageNamed:@"down-arrow2.png"]];
    if ([time isEqualToString:@"" ] || time ==nil) {
        
        txttime.text=[arrtime objectAtIndex:0];
    }
    else
    {
    txttime.text=time;
    }
   
    time=@"";
    
    [estimatetimepicker removeFromSuperview];
    [btntimesave removeFromSuperview];
    [viewtime removeFromSuperview];
}
-(void)paypickerChange
{
    [imgtimearrow setImage:[UIImage imageNamed:@"down-arrow2.png"]];
    if ([amtpay isEqualToString:@"" ] || amtpay ==nil) {
        
        txtperjob.text=[@"$ " stringByAppendingString:[arramt objectAtIndex:0]];
    }
    else
    {
    txtperjob.text=amtpay;
    }
    amtpay=@"";
    btnpayarrow.selected=NO;
 /*
    //view change
    priceview.frame = CGRectMake( priceview.frame.origin.x, priceview.frame.origin.y, priceview.frame.size.width, priceview.frame.size.height-amtpicker.frame.size.height);
    pricemainview.frame = CGRectMake( pricemainview.frame.origin.x, pricemainview.frame.origin.y, pricemainview.frame.size.width, pricemainview.frame.size.height-amtpicker.frame.size.height-btnpaysave.frame.size.height);
    contactoramtpicker.frame = CGRectMake( contactoramtpicker.frame.origin.x, contactoramtpicker.frame.origin.y-amtpicker.frame.size.height-btnpaysave.frame.size.height, contactoramtpicker.frame.size.width, contactoramtpicker.frame.size.height);
    btncontactpaysave.frame = CGRectMake( btncontactpaysave.frame.origin.x, btncontactpaysave.frame.origin.y-amtpicker.frame.size.height-btnpaysave.frame.size.height, btncontactpaysave.frame.size.width, btncontactpaysave.frame.size.height);
    lblcontactorpay.frame = CGRectMake( lblcontactorpay.frame.origin.x, lblcontactorpay.frame.origin.y-amtpicker.frame.size.height-btnpaysave.frame.size.height, lblcontactorpay.frame.size.width, lblcontactorpay.frame.size.height);
    contratorlineimg.frame = CGRectMake( contratorlineimg.frame.origin.x, contratorlineimg.frame.origin.y-amtpicker.frame.size.height-btnpaysave.frame.size.height, contratorlineimg.frame.size.width, contratorlineimg.frame.size.height);
    txtcontractorpay.frame = CGRectMake( txtcontractorpay.frame.origin.x, txtcontractorpay.frame.origin.y-amtpicker.frame.size.height-btnpaysave.frame.size.height, txtcontractorpay.frame.size.width, txtcontractorpay.frame.size.height);
    btncontractpayarrow.frame = CGRectMake( btncontractpayarrow.frame.origin.x, btncontractpayarrow.frame.origin.y-amtpicker.frame.size.height-btnpaysave.frame.size.height, btncontractpayarrow.frame.size.width, btncontractpayarrow.frame.size.height);
     btncontractorpayamt.frame = CGRectMake( btncontractorpayamt.frame.origin.x, btncontractorpayamt.frame.origin.y-amtpicker.frame.size.height-btnpaysave.frame.size.height, btncontractorpayamt.frame.size.width, btncontractorpayamt.frame.size.height);
    if (taskfilled==YES)
    {
        editview.frame=CGRectMake(editview.frame.origin.x, editview.frame.origin.y -amtpicker.frame.size.height-btnpaysave.frame.size.height, editview.frame.size.width, editview.frame.size.height);
        btnpaydetail.frame = CGRectMake( btnpaydetail.frame.origin.x, editview.frame.origin.y+editview.frame.size.height, btnpaydetail.frame.size.width, btnpaydetail.frame.size.height);
    }
    else
    {
        btnpaydetail.frame = CGRectMake( btnpaydetail.frame.origin.x, btnpaydetail.frame.origin.y-amtpicker.frame.size.height-btnpaysave.frame.size.height, btnpaydetail.frame.size.width, btnpaydetail.frame.size.height);
    }

   
    mainscroll.contentSize = CGSizeMake(0, mainscroll.contentSize.height-amtpicker.frame.size.height-btnpaysave.frame.size.height);
  */
    [viewpay removeFromSuperview];
    [amtpicker removeFromSuperview];
    [btnpaysave removeFromSuperview];
}
-(void)contactorpaypickerChange
{
    if ([contactorpay isEqualToString:@"" ] || contactorpay ==nil) {
        
      //  txtcontractorpay.text=[@"$ " stringByAppendingString:[arrContractoramt objectAtIndex:0]];
        txtcontractorpay.text=[arrContractoramt objectAtIndex:0];
    }
    else
    {
    txtcontractorpay.text=contactorpay;
    }
        contactorpay=@"";
    btncontractpayarrow.selected=NO;
 /*
    //view change
    if (taskfilled==YES)
    {
        editview.frame=CGRectMake(editview.frame.origin.x, editview.frame.origin.y - contactoramtpicker.frame.size.height-btncontactpaysave.frame.size.height, editview.frame.size.width, editview.frame.size.height);
        btnpaydetail.frame = CGRectMake( btnpaydetail.frame.origin.x, editview.frame.origin.y+editview.frame.size.height, btnpaydetail.frame.size.width, btnpaydetail.frame.size.height);
    }
    else
    {
        btnpaydetail.frame = CGRectMake( btnpaydetail.frame.origin.x, btnpaydetail.frame.origin.y-contactoramtpicker.frame.size.height-btncontactpaysave.frame.size.height, btnpaydetail.frame.size.width, btnpaydetail.frame.size.height);
    }
   
    pricemainview.frame = CGRectMake( pricemainview.frame.origin.x, pricemainview.frame.origin.y, pricemainview.frame.size.width, pricemainview.frame.size.height-contactoramtpicker.frame.size.height-btncontactpaysave.frame.size.height);
    priceview.frame = CGRectMake( priceview.frame.origin.x, priceview.frame.origin.y, priceview.frame.size.width, priceview.frame.size.height-contactoramtpicker.frame.size.height-btncontactpaysave.frame.size.height);
    mainscroll.contentSize = CGSizeMake(0, mainscroll.contentSize.height-contactoramtpicker.frame.size.height-btncontactpaysave.frame.size.height);
  */
   [self viewremove];
}
-(void)contactorpayclk
{
    if (btncontractpayarrow.selected==NO)
    {
        btncontractpayarrow.selected=YES;
     //    [mainscroll setContentOffset:CGPointMake(0,priceview.frame.origin.y+100) animated:YES];
       [self viewremove];
        
         viewcontactorpay=[[UIView alloc]initWithFrame:CGRectMake(self.view.frame.origin.x, self.view.frame.origin.y, self.view.frame.size.width,self.view.frame.size.height)];
   //     viewcontactorpay=[[UIView alloc]initWithFrame:CGRectMake(self.view.frame.origin.x, self.view.frame.size.height-200, self.view.frame.size.width,200)];
        [viewcontactorpay setBackgroundColor:[[UIColor blackColor]colorWithAlphaComponent:0.8]];
        [self.view addSubview:viewcontactorpay];

       
        
        //picker create
        [contactoramtpicker removeFromSuperview];
        contactoramtpicker=[[UIPickerView alloc]initWithFrame:CGRectMake(self.view.frame.size.width/2-125, 180, 250,150)];
         [contactoramtpicker setBackgroundColor:[UIColor whiteColor]];
        //contactoramtpicker=[[UIPickerView alloc]initWithFrame:CGRectMake(self.view.frame.origin.x, 50, self.view.frame.size.width,150)];
        contactoramtpicker.delegate=self;
        contactoramtpicker.dataSource=self;
        [viewcontactorpay addSubview:contactoramtpicker];
        
        btncontactpaysave=[[UIButton alloc] initWithFrame:CGRectMake(contactoramtpicker.frame.origin.x+contactoramtpicker.frame.size.width-50, contactoramtpicker.frame.origin.y-50, 50, 50)];
        //   btncontactpaysave = [UIButton buttonWithType:UIButtonTypeCustom];
        [btncontactpaysave setTitle:@"Save" forState:UIControlStateNormal];
        btncontactpaysave.backgroundColor = [UIColor clearColor];
        [btncontactpaysave setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal ];
        btncontactpaysave.titleLabel.font = [UIFont fontWithName:@"OpenSans-Semibold" size:14.0];
        [btncontactpaysave addTarget:self action:@selector(contactorpaypickerChange) forControlEvents:UIControlEventTouchUpInside];
        [viewcontactorpay addSubview:btncontactpaysave];
        
        btncontactpaycancel=[[UIButton alloc] initWithFrame:CGRectMake(contactoramtpicker.frame.origin.x, contactoramtpicker.frame.origin.y-50, 50, 50)];
        //   btncontactpaysave = [UIButton buttonWithType:UIButtonTypeCustom];
        [btncontactpaycancel setTitle:@"Cancel" forState:UIControlStateNormal];
        btncontactpaycancel.backgroundColor = [UIColor clearColor];
        [btncontactpaycancel setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal ];
        btncontactpaycancel.titleLabel.font = [UIFont fontWithName:@"OpenSans-Semibold" size:14.0];
        [btncontactpaycancel addTarget:self action:@selector(contactorpaypickerCancel) forControlEvents:UIControlEventTouchUpInside];
        [viewcontactorpay addSubview:btncontactpaycancel];
        /*
        //view change
        priceview.frame = CGRectMake( priceview.frame.origin.x, priceview.frame.origin.y, priceview.frame.size.width, priceview.frame.size.height+contactoramtpicker.frame.size.height+btncontactpaysave.frame.size.height);
        pricemainview.frame = CGRectMake( pricemainview.frame.origin.x, pricemainview.frame.origin.y, pricemainview.frame.size.width, pricemainview.frame.size.height+contactoramtpicker.frame.size.height+btncontactpaysave.frame.size.height);
        if (taskfilled==YES)
        {
            editview.frame=CGRectMake(editview.frame.origin.x, editview.frame.origin.y + contactoramtpicker.frame.size.height+btncontactpaysave.frame.size.height, editview.frame.size.width, editview.frame.size.height);
            btnpaydetail.frame = CGRectMake( btnpaydetail.frame.origin.x, editview.frame.origin.y+editview.frame.size.height, btnpaydetail.frame.size.width, btnpaydetail.frame.size.height);
        }
        else
        {
             btnpaydetail.frame = CGRectMake( btnpaydetail.frame.origin.x, btnpaydetail.frame.origin.y+contactoramtpicker.frame.size.height+btncontactpaysave.frame.size.height, btnpaydetail.frame.size.width, btnpaydetail.frame.size.height);
        }
       
        mainscroll.contentSize = CGSizeMake(0, mainscroll.contentSize.height+contactoramtpicker.frame.size.height+btncontactpaysave.frame.size.height);
         */
    }
    else
    {
        btncontractpayarrow.selected=NO;
        [self viewremove];
        /*
        //view change
        priceview.frame = CGRectMake( priceview.frame.origin.x, priceview.frame.origin.y, priceview.frame.size.width, priceview.frame.size.height-contactoramtpicker.frame.size.height-btncontactpaysave.frame.size.height);
        pricemainview.frame = CGRectMake( pricemainview.frame.origin.x, pricemainview.frame.origin.y, pricemainview.frame.size.width, pricemainview.frame.size.height-contactoramtpicker.frame.size.height-btncontactpaysave.frame.size.height);
        if (taskfilled==YES)
        {
            editview.frame=CGRectMake(editview.frame.origin.x, editview.frame.origin.y - contactoramtpicker.frame.size.height-btncontactpaysave.frame.size.height, editview.frame.size.width, editview.frame.size.height);
            btnpaydetail.frame = CGRectMake( btnpaydetail.frame.origin.x, editview.frame.origin.y+editview.frame.size.height, btnpaydetail.frame.size.width, btnpaydetail.frame.size.height);
        }
        else
        {
            btnpaydetail.frame = CGRectMake( btnpaydetail.frame.origin.x, btnpaydetail.frame.origin.y-contactoramtpicker.frame.size.height-btncontactpaysave.frame.size.height, btnpaydetail.frame.size.width, btnpaydetail.frame.size.height);
        }
        
        mainscroll.contentSize = CGSizeMake(0, mainscroll.contentSize.height-contactoramtpicker.frame.size.height-btncontactpaysave.frame.size.height);
          */
    }
        
    [btncontractpayarrow setBackgroundImage:[UIImage imageNamed:@"down-arrow2.png"] forState:UIControlStateNormal];
    [btncontractpayarrow setBackgroundImage:[UIImage imageNamed:@"down-arrow4.png"] forState:UIControlStateSelected];
    [btncontractpayarrow setBackgroundImage:[UIImage imageNamed:@"down-arrow4.png"] forState:UIControlStateHighlighted];
}
-(void)contactorpaypickerCancel
{
    btncontractpayarrow.selected=NO;
    [self viewremove];
    [btncontractpayarrow setBackgroundImage:[UIImage imageNamed:@"down-arrow2.png"] forState:UIControlStateNormal];
    [btncontractpayarrow setBackgroundImage:[UIImage imageNamed:@"down-arrow4.png"] forState:UIControlStateSelected];
    [btncontractpayarrow setBackgroundImage:[UIImage imageNamed:@"down-arrow4.png"] forState:UIControlStateHighlighted];
}
- (IBAction)contactorpayarrowclk:(id)sender
{
    [self contactorpayclk];
    
}

- (IBAction)pricebtnextraclk:(id)sender {
    NSLog(@"price view");
    if (btnpricearrow.selected==YES)
    {
        
        [self expandpriceview];
    }
    else
    {
        [self collapsepriceview];
        
    }
    
}

- (IBAction)payextraclk:(id)sender
{
    
    [self payclk];
}

- (IBAction)contactorpayextraclk:(id)sender
{
    [self contactorpayclk];
}

- (IBAction)paydetailclk:(id)sender
{
    // [self afterpaymenturl1];
 
    NSDateFormatter *dt = [[NSDateFormatter alloc] init];
    [dt setDateFormat:@"ddMMyyyyhh:mma"];
    NSDate *bidDate = [dt dateFromString:biddatetime];
    NSDate *taskDate = [dt dateFromString:taskclsdatetime];

    NSComparisonResult result;
    result = [bidDate compare:taskDate]; // comparing two dates
 
  //  if(result==NSOrderedAscending)
  //      NSLog(@"biddatetime is less");
 //   else if(result==NSOrderedDescending)
 //       NSLog(@"taskclsdatetime is less");
 //   else
 //       NSLog(@"Both dates are same");
    
    if(txttaskname.text.length==0){
        
        [UIView animateWithDuration:0.5 animations:^{
            
            [mainscroll setContentOffset:CGPointMake(0,0) animated:NO];
            
        }
                         completion:^(BOOL finished)
         {
             txttaskname.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"Enter Task Name" attributes:@{NSForegroundColorAttributeName: [UIColor redColor]}];
             
         }];
        
        
    }
    else if(txtvwtaskdesc.text.length==0){
        
        
        
        [UIView animateWithDuration:0.5 animations:^{
            
            [mainscroll setContentOffset:CGPointMake(0,0) animated:NO];
            
        } completion:^(BOOL finished) {
            
            lbltaskdesc.hidden=NO;
            lbltaskdesc.text=@"Enter task description";

            
        }];
        
    }
    else if((txtday.text.length==0 || [txtday.text isEqual:@"0"]) && (txttime.text.length==0 || [txttime.text isEqual:@"0"]))
    {
        
        [UIView animateWithDuration:0.5 animations:^{
            
            [mainscroll setContentOffset:CGPointMake(0,taskdescview.frame.origin.y+100) animated:NO];
            
        } completion:^(BOOL finished) {
            txtday.text=@"";
            txttime.text=@"";
            txtday.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"Enter Day" attributes:@{NSForegroundColorAttributeName: [UIColor redColor]}];
            txttime.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"Enter Hour" attributes:@{NSForegroundColorAttributeName: [UIColor redColor]}];
            
            
        }];

       
        
    }
    else if(txtvwaddress.text.length==0)
    {
        [UIView animateWithDuration:0.5 animations:^{
            
            [mainscroll setContentOffset:CGPointMake(0,tasklocationview.frame.origin.y-40) animated:NO];
            
        }
        completion:^(BOOL finished)
        {
            lbladdress.hidden=NO;
            lbladdress.text=@"Enter address";
            
        }];
        
       
        
        
    }
    else if(txtcity.text.length==0){
        
        [UIView animateWithDuration:0.5 animations:^{
            
            [mainscroll setContentOffset:CGPointMake(0,tasklocationview.frame.origin.y-40) animated:NO];
            
        }
                         completion:^(BOOL finished)
         {
             txtcity.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"Enter city" attributes:@{NSForegroundColorAttributeName: [UIColor redColor]}];
             
         }];
        
        
    }
    else if(txtprovince.text.length==0){
        
        [UIView animateWithDuration:0.5 animations:^{
            
            [mainscroll setContentOffset:CGPointMake(0,tasklocationview.frame.origin.y+60) animated:NO];
            
        }
                         completion:^(BOOL finished)
         {
              txtprovince.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"Enter province" attributes:@{NSForegroundColorAttributeName: [UIColor redColor]}];
             
         }];
       
        
    }
    else if(txtpcode.text.length==0){
        
        [UIView animateWithDuration:0.5 animations:^{
            
            [mainscroll setContentOffset:CGPointMake(0,tasklocationview.frame.origin.y+60) animated:NO];
            
        }
                         completion:^(BOOL finished)
         {
             txtpcode.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"Enter postal code" attributes:@{NSForegroundColorAttributeName: [UIColor redColor]}];
             
         }];
        
        
    }
    else if(result==NSOrderedDescending)
    {
       
        [UIView animateWithDuration:0.5 animations:^{
            
            [mainscroll setContentOffset:CGPointMake(0,deadlineview.frame.origin.y-45) animated:NO];
            
        }
                         completion:^(BOOL finished)
         {
            UIAlertView *aler=[[UIAlertView alloc] initWithTitle:@"Alert" message:@"Task completion date can't be less than bid completion date." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
           [aler show];
             
         }];
       
        
    }
    else if(result == NSOrderedSame)
    {
        [UIView animateWithDuration:0.5 animations:^{
            
            [mainscroll setContentOffset:CGPointMake(0,deadlineview.frame.origin.y-45) animated:NO];
            
        }
                         completion:^(BOOL finished)
         {
             UIAlertView *aler=[[UIAlertView alloc] initWithTitle:@"Alert" message:@"Task completion date can't be same as bid completion date." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
             [aler show];
             
         }];
       
        
    }
    else if(txtperjob.text.length==0){
        
        txtperjob.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"Enter Amount in $" attributes:@{NSForegroundColorAttributeName: [UIColor redColor]}];
        
    }
    else if(txtcontractorpay.text.length==0){
        
        txtcontractorpay.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"Enter contractor to spend" attributes:@{NSForegroundColorAttributeName: [UIColor redColor]}];
        
    }
    else if(btnagreetick.selected==NO && taskfilled==YES){
        
        txtcontractorpay.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"Enter contractor to spend" attributes:@{NSForegroundColorAttributeName: [UIColor redColor]}];
        UIAlertView *aler=[[UIAlertView alloc] initWithTitle:@"Alert" message:@"Please Agree terms and conditions." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [aler show];
    }
    else
    {
     
        [taskdetaildic setObject:txttaskname.text forKey:@"taskname"];
        [taskdetaildic setObject:txtvwtaskdesc.text forKey:@"taskdesc"];

        if (btnindividual.selected==YES) {
            [taskdetaildic setObject:@"individual" forKey:@"individual"];
        }
        else if (btnbusiness.selected==YES){
            NSLog(@"business");
            [taskdetaildic setObject:@"business" forKey:@"individual"];
        }
     //  [taskdetaildic setObject:arrimage forKey:@"photoArray"];
        [taskdetaildic setObject:txtday.text forKey:@"estimatedday"];
        [taskdetaildic setObject:txttime.text forKey:@"estimatedtime"];
        if (btnphtick.selected==YES)
        {
            [taskdetaildic setObject:@"phone" forKey:@"donebyphone"];
        }
        else
        {
            [taskdetaildic setObject:@"online" forKey:@"donebyphone"];
        }
        if (btnvehicletick.selected==YES)
        {
            [taskdetaildic setObject:@"yes" forKey:@"vehicle"];
        }
        else
        {
            [taskdetaildic setObject:@"no" forKey:@"vehicle"];
        }
        if (btnbidtick.selected==YES)
        {
            [taskdetaildic setObject:@"yes" forKey:@"nobid"];
        }
        else
        {
            [taskdetaildic setObject:@"no" forKey:@"nobid"];
        }
        if (btndeliverychk.selected==YES)
        {
            [taskdetaildic setObject:@"yes" forKey:@"delivery"];
            
        }
        else
        {
            [taskdetaildic setObject:@"no" forKey:@"delivery"];
        }
        [taskdetaildic setObject:txtdroplocation.text forKey:@"droplocation"];
        [taskdetaildic setObject:txtrepeattask.text forKey:@"repeattask"];
        [taskdetaildic setObject:txtvwaddress.text forKey:@"address"];
        [taskdetaildic setObject:txtcity.text forKey:@"city"];
        [taskdetaildic setObject:txtprovince.text forKey:@"province"];
        [taskdetaildic setObject:txtpcode.text forKey:@"pcode"];
        [taskdetaildic setObject:biddatetime forKey:@"bidclosedt"];
        [taskdetaildic setObject:taskclsdatetime forKey:@"taskcompletedt"];
        if (btnperjob.selected==YES)
        {
            [taskdetaildic setObject:@"yes" forKey:@"perjob"];
        }
        else
        {
            [taskdetaildic setObject:@"no" forKey:@"perjob"];
        }
        [taskdetaildic setObject:txtperjob.text forKey:@"payamt"];
        [taskdetaildic setObject:txtcontractorpay.text forKey:@"contractorpay"];
        
        NSNumber *imageno = [NSNumber numberWithInteger:imgcount];
         [taskdetaildic setObject:imageno forKey:@"imagecount"];
      //  NSLog(@"task dic=%@",[taskdetaildic objectForKey:@"contractorpay"]);
          NSLog(@"task dic=%@",taskdetaildic);
        [[NSUserDefaults standardUserDefaults] setObject:taskdetaildic forKey:@"taskdetaildic"];
        [[NSUserDefaults standardUserDefaults]synchronize];
        
        //image save in doc directory
        
        NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
        for (int i=0; i<arrimage.count; i++)
        {
            NSString *documentsDirectory = [paths objectAtIndex:0];
            NSString *taskimg=[@"taskimage" stringByAppendingString:[NSString stringWithFormat:@"%d", i+1]];
            NSString *taskimg1=[taskimg stringByAppendingString:@".png"];
            NSString *savedImagePath = [documentsDirectory stringByAppendingPathComponent:taskimg1];
            UIImage *image = [arrimage objectAtIndex:i];
            NSData *imageData = UIImagePNGRepresentation(image);
            [imageData writeToFile:savedImagePath atomically:NO];
            
        }
        
        
       
        if(taskfilled==YES)
        {
            // you have logged in and you have already filled our task,you have edited (or not edited) but proceed to payment
     
            NSLog(@"you are logged in and you have already posted our task,you have edited (or not edited) but proceed to payment");
            NSUserDefaults *prefs = [NSUserDefaults standardUserDefaults];
            NSString *paystatus=[prefs valueForKey:@"paymentstatus"];
            
            if ([paystatus isEqualToString:@"0"] || paystatus == nil || [paystatus isEqualToString:@""])
            {
                // you are doing payment for the first time
                NSLog(@"go to payment page.");
                NSLog(@"card io is running");
                 NSLog(@"you are doing payment for the first time");
           /*     CardIOPaymentViewController *scanViewController = [[CardIOPaymentViewController alloc] initWithPaymentDelegate:self];
                scanViewController.modalPresentationStyle = UIModalPresentationFormSheet;
                [self presentViewController:scanViewController animated:YES completion:nil];
               */
                PaymentViewController *obj1=[self.storyboard instantiateViewControllerWithIdentifier:@"PaymentViewControllersid"];
                [self.navigationController pushViewController:obj1 animated:YES];
            }
           else if ([paystatus isEqualToString:@"1"])
           {
               // your payment detail is already exist
                NSLog(@"your payment detail is already exist");
               cardno=@"";
               expirymonth=@"";
               expirtyear=@"";
               cvv=@"";
              
                 [self afterpaymenturl];
           }
        }
        else if (taskfilled==NO)
        {
           
            NSLog(@"userid=%@",userid);
            if (userid == nil || [userid isEqualToString:@""])
            {
                // you are not logged in and you posting this task for the first time
                  NSLog(@"you are not logged in and you posting this task for the first time");
                user=YES;
                NewOrExistingUserViewController *obj=[self.storyboard instantiateViewControllerWithIdentifier:@"NewOrExistingUserViewControllersid"];
                
                [self.navigationController pushViewController:obj animated:YES];
                /*
                UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"User" message:nil delegate:self cancelButtonTitle:@"Normal User" otherButtonTitles:@"Existing User", nil];
                [alertView show];
                 */
            }
            else
            {
                // you are  logged in and you posting this task for the first time
                 NSLog(@"you are  logged in and you posting this task for the first time");
                
                taskfilled=YES;
                [self NewOrEditTask];
            }
           
        }
        
        
    }
    
}

- (IBAction)editclk:(id)sender
{
    btntaskcompdt.userInteractionEnabled=YES;
    btntime.userInteractionEnabled=YES;
    btnvehicletick.userInteractionEnabled=YES;
    btnrepeattaskarrow.userInteractionEnabled=YES;
    btnradioperjob.userInteractionEnabled=YES;
    btnradioperhour.userInteractionEnabled=YES;
    btnphtick.userInteractionEnabled=YES;
    btnperjob.userInteractionEnabled=YES;
    btnperhour.userInteractionEnabled=YES;
    btnpaysave.userInteractionEnabled=YES;
    btnpayarrow.userInteractionEnabled=YES;
    btnindividual.userInteractionEnabled=YES;
    btnestimateddayarrow.userInteractionEnabled=YES;
    btndtsave.userInteractionEnabled=YES;
    btndtcompsave.userInteractionEnabled=YES;
    btndeliverychk.userInteractionEnabled=YES;
    btndeliveryextra.userInteractionEnabled=YES;
    btncontractpayarrow.userInteractionEnabled=YES;
    btncontactpaysave.userInteractionEnabled=YES;
    btncityarrow.userInteractionEnabled=YES;
    btnbusiness.userInteractionEnabled=YES;
    btnbidtick.userInteractionEnabled=YES;
    btnbidclosedeadline1.userInteractionEnabled=YES;
    btnbidclosedeadline.userInteractionEnabled=YES;
    btnradiobusi.userInteractionEnabled=YES;
    btnradioindiv.userInteractionEnabled=YES;
    btnradioperhour.userInteractionEnabled=YES;
    btnradioperjob.userInteractionEnabled=YES;
    camerabtn.userInteractionEnabled=YES;
    btnrepeattaskextra.userInteractionEnabled=YES;
    btnday.userInteractionEnabled=YES;
    btnprovinceextra.userInteractionEnabled=YES;
    btnpayamt.userInteractionEnabled=YES;
    btncontractorpayamt.userInteractionEnabled=YES;
    btnvehicle.userInteractionEnabled=YES;
    btndonebyph.userInteractionEnabled=YES;
    btnbid.userInteractionEnabled=YES;
    camerabtnextra.userInteractionEnabled=YES;

    
    txtcity.enabled=YES;
    txtcontractorpay.enabled=YES;
    txtday.enabled=YES;
    txtpcode.enabled=YES;
    txtperjob.enabled=YES;
    txtprovince.enabled=YES;
    txtrepeattask.enabled=YES;
    txttime.enabled=YES;
    txtvwaddress.editable=YES;
    txtvwtaskdesc.editable=YES;
    txttaskname.enabled=YES;
    txtdroplocation.editable=YES;
    if (addedimg.image != nil) {
        txtphoto.placeholder=@"               Add more photos";
        txtphoto.font=[UIFont fontWithName:@"OpenSans-Light" size:14];
        imggesture1=[[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(handleLongPressGestures1:)];
        imggesture1.delegate = self;
        [addedimg addGestureRecognizer:imggesture1];
        [addedimg setUserInteractionEnabled:YES];
    }
    if (img.image != nil)
    {
        txtphoto.placeholder=@"                         Add more photos";
        txtphoto.font=[UIFont fontWithName:@"OpenSans-Light" size:10];
        imggesture2=[[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(handleLongPressGestures2:)];
        imggesture2.delegate = self;
        
        [img addGestureRecognizer:imggesture2];
        
        [img setUserInteractionEnabled:YES];
    }
    if (img1.image != nil)
    {
        txtphoto.placeholder=@"";
        
        imggesture3=[[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(handleLongPressGestures3:)];
        imggesture3.delegate = self;
        [img1 setUserInteractionEnabled:YES];
        [img1 addGestureRecognizer:imggesture3];
    }
    
    [UIView animateWithDuration:1.0 animations:^{
        [mainscroll setContentOffset:CGPointMake(0,0) animated:YES];
    }];
    

}

- (IBAction)agreetickclk:(id)sender
{
   /*
    screenview=[[UIView alloc]init];
    [screenview setFrame:CGRectMake(0,0, [UIScreen mainScreen].bounds.size.width,[UIScreen mainScreen].bounds.size.height)];
    screenview.backgroundColor=[[UIColor blackColor]colorWithAlphaComponent:0.65];
    [self.view addSubview:screenview];
     tm=[[TermsView alloc]init];
    [tm setFrame:CGRectMake(self.view.frame.origin.x+50,self.view.frame.origin.y+27, [UIScreen mainScreen].bounds.size.width-100,[UIScreen mainScreen].bounds.size.height-170)];
    [screenview addSubview:tm];
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
- (IBAction)agreeextratickclk:(id)sender
{
    if (btnagreetick.selected==NO)
    {
        btnagreetick.selected=YES;
        imgagreetick.image=[UIImage imageNamed:@"tick1"];
    }
    else if (btnagreetick.selected==YES)
    {
        btnagreetick.selected=NO;
        imgagreetick.image=[UIImage imageNamed:@"tick2"];
    }
}
-(void)expandpriceview
{
    [UIView beginAnimations:@"ToggleViews" context:nil];
    [UIView setAnimationRepeatCount:1];
    [UIView setAnimationRepeatAutoreverses:NO];
    
    NSLog(@"expand");
    btnpricearrow.selected=NO;
    [btnpricearrow setBackgroundImage:[UIImage imageNamed:@"uparrow.png"] forState:UIControlStateNormal];
    
    [btnpricearrow setBackgroundImage:[UIImage imageNamed:@"down-arrow.png"] forState:UIControlStateSelected];
    
    [btnpricearrow setBackgroundImage:[UIImage imageNamed:@"down-arrow.png"] forState:UIControlStateHighlighted];
    [pricemainview setHidden:NO];
    [priceview setHidden:NO];
    NSLog(@"scroll content=%f",mainscroll.contentSize.height+priceview.frame.size.height);
    mainscroll.contentSize = CGSizeMake(0, mainscroll.contentSize.height+priceview.frame.size.height);
    [UIView commitAnimations];
}
-(void)collapsepriceview
{
    [UIView beginAnimations:@"ToggleViews" context:nil];
    [UIView setAnimationRepeatCount:1];
    [UIView setAnimationRepeatAutoreverses:NO];
    
    NSLog(@"collapse");
    btnpricearrow.selected=YES;
    [btnpricearrow setBackgroundImage:[UIImage imageNamed:@"uparrow.png"] forState:UIControlStateNormal];
    
    [btnpricearrow setBackgroundImage:[UIImage imageNamed:@"down-arrow.png"] forState:UIControlStateSelected];
    
    [btnpricearrow setBackgroundImage:[UIImage imageNamed:@"down-arrow.png"] forState:UIControlStateHighlighted];
    [pricemainview setHidden:YES];
    [priceview setHidden:YES];
    mainscroll.contentSize = CGSizeMake(0, mainscroll.contentSize.height-priceview.frame.size.height);
    [UIView commitAnimations];
}
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    if(pickerView==amtpicker)
    {
    return arramt.count;
    }
    else if (pickerView==contactoramtpicker)
    {
        return arrContractoramt.count;
    }
    else if (pickerView==estimatedaypicker)
    {
        return arrday.count;
    }
    else if (pickerView==estimatetimepicker)
    {
        return arrtime.count;
    }
    else if (pickerView==repeattaskpicker)
    {
        return arrrepeattask.count;
    }
    else if (pickerView==provincepicker)
    {
        return arrcity.count;
    }
    else
    {
        return 0;
    }
}
- (NSString*)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    if(pickerView==amtpicker)
    {
        NSString *amt=[@"$ " stringByAppendingString:arramt[row]];
        return amt;
    }
    else if(pickerView==contactoramtpicker)
    {
        NSString *amt;
        if (row==0)
        {
           amt=arrContractoramt[row];
        }
        else
        {
        amt=[@"$ " stringByAppendingString:arrContractoramt[row]];
        }
        return amt;
    }
    else if (pickerView==estimatedaypicker)
    {
        return arrday[row];
    }
    else if (pickerView==estimatetimepicker)
    {
        return arrtime[row];
    }
    else if (pickerView==repeattaskpicker)
    {
        return arrrepeattask[row];
    }
    else if (pickerView==provincepicker)
    {
        return arrcity[row];
    }
    else
    {
        return @"";
    }
    
}
- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    if (pickerView==amtpicker) {
        
        amtpay=[@"$ " stringByAppendingString:arramt[row]];;
       
        
    }
    else if (pickerView==contactoramtpicker)
    {
        if (row==0)
        {
            contactorpay=arrContractoramt[row];
        }
        else
        {
        contactorpay=[@"$ " stringByAppendingString:arrContractoramt[row]];
        }
       // btncontractpayarrow.selected=NO;
        
           }
    else if (pickerView==estimatedaypicker)
    {
        day= arrday[row];
    }
    else if (pickerView==estimatetimepicker)
    {
        time= arrtime[row];
    }
    else if (pickerView==repeattaskpicker)
    {
        repeattask= arrrepeattask[row];
    }
    else if (pickerView==provincepicker)
    {
        province= arrcity[row];
    }
    else
    {
        
    }
}/*
- (NSAttributedString *)pickerView:(UIPickerView *)pickerView attributedTitleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    NSAttributedString *attString;
    if (pickerView==estimatedaypicker)
    {
       
         attString = [[NSAttributedString alloc] initWithString:arrday[row] attributes:@{NSForegroundColorAttributeName:[UIColor whiteColor]}];
    }
    else if (pickerView==estimatetimepicker)
    {
        
        attString = [[NSAttributedString alloc] initWithString:arrtime[row] attributes:@{NSForegroundColorAttributeName:[UIColor whiteColor]}];
    }
    else if (pickerView==repeattaskpicker)
    {
        
        attString = [[NSAttributedString alloc] initWithString:arrrepeattask[row] attributes:@{NSForegroundColorAttributeName:[UIColor whiteColor]}];
    }
    else if (pickerView==provincepicker)
    {
        
        attString = [[NSAttributedString alloc] initWithString:arrcity[row] attributes:@{NSForegroundColorAttributeName:[UIColor whiteColor]}];
    }
    else if (pickerView==amtpicker || pickerView==contactoramtpicker)
    {
        NSString *amt=[@"$ " stringByAppendingString:arramt[row]];
        attString = [[NSAttributedString alloc] initWithString:amt attributes:@{NSForegroundColorAttributeName:[UIColor whiteColor]}];
    }
   
    
    return attString;
    
}
  */
/*
-(UIView *)pickerView:(UIDatePicker *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(UIView *)view
{
    
    UILabel *label;
    
    if ((datepicker.tag==111)) {
        NSLog(@"datepicker");
        label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 50, 44)]; // your frame, so picker gets "colored"
        label.backgroundColor = [UIColor redColor];
        label.textColor = [UIColor yellowColor];
        label.font = [UIFont fontWithName:@"HelveticaNeue-Bold" size:18];
        label.text = [NSString stringWithFormat:@"%d",row];
        
        
    }
     
    return label;
     
}
 */
-(void)viewremove
{
    [viewbidcls removeFromSuperview];
    [viewcontactorpay removeFromSuperview];
    [viewday removeFromSuperview];
    [viewpay removeFromSuperview];
    [viewprovince removeFromSuperview];
    [viewrepeattask removeFromSuperview];
    [viewtaskcls removeFromSuperview];
    [viewtime removeFromSuperview];
}
-(void)resetView
{
    [txtpcode resignFirstResponder];
}
- (BOOL)textViewShouldBeginEditing:(UITextView *)textView
{
    
    if(textView==txtvwtaskdesc)
    {
        lbltaskdesc.hidden=YES;
       [mainscroll setContentOffset:CGPointMake(0,taskdescview.frame.origin.y+80) animated:YES];
    }
    if(textView==txtvwaddress)
    {
        lbladdress.hidden=YES;
         [mainscroll setContentOffset:CGPointMake(0,tasklocationview.frame.origin.y-20) animated:YES];
    }
    if(textView==txtdroplocation)
    {
        lbldroplocation.hidden=YES;
        [mainscroll setContentOffset:CGPointMake(0,tasklocationview.frame.origin.y+180) animated:YES];
    }
    
    return YES;
}
- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField
{
    /*  if(textField==txtpassword || textField==txtconfirmpass || textField==txtsques1 || textField==txtsques2 || textField==txtemail)
     {
     [mainscroll setContentOffset:CGPointMake(0,140) animated:YES];
     }
     */
    
   
     if(textField==txtcity)
     {
    [mainscroll setContentOffset:CGPointMake(0,tasklocationview.frame.origin.y+50) animated:YES];
     }
    if(textField==txtpcode)
    {
        [mainscroll setContentOffset:CGPointMake(0,tasklocationview.frame.origin.y+160) animated:YES];
    }
   
    return YES;
}
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}


- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text {
    lbltaskdesc.hidden=YES;
    lbladdress.hidden=YES;
    lbldroplocation.hidden=YES;
    if([text isEqualToString:@"\n"]) {
        [textView resignFirstResponder];
        //  [mainscroll setContentOffset:CGPointMake(0,30) animated:YES];
        
        return NO;
    }
    
    
    return YES;
}

//cardIO Implementation Start
#pragma mark - CardIOPaymentViewControllerDelegate

- (void)userDidProvideCreditCardInfo:(CardIOCreditCardInfo *)info inPaymentViewController:(CardIOPaymentViewController *)paymentViewController {
    NSLog(@"Scan succeeded with info: %@", info);
    // Do whatever needs to be done to deliver the purchased items.
    NSLog(@"Received card info. Number: %@, expiry: %02lu/%lu, cvv: %@.", info.cardNumber, (unsigned long)info.expiryMonth, (unsigned long)info.expiryYear, info.cvv);
    cardno=info.cardNumber;
    expirymonth=[NSString stringWithFormat:@"%02lu",(unsigned long)info.expiryMonth];
    expirtyear=[NSString stringWithFormat:@"%lu",(unsigned long)info.expiryYear];
    cvv=info.cvv;
    NSLog(@"expiry mnth=%@",expirymonth);
    [self afterpaymenturl];
    [self dismissViewControllerAnimated:YES completion:nil];
    
    //    self.infoLabel.text = [NSString stringWithFormat:@"Received card info. Number: %@, expiry: %02lu/%lu, cvv: %@.", info.redactedCardNumber, (unsigned long)info.expiryMonth, (unsigned long)info.expiryYear, info.cvv];
}

- (void)userDidCancelPaymentViewController:(CardIOPaymentViewController *)paymentViewController {
    NSLog(@"User cancelled scan");
    [self dismissViewControllerAnimated:YES completion:nil];
}
- (void)cardIOView:(CardIOView *)cardIOView didScanCard:(CardIOCreditCardInfo *)cardInfo
{
    if (cardInfo) {
        // The full card number is available as info.cardNumber, but don't log that!
        /*
        NSLog(@"Received card info. Number: %@, expiry: %02lu/%lu, cvv: %@.", cardInfo.redactedCardNumber, (unsigned long)cardInfo.expiryMonth, (unsigned long)cardInfo.expiryYear, cardInfo.cvv);
        cardno=cardInfo.redactedCardNumber;
        expirymonth=[NSString stringWithFormat:@"%d",cardInfo.expiryMonth];
          expirtyear=[NSString stringWithFormat:@"%d",cardInfo.expiryYear];
        cvv=cardInfo.cvv;
        [self afterpaymenturl];
         */
        // Use the card info...
    }
    else {
        NSLog(@"User canceled payment info");
        // Handle user cancellation here...
    }
    
    [cardIOView removeFromSuperview];
}
//cardIO Implementation End
-(void)afterpaymenturl
{
    NSUserDefaults *prefs = [NSUserDefaults standardUserDefaults];
    NSString *i_am,*taskdone,*paytype,*bidtype,*bidclsdt,*bidclstm,*taskclsdt,*taskclstm;
    //fetch task value from user default
    NSLog(@"edited details=%@",[prefs valueForKey:@"taskdetaildic"]);
    if([[[prefs valueForKey:@"taskdetaildic"] valueForKey:@"individual"] isEqualToString:@"individual"])
    {
       i_am=@"1";
        
    }
    else if([[[prefs valueForKey:@"taskdetaildic"] valueForKey:@"individual"] isEqualToString:@"business"])
    {
       i_am=@"2";
        
    }
    if([[[prefs valueForKey:@"taskdetaildic"] valueForKey:@"donebyphone"] isEqualToString:@"phone"])
    {
        taskdone=@"1";
        
    }
    else if([[[prefs valueForKey:@"taskdetaildic"] valueForKey:@"donebyphone"] isEqualToString:@"online"])
    {
        taskdone=@"";
        
    }
    if([[[prefs valueForKey:@"taskdetaildic"] valueForKey:@"vehicle"] isEqualToString:@"yes"])
    {
        if(![taskdone isEqualToString:@""])
        {
             taskdone=[taskdone stringByAppendingString:@","];
        }
       
        taskdone=[taskdone stringByAppendingString:@"2"];
        
    }
    else if([[[prefs valueForKey:@"taskdetaildic"] valueForKey:@"vehicle"] isEqualToString:@"no"])
    {
        
        
    }
    if([[[prefs valueForKey:@"taskdetaildic"] valueForKey:@"nobid"] isEqualToString:@"yes"])
    {
        bidtype=@"0";
    }
    else if([[[prefs valueForKey:@"taskdetaildic"] valueForKey:@"nobid"] isEqualToString:@"no"])
    {
        bidtype=@"1";
        
    }
    if([[[prefs valueForKey:@"taskdetaildic"] valueForKey:@"delivery"] isEqualToString:@"yes"])
    {
      //  btndeliverychk.selected=YES;
        
    }
    else if([[[prefs valueForKey:@"taskdetaildic"] valueForKey:@"delivery"] isEqualToString:@"no"])
    {
      //  btndeliverychk.selected=NO;
        
    }
    
 //   NSNumber *num=[[prefs valueForKey:@"taskdetaildic"] valueForKey:@"imagecount"];
 //   NSLog(@"image count num=%@",num);
 //   imgcount=[num integerValue];
 //   NSLog(@"image count=%d",imgcount);
    if([[[prefs valueForKey:@"taskdetaildic"] valueForKey:@"perjob"] isEqualToString:@"yes"])
    {
        paytype=@"0";
        
    }
    else if([[[prefs valueForKey:@"taskdetaildic"] valueForKey:@"perjob"] isEqualToString:@"no"])
    {
        paytype=@"1";
    }
    
    
    lblbiddt.text=[[[prefs valueForKey:@"taskdetaildic"] valueForKey:@"bidclosedt"] substringWithRange:NSMakeRange(0, 2)];
    lblbidmonth.text=[[[prefs valueForKey:@"taskdetaildic"] valueForKey:@"bidclosedt"] substringWithRange:NSMakeRange(2, 2)];
    lblbidyr.text=[[[prefs valueForKey:@"taskdetaildic"] valueForKey:@"bidclosedt"] substringWithRange:NSMakeRange(4, 4)];
    lblbidtime.text=[[[prefs valueForKey:@"taskdetaildic"] valueForKey:@"bidclosedt"] substringWithRange:NSMakeRange(8, 7)];
    
    lbltaskdt.text=[[[prefs valueForKey:@"taskdetaildic"] valueForKey:@"taskcompletedt"] substringWithRange:NSMakeRange(0, 2)];
    lbltaskmonth.text=[[[prefs valueForKey:@"taskdetaildic"] valueForKey:@"taskcompletedt"] substringWithRange:NSMakeRange(2, 2)];
    lbltaskyr.text=[[[prefs valueForKey:@"taskdetaildic"] valueForKey:@"taskcompletedt"] substringWithRange:NSMakeRange(4, 4)];
    lbltasktime.text=[[[prefs valueForKey:@"taskdetaildic"] valueForKey:@"taskcompletedt"] substringWithRange:NSMakeRange(8, 7)];
    
    biddatetime=[[prefs valueForKey:@"taskdetaildic"] valueForKey:@"bidclosedt"];
    taskclsdatetime=[[prefs valueForKey:@"taskdetaildic"] valueForKey:@"taskcompletedt"];
    
    bidclsdt=[[self changeformate_string24hr:biddatetime] substringWithRange:NSMakeRange(0,10)];
     bidclstm=[[self changeformate_string24hr:biddatetime] substringWithRange:NSMakeRange(11,8)];
    
    taskclsdt=[[self changeformate_string24hr:taskclsdatetime] substringWithRange:NSMakeRange(0,10)];
    taskclstm=[[self changeformate_string24hr:taskclsdatetime] substringWithRange:NSMakeRange(11,8)];
    NSString *conpay;
    if ([[[prefs valueForKey:@"taskdetaildic"] valueForKey:@"contractorpay"] isEqualToString:@"None"])
    {
        conpay=@"0";
    }
    else{
    conpay=[[[prefs valueForKey:@"taskdetaildic"] valueForKey:@"contractorpay"] substringWithRange:NSMakeRange(2,[[[prefs valueForKey:@"taskdetaildic"] valueForKey:@"contractorpay"] length]-2)];
    }
    NSString *pay=[[[prefs valueForKey:@"taskdetaildic"] valueForKey:@"payamt"] substringWithRange:NSMakeRange(2,[[[prefs valueForKey:@"taskdetaildic"] valueForKey:@"payamt"] length]-2)];
    // user type is always 0 for task poster (1 for task runner)
    
//    myspinner.hidden=NO;
//    [myspinner startAnimating];
    [self checkLoader];
   
    
    
  //  NSLog(@"province without space=%@",[[NSString stringWithFormat:@"%@", [[prefs valueForKey:@"taskdetaildic"] valueForKey:@"province"]] stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]);
    NSOperationQueue *myQueue11 = [[NSOperationQueue alloc] init];
    [myQueue11 addOperationWithBlock:^{
        
       
   
        
        NSString *parameter = [NSString stringWithFormat:@"%@posttask_ios?user_id=%@&user_type=%@&i_am=%@&task_title=%@&task_description=%@&location=%@&address=%@&city=%@&state=%@&zip=%@&addtional_details=%@&task_done=%@&est_time_date=%@&est_time=%@&repeated_task=%@&contractor_spend=%@&pay_for_task=%@&pay_type=%@&bid_type=%@&bid_close_date=%@&bid_close_time=%@&task_close_date=%@&task_close_time=%@&bill_name=%@&card_no=%@&expyear=%@&expm=%@&cvvcode=%@",URL_LINK,userid,@"0",i_am,[[[prefs valueForKey:@"taskdetaildic"] valueForKey:@"taskname"] stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding],[[[prefs valueForKey:@"taskdetaildic"] valueForKey:@"taskdesc"] stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding] ,@"",[[[prefs valueForKey:@"taskdetaildic"] valueForKey:@"address"] stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding],[[[prefs valueForKey:@"taskdetaildic"] valueForKey:@"city"] stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding],[[[prefs valueForKey:@"taskdetaildic"] valueForKey:@"province"] stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding],[[[prefs valueForKey:@"taskdetaildic"] valueForKey:@"pcode"] stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding],[[[prefs valueForKey:@"taskdetaildic"] valueForKey:@"droplocation"] stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding],taskdone,[[[prefs valueForKey:@"taskdetaildic"] valueForKey:@"estimatedday"] stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding],[[[prefs valueForKey:@"taskdetaildic"] valueForKey:@"estimatedtime"] stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding],[[[prefs valueForKey:@"taskdetaildic"] valueForKey:@"repeattask"] stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding],conpay,pay,paytype,bidtype,bidclsdt,bidclstm,taskclsdt,taskclstm,@"abc",cardno,[expirtyear stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding],[expirymonth stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding],[cvv stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
        
        NSLog(@"parameter=%@",parameter);
        
        NSData *imageData = UIImagePNGRepresentation(addedimg.image);
        NSData *imageData1 = UIImagePNGRepresentation(img.image);
        NSData *imageData2 = UIImagePNGRepresentation(img1.image);
        
    //    NSLog(@"image data=%@",imageData);
        
        if ([imageData length] > 0)
        {
        //    NSLog(@"imagedata--- %@--- %@-- %@",imageData,imageData1,imageData2);
            
            NSMutableArray *trucksArray = [NSMutableArray arrayWithObjects:imageData, imageData1,imageData2, nil];
            
            
            
            
            
            //    NSData *imageToUpload = [mutDic objectAtIndex:0];
            
            
            
            AFHTTPClient *client= [AFHTTPClient clientWithBaseURL:[NSURL URLWithString:parameter]];
            
            
            
            
            
            
            
            NSMutableURLRequest *request = [client multipartFormRequestWithMethod:@"POST" path:nil parameters:nil constructingBodyWithBlock: ^(id <AFMultipartFormData>formData) {
                
                
                
                //        [formData appendPartWithFileData: imageToUpload name:@"image[0]" fileName:@"temp.jpeg" mimeType:@"image/jpeg"];
                
                
                
                //        [formData appendPartWithFileData: imageToUpload name:@"image[1]" fileName:@"temp.jpeg" mimeType:@"image/jpeg"];
                
                
                
                //        [formData appendPartWithFileData: imageToUpload name:@"image[2]" fileName:@"temp.jpeg" mimeType:@"image/jpeg"];
                
                
                
                
                
                
                
                for (int i=0; i < [trucksArray count]; i++)
                    
                    
                    
                {
                    
                    
                    
                    NSData *imagetoupload = [trucksArray objectAtIndex:i];
                    
                    
                    
                    NSString *imagename = [NSString stringWithFormat:@"photo[%d]",i];
                    
                    
                    
                    [formData appendPartWithFileData: imagetoupload name:imagename fileName:@"temp.jpeg" mimeType:@"image/jpeg"];
                    
                    
                    
                }
                
                
                
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
                if ([[[json valueForKey:@"response"] valueForKey:@"status"] isEqualToString:@"Success"]) {
                    
                    [self checkLoader];
                    UIAlertView *aler=[[UIAlertView alloc] initWithTitle:@"Success" message:@"Task Successfully Posted." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
                    [aler show];
                //    [[NSUserDefaults standardUserDefaults] setObject:[json valueForKey:@"paymentstatus"] forKey:@"paymentstatus"];
                    [[NSUserDefaults standardUserDefaults] removeObjectForKey:@"taskdetaildic"];
                    btnpaydetail.userInteractionEnabled=NO;
                    TaskHomeViewController *obj=[self.storyboard instantiateViewControllerWithIdentifier:@"TaskHomeViewControllersid"];
                    [self.navigationController pushViewController:obj animated:YES];
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
        else
        {
            NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
            
            [request setCachePolicy:NSURLRequestReloadIgnoringLocalCacheData];
            
            [request setHTTPShouldHandleCookies:NO];
            
            [request setURL:[NSURL URLWithString:parameter]];
            
            [request setTimeoutInterval:100];
            
            [request setHTTPMethod:@"POST"];

        
       [[NSOperationQueue mainQueue] addOperationWithBlock:^{
        
            NSURLConnection *connection = [[NSURLConnection alloc] initWithRequest:request delegate:self];
        
            if( connection )
            {
                mutableData = [[NSMutableData alloc] init];

           }
        
       }];
        }
        
        
  
        
    }];
    
    
    
}

-(void) connection:(NSURLConnection *) connection didReceiveResponse:(NSURLResponse *)response
{
    [mutableData setLength:0];
}

-(void) connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    NSLog(@"data=%@",data);
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
    mainDic=[[NSMutableDictionary alloc]init];
    mainDic=[NSJSONSerialization JSONObjectWithData:mutableData options:kNilOptions error:&error];
    //  NSLog(@"values:%@",mainDic);
    //   NSLog(@"values:%@",[mainDic valueForKey:@"userid"]);
    mutDic=[mainDic valueForKey:@"response"];
    
    NSLog(@"maindictionary %@", mainDic);
    
    NSLog(@"values:%@",[mutDic valueForKey:@"status"]);
    
    
    if ([[mutDic valueForKey:@"status"] isEqualToString:@"Success"]) {
        [self checkLoader];
    //    [myspinner stopAnimating];
   //     myspinner.hidden=YES;
 //          NSString *msg=[mutDic valueForKey:@"message"];
        
           UIAlertView *aler=[[UIAlertView alloc] initWithTitle:@"Success" message:@"Task Successfully Posted." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
          [aler show];
    //    [[NSUserDefaults standardUserDefaults] setObject:[mainDic valueForKey:@"paymentstatus"] forKey:@"paymentstatus"];
        [[NSUserDefaults standardUserDefaults] removeObjectForKey:@"taskdetaildic"];
        btnpaydetail.userInteractionEnabled=NO;
        TaskHomeViewController *obj=[self.storyboard instantiateViewControllerWithIdentifier:@"TaskHomeViewControllersid"];
        [self.navigationController pushViewController:obj animated:YES];
     //        [[NSUserDefaults standardUserDefaults] setObject:[mainDic valueForKey:@"userid"] forKey:@"userid"];
   /*    TaskShowViewController *obj=[self.storyboard instantiateViewControllerWithIdentifier:@"TaskShowViewControllersid"];
       
        [self.navigationController pushViewController:obj animated:YES];
 */
    }
    else
    {
        [self checkLoader];
        //   [myspinner stopAnimating];
     //   myspinner.hidden=YES;
        UIAlertView *aler=[[UIAlertView alloc] initWithTitle:@"Error" message:@"Task Posting fail.." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [aler show];
    }
     
}

- (IBAction)leftimageclk:(id)sender {
  //  NSLog(@"left menu");
    if(mainscroll.center.x==self.view.frame.size.width/2)
    {
        
        [UIView beginAnimations:@"ToggleViews" context:nil];
        [UIView setAnimationRepeatCount:1];
        [UIView setAnimationRepeatAutoreverses:NO];
        mainscroll.center = CGPointMake([[UIScreen mainScreen] bounds].size.width+60,
                                        self.view.center.y);
              headerview.center = CGPointMake(self.view.frame.size.width+60,
                                             self.view.center.y);
        [txtcity resignFirstResponder];
        [txtcontractorpay resignFirstResponder];
        [txtday resignFirstResponder];
        [txtdroplocation resignFirstResponder];
        [txtpcode resignFirstResponder];
        [txttaskname resignFirstResponder];
        [txtvwaddress resignFirstResponder];
        [txtvwtaskdesc resignFirstResponder];
        [txtperjob resignFirstResponder];
        
        
        [leftView removeFromSuperview];
        leftView = [LeftMenuView leftmenu];
        [leftView leftmenumethod];
          [leftView tapCheck:0];
        leftView.frame = CGRectMake(0, 0,[[UIScreen mainScreen] bounds].size.width/2+60, self.view.frame.size.height);
        leftView.leftDelegate=self;
        [self.view addSubview:leftView];
        [UIView commitAnimations];
    }
    else
    {
        [UIView beginAnimations:@"ToggleViews" context:nil];
        [UIView setAnimationRepeatCount:1];
        [UIView setAnimationRepeatAutoreverses:NO];
        mainscroll.center = CGPointMake(self.view.center.x,
                                        self.view.center.y);
        headerview.center = CGPointMake(self.view.center.x,
                                        self.view.center.y);
        //    leftView.frame=CGRectMake(self.view.frame.origin.x-[[UIScreen mainScreen] bounds].size.width/2-60, 0,[[UIScreen mainScreen] bounds].size.width/2+60, self.view.frame.size.height);
        [leftView removeFromSuperview];
        [UIView commitAnimations];
        
        
        
        
    }
}

- (IBAction)leftmenuclk:(id)sender {
    NSLog(@"left menu");
    if(mainscroll.center.x==self.view.frame.size.width/2)
    {
        
        //            [UIView beginAnimations:@"ToggleViews" context:nil];
        //            [UIView setAnimationRepeatCount:1];
        //            [UIView setAnimationRepeatAutoreverses:NO];
        //            mainview.center = CGPointMake([[UIScreen mainScreen] bounds].size.width+60,
        //
        [txtcity resignFirstResponder];
        [txtcontractorpay resignFirstResponder];
        [txtday resignFirstResponder];
        [txtdroplocation resignFirstResponder];
        [txtpcode resignFirstResponder];
        [txttaskname resignFirstResponder];
        [txtvwaddress resignFirstResponder];
        [txtvwtaskdesc resignFirstResponder];
        [txtperjob resignFirstResponder];

        [leftView removeFromSuperview];
        leftView = [LeftMenuView leftmenu];
        [leftView leftmenumethod];
         [leftView tapCheck:0];
        leftView.frame = CGRectMake(-160, 0,[[UIScreen mainScreen] bounds].size.width/2+60, self.view.frame.size.height);
        leftView.leftDelegate=self;
        [leftView.btnprofImg addTarget:self action:@selector(ProfilebuttonTapped:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:leftView];
        
        [UIView animateWithDuration:0.5 animations:^{
            
            
            mainscroll.center = CGPointMake([[UIScreen mainScreen] bounds].size.width+60,self.view.center.y);
              headerview.frame=CGRectMake(headerview.frame.size.width/2+60, headerview.frame.origin.y, headerview.frame.size.width, headerview.frame.size.height);
            
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
            
            
            mainscroll.center = CGPointMake(self.view.center.x,self.view.center.y);
             headerview.frame=CGRectMake(0, headerview.frame.origin.y, headerview.frame.size.width, headerview.frame.size.height);
            leftView.frame = CGRectMake(-leftView.frame.size.width, 0,[[UIScreen mainScreen] bounds].size.width/2+60, self.view.frame.size.height);
            
            
        } completion:^(BOOL finished) {
            
            [leftView removeFromSuperview];
            [UIView commitAnimations];
        }];
        
        
        
        
        
        
        
        
        
        
        
    }
    /*
    if(mainscroll.center.x==self.view.frame.size.width/2)
    {
        
        [UIView beginAnimations:@"ToggleViews" context:nil];
        [UIView setAnimationRepeatCount:1];
        [UIView setAnimationRepeatAutoreverses:NO];
        mainscroll.center = CGPointMake([[UIScreen mainScreen] bounds].size.width+60,
                                      self.view.center.y);
    //    headerview.center = CGPointMake([[UIScreen mainScreen] bounds].size.width+60,
   //                                     self.view.center.y);
        headerview.frame=CGRectMake(headerview.frame.size.width/2+60, headerview.frame.origin.y, headerview.frame.size.width, headerview.frame.size.height);
        [leftView removeFromSuperview];
        leftView = [LeftMenuView leftmenu];
        [leftView leftmenumethod];
        leftView.frame = CGRectMake(0, 0,[[UIScreen mainScreen] bounds].size.width/2+60, self.view.frame.size.height);
        leftView.leftDelegate=self;
        [self.view addSubview:leftView];
        [UIView commitAnimations];
    }
    else
    {
        [UIView beginAnimations:@"ToggleViews" context:nil];
        [UIView setAnimationRepeatCount:1];
        [UIView setAnimationRepeatAutoreverses:NO];
        mainscroll.center = CGPointMake(self.view.center.x,
                                      self.view.center.y);
        headerview.frame=CGRectMake(0, headerview.frame.origin.y, headerview.frame.size.width, headerview.frame.size.height);
        //    leftView.frame=CGRectMake(self.view.frame.origin.x-[[UIScreen mainScreen] bounds].size.width/2-60, 0,[[UIScreen mainScreen] bounds].size.width/2+60, self.view.frame.size.height);
        [leftView removeFromSuperview];
        [UIView commitAnimations];
        
        
        
        
    }
     */

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
@end
