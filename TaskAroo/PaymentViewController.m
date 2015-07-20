//
//  PaymentViewController.m
//  TaskAroo
//
//  Created by Prosenjit Kolay on 22/04/15.
//  Copyright (c) 2015 Prosenjit Kolay. All rights reserved.
//

#import "PaymentViewController.h"
//cardIO Implementation
#import "CardIOPaymentViewControllerDelegate.h"
#import "CardIO.h"
#import "CardIOCreditCardInfo.h"

@interface PaymentViewController ()<CardIOPaymentViewControllerDelegate,NSURLConnectionDelegate,UITextFieldDelegate,UIPickerViewDataSource,UIPickerViewDelegate>
@end

@implementation PaymentViewController
@synthesize btnradiomanual,btnradioscan,mainscroll,btnpayment,txtbillname,myspinner,txtcardno,txtexpdt,tctcvv,btnscancard,btndt,oneView,threeView,twoView;
- (void) viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:YES animated:animated];
    mainscroll.contentSize=CGSizeMake(0, 500);
    //cardIO Implementation
    [CardIOUtilities preload];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self footercall];
    [self headercall];
    
 //   mainscroll.contentSize=CGSizeMake(0, 1200);
    oneView.layer.borderColor = [UIColor blackColor].CGColor;
    oneView.layer.borderWidth = 0.5f;
    oneView.layer.cornerRadius=oneView.frame.size.width/2;
    
    threeView.layer.borderColor = [UIColor blackColor].CGColor;
    threeView.layer.borderWidth = 0.5f;
    threeView.layer.cornerRadius=threeView.frame.size.width/2;
    
    twoView.layer.borderColor = [UIColor blackColor].CGColor;
    twoView.layer.borderWidth = 0.5f;
    twoView.layer.cornerRadius=twoView.frame.size.width/2;
    
    UIGraphicsBeginImageContext(mainscroll.frame.size);
    [[UIImage imageNamed:@"bg.png"] drawInRect:mainscroll.bounds];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    mainscroll.backgroundColor = [UIColor colorWithPatternImage:image];
    
    btnradiomanual.selected=NO;
    
    [btnradiomanual setBackgroundImage:[UIImage imageNamed:@"rediobutton1.png"] forState:UIControlStateNormal];
    
    [btnradiomanual setBackgroundImage:[UIImage imageNamed:@"rediobutton2.png"] forState:UIControlStateSelected];
    
    [btnradiomanual setBackgroundImage:[UIImage imageNamed:@"rediobutton2.png"] forState:UIControlStateHighlighted];
    
    btnradioscan.selected=NO;
    
    [btnradioscan setBackgroundImage:[UIImage imageNamed:@"rediobutton1.png"] forState:UIControlStateNormal];
    
    [btnradioscan setBackgroundImage:[UIImage imageNamed:@"rediobutton2.png"] forState:UIControlStateSelected];
    
    [btnradioscan setBackgroundImage:[UIImage imageNamed:@"rediobutton2.png"] forState:UIControlStateHighlighted];
    
     btnpayment.backgroundColor=[UIColor colorWithRed:(235.0/255) green:(66.0/255) blue:(32.0/255) alpha:1.0];
    btnscancard.backgroundColor=[UIColor colorWithRed:(235.0/255) green:(66.0/255) blue:(32.0/255) alpha:1.0];
    myspinner.hidden=YES;
    mainDic=[[NSMutableDictionary alloc]init];
    mutDic=[[NSMutableDictionary alloc]init];
    
    
    txtbillname.leftView = [self addPaddingView];
    txtbillname.leftViewMode = UITextFieldViewModeAlways;
    txtcardno.leftView = [self addPaddingView];
    txtcardno.leftViewMode = UITextFieldViewModeAlways;
    txtexpdt.leftView = [self addPaddingView];
    txtexpdt.leftViewMode = UITextFieldViewModeAlways;
    tctcvv.leftView = [self addPaddingView];
    tctcvv.leftViewMode = UITextFieldViewModeAlways;
    
    //done button on numeric keyboard
    
    UIToolbar *toolbar = [[UIToolbar alloc] initWithFrame:CGRectMake(0.0f, 0.0f, 320.0f, 35.0f)];
    toolbar.barStyle=UIBarStyleDefault;
    //    // Create a flexible space to align buttons to the right
    UIBarButtonItem *flexibleSpace = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
    //    // Create a cancel button to dismiss the keyboard
    UIBarButtonItem *barButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(resetView)];
    //    // Add buttons to the toolbar
    [toolbar setItems:[NSArray arrayWithObjects:flexibleSpace, barButtonItem, nil]];
    // Set the toolbar as accessory view of an UITextField object
    txtcardno.inputAccessoryView = toolbar;
    
    UIToolbar *toolbar1 = [[UIToolbar alloc] initWithFrame:CGRectMake(0.0f, 0.0f, 320.0f, 35.0f)];
    toolbar1.barStyle=UIBarStyleDefault;
    //    // Create a flexible space to align buttons to the right
    UIBarButtonItem *flexibleSpace1 = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
    //    // Create a cancel button to dismiss the keyboard
    UIBarButtonItem *barButtonItem1 = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(resetView1)];
    //    // Add buttons to the toolbar
    [toolbar1 setItems:[NSArray arrayWithObjects:flexibleSpace1, barButtonItem1, nil]];
    // Set the toolbar as accessory view of an UITextField object
    tctcvv.inputAccessoryView = toolbar1;
    
    arryr=[[NSMutableArray alloc]init];
    for (int i=2015; i<=2040; i++) {
        NSString *val=[NSString stringWithFormat:@"%d", i];
        [arryr addObject:val];
    }
    arrmonth=[[NSMutableArray alloc]initWithObjects:@"01",@"02",@"03",@"04",@"05",@"06",@"07",@"08",@"09",@"10",@"11",@"12", nil];
    
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
-(void)resetView
{
    NSLog(@"txtcard done clk");
    [mainscroll setContentOffset:CGPointMake(0,0) animated:YES];
    [txtcardno resignFirstResponder];
}
-(void)resetView1
{
    [tctcvv resignFirstResponder];
    [mainscroll setContentOffset:CGPointMake(0,0) animated:YES];
}
- (IBAction)scanextraclk:(id)sender
{
    [self scancard];
}

- (IBAction)manualextraclk:(id)sender
{
   //  [self manualentry];
}

- (IBAction)scanradioclk:(id)sender
{
     [self scancard];
}

- (IBAction)manualradioclk:(id)sender
{
  //   [self manualentry];
}
-(void)scancard
{
    /*
    if (btnradioscan.selected==YES)
    {
        
        
    }
    else
    {
    */
        //scan user button selected
       
 
    
        CardIOPaymentViewController *scanViewController = [[CardIOPaymentViewController alloc] initWithPaymentDelegate:self];
    scanViewController.useCardIOLogo=YES;
    scanViewController.disableManualEntryButtons=YES;
        scanViewController.modalPresentationStyle = UIModalPresentationFormSheet;
        [self presentViewController:scanViewController animated:YES completion:nil];

       
 //   }
    
}
/*
-(void)manualentry
{
    
    if (btnradiomanual.selected==YES)
    {
        
        
    }
    else
    {
 
        //manual entry button selected
        
        btnradiomanual.selected=YES;
        [btnradiomanual setBackgroundImage:[UIImage imageNamed:@"rediobutton2.png"] forState:UIControlStateSelected];
        
        [btnradiomanual setBackgroundImage:[UIImage imageNamed:@"rediobutton2.png"] forState:UIControlStateHighlighted];
        
        
        //scan button reset
        btnradioscan.selected=NO;
        
        [btnradioscan setBackgroundImage:[UIImage imageNamed:@"rediobutton1.png"] forState:UIControlStateNormal];
        
        [btnradioscan setBackgroundImage:[UIImage imageNamed:@"rediobutton2.png"] forState:UIControlStateSelected];
        
        [btnradioscan setBackgroundImage:[UIImage imageNamed:@"rediobutton2.png"] forState:UIControlStateHighlighted];
    
    CardIOPaymentViewController *scanViewController = [[CardIOPaymentViewController alloc] initWithPaymentDelegate:self scanningEnabled:NO];
    scanViewController.useCardIOLogo=YES;
   
    scanViewController.modalPresentationStyle = UIModalPresentationFormSheet;
    [self presentViewController:scanViewController animated:YES completion:nil];
    
   }
    
}
 */
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
    txtcardno.text=cardno;
    tctcvv.text=cvv;
    NSArray *myStrings = [[NSArray alloc] initWithObjects:expirymonth,expirtyear, nil];
    NSString *joinedString = [myStrings componentsJoinedByString:@"/"];
    txtexpdt.text=joinedString;
    NSLog(@"expiry mnth=%@",expirymonth);
 //   [self afterpaymenturl];
    [self dismissViewControllerAnimated:YES completion:nil];
    
    //    self.infoLabel.text = [NSString stringWithFormat:@"Received card info. Number: %@, expiry: %02lu/%lu, cvv: %@.", info.redactedCardNumber, (unsigned long)info.expiryMonth, (unsigned long)info.expiryYear, info.cvv];
}

- (void)userDidCancelPaymentViewController:(CardIOPaymentViewController *)paymentViewController {
    NSLog(@"User cancelled scan");
    [self dismissViewControllerAnimated:YES completion:nil];
}
//end
- (NSString *) validateCard:(NSString *)ccNumberString
{
    NSString * validCard;
    NSString * isAMEX;
   
    validCard = @"";
    NSString * ccNumberReversed = @"";
    NSString * doubleNumbers = @"";
    NSString * everyOtherNumber = @"";
    NSString * lastChar = @"";
    NSString * intDoubled;
    NSString * stringToSum;
    NSUInteger count = [ccNumberString length];
    NSUInteger len = 1;
    NSRange r;
    
    
    r = NSMakeRange( 0, 1);
    lastChar = [ccNumberString substringWithRange:r];
    if ([lastChar compare:@"3"] ==0) {
        
        isAMEX = @"YES";
        
    }
    else {
        isAMEX = @"NO";
    }
    
    
    
    //reverse the string
    
    for ( int i=0; i<count; i++){
        r = NSMakeRange( count-i-1, len);
        lastChar = [ccNumberString substringWithRange:r];
        ccNumberReversed = [ccNumberReversed stringByAppendingString:lastChar];
    }
    
    //double every other number
    
    NSInteger loc = 1;
    NSInteger ttr = ccNumberReversed.length/2.0;
    for ( int i=0; i<ttr; i++){
        
        r = NSMakeRange( loc, len);
        loc = loc+2;
        lastChar = [ccNumberReversed substringWithRange:r];
        int dv = [lastChar intValue];
        dv = (dv * 2);
        intDoubled = [NSString stringWithFormat:@"%d",dv];
        doubleNumbers = [doubleNumbers stringByAppendingString:intDoubled];
    }
    
    // get every other number starting at index 0
    loc = 0;
    if ([isAMEX compare:@"YES"] ==0) {
        ttr = txtcardno.text.length/2.0+1;
    }
    else {
        ttr = txtcardno.text.length/2.0;
    }
    
    
    for ( int i=0; i<ttr; i++){
        
        r = NSMakeRange( loc, len);
        loc = loc+2;
        lastChar = [ccNumberReversed substringWithRange:r];
        everyOtherNumber = [everyOtherNumber stringByAppendingString:lastChar];
    }
    
    //combine both strings so we can sum them up
    stringToSum = [doubleNumbers stringByAppendingString:everyOtherNumber];
    
    // add all the numbers up one by one and divide by 10... if no remainder - its a valid card
    
    loc = 0;
    ttr = stringToSum.length;
    int stringSum = 0;
    for ( int i=0; i<ttr; i++){
        
        r = NSMakeRange( loc, len);
        lastChar = [stringToSum substringWithRange:r];
        int cc = [lastChar intValue];
        stringSum = stringSum+cc;
        
        loc ++;
    }
    
    if (stringSum%10 == 0) {
        
        validCard = @"YES";
    }
    else {
        
        validCard = @"NO";
    }
    
    return validCard;
    
}
-(NSString *)validatecvv:(NSString *)cvvno
{
    NSString *first=[txtcardno.text substringWithRange:NSMakeRange(0, 1)];
    int cardtype,cvvlength;
    if ([first isEqualToString:@"0"]) {
        cardtype=CardIOCreditCardTypeUnrecognized;
        cvvlength = -1;
    }
    else if ([first isEqualToString:@"1"]) {
        cardtype=CardIOCreditCardTypeAmbiguous;
        cvvlength = -1;
    }
    else if ([first isEqualToString:@"3"]) {
        cardtype=CardIOCreditCardTypeAmex;
        cvvlength = 4;
    }
    else if ([first isEqualToString:@"J"]) {
        cardtype=CardIOCreditCardTypeJCB;
        cvvlength = 3;
    }
    else if ([first isEqualToString:@"4"]) {
        cardtype=CardIOCreditCardTypeVisa;
       cvvlength = 3;
    }
    else if ([first isEqualToString:@"5"]) {
        cardtype=CardIOCreditCardTypeMastercard;
        cvvlength = 3;
    }
    else if ([first isEqualToString:@"6"]) {
        cardtype=CardIOCreditCardTypeDiscover;
        cvvlength = 3;
    }
    else
    {
        cardtype=0;
        cvvlength = -1;
    }
    
    if(cardtype==CardIOCreditCardTypeAmex)
    {
        if (cvvno.length==4) {
            return @"YES";
        }
        
        else
        {
            return @"NO";
        }

    }
    else if(cardtype==CardIOCreditCardTypeJCB || cardtype==CardIOCreditCardTypeVisa || cardtype==CardIOCreditCardTypeMastercard || cardtype==CardIOCreditCardTypeDiscover )
    {
        if (cvvno.length==3) {
            return @"YES";
        }
        
        else
        {
            return @"NO";
        }
        
    }
    else if(cvvno.length==4 || cvvno.length==3)
    {
         return @"YES";
    }
    else
    {
        return @"NO";
    }
}
-(NSString *)validateexpdt:(NSString *)date
{
    NSDateFormatter *dt = [[NSDateFormatter alloc] init];
    [dt setDateFormat:@"MM/yy"];
    NSDate *expdt = [dt dateFromString:date];
    
   
    NSDate *currdate=[dt dateFromString:[dt stringFromDate:[NSDate date]]];

    
    NSComparisonResult result;
    result = [currdate compare:expdt];
    
    if(result==NSOrderedDescending)
    {
       return @"NO";
    }
    else if (result==NSOrderedAscending)
    {
        return  @"YES";
    }
    else if (result==NSOrderedSame)
    {
        return  @"YES";
    }
    else
    {
        return  @"NO";
    }

}
- (IBAction)paymentclk:(id)sender
{
    NSString *validcard;
    NSString *validcvv;
    NSString *validdt;
    validcard=@"NO";
     validcvv=@"NO";
     validdt=@"NO";
        cardno=txtcardno.text;
   
        cvv=tctcvv.text;
/*    if (txtexpdt.text.length>0)
    {
        expirymonth=[txtexpdt.text substringWithRange:NSMakeRange(0, 2)];
        expirtyear=[txtexpdt.text substringWithRange:NSMakeRange(3, 2)];
    }
 */
    if (txtcardno.text.length>0)
    {
        NSLog(@"check card validation");
        validcard = [self validateCard:txtcardno.text];
        NSLog(@"valid cardno=%@",validcard);
        validcvv=[self validatecvv:tctcvv.text];
        NSLog(@"valid cvvno=%@",validcvv);

    }
    else
    {
        validcard=@"NO";
        validcvv=@"NO";
    }
    if (txtexpdt.text.length>0)
    {
       
        validdt=[self validateexpdt:txtexpdt.text];
        NSLog(@"valid dt=%@",validdt);
        
    }
    else
    {
        validdt=@"NO";
        
    }
   
   //    NSString *validdt=[self validateexpdt:txtexpdt.text];
//    NSLog(@"valid date=%@",validdt);
    
    
    NSLog(@"card info=%lu",(unsigned long)cardno.length);
    if ([txtbillname.text isEqualToString:@""])
    {
         txtbillname.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"Please Enter Bill Name." attributes:@{NSForegroundColorAttributeName: [UIColor redColor]}];
    }
    else if(cardno.length==0 || expirymonth.length==0 || expirtyear.length==0 || cvv.length==0)
    {
        UIAlertView *aler=[[UIAlertView alloc] initWithTitle:@"Error" message:@"Please Provide Card Information." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [aler show];
    }
    else if ([validcard isEqualToString:@"NO"])
    {
        txtcardno.text=@"";
        txtcardno.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"Please Enter Valid Card Number." attributes:@{NSForegroundColorAttributeName: [UIColor redColor]}];
    }
    else if ([validcvv isEqualToString:@"NO"])
    {
        tctcvv.text=@"";

        tctcvv.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"Invalid CVV" attributes:@{NSForegroundColorAttributeName: [UIColor redColor]}];
    }
   else if ([validdt isEqualToString:@"NO"])
    {
        txtexpdt.text=@"";
        txtexpdt.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"Invalid Date." attributes:@{NSForegroundColorAttributeName: [UIColor redColor]}];
    }
   else
   {
       
       [self afterpaymenturl];
       
   }
   
}
-(void)afterpaymenturl
{
    [self checkLoader];
    //  [myspinner setHidden:NO];
 //   [myspinner startAnimating];
    NSUserDefaults *prefs = [NSUserDefaults standardUserDefaults];
    NSString *userid=[prefs valueForKey:@"userid"];
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
 
    if([[[prefs valueForKey:@"taskdetaildic"] valueForKey:@"perjob"] isEqualToString:@"yes"])
    {
        paytype=@"0";
        
    }
    else if([[[prefs valueForKey:@"taskdetaildic"] valueForKey:@"perjob"] isEqualToString:@"no"])
    {
        paytype=@"1";
    }
  /*
    
    lblbiddt.text=[[[prefs valueForKey:@"taskdetaildic"] valueForKey:@"bidclosedt"] substringWithRange:NSMakeRange(0, 2)];
    lblbidmonth.text=[[[prefs valueForKey:@"taskdetaildic"] valueForKey:@"bidclosedt"] substringWithRange:NSMakeRange(2, 2)];
    lblbidyr.text=[[[prefs valueForKey:@"taskdetaildic"] valueForKey:@"bidclosedt"] substringWithRange:NSMakeRange(4, 4)];
    lblbidtime.text=[[[prefs valueForKey:@"taskdetaildic"] valueForKey:@"bidclosedt"] substringWithRange:NSMakeRange(8, 7)];
    
    lbltaskdt.text=[[[prefs valueForKey:@"taskdetaildic"] valueForKey:@"taskcompletedt"] substringWithRange:NSMakeRange(0, 2)];
    lbltaskmonth.text=[[[prefs valueForKey:@"taskdetaildic"] valueForKey:@"taskcompletedt"] substringWithRange:NSMakeRange(2, 2)];
    lbltaskyr.text=[[[prefs valueForKey:@"taskdetaildic"] valueForKey:@"taskcompletedt"] substringWithRange:NSMakeRange(4, 4)];
    lbltasktime.text=[[[prefs valueForKey:@"taskdetaildic"] valueForKey:@"taskcompletedt"] substringWithRange:NSMakeRange(8, 7)];
    */
    biddatetime=[[prefs valueForKey:@"taskdetaildic"] valueForKey:@"bidclosedt"];
    taskclsdatetime=[[prefs valueForKey:@"taskdetaildic"] valueForKey:@"taskcompletedt"];
   
    
    bidclsdt=[[self changeformate_string24hr:biddatetime] substringWithRange:NSMakeRange(0,10)];
    bidclstm=[[self changeformate_string24hr:biddatetime] substringWithRange:NSMakeRange(11,8)];
    
    taskclsdt=[[self changeformate_string24hr:taskclsdatetime] substringWithRange:NSMakeRange(0,10)];
    taskclstm=[[self changeformate_string24hr:taskclsdatetime] substringWithRange:NSMakeRange(11,8)];
    NSString *conpay=[[[prefs valueForKey:@"taskdetaildic"] valueForKey:@"contractorpay"] substringWithRange:NSMakeRange(2,[[[prefs valueForKey:@"taskdetaildic"] valueForKey:@"contractorpay"] length]-2)];
    NSString *pay=[[[prefs valueForKey:@"taskdetaildic"] valueForKey:@"payamt"] substringWithRange:NSMakeRange(2,[[[prefs valueForKey:@"taskdetaildic"] valueForKey:@"payamt"] length]-2)];
    // user type is always 0 for task poster (1 for task runner)
    
 
    NSOperationQueue *myQueue11 = [[NSOperationQueue alloc] init];
    [myQueue11 addOperationWithBlock:^{
        
        
        
        
        NSString *parameter = [NSString stringWithFormat:@ "%@posttask_ios?user_id=%@&user_type=%@&i_am=%@&task_title=%@&task_description=%@&location=%@&address=%@&city=%@&state=%@&zip=%@&addtional_details=%@&task_done=%@&est_time_date=%@&est_time=%@&repeated_task=%@&contractor_spend=%@&pay_for_task=%@&pay_type=%@&bid_type=%@&bid_close_date=%@&bid_close_time=%@&task_close_date=%@&task_close_time=%@&bill_name=%@&card_no=%@&expyear=%@&expm=%@&cvvcode=%@",URL_LINK,userid,@"0",i_am,[[[prefs valueForKey:@"taskdetaildic"] valueForKey:@"taskname"] stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding],[[[prefs valueForKey:@"taskdetaildic"] valueForKey:@"taskdesc"] stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding] ,@"",[[[prefs valueForKey:@"taskdetaildic"] valueForKey:@"address"] stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding],[[[prefs valueForKey:@"taskdetaildic"] valueForKey:@"city"] stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding],[[[prefs valueForKey:@"taskdetaildic"] valueForKey:@"province"] stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding],[[[prefs valueForKey:@"taskdetaildic"] valueForKey:@"pcode"] stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding],[[[prefs valueForKey:@"taskdetaildic"] valueForKey:@"droplocation"] stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding],taskdone,[[[prefs valueForKey:@"taskdetaildic"] valueForKey:@"estimatedday"] stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding],[[[prefs valueForKey:@"taskdetaildic"] valueForKey:@"estimatedtime"] stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding],[[[prefs valueForKey:@"taskdetaildic"] valueForKey:@"repeattask"] stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding],conpay,pay,paytype,bidtype,bidclsdt,bidclstm,taskclsdt,taskclstm,txtbillname.text,cardno,[expirtyear stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding],[expirymonth stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding],[cvv stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
        
        NSLog(@"parameter=%@",parameter);
        
        //fetch image data from document directory
        NSNumber *num=[[prefs valueForKey:@"taskdetaildic"] valueForKey:@"imagecount"];
        NSLog(@"image count num=%@",num);
        imgcount=[num integerValue];
        NSLog(@"image count=%ld",(long)imgcount);
        NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,     NSUserDomainMask, YES);
        
       
        
        NSString *documentsDirectory = [paths objectAtIndex:0];
        NSString *getImagePath = [documentsDirectory stringByAppendingPathComponent:@"taskimage1.png"];
        UIImage *tskimg = [UIImage imageWithContentsOfFile:getImagePath];
       
        
        NSString *getImagePath1 = [documentsDirectory stringByAppendingPathComponent:@"taskimage2.png"];
        UIImage *tskimg1 = [UIImage imageWithContentsOfFile:getImagePath1];
        
        NSString *getImagePath2 = [documentsDirectory stringByAppendingPathComponent:@"taskimage3.png"];
        UIImage *tskimg2 = [UIImage imageWithContentsOfFile:getImagePath2];
      
        NSData *imageData = UIImagePNGRepresentation(tskimg);
        NSData *imageData1 = UIImagePNGRepresentation(tskimg1);
        NSData *imageData2 = UIImagePNGRepresentation(tskimg2);
        
        
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
                    [[NSUserDefaults standardUserDefaults] removeObjectForKey:@"taskdetaildic"];
                    btnpayment.userInteractionEnabled=NO;
                    NSLog(@"pay status=%@",[json valueForKey:@"payment_status"]);
                    [[NSUserDefaults standardUserDefaults] setObject:[json valueForKey:@"payment_status"] forKey:@"paymentstatus"];
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

        //   NSError *error=nil;
        
        //   NSMutableArray  *fetchPassPath= [[NSMutableArray alloc] init];
        
        /*
        NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
        
        [request setCachePolicy:NSURLRequestReloadIgnoringLocalCacheData];
        
        [request setHTTPShouldHandleCookies:NO];
        
        [request setURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@", parameter]]];
        
        [request setTimeoutInterval:10];
        
        [request setHTTPMethod:@"POST"];
        
        
        if ( [imageData length] > 0)
        {
            NSString *boundary = @"---------------------------14737809831466499882746641449";
            
            NSString *contentType = [NSString stringWithFormat:@"multipart/form-data; boundary=%@", boundary];
            
            [request addValue:contentType forHTTPHeaderField:@"Content-Type"];
            
            NSMutableData *body = [NSMutableData data];
            
            [body appendData:[[NSString stringWithFormat:@"\r\n--%@\r\n", boundary] dataUsingEncoding:NSUTF8StringEncoding]];
            
            [body appendData:[[NSString stringWithFormat:@"Content-Disposition: form-data; name=\"task_photo\"; filename=\"taskimage1.jpg\"\r\n"] dataUsingEncoding:NSUTF8StringEncoding]];
            
            [body appendData:[[NSString stringWithFormat:@"Content-Type: application/octet-stream\r\n\r\n"] dataUsingEncoding:NSUTF8StringEncoding]];
            
            [body appendData:[NSData dataWithData:UIImageJPEGRepresentation(tskimg, 1)]];
            
            [body appendData:[[NSString stringWithFormat:@"\r\n--%@--\r\n", boundary] dataUsingEncoding:NSUTF8StringEncoding]];
            
            [request setHTTPBody:body];
            
        }
        if ( [imageData1 length] > 0)
        {
            NSString *boundary = @"---------------------------14737809831466499882746641449";
            
            NSString *contentType = [NSString stringWithFormat:@"multipart/form-data; boundary=%@", boundary];
            
            [request addValue:contentType forHTTPHeaderField:@"Content-Type"];
            
            NSMutableData *body = [NSMutableData data];
            
            [body appendData:[[NSString stringWithFormat:@"\r\n--%@\r\n", boundary] dataUsingEncoding:NSUTF8StringEncoding]];
            
            [body appendData:[[NSString stringWithFormat:@"Content-Disposition: form-data; name=\"task_photo\"; filename=\"taskimage2.jpg\"\r\n"] dataUsingEncoding:NSUTF8StringEncoding]];
            
            [body appendData:[[NSString stringWithFormat:@"Content-Type: application/octet-stream\r\n\r\n"] dataUsingEncoding:NSUTF8StringEncoding]];
            
            [body appendData:[NSData dataWithData:UIImageJPEGRepresentation(tskimg1, 1)]];
            
            [body appendData:[[NSString stringWithFormat:@"\r\n--%@--\r\n", boundary] dataUsingEncoding:NSUTF8StringEncoding]];
            
            [request setHTTPBody:body];
            
        }
        if ( [imageData2 length] > 0)
        {
            NSString *boundary = @"---------------------------14737809831466499882746641449";
            
            NSString *contentType = [NSString stringWithFormat:@"multipart/form-data; boundary=%@", boundary];
            
            [request addValue:contentType forHTTPHeaderField:@"Content-Type"];
            
            NSMutableData *body = [NSMutableData data];
            
            [body appendData:[[NSString stringWithFormat:@"\r\n--%@\r\n", boundary] dataUsingEncoding:NSUTF8StringEncoding]];
            
            [body appendData:[[NSString stringWithFormat:@"Content-Disposition: form-data; name=\"task_photo\"; filename=\"taskimage3.jpg\"\r\n"] dataUsingEncoding:NSUTF8StringEncoding]];
            
            [body appendData:[[NSString stringWithFormat:@"Content-Type: application/octet-stream\r\n\r\n"] dataUsingEncoding:NSUTF8StringEncoding]];
            
            [body appendData:[NSData dataWithData:UIImageJPEGRepresentation(tskimg2, 1)]];
            
            [body appendData:[[NSString stringWithFormat:@"\r\n--%@--\r\n", boundary] dataUsingEncoding:NSUTF8StringEncoding]];
            
            [request setHTTPBody:body];
            
        }
        [[NSOperationQueue mainQueue] addOperationWithBlock:^{
            
           NSURLConnection *connection = [[NSURLConnection alloc] initWithRequest:request delegate:self];
            
            if( connection )
            {
                mutableData = [[NSMutableData alloc] init];
                
            }
     
        }];
         
         */
    }];
    
}

-(void) connection:(NSURLConnection *) connection didReceiveResponse:(NSURLResponse *)response
{
    [mutableData setLength:0];
}

-(void) connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
  //  NSLog(@"data=%@",data);
    [mutableData appendData:data];
}

-(void) connection:(NSURLConnection *)connection didFailWithError:(NSError *)error
{
    // If we get any connection error we can manage it here…
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Alert" message:@"No Network Connection" delegate:self cancelButtonTitle:nil otherButtonTitles:@"OK",nil];
    [alertView show];
    [self checkLoader];
    //   [myspinner stopAnimating];
 //   [myspinner setHidden:YES];
    return;
}

-(void)connectionDidFinishLoading:(NSURLConnection *)connection
{
    
    NSError *error;
    mainDic=[NSJSONSerialization JSONObjectWithData:mutableData options:kNilOptions error:&error];
    //  NSLog(@"values:%@",mainDic);
    //   NSLog(@"values:%@",[mainDic valueForKey:@"userid"]);
    mutDic=[mainDic valueForKey:@"response"];
    
    NSLog(@"maindictionary %@", mainDic);
    
    NSLog(@"values:%@",[mutDic valueForKey:@"status"]);
    
    
    if ([[mutDic valueForKey:@"status"] isEqualToString:@"Success"]) {
        
      
        //          NSString *msg=[mutDic valueForKey:@"message"];
        UIAlertView *aler=[[UIAlertView alloc] initWithTitle:@"Success" message:@"Task Successfully Posted." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [aler show];
        [[NSUserDefaults standardUserDefaults] removeObjectForKey:@"taskdetaildic"];
        btnpayment.userInteractionEnabled=NO;
        [[NSUserDefaults standardUserDefaults] setObject:[mainDic valueForKey:@"payment_status"] forKey:@"paymentstatus"];
        NSLog(@"pay status=%@",[mainDic valueForKey:@"payment_status"]);
        TaskHomeViewController *obj=[self.storyboard instantiateViewControllerWithIdentifier:@"TaskHomeViewControllersid"];
        [self.navigationController pushViewController:obj animated:YES];
        
        [self checkLoader];
  //      [myspinner stopAnimating];
 //       [myspinner setHidden:YES];
        //        [[NSUserDefaults standardUserDefaults] setObject:[mainDic valueForKey:@"userid"] forKey:@"userid"];
        /*    TaskShowViewController *obj=[self.storyboard instantiateViewControllerWithIdentifier:@"TaskShowViewControllersid"];
         
         [self.navigationController pushViewController:obj animated:YES];
         */
    }
    else
    {
       
        UIAlertView *aler=[[UIAlertView alloc] initWithTitle:@"Error" message:@"Task Posting fail.." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [aler show];
        [self checkLoader];
   //     [myspinner stopAnimating];
   //     [myspinner setHidden:YES];
    }
    
}
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [mainscroll setContentOffset:CGPointMake(0,0) animated:YES];
    [textField resignFirstResponder];
    return YES;
}
- (IBAction)testclk:(id)sender
{
     NSString *validcard = [self validateCard:txtcardno.text];
    NSLog(@"valid cardno=%@",validcard);
    NSString *validcvv=[self validatecvv:tctcvv.text];
      NSLog(@"valid cvvno=%@",validcvv);
    NSString *validdt=[self validateexpdt:txtexpdt.text];
    NSLog(@"valid date=%@",validdt);
}
- (IBAction)dateclk:(id)sender
{
    
    [txtcardno resignFirstResponder];
        [dateview removeFromSuperview];
    
        dateview=[[UIView alloc]initWithFrame:CGRectMake(self.view.frame.origin.x, self.view.frame.origin.y, self.view.frame.size.width,self.view.frame.size.height)];
        //    viewrepeattask=[[UIView alloc]initWithFrame:CGRectMake(self.view.frame.origin.x, self.view.frame.size.height-200, self.view.frame.size.width,200)];
        [dateview setBackgroundColor:[[UIColor blackColor]colorWithAlphaComponent:0.8]];
        [self.view addSubview:dateview];
        
        monthpicker=[[UIPickerView alloc]initWithFrame:CGRectMake(self.view.frame.size.width/2-125, 180, 123,150)];
     yrpicker=[[UIPickerView alloc]initWithFrame:CGRectMake(self.view.frame.size.width/2+2, 180, 123,150)];
    
        [monthpicker setBackgroundColor:[UIColor whiteColor]];
     [yrpicker setBackgroundColor:[UIColor whiteColor]];
        monthpicker.delegate=self;
        monthpicker.dataSource=self;
        [dateview addSubview:monthpicker];
    
    yrpicker.delegate=self;
    yrpicker.dataSource=self;
    [dateview addSubview:yrpicker];
    
        btndtsave=[[UIButton alloc] initWithFrame:CGRectMake(monthpicker.frame.origin.x+yrpicker.frame.size.width+monthpicker.frame.size.width+5-50, yrpicker.frame.origin.y-50, 50, 50)];
        //      btnrepeatsave=[[UIButton alloc] initWithFrame:CGRectMake(repeattaskpicker.frame.origin.x+repeattaskpicker.frame.size.width-50,0, 50, 50)];
        //   btncontactpaysave = [UIButton buttonWithType:UIButtonTypeCustom];
        [btndtsave setTitle:@"Save" forState:UIControlStateNormal];
        btndtsave.backgroundColor = [UIColor clearColor];
        [btndtsave setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal ];
        btndtsave.titleLabel.font = [UIFont fontWithName:@"OpenSans-Semibold" size:14.0];
        [btndtsave addTarget:self action:@selector(datepickerChange) forControlEvents:UIControlEventTouchUpInside];
        [dateview addSubview:btndtsave];
        
        btndtcancel=[[UIButton alloc] initWithFrame:CGRectMake(monthpicker.frame.origin.x, yrpicker.frame.origin.y-50, 50, 50)];
        //      btnrepeatsave=[[UIButton alloc] initWithFrame:CGRectMake(repeattaskpicker.frame.origin.x+repeattaskpicker.frame.size.width-50,0, 50, 50)];
        //   btncontactpaysave = [UIButton buttonWithType:UIButtonTypeCustom];
        [btndtcancel setTitle:@"Cancel" forState:UIControlStateNormal];
        btndtcancel.backgroundColor = [UIColor clearColor];
        [btndtcancel setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal ];
        btndtcancel.titleLabel.font = [UIFont fontWithName:@"OpenSans-Semibold" size:14.0];
        [btndtcancel addTarget:self action:@selector(datepickerCancel) forControlEvents:UIControlEventTouchUpInside];
        [dateview addSubview:btndtcancel];
       
   
}
-(void)datepickerChange
{
    expirymonth=emonth;
    expirtyear=eyear;
    if ([emonth isEqualToString:@"" ] || emonth ==nil)
    {
        
        expirymonth=[arrmonth objectAtIndex:0];
    }
    if ([eyear isEqualToString:@"" ] || eyear ==nil)
    {
        
        expirtyear=[arryr objectAtIndex:0];
    }
    NSArray *myStrings = [[NSArray alloc] initWithObjects:expirymonth,expirtyear, nil];
    NSString *joinedString = [myStrings componentsJoinedByString:@"/"];
    txtexpdt.text=joinedString;
    [dateview removeFromSuperview];
    emonth=@"";
    eyear=@"";
      [mainscroll setContentOffset:CGPointMake(0,0) animated:YES];
}
-(void)datepickerCancel
{
     [dateview removeFromSuperview];
      [mainscroll setContentOffset:CGPointMake(0,0) animated:YES];
}
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    if(pickerView==monthpicker)
    {
        return arrmonth.count;
    }
    else if (pickerView==yrpicker)
    {
        return arryr.count;
    }
    else
    {
        return 0;
    }
}
- (NSString*)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
   if (pickerView==monthpicker)
    {
        return arrmonth[row];
    }
    else if (pickerView==yrpicker)
    {
        return arryr[row];
    }
    else
    {
        return @"";
    }
    
}
- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    if (pickerView==monthpicker)
    {
        emonth= arrmonth[row];
        
    }
    else if (pickerView==yrpicker)
    {
        eyear= arryr[row];
    }
    else
    {
        
    }
   
    
}
- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField
{
    if(textField==txtbillname)
    {
        [mainscroll setContentOffset:CGPointMake(0,txtbillname.frame.origin.y+40) animated:YES];
    }
    if(textField==txtcardno || textField==tctcvv)
    {
        [mainscroll setContentOffset:CGPointMake(0,txtbillname.frame.origin.y+70) animated:YES];
    }
    return  YES;
}
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range     replacementString:(NSString *)string
{
    if (textField==tctcvv)
    {
        if (textField.text.length >= 4 && range.length == 0)
            return NO;
    }
    if (textField==txtcardno)
    {
        if (textField.text.length >= 16 && range.length == 0)
            return NO;
    }
    
    return YES;
}
@end
