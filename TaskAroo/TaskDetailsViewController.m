//
//  TaskDetailsViewController.m
//  TaskAroo
//
//  Created by Prosenjit Kolay on 19/05/15.
//  Copyright (c) 2015 Prosenjit Kolay. All rights reserved.
//

#import "TaskDetailsViewController.h"
#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>

@interface TaskDetailsViewController ()<headerDelegate,MKMapViewDelegate,CLLocationManagerDelegate,UITableViewDataSource,UITableViewDelegate,UIActionSheetDelegate,UITextViewDelegate,UIAlertViewDelegate>

@end

@implementation TaskDetailsViewController
@synthesize taskid,mainscroll,mainview,lblamt,lblbidenddt,lblestimatedtime,lbllocation,lblrepeattask,lbltaskcreatedt,lbltaskenddt,lbltasktitle,lbltasktype,lblusertype,taskimage2,taskimage3,taskimg1,MapView,titleview,lbltaskcode,tasktypeview,lblimage,menuview,btnallbids,btndetails,btnmesgboard,tblbids,tblmesg,btnmesg,underlineimg,lbladddetail,lbladditionalDetail,btntaskcancel,lblnodata,btntaskimg1,btntaskimg2,btntaskimg3,lblContractorSpend;
- (void) viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:YES animated:animated];
    
       [super viewWillAppear:YES];
   
    
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
    
    NSLog(@"image picked=%@",info[UIImagePickerControllerEditedImage]);
    
   
    
    mesgview.fileimg.image=info[UIImagePickerControllerEditedImage];
    mesgview.fileimg.contentMode = UIViewContentModeScaleAspectFill;
    mesgview.fileimg.clipsToBounds=YES;
    
    [mesgview.fileimg setUserInteractionEnabled:YES];
    
    
    
    [picker dismissViewControllerAnimated:YES completion:nil];
    
    
    
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    HeaderView *hv = [[HeaderView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 60)];
    hv.userInteractionEnabled = YES;
    hv.myDelegate = self;
      hv.btnlogo1.hidden=YES;
//    hv.btnlogo1.frame=CGRectMake(self.view.frame.size.width- hv.btnlogo1.frame.size.width-30,  hv.btnlogo1.frame.origin.y-10,  hv.btnlogo1.frame.size.width,  hv.btnlogo1.frame.size.height);
    hv.btnback.hidden=NO;
    hv.btnbackextra.hidden=NO;
    hv.btnsignnout.hidden=YES;
     hv.lblpagename.text=@"DETAILS";
     hv.lblpagename.center=CGPointMake(self.view.center.x, hv.lblpagename.center.y);
  //   hv.lblpagename.frame=CGRectMake(hv.lblpagename.frame.origin.x+7,  hv.lblpagename.frame.origin.y,  hv.lblpagename.frame.size.width,  hv.lblpagename.frame.size.height);
    [mainview addSubview:hv];
    
    FooterView *fv = [[FooterView alloc]initWithFrame:CGRectMake(0,self.view.frame.size.height-60, self.view.frame.size.width,60)];
    [fv.btnmenu1 addTarget:self action:@selector(taskbuttonTapped:) forControlEvents:UIControlEventTouchUpInside];
    [fv.btnmenu2 addTarget:self action:@selector(MyAccountbuttonTapped:) forControlEvents:UIControlEventTouchUpInside];
    [fv.btnmenu3 addTarget:self action:@selector(MessagebuttonTapped:) forControlEvents:UIControlEventTouchUpInside];
    [fv.btnmenu4 addTarget:self action:@selector(ContactbuttonTapped:) forControlEvents:UIControlEventTouchUpInside];
    [mainview addSubview:fv];

    NSLog(@"task id=%@",taskid);
     menuview.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"topbar-1"]];
    urlobj=[[UrlconnectionObject alloc]init];
    mainscroll.contentSize = CGSizeMake(0, 1150);
  //   mainscroll.contentSize = CGSizeMake(0, mainscroll.bounds.size.height * 1.5);
    [self taskdetailUrl];
    
    NSUserDefaults *prefs = [NSUserDefaults standardUserDefaults];
    userid=[prefs valueForKey:@"userid"];
    Arrmesg=[[NSMutableArray alloc]init];
    
    ArrRecieverId1=[[NSMutableArray alloc]init];
    ArrAllBids=[[NSMutableArray alloc]init];
    ArrBigImg=[[NSMutableArray alloc]init];
 
}
-(void)taskbuttonTapped:(id)sender
{
    
    TaskHomeViewController *obj=[self.storyboard instantiateViewControllerWithIdentifier:@"TaskHomeViewControllersid"];
    
    [self.navigationController pushViewController:obj animated:YES];
    
}
-(void)MyAccountbuttonTapped:(id)sender
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
-(void)MessagebuttonTapped:(id)sender
{
  
    if (userid == nil || [userid isEqualToString:@""])
    {
        SignInViewController *obj=[self.storyboard instantiateViewControllerWithIdentifier:@"SignInViewControllersid"];
        
        [self.navigationController pushViewController:obj animated:YES];
    }
    else
    {
        MessageViewController *obj=[self.storyboard instantiateViewControllerWithIdentifier:@"MessageViewControllersid"];
        
        [self.navigationController pushViewController:obj animated:YES];
    }
    /*
     UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"just alert" message:@"first footer clicked" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
     [alert show];
     */
}

-(void)ContactbuttonTapped:(id)sender
{
    
    ContactViewController *obj=[self.storyboard instantiateViewControllerWithIdentifier:@"ContactViewControllersid"];
    
    [self.navigationController pushViewController:obj animated:YES];
    
}
-(void)headerclk:(UIButton *)sender
{
    
  //  NSLog(@"get value method called");
    long tagId = [sender tag];
    if (tagId==5 || tagId==6)
    {
        [self.navigationController popViewControllerAnimated:YES];
            
       
    }
    else if (tagId==1)
    {
        ViewController *obj=[self.storyboard instantiateViewControllerWithIdentifier:@"ViewControllersid"];
        
        [self.navigationController pushViewController:obj animated:YES];
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
-(void)taskdetailUrl
{
    NSString *str=[NSString stringWithFormat:@"%@tasklist_ios/task_deatils?task_id=%@",URL_LINK,[taskid stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
    NSLog(@"str=%@",str);
    BOOL net=[urlobj connectedToNetwork];
    if (net==YES) {
    [urlobj global:str typerequest:@"array" withblock:^(id result, NSError *error,BOOL completed) {
        
      //     NSLog(@"event result----- %@", result);
 
        taskdic = [[NSMutableDictionary alloc]init];
        taskdic=[result mutableCopy];
    //    NSLog(@"task details=%@",taskdic);
        lbltasktitle.text=[taskdic valueForKey:@"task_title"];
         lbltaskcode.text=[taskdic valueForKey:@"task_code"];
        if([[taskdic valueForKey:@"i_am"] isEqualToString:@"1"])
        {
            lblusertype.text=@"I am an individual";
        }
        else if([[taskdic valueForKey:@"i_am"] isEqualToString:@"2"])
        {
            lblusertype.text=@"I am a Business";
        }
        lbltaskcreatedt.text=[taskdic valueForKey:@"added_date"];
         lblbidenddt.text=[taskdic valueForKey:@"bid_close_deadline"];
         lbltaskenddt.text=[taskdic valueForKey:@"task_close_deadline"];
     NSString *adddetail=[taskdic valueForKey:@"additional_details"];
        IsAwarded=[[taskdic valueForKey:@"task_award"] integerValue];
        NSLog(@"is awarded=%ld",(long)IsAwarded);
        timetype=[[taskdic valueForKey:@"payment_mode"] integerValue];
        AwardedTo=[taskdic valueForKey:@"task_award_owner_id"];
        //cancel button show or hide
        if ([[taskdic valueForKey:@"user_id"] isEqualToString:userid])
        {
            if ([[taskdic valueForKey:@"task_is_completed"] isEqualToString:@"0"] && [[taskdic valueForKey:@"is_canceled"] isEqualToString:@"0"] && [[taskdic valueForKey:@"task_award"] isEqualToString:@"0"] &&  [[taskdic  valueForKey:@"total_bid"] integerValue]==0)
            {
                btntaskcancel.hidden=NO;
            }
            else
            {
                btntaskcancel.hidden=YES;
            }
        }
        else{
            btntaskcancel.hidden=YES;
        }
        
        
        if (adddetail.length==0)
        {
            lbladditionalDetail.text=@"N/A";
        }
        else
        {
            NSInteger rw=ceil(adddetail.length/50.0);
            NSInteger len=rw*21;
            lbladditionalDetail.frame=CGRectMake(lbladditionalDetail.frame.origin.x, lbladditionalDetail.frame.origin.y, lbladditionalDetail.frame.size.width,len);
            tasktypeview.frame=CGRectMake(tasktypeview.frame.origin.x, tasktypeview.frame.origin.y, tasktypeview.frame.size.width,tasktypeview.frame.size.height+len-21);
            MapView.frame=CGRectMake(MapView.frame.origin.x, tasktypeview.frame.origin.y+tasktypeview.frame.size.height+2, MapView.frame.size.width, MapView.frame.size.height);
        //    NSLog(@"mainscroll height=%f",mainscroll.contentSize.height);
          //  mainscroll.contentSize = CGSizeMake(0, mainscroll.contentSize.height+len-21);
             mainscroll.contentSize = CGSizeMake(0, 1150+len-21);
            lbladditionalDetail.text=adddetail;
         //   NSLog(@"additional detail=%d",len);
        }
    //    NSArray *myStrings = [[NSArray alloc] initWithObjects:[taskdic valueForKey:@"location"], [taskdic valueForKey:@"city"], [taskdic valueForKey:@"state"], [taskdic valueForKey:@"zipcode"], nil];
    //    NSString *joinedString = [myStrings componentsJoinedByString:@","];
        NSString *str;
        if([[taskdic valueForKey:@"address"] isEqualToString:@""])
        {
           str = [@[[taskdic valueForKey:@"city"], [taskdic valueForKey:@"state"],[taskdic valueForKey:@"zipcode"]] componentsJoinedByString:@","];
        }
        else if ([[taskdic valueForKey:@"city"] isEqualToString:@""])
        {
          str = [@[[taskdic valueForKey:@"address"], [taskdic valueForKey:@"state"],[taskdic valueForKey:@"zipcode"]] componentsJoinedByString:@","];
        }
        else if ([[taskdic valueForKey:@"state"] isEqualToString:@""])
        {
            str = [@[[taskdic valueForKey:@"address"], [taskdic valueForKey:@"city"],[taskdic valueForKey:@"zipcode"]] componentsJoinedByString:@","];
        }
        else if ([[taskdic valueForKey:@"zipcode"] isEqualToString:@""])
        {
            str = [@[[taskdic valueForKey:@"address"], [taskdic valueForKey:@"state"],[taskdic valueForKey:@"city"]] componentsJoinedByString:@","];
        }
        else
        {
       str = [@[[taskdic valueForKey:@"address"], [taskdic valueForKey:@"city"], [taskdic valueForKey:@"state"],[taskdic valueForKey:@"zipcode"]] componentsJoinedByString:@" ,"];
        }
        lbllocation.text=str;
        if (timetype==1)
        {
            lblamt.text=[NSString stringWithFormat:@"%@ %@ %@",@"$ ",[taskdic valueForKey:@"pay_for_task"],@" / hr"];
        }
        else if (timetype==0)
        {
            lblamt.text=[NSString stringWithFormat:@"%@ %@ %@",@"$ ",[taskdic valueForKey:@"pay_for_task"],@" / job"];
        }
        if ([[taskdic valueForKey:@"contractor_spend"] floatValue]>100)
        {
            lblContractorSpend.text=[NSString stringWithFormat:@"%@ %@",@"$",[taskdic valueForKey:@"contractor_spend"]];
        }
        else
        {
            lblContractorSpend.text=@"N/A";
        }

     //   lblamt.text=[@"$ " stringByAppendingString:[taskdic valueForKey:@"pay_for_task"]];
         lblrepeattask.text=[[taskdic valueForKey:@"repeated_task"] stringByAppendingString:@" Weeks"];
        NSString *str1;
        if([[taskdic valueForKey:@"estimate_day"] isEqualToString:@"0"])
        {
            str1 = [[taskdic valueForKey:@"estimate_time"] stringByAppendingString:@" Hours"];
        }
        else if ([[taskdic valueForKey:@"estimate_time"] isEqualToString:@"0"])
        {
             str1 = [[taskdic valueForKey:@"estimate_day"] stringByAppendingString:@" Days"];
        }
        else
        {
             str1 = [@[[[taskdic valueForKey:@"estimate_day"] stringByAppendingString:@" Days"], [[taskdic valueForKey:@"estimate_time"] stringByAppendingString:@" Hours"]] componentsJoinedByString:@","];
        }
        lblestimatedtime.text=str1;
      
        if([[taskdic valueForKey:@"task_type"] isEqualToString:@""])
        {
           lbltasktype.text=@"N/A";
        }
        else
        {
           NSString *type=[NSString stringWithFormat:@"%@",[taskdic objectForKey:@"task_type"]];
            if (type.length==5) {
                lbltasktype.text = [@[@"Can be Done By Phone Or Online",@"Requires A Vehicle",@"No Bid"] componentsJoinedByString:@","];
            }
            else if (type.length==1)
            {
                if ([type isEqualToString:@"1"])
                {
                    lbltasktype.text=@"Can be Done By Phone Or Online";
                }
                else if ([type isEqualToString:@"2"])
                {
                   
                        lbltasktype.text=@"Requires A Vehicle";
                   
                }
                else if ([type isEqualToString:@"3"])
                {
                    
                    lbltasktype.text=@"No Bid";
                    
                }
            }
            else if (type.length==3)
            {
                NSString *data=[type substringWithRange:NSMakeRange(0, 1)];
                NSString *data1=[type substringWithRange:NSMakeRange(2, 1)];
                if ([data isEqualToString:@"1"] && [data1 isEqualToString:@"2"])
                {
                    lbltasktype.text = [@[@"Can be Done By Phone Or Online",@"Requires A Vehicle"] componentsJoinedByString:@","];
                }
                else if ([data isEqualToString:@"1"] && [data1 isEqualToString:@"3"])
                {
                    lbltasktype.text = [@[@"Can be Done By Phone Or Online",@"No Bid"] componentsJoinedByString:@","];
                }
                else if ([data isEqualToString:@"2"] && [data1 isEqualToString:@"3"])
                {
                    lbltasktype.text = [@[@"Requires A Vehicle",@"No Bid"] componentsJoinedByString:@","];
                }
            }
           
        }
        //task type dynamic view
     /*   NSString *adddetail1=lbltasktype.text;
        if (adddetail1.length==0)
        {
            lbltasktype.text=@"N/A";
        }
        else
        {
            NSInteger rw=ceil(adddetail1.length/50.0);
            NSInteger len=rw*21;
            lbladditionalDetail.frame=CGRectMake(lbladditionalDetail.frame.origin.x, lbladditionalDetail.frame.origin.y, lbladditionalDetail.frame.size.width,len);
            tasktypeview.frame=CGRectMake(tasktypeview.frame.origin.x, tasktypeview.frame.origin.y, tasktypeview.frame.size.width,tasktypeview.frame.size.height+len-21);
            MapView.frame=CGRectMake(MapView.frame.origin.x, tasktypeview.frame.origin.y+tasktypeview.frame.size.height+2, MapView.frame.size.width, MapView.frame.size.height);
            mainscroll.contentSize = CGSizeMake(0, mainscroll.contentSize.height+len-21);
            lbladditionalDetail.text=adddetail;
            //   NSLog(@"additional detail=%d",len);
        }
      */
       //image show
       NSMutableArray *arrimg=[[NSMutableArray alloc]init];
        
        NSString *check_STR=[[NSString alloc]init];
        check_STR=[NSString stringWithFormat:@"%@",[taskdic objectForKey:@"task_photo"]];
        
        NSLog(@"##############....%lu",(unsigned long)check_STR.length);
       
               if (check_STR.length==0)
        {
            lblimage.hidden=YES;
            taskimg1.hidden=YES;
             taskimage2.hidden=YES;
             taskimage3.hidden=YES;
            btntaskimg1.hidden=YES;
            btntaskimg2.hidden=YES;
            btntaskimg3.hidden=YES;
            tasktypeview.frame=CGRectMake(tasktypeview.frame.origin.x, lblimage.frame.origin.y, tasktypeview.frame.size.width, tasktypeview.frame.size.height);
             MapView.frame=CGRectMake(MapView.frame.origin.x, tasktypeview.frame.origin.y+tasktypeview.frame.size.height+2, MapView.frame.size.width, MapView.frame.size.height);
            mainscroll.contentSize = CGSizeMake(0, mainscroll.contentSize.height-taskimg1.frame.size.height-10);
        }
        else
        {
           
            
            arrimg=[taskdic objectForKey:@"task_photo"];
            ArrBigImg=[taskdic objectForKey:@"normal_task_photo"];
            
            if (arrimg.count==1) {
                [taskimg1 sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@",[arrimg objectAtIndex:0]]] placeholderImage:[UIImage imageNamed:@"no image"] options:/* DISABLES CODE */ (0) == 0?SDWebImageRefreshCached : 0];
                taskimg1.contentMode=UIViewContentModeScaleAspectFit;
                btntaskimg1.hidden=NO;
                btntaskimg2.hidden=YES;
                btntaskimg3.hidden=YES;
            }
            else if (arrimg.count==2) {
                [taskimg1 sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@",[arrimg objectAtIndex:0]]] placeholderImage:[UIImage imageNamed:@"no image"] options:/* DISABLES CODE */ (0) == 0?SDWebImageRefreshCached : 0];
                [taskimage2 sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@",[arrimg objectAtIndex:1]]] placeholderImage:[UIImage imageNamed:@"no image"] options:/* DISABLES CODE */ (0) == 0?SDWebImageRefreshCached : 0];
                btntaskimg1.hidden=NO;
                btntaskimg2.hidden=NO;
                btntaskimg3.hidden=YES;
                taskimg1.contentMode=UIViewContentModeScaleAspectFit;
                taskimage2.contentMode=UIViewContentModeScaleAspectFit;

            }
            else if (arrimg.count==3) {
                [taskimg1 sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@",[arrimg objectAtIndex:0]]] placeholderImage:[UIImage imageNamed:@"no image"] options:/* DISABLES CODE */ (0) == 0?SDWebImageRefreshCached : 0];
                [taskimage2 sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@",[arrimg objectAtIndex:1]]] placeholderImage:[UIImage imageNamed:@"no image"] options:/* DISABLES CODE */ (0) == 0?SDWebImageRefreshCached : 0];
                [taskimage3 sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@",[arrimg objectAtIndex:2]]] placeholderImage:[UIImage imageNamed:@"no image"] options:/* DISABLES CODE */ (0) == 0?SDWebImageRefreshCached : 0];
                btntaskimg1.hidden=NO;
                btntaskimg2.hidden=NO;
                btntaskimg3.hidden=NO;
                taskimg1.contentMode=UIViewContentModeScaleAspectFit;
                taskimage2.contentMode=UIViewContentModeScaleAspectFit;
                taskimage3.contentMode=UIViewContentModeScaleAspectFit;
            }
        }
    
 
        
      //map show
  
 check_STR=[NSString stringWithFormat:@"%@",[taskdic objectForKey:@"latitude"]];
          if (check_STR.length==0)
          {
              MapView.hidden=YES;
               mainscroll.contentSize = CGSizeMake(0, mainscroll.contentSize.height-MapView.frame.size.height);
          }
          else{
              CLLocationCoordinate2D coord = {.latitude =  [[taskdic valueForKey:@"latitude"] floatValue], .longitude = [[taskdic valueForKey:@"longitude"] floatValue]};
              MKCoordinateSpan span = {.latitudeDelta =  0.2, .longitudeDelta =  0.2};
              MKCoordinateRegion region = {coord, span};
              [MapView setRegion:region];
              
              MKPointAnnotation *annotation = [[MKPointAnnotation alloc] init];
              annotation.coordinate = coord;
           //   annotation.title = @"Location";
              [MapView addAnnotation:annotation];

          }
        taskposterid=[taskdic objectForKey:@"user_id"];
    
    }];
    }
    else{
        UIAlertView *aler=[[UIAlertView alloc] initWithTitle:@"Alert" message:@"No Network Connection." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [aler show];
    }

}
- (void)mapView:(MKMapView *)mv didAddAnnotationViews:(NSArray *)views
{
    MKAnnotationView *annotationView = [views objectAtIndex:0];
    id <MKAnnotation> mp = [annotationView annotation];
    MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance
    ([mp coordinate], 1500, 1500);
    [mv setRegion:region animated:YES];
    [mv selectAnnotation:mp animated:YES];
}

- (IBAction)detailsclk:(id)sender
{
    if (btndetails.selected==NO)
    {
        btndetails.selected=YES;
        btnmesgboard.selected=NO;
        btnallbids.selected=NO;
        mainscroll.hidden=NO;
        tblbids.hidden=YES;
        tblmesg.hidden=YES;
        btnmesg.hidden=YES;
        lblnodata.hidden=YES;
        underlineimg.frame=CGRectMake(btndetails.frame.origin.x, btndetails.frame.origin.y+btndetails.frame.size.height, btndetails.frame.size.width, 1);
        [self taskdetailUrl];
    }
}

- (IBAction)mesgClk:(id)sender
{
    if (btnmesgboard.selected==NO) {
        [self MessageShowUrl];
        btnmesgboard.selected=YES;
        btndetails.selected=NO;
        btnallbids.selected=NO;
        mainscroll.hidden=YES;
         tblbids.hidden=YES;
      //   tblmesg.hidden=NO;
     //   btnmesg.hidden=NO;
       
        btnmesg.frame=CGRectMake(btnmesg.frame.origin.x, tblmesg.frame.origin.y+tblmesg.frame.size.height+5, btnmesg.frame.size.width, btnmesg.frame.size.height);
         underlineimg.frame=CGRectMake(btnmesgboard.frame.origin.x, btnmesgboard.frame.origin.y+btnmesgboard.frame.size.height, btnmesgboard.frame.size.width, 1);
    }
}

- (IBAction)AllbidsClk:(id)sender
{
    if (btnallbids.selected==NO)
    {
        btnallbids.selected=YES;
        btndetails.selected=NO;
        btnmesgboard.selected=NO;
        mainscroll.hidden=YES;
        [self BidsShowUrl];
     //   tblbids.hidden=NO;
         tblmesg.hidden=YES;
        btnmesg.hidden=YES;
        underlineimg.frame=CGRectMake(btnallbids.frame.origin.x, btnallbids.frame.origin.y+btnallbids.frame.size.height, btnallbids.frame.size.width, 1);
    }
}
-(void)BidsShowUrl
{
    @try {
        
        [ArrAllBids removeAllObjects];
        NSLog(@"taaaaa=%@",taskid);
        NSString *str=[NSString stringWithFormat:@"%@tasklist_ios/get_all_bids?task_id=%@",URL_LINK,[taskid stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
        NSLog(@"str=%@",str);
        BOOL net=[urlobj connectedToNetwork];
        
        
        if (net==YES) {
            [urlobj global:str typerequest:@"array" withblock:^(id result, NSError *error,BOOL completed) {
               
                         NSMutableArray *array = [[NSMutableArray alloc]init];
                for ( NSDictionary *tempDict in  [result objectForKey:@"bid"])
                {
                    [array addObject:tempDict];
                    
                }
      
                //    NSLog(@"fggg=%@",[[[result objectForKey:@"usercarddetails"] valueForKey:@"0"] valueForKey:@"cardnumber"]);
                if ([[result valueForKey:@"status"] isEqualToString:@"Success"])
                {
                    
                    if ([array count]==0)
                    {
                        lblnodata.hidden=NO;
                        [tblbids setHidden:YES];
                       
                        
                    }
                    else{
                        lblnodata.hidden=YES;
                        [tblbids setHidden:NO];
                       
           /*             NSLog(@"task poster id=%@",taskposterid);
                        
                        if ([taskposterid isEqualToString:userid])
                        {
                            btnmesg.hidden=NO;
                        }
                        else
                        {
                            btnmesg.hidden=YES;
                        }
           */
                        for ( NSDictionary *tempDict in  [result objectForKey:@"bid"])
                        {
                            [ArrAllBids addObject:tempDict];
                            
                        }
                       NSLog(@"result=%@",ArrAllBids);
                        [tblbids reloadData];
                    }
                }
                else{
                   
                    lblnodata.hidden=NO;
                    [tblbids setHidden:YES];
                   
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
        [tblbids setHidden:YES];
       
    }
    @finally {
        
    }
    
    
    
    
}
-(void)MessageShowUrl
{
    @try {
        
        [Arrmesg removeAllObjects];
        NSString *str=[NSString stringWithFormat:@"%@message_ios/task_related_message?task_id=%@",URL_LINK,[taskid stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
        NSLog(@"str=%@",str);
        BOOL net=[urlobj connectedToNetwork];
        if (net==YES) {
            [urlobj global:str typerequest:@"array" withblock:^(id result, NSError *error,BOOL completed) {
                
                NSMutableArray *array = [[NSMutableArray alloc]init];
                for ( NSDictionary *tempDict in  [result objectForKey:@"response"])
                {
                    [array addObject:tempDict];
                    
                }
                
                //    NSLog(@"fggg=%@",[[[result objectForKey:@"usercarddetails"] valueForKey:@"0"] valueForKey:@"cardnumber"]);
                if ([[result valueForKey:@"status"] isEqualToString:@"Success"])
                {
                    
                    if ([array count]==0)
                    {
                        lblnodata.hidden=NO;
                        [tblmesg setHidden:YES];
                        btnmesg.hidden=YES;
                        
                    }
                    else{
                        lblnodata.hidden=YES;
                        [tblmesg setHidden:NO];
                        
                        NSLog(@"task poster id=%@",taskposterid);
                        
                        if ([taskposterid isEqualToString:userid])
                        {
                            btnmesg.hidden=NO;
                        }
                        else
                        {
                            btnmesg.hidden=YES;
                        }
                        
                        for ( NSDictionary *tempDict in  [result objectForKey:@"response"])
                        {
                            [Arrmesg addObject:tempDict];
                            
                            
                            
                        }
                        
                        [ArrRecieverId1 removeAllObjects];
                        ArrRecieverId=[[NSArray alloc]init];
                        if (IsAwarded==0)
                        {
                            for (int i=0; i<Arrmesg.count; i++)
                            {
                                if (![[[Arrmesg objectAtIndex:i] valueForKey:@"message_sender_id"] isEqualToString:userid])
                                {
                                    
                                    [ArrRecieverId1 addObject:[[Arrmesg objectAtIndex:i] valueForKey:@"message_sender_id"]];
                                    
                                    
                                }
                                else
                                {
                                    
                                }
                            }
                        }
                        else if (IsAwarded==1)
                        {
                            
                        }
                        ArrRecieverId = [[NSOrderedSet orderedSetWithArray:ArrRecieverId1] array];
                        NSLog(@"array rec id=%@",ArrRecieverId);
                        
                        
                   //    NSLog(@"result=%@",Arrmesg);
                        [tblmesg reloadData];
                    }
                }
                else{
                    
                    lblnodata.hidden=NO;
                    [tblmesg setHidden:YES];
                    btnmesg.hidden=YES;
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
        btnmesg.hidden=YES;
    }
    @finally {
        
    }
    
    
    
    
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (tableView==tblbids) {
        return 106.0f;
    }
    else if (tableView==tblmesg)
    {
        
      //   NSLog(@"str=%@",[NSString stringWithFormat:@"%@",[[Arrmesg objectAtIndex:indexPath.row] valueForKey:@"message"]]);
        NSString *str=[NSString stringWithFormat:@"%@",[[Arrmesg objectAtIndex:indexPath.row] valueForKey:@"message"]];
       
        NSInteger rw=ceil(str.length/50.0);
        NSInteger len=rw*21;
        return len+40.0;
         
      //  return  100.0;
    }
    else{
        return 0.0;
    }
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //  NSLog(@"cellForRowAtIndexPath");
    cellId = @"cellid";
    
    if (tableView==tblbids) {
        BidCell *cell;
        cell = [tableView dequeueReusableCellWithIdentifier:cellId];
        cell=[[[NSBundle mainBundle] loadNibNamed:@"BidCell" owner:self options:nil] objectAtIndex:0];
        
        
        cell.posterimg.layer.cornerRadius = cell.posterimg.frame.size.height/2;
        cell.posterimg.clipsToBounds = YES;
        cell.posterimg.userInteractionEnabled=YES;
        cell.posterimg.layer.borderColor=[UIColor whiteColor].CGColor;
        cell.posterimg.layer.borderWidth=1.0;
        cell.posterimg.contentMode=UIViewContentModeScaleAspectFill;
      //  cell.posterimg.image=[UIImage imageNamed:@"no image available"];
            [cell.posterimg sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@",[[ArrAllBids objectAtIndex:indexPath.row] valueForKey:@"bidder_img"]]] placeholderImage:[UIImage imageNamed:@"no image available"] options:/* DISABLES CODE */ (0) == 0?SDWebImageRefreshCached : 0];
           cell.lblpropose.text = [[ArrAllBids objectAtIndex:indexPath.row] valueForKey:@"proposal"];
         cell.lblamt.text =[@"$" stringByAppendingString:[[ArrAllBids objectAtIndex:indexPath.row] valueForKey:@"bidded_amount"]];
           NSString *time = [[ArrAllBids objectAtIndex:indexPath.row] valueForKey:@"completion_time"];
        if (timetype==1)// per hour
        {
            if ([time integerValue]>=24)
            {
                //  NSLog(@"tm=%ld",(long)[time integerValue]);
                NSInteger day=[time integerValue]/24;
                NSInteger hrs=[time integerValue]%24;
                if (hrs==0) {
                    cell.lbltime.text=[[NSString stringWithFormat:@"%ld",(long)day] stringByAppendingString:@" day"];
                }
                else
                {
                    cell.lbltime.text=[NSString stringWithFormat:@"%ld %@ %ld %@", (long)day, @"day", (long)hrs,@"hour"];
                }
            }
            else
            {
                
                cell.lbltime.text=[time stringByAppendingString:@" hours"];
            }

        }
        else
        {
            //per job
            if([time isEqualToString:@"1"])
            {
            cell.lbltime.text=[time stringByAppendingString:@" day"];
            }
            else
            {
                cell.lbltime.text=[time stringByAppendingString:@" days"];
            }
        }
        
        
        NSString *fav = [[ArrAllBids objectAtIndex:indexPath.row] valueForKey:@"fav_mode"];
        NSLog(@"fav=%@",[[ArrAllBids objectAtIndex:indexPath.row] valueForKey:@"fav_mode"]);
        if ([fav isEqualToString:@"make_fav"])
        {
            cell.lblfavourite.text=@"Make Favourite";
            cell.btnfavourite.tag=[[[ArrAllBids objectAtIndex:indexPath.row] valueForKey:@"bidder_id"] integerValue];
            [cell.btnfavourite addTarget:self action:@selector(BidMakeFovourClicked:) forControlEvents:UIControlEventTouchUpInside];
            
            
        }
        else if ([fav isEqualToString:@"remove_fav"]) {
            
            cell.lblfavourite.text=@"Remove Favourite";
            cell.btnfavourite.tag=[[[ArrAllBids objectAtIndex:indexPath.row] valueForKey:@"bidder_id"] integerValue];
            NSLog(@"remove");
            [cell.btnfavourite addTarget:self action:@selector(BidRemoveFovourClicked:) forControlEvents:UIControlEventTouchUpInside];
        }
        
        
        if ([[taskdic valueForKey:@"user_id"] isEqualToString:userid])
        {
            
            if ([[taskdic valueForKey:@"task_is_completed"] isEqualToString:@"0"] && [[taskdic valueForKey:@"is_canceled"] isEqualToString:@"0"] && [[taskdic valueForKey:@"task_award"] isEqualToString:@"0"] &&  [[taskdic  valueForKey:@"total_bid"] integerValue]>0)
            {
                cell.btnaccept.hidden=NO;
                cell.btnaccept.tag=[[[ArrAllBids objectAtIndex:indexPath.row] valueForKey:@"bid_id"] integerValue];
                [cell.btnaccept addTarget:self action:@selector(BidAcceptClicked:) forControlEvents:UIControlEventTouchUpInside];
               
            }
            else
            {
                cell.btnaccept.hidden=YES;
                cell.lblaccepted.hidden=NO;
             //   NSLog(@"status=%@",[taskdic valueForKey:@"task_award_status"]);
                if ([[[ArrAllBids objectAtIndex:indexPath.row] valueForKey:@"task_award_status"] isEqualToString:@"Accepted"])
                {
                    cell.lblaccepted.text=@"Accepted";
                    cell.lblaccepted.textColor=[UIColor colorWithRed:(41.0/255) green:(115.0/255) blue:(78.0/255) alpha:1.0];
                    
                }
                else if ([[[ArrAllBids objectAtIndex:indexPath.row] valueForKey:@"task_award_status"] isEqualToString:@"Not Accepted"])
                {
                    cell.lblaccepted.text=@"Rejected";
                    cell.lblaccepted.textColor=[UIColor redColor];
                }
            }
        }
        else
        {
            cell.btnaccept.hidden=YES;
        }
        //    cell.btnchkbox.tag = indexPath.row;
        //    [cell.btnchkbox addTarget:self action:@selector(ChkboxClicked:) forControlEvents:UIControlEventTouchUpInside];
        [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
        [cell setBackgroundColor:[UIColor clearColor]];
        
        UIView *lineView = [[UIView alloc] initWithFrame:CGRectMake(0, 106, [[UIScreen mainScreen]bounds].size.width, 1.0)];
        lineView.backgroundColor = [UIColor lightGrayColor];
        [cell addSubview:lineView];
        
        return cell;
    }
   else if (tableView==tblmesg)
   {
       MessageCell *cell;
       cell = [tableView dequeueReusableCellWithIdentifier:cellId];
       cell=[[[NSBundle mainBundle] loadNibNamed:@"MessageCell" owner:self options:nil] objectAtIndex:0];
      
  
       NSString *str=[NSString stringWithFormat:@"%@",[[Arrmesg objectAtIndex:indexPath.row] valueForKey:@"message"]];
       NSInteger rw=ceil(str.length/50.0);
   //    NSLog(@"row no=%d",rw);
       NSInteger height=21*rw;
   //    NSLog(@"height=%d",height);
       
       cell.lblmesg.frame=CGRectMake(cell.lblmesg.frame.origin.x, 5, cell.lblmesg.frame.size.width,height);
       cell.lblmesg.text=str;
       NSString *postedby=[NSString stringWithFormat:@"%@ %@ %@", [[Arrmesg objectAtIndex:indexPath.row] valueForKey:@"name"],@" on ", [[Arrmesg objectAtIndex:indexPath.row] valueForKey:@"message_date"]];

        cell.lblpostername.text=postedby;
       cell.lblpostername.frame=CGRectMake(cell.lblpostername.frame.origin.x, cell.lblmesg.frame.origin.y+(21*rw)+2, cell.lblpostername.frame.size.width,cell.lblpostername.frame.size.height);
    //   NSLog(@"y=%f",cell.lblmesg.frame.origin.y+(21*rw)+2);
       
       if ([[[Arrmesg objectAtIndex:indexPath.row] valueForKey:@"attach_file"] isEqualToString:@""]) {
           cell.btnattachment.hidden=YES;
       }
       else{
           cell.btnattachment.hidden=NO;
           cell.btnattachment.tag=indexPath.row;
           [cell.btnattachment addTarget:self action:@selector(DownloadattachmentClicked:) forControlEvents:UIControlEventTouchUpInside];
       }
       
       
//       if (IsAwarded==0)
//       {
//           //bidder id
//       //    NSLog(@" bidder id=%@",[[Arrmesg objectAtIndex:indexPath.row] valueForKey:@"message_sender_id"]);
//           
//           //you have to scroll to the end
//           if (![[[Arrmesg objectAtIndex:indexPath.row] valueForKey:@"message_sender_id"] isEqualToString:userid])
//           {
//          //     NSLog(@" rec id=%@",[[Arrmesg objectAtIndex:indexPath.row] valueForKey:@"message_sender_id"]);
//               [ArrRecieverId addObject:[[Arrmesg objectAtIndex:indexPath.row] valueForKey:@"message_sender_id"]];
//               NSLog(@"array rec id=%@",ArrRecieverId);
//               
//           }
//           else
//           {
//               
//           }
//       }
//       else if (IsAwarded==1)
//       {
//           
//       }
       cell.btnattachment.frame=CGRectMake(cell.btnattachment.frame.origin.x, cell.lblmesg.frame.origin.y+(21*rw)+2, cell.btnattachment.frame.size.width,cell.btnattachment.frame.size.height);
      
       [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
       [cell setBackgroundColor:[UIColor clearColor]];
       
       UIView *lineView = [[UIView alloc] initWithFrame:CGRectMake(0,height+40.0, [[UIScreen mainScreen]bounds].size.width, 1.0)];
       lineView.backgroundColor = [UIColor lightGrayColor];
       [cell addSubview:lineView];
       
       return cell;
   }
   else{
       BidCell *cell;
       return cell;
   }
   
}
-(void)BidAcceptClicked:(UIButton*)sender
{
    Isaccept=1;
    Ismakefavour=0;
    Isremovefavour=0;
    Iscancel=0;
    bidid=[ NSString stringWithFormat:@"%ld",(long)sender.tag];
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Alert" message:@" Do you want to accept this bid?" delegate:self cancelButtonTitle:@"NO" otherButtonTitles:@"YES", nil];
    [alertView show];
    

    
}
-(void)BidMakeFovourClicked:(UIButton*)sender
{
    Isaccept=0;
    Ismakefavour=1;
    Isremovefavour=0;
    Iscancel=0;
    biderid=[ NSString stringWithFormat:@"%ld",(long)sender.tag];
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Alert" message:@" Do you want to make favourite?" delegate:self cancelButtonTitle:@"NO" otherButtonTitles:@"YES", nil];
    [alertView show];
    
    
    
}
-(void)BidRemoveFovourClicked:(UIButton*)sender
{
    Isaccept=0;
    Ismakefavour=0;
    Isremovefavour=1;
    Iscancel=0;
    biderid=[ NSString stringWithFormat:@"%ld",(long)sender.tag];
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Alert" message:@" Do you want to Remove favourite?" delegate:self cancelButtonTitle:@"NO" otherButtonTitles:@"YES", nil];
    [alertView show];
    
    
    
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    
    if (buttonIndex == [alertView cancelButtonIndex])
    {
        
    }
    else
    {
        if (Isaccept==1) {
            [self acceptbidUrl];
        }
        else if (Ismakefavour==1)
        {
            [self MakeFavouriteUrl];
        }
        else if (Isremovefavour==1)
        {
            [self RemoveeFavouriteUrl];
        }
        else if (Iscancel==1)
        {
            [self TaskCancelUrl];
        }
        
        
    }
    
    
}
-(void)RemoveeFavouriteUrl
{
    if(biderid.length>0)
    {
        NSString *str=[NSString stringWithFormat:@"%@favorite_ios/remove_favorite?user_id=%@&poster_id=%@",URL_LINK,[userid stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding],[biderid stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
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
                    UIAlertView *aler=[[UIAlertView alloc] initWithTitle:@"Success" message:@"Bidder is removed from your favourite list." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
                     [aler show];
                     */
                    //    [self taskdetailUrl];
                        [self BidsShowUrl];
                    
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
        UIAlertView *aler=[[UIAlertView alloc] initWithTitle:@"Alert" message:@"Select bider." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [aler show];
    }
}
-(void)MakeFavouriteUrl
{
    if(biderid.length>0)
    {
        NSString *str=[NSString stringWithFormat:@"%@favorite_ios/index?user_id=%@&poster_id=%@",URL_LINK,[userid stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding],[biderid stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
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
                /*    UIAlertView *aler=[[UIAlertView alloc] initWithTitle:@"Success" message:@"Bidder is added to your favourite list." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
                  [aler show];
                 */
                    //    [self taskdetailUrl];
                        [self BidsShowUrl];
                   
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
        UIAlertView *aler=[[UIAlertView alloc] initWithTitle:@"Alert" message:@"Select bider." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [aler show];
    }
}
-(void)acceptbidUrl
{
    if(bidid.length>0)
    {
        NSString *str=[NSString stringWithFormat:@"%@tasklist_ios/acceptbid?bid_id=%@",URL_LINK,[bidid stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
        NSLog(@"str=%@",str);
        BOOL net=[urlobj connectedToNetwork];
        if (net==YES) {
            [self checkLoader];
            [urlobj global:str typerequest:@"array" withblock:^(id result, NSError *error,BOOL completed) {
                
                //   NSLog(@"event result----- %@", result);
                NSMutableDictionary *dic=[[NSMutableDictionary alloc]init];
                dic=[result valueForKey:@"response"];
                
                //     NSLog(@"maindictionary %@", mainDic);
                
                NSLog(@"values:%@",[dic valueForKey:@"status"]);
                
                
                if ([[dic valueForKey:@"status"] isEqualToString:@"Success"]) {
                    
                    [self checkLoader];
                    UIAlertView *aler=[[UIAlertView alloc] initWithTitle:@"Success" message:@"Bid Accepted." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
               
                    [aler show];
                    
                    btndetails.selected=YES;
                    btnmesgboard.selected=NO;
                    btnallbids.selected=NO;
                    mainscroll.hidden=NO;
                    tblbids.hidden=YES;
                    tblmesg.hidden=YES;
                    btnmesg.hidden=YES;
                    lblnodata.hidden=YES;
                    underlineimg.frame=CGRectMake(btndetails.frame.origin.x, btndetails.frame.origin.y+btndetails.frame.size.height, btndetails.frame.size.width, 1);
                    [self taskdetailUrl];
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
            [self checkLoader];
            UIAlertView *aler=[[UIAlertView alloc] initWithTitle:@"Alert" message:@"No Network Connection." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
            [aler show];
        }
    }
    else{
        UIAlertView *aler=[[UIAlertView alloc] initWithTitle:@"Alert" message:@"Select Bid." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [aler show];
    }
}
-(void)DownloadattachmentClicked:(UIButton*)sender
{
    UIImageView *downloadimg=[[UIImageView alloc]init];
    [downloadimg sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@",[[Arrmesg objectAtIndex:sender.tag] valueForKey:@"attach_file"]]] placeholderImage:[UIImage imageNamed:@"no image"] options:/* DISABLES CODE */ (0) == 0?SDWebImageRefreshCached : 0];
    NSLog(@"file=%@",[[Arrmesg objectAtIndex:sender.tag] valueForKey:@"attach_file"]);
    NSLog(@"image=%@",downloadimg.image);
    ALAssetsLibrary *library = [[ALAssetsLibrary alloc] init];
     [library saveImage:downloadimg.image toAlbum:@"TaskArooFile" withCompletionBlock:^(NSError *error) {
         
        if (error!=nil)
        {
            NSLog(@"Noooo error: %@", [error description]);
            
          //  [busyview removeFromSuperview];
        }
        else{
            if (downloadimg.image )
            {
                NSLog(@"image null");
                UIImageView *downloadimg=[[UIImageView alloc]init];
                [downloadimg sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@",[[Arrmesg objectAtIndex:sender.tag] valueForKey:@"attach_file"]]] placeholderImage:[UIImage imageNamed:@"no image"] options:/* DISABLES CODE */ (0) == 0?SDWebImageRefreshCached : 0];
                NSLog(@"file=%@",[[Arrmesg objectAtIndex:sender.tag] valueForKey:@"attach_file"]);
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
/*
-(void)ChkboxClicked:(UIButton*)sender
{
    
    //   NSLog(@"chk");
    cell.btnchkbox.selected=NO;
    [cell.btnchkbox setBackgroundImage:[UIImage imageNamed:@"tick2.png"] forState:UIControlStateNormal];
    if (sender.selected==YES) {
        // NSLog(@"dont select");
        sender.selected=NO;
        [sender setBackgroundImage:[UIImage imageNamed:@"tick2.png"] forState:UIControlStateNormal];
    }
    else
    {
        //  NSLog(@"select");
        
        sender.selected=YES;
        [sender setBackgroundImage:[UIImage imageNamed:@"tick1.png"] forState:UIControlStateSelected];
    }
    
}
 */
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (tableView==tblbids) {
      //  return 10;
        return [ArrAllBids count];
    }
    else if (tableView==tblmesg)
    {
        return [Arrmesg count];
    }
    else
    {
        return 0;
    }
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    /*
     if (cell.btnchkbox.selected==YES) {
     NSLog(@"dont select");
     cell.btnchkbox.selected=NO;
     [cell.btnchkbox setBackgroundImage:[UIImage imageNamed:@"tick2.png"] forState:UIControlStateNormal];
     }
     else
     {
     NSLog(@"select");
     cell.btnchkbox.selected=YES;
     [cell.btnchkbox setBackgroundImage:[UIImage imageNamed:@"tick1.png"] forState:UIControlStateSelected];
     }
     */
}
/*
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 0.0;
}
 */
- (IBAction)sendmesgclk:(id)sender {
 
    screenview=[[UIView alloc]init];
    [screenview setFrame:CGRectMake(0,0, [UIScreen mainScreen].bounds.size.width,[UIScreen mainScreen].bounds.size.height)];
    screenview.userInteractionEnabled=YES;
    screenview.backgroundColor=[[UIColor blackColor]colorWithAlphaComponent:0.65];
    [self.view addSubview:screenview];
    
    UIButton *btnmesgcancel=[[UIButton alloc] initWithFrame:CGRectMake(self.view.frame.size.width-35,60, 20, 20)];
    [btnmesgcancel setBackgroundImage:[UIImage imageNamed:@"cross"] forState:UIControlStateNormal];
    btnmesgcancel.backgroundColor = [UIColor clearColor];
    [btnmesgcancel setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal ];
    btnmesgcancel.titleLabel.font = [UIFont fontWithName:@"OpenSans-Semibold" size:14.0];
    [btnmesgcancel addTarget:self action:@selector(addmesgcancel) forControlEvents:UIControlEventTouchUpInside];
    [screenview addSubview:btnmesgcancel];
  mesgview = [[[NSBundle mainBundle] loadNibNamed:@"MesgSubmitView" owner:self options:nil] lastObject];
//    mesgview=[[MesgSubmitView alloc]init];
    [mesgview setFrame:CGRectMake(self.view.frame.origin.x+10,self.view.frame.origin.y+90, [UIScreen mainScreen].bounds.size.width-20,[UIScreen mainScreen].bounds.size.height-200)];
   [mesgview.btnchoosefile addTarget:self action:@selector(ChoosebuttonTapped:) forControlEvents:UIControlEventTouchUpInside];
    [mesgview.btnsend addTarget:self action:@selector(SendbuttonTapped:) forControlEvents:UIControlEventTouchUpInside];

    [screenview addSubview:mesgview];
    
}
-(void)ChoosebuttonTapped:(id)sender
{
    
 //   NSLog(@"choose file");
    [mesgview.txtvwmesg resignFirstResponder];
    actionsheet=[[UIActionSheet alloc]initWithTitle:@"" delegate:self cancelButtonTitle:@"Cancel" destructiveButtonTitle:nil otherButtonTitles:@"Camera", @"Photo Library", nil];
    [actionsheet showInView:self.view];
    
}
-(void)SendbuttonTapped:(id)sender
{
    if(mesgview.txtvwmesg.text.length==0)
    {
        mesgview.lblmesg.hidden=NO;
        mesgview.lblmesg.textColor=[UIColor redColor];
        mesgview.lblmesg.text=@"Enter some message";
        
    }
else
{
    if (IsAwarded==0)
    {
        recieverid = [ArrRecieverId componentsJoinedByString:@","];
        NSLog(@"reciever id=%@",recieverid);
    }
    else if (IsAwarded==1)
    {
        //have to change
      //  recieverid = [ArrRecieverId componentsJoinedByString:@","];
        recieverid = AwardedTo;
        NSLog(@"reciever id=%@",recieverid);
        
    }
    [self sendmesg];
}
    
  //
    
    
}

-(void)sendmesg
{
    
    NSString *str=[NSString stringWithFormat:@"%@message_ios/insert_message?task_id=%@&sender_id=%@&reciver_id=%@&message=%@&attachment=",URL_LINK,[taskid stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding],[userid stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding],[recieverid stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding],[mesgview.txtvwmesg.text stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
    NSLog(@"str=%@",str);
    BOOL net=[urlobj connectedToNetwork];
    if (net==YES)
    {
        [self checkLoader];
        NSData *imageData;
        if ([mesgview.fileimg.image isEqual:[UIImage imageNamed:@"file1.png"]])
        {
            //no image
            [urlobj global:str typerequest:@"array" withblock:^(id result, NSError *error,BOOL completed) {
                
                //   NSLog(@"event result----- %@", result);
                NSMutableDictionary *dic=[[NSMutableDictionary alloc]init];
                dic=[result valueForKey:@"response"];
                
                //     NSLog(@"maindictionary %@", mainDic);
                
                NSLog(@"values:%@",[dic valueForKey:@"status"]);
                
                
                if ([[dic valueForKey:@"status"] isEqualToString:@"Success"]) {
                    
                    [self checkLoader];
                    UIAlertView *aler=[[UIAlertView alloc] initWithTitle:@"Success" message:@"Mail sent successfully." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
                    [aler show];
                    [screenview removeFromSuperview];
                    
                }
                else
                {
                    [self checkLoader];
                    UIAlertView *aler=[[UIAlertView alloc] initWithTitle:@"Error" message:@"Unsucessful...." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
                    [aler show];
                }
                
            }];
        }
        else
        {
            //image present
            imageData = UIImagePNGRepresentation(mesgview.fileimg.image);
            AFHTTPClient *client= [AFHTTPClient clientWithBaseURL:[NSURL URLWithString:str]];
            
            
            
            
            
            
            
            NSMutableURLRequest *request = [client multipartFormRequestWithMethod:@"POST" path:nil parameters:nil constructingBodyWithBlock: ^(id <AFMultipartFormData>formData) {
                
                
                
                //        [formData appendPartWithFileData: imageToUpload name:@"image[0]" fileName:@"temp.jpeg" mimeType:@"image/jpeg"];
                
                
                
                //        [formData appendPartWithFileData: imageToUpload name:@"image[1]" fileName:@"temp.jpeg" mimeType:@"image/jpeg"];
                
                
                
                //        [formData appendPartWithFileData: imageToUpload name:@"image[2]" fileName:@"temp.jpeg" mimeType:@"image/jpeg"];
                
                
                
                
                
                
                
                //        for (int i=0; i < [mutDic count]; i++)
                
                //
                
                //        {
                
                
                
                // NSData *imagetoupload = [mutDic objectAtIndex:i];
                
                
                
                NSString *imagename = [NSString stringWithFormat:@"attachment"];
                
                
                
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
                if ([[[json valueForKey:@"response"] valueForKey:@"status"] isEqualToString:@"Success"]) {
                    
                    [self checkLoader];
                    UIAlertView *aler=[[UIAlertView alloc] initWithTitle:@"Success" message:@"Message Sent Successfully." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
                    [aler show];
                    [screenview removeFromSuperview];
                    
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
        

    /*    [urlobj global:str typerequest:@"array" withblock:^(id result, NSError *error,BOOL completed) {
            
            //   NSLog(@"event result----- %@", result);
            NSMutableDictionary *dic=[[NSMutableDictionary alloc]init];
            dic=[result valueForKey:@"response"];
            
            //     NSLog(@"maindictionary %@", mainDic);
            
            NSLog(@"values:%@",[dic valueForKey:@"status"]);
            
            
            if ([[dic valueForKey:@"status"] isEqualToString:@"Success"]) {
                
                [self checkLoader];
                UIAlertView *aler=[[UIAlertView alloc] initWithTitle:@"Success" message:@"Mail sent successfully." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
                [aler show];
                [screenview removeFromSuperview];
                [self MessageShowUrl];
            }
            else
            {
                [self checkLoader];
                UIAlertView *aler=[[UIAlertView alloc] initWithTitle:@"Error" message:@"Unsucessful...." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
                [aler show];
            }
            
        }];
     */
    }
    else{
        
        UIAlertView *aler=[[UIAlertView alloc] initWithTitle:@"Alert" message:@"No Network Connection." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [aler show];
    }
}

-(void)addmesgcancel
{
  
    [screenview removeFromSuperview];
   
}
-(void)imagecancel
{
    
    [screenview1 removeFromSuperview];
    
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
        loader_shadow_View.layer.zPosition=1000;
    }
}
- (IBAction)taskimg1clk:(id)sender
{
    screenview1=[[UIView alloc]init];
    [screenview1 setFrame:CGRectMake(0,0, [UIScreen mainScreen].bounds.size.width,[UIScreen mainScreen].bounds.size.height)];
    screenview1.userInteractionEnabled=YES;
    screenview1.backgroundColor=[[UIColor blackColor]colorWithAlphaComponent:0.65];
    [self.view addSubview:screenview1];
    
    UIButton *btnmesgcancel=[[UIButton alloc] initWithFrame:CGRectMake(280,60, 20, 20)];
    [btnmesgcancel setBackgroundImage:[UIImage imageNamed:@"cross"] forState:UIControlStateNormal];
    btnmesgcancel.backgroundColor = [UIColor clearColor];
    [btnmesgcancel setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal ];
    btnmesgcancel.titleLabel.font = [UIFont fontWithName:@"OpenSans-Semibold" size:14.0];
    [btnmesgcancel addTarget:self action:@selector(imagecancel) forControlEvents:UIControlEventTouchUpInside];
    [screenview1 addSubview:btnmesgcancel];
    UIImageView *bigimg1=[[UIImageView alloc]init];
    //    mesgview=[[MesgSubmitView alloc]init];
    [bigimg1 setFrame:CGRectMake(self.view.frame.origin.x+10,self.view.frame.origin.y+90, [UIScreen mainScreen].bounds.size.width-20,[UIScreen mainScreen].bounds.size.height-200)];
    [bigimg1 sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@",[ArrBigImg objectAtIndex:0]]] placeholderImage:[UIImage imageNamed:@"no image"] options:/* DISABLES CODE */ (0) == 0?SDWebImageRefreshCached : 0];
    bigimg1.contentMode=UIViewContentModeScaleAspectFit;
 //   [mesgview.btnchoosefile addTarget:self action:@selector(ChoosebuttonTapped:) forControlEvents:UIControlEventTouchUpInside];
 //   [mesgview.btnsend addTarget:self action:@selector(SendbuttonTapped:) forControlEvents:UIControlEventTouchUpInside];
    
    [screenview1 addSubview:bigimg1];
}

- (IBAction)taskimg2clk:(id)sender {
    screenview1=[[UIView alloc]init];
    [screenview1 setFrame:CGRectMake(0,0, [UIScreen mainScreen].bounds.size.width,[UIScreen mainScreen].bounds.size.height)];
    screenview1.userInteractionEnabled=YES;
    screenview1.backgroundColor=[[UIColor blackColor]colorWithAlphaComponent:0.65];
    [self.view addSubview:screenview1];
    
    UIButton *btnmesgcancel=[[UIButton alloc] initWithFrame:CGRectMake(280,60, 20, 20)];
    [btnmesgcancel setBackgroundImage:[UIImage imageNamed:@"cross"] forState:UIControlStateNormal];
    btnmesgcancel.backgroundColor = [UIColor clearColor];
    [btnmesgcancel setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal ];
    btnmesgcancel.titleLabel.font = [UIFont fontWithName:@"OpenSans-Semibold" size:14.0];
    [btnmesgcancel addTarget:self action:@selector(imagecancel) forControlEvents:UIControlEventTouchUpInside];
    [screenview1 addSubview:btnmesgcancel];
    UIImageView *bigimg1=[[UIImageView alloc]init];
    //    mesgview=[[MesgSubmitView alloc]init];
    [bigimg1 setFrame:CGRectMake(self.view.frame.origin.x+10,self.view.frame.origin.y+90, [UIScreen mainScreen].bounds.size.width-20,[UIScreen mainScreen].bounds.size.height-200)];
    [bigimg1 sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@",[ArrBigImg objectAtIndex:1]]] placeholderImage:[UIImage imageNamed:@"no image"] options:/* DISABLES CODE */ (0) == 0?SDWebImageRefreshCached : 0];
    bigimg1.contentMode=UIViewContentModeScaleAspectFit;
    //   [mesgview.btnchoosefile addTarget:self action:@selector(ChoosebuttonTapped:) forControlEvents:UIControlEventTouchUpInside];
    //   [mesgview.btnsend addTarget:self action:@selector(SendbuttonTapped:) forControlEvents:UIControlEventTouchUpInside];
    
    [screenview1 addSubview:bigimg1];
}

- (IBAction)taskimg3clk:(id)sender
{
    screenview1=[[UIView alloc]init];
    [screenview1 setFrame:CGRectMake(0,0, [UIScreen mainScreen].bounds.size.width,[UIScreen mainScreen].bounds.size.height)];
    screenview1.userInteractionEnabled=YES;
    screenview1.backgroundColor=[[UIColor blackColor]colorWithAlphaComponent:0.65];
    [self.view addSubview:screenview1];
    
    UIButton *btnmesgcancel=[[UIButton alloc] initWithFrame:CGRectMake(280,60, 20, 20)];
    [btnmesgcancel setBackgroundImage:[UIImage imageNamed:@"cross"] forState:UIControlStateNormal];
    btnmesgcancel.backgroundColor = [UIColor clearColor];
    [btnmesgcancel setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal ];
    btnmesgcancel.titleLabel.font = [UIFont fontWithName:@"OpenSans-Semibold" size:14.0];
    [btnmesgcancel addTarget:self action:@selector(imagecancel) forControlEvents:UIControlEventTouchUpInside];
    [screenview1 addSubview:btnmesgcancel];
    UIImageView *bigimg1=[[UIImageView alloc]init];
    //    mesgview=[[MesgSubmitView alloc]init];
    [bigimg1 setFrame:CGRectMake(self.view.frame.origin.x+10,self.view.frame.origin.y+90, [UIScreen mainScreen].bounds.size.width-20,[UIScreen mainScreen].bounds.size.height-200)];
    [bigimg1 sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@",[ArrBigImg objectAtIndex:2]]] placeholderImage:[UIImage imageNamed:@"no image"] options:/* DISABLES CODE */ (0) == 0?SDWebImageRefreshCached : 0];
    //   [mesgview.btnchoosefile addTarget:self action:@selector(ChoosebuttonTapped:) forControlEvents:UIControlEventTouchUpInside];
    //   [mesgview.btnsend addTarget:self action:@selector(SendbuttonTapped:) forControlEvents:UIControlEventTouchUpInside];
    bigimg1.contentMode=UIViewContentModeScaleAspectFit;
    

    [screenview1 addSubview:bigimg1];
}

- (IBAction)cancelclk:(id)sender
{
    Isaccept=0;
    Ismakefavour=0;
    Isremovefavour=0;
    Iscancel=1;
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Alert" message:@" Do you want to Cancel task?" delegate:self cancelButtonTitle:@"NO" otherButtonTitles:@"YES", nil];
    [alertView show];

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
                    UIAlertView *aler=[[UIAlertView alloc] initWithTitle:@"Success" message:@"Task Canceled." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
                    
                    [aler show];
                    
                    [self.navigationController popViewControllerAnimated:YES];
                  //  [self taskdetailUrl];
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

@end
