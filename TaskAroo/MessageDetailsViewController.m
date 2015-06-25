//
//  MessageDetailsViewController.m
//  TaskAroo
//
//  Created by Prosenjit Kolay on 25/05/15.
//  Copyright (c) 2015 Prosenjit Kolay. All rights reserved.
//

#import "MessageDetailsViewController.h"

@interface MessageDetailsViewController ()<headerDelegate,UIActionSheetDelegate>

@end

@implementation MessageDetailsViewController
@synthesize mainscroll,mainview,titleview,messageid,lbldate,lblmessage,lblsendername,lbltaskcode,btnattachment,btnreply,btntaskview;
-(void) viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    urlobj=[[UrlconnectionObject alloc]init];
    [self MessagedetailUrl];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    HeaderView *hv = [[HeaderView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 60)];
    hv.userInteractionEnabled = YES;
    hv.myDelegate = self;
      hv.btnlogo1.hidden=YES;
    hv.btnlogo1.frame=CGRectMake(self.view.frame.size.width- hv.btnlogo1.frame.size.width-30,  hv.btnlogo1.frame.origin.y-10,  hv.btnlogo1.frame.size.width,  hv.btnlogo1.frame.size.height);
    hv.btnback.hidden=NO;
    hv.btnbackextra.hidden=NO;
    hv.btnsignnout.hidden=YES;
    hv.lblpagename.text=@"DETAILS";
    hv.lblpagename.center=CGPointMake(self.view.center.x, hv.lblpagename.center.y);
//     hv.lblpagename.frame=CGRectMake(hv.lblpagename.frame.origin.x+7,  hv.lblpagename.frame.origin.y,  hv.lblpagename.frame.size.width,  hv.lblpagename.frame.size.height);
    [mainview addSubview:hv];
    
    FooterView *fv = [[FooterView alloc]initWithFrame:CGRectMake(0,self.view.frame.size.height-60, self.view.frame.size.width,60)];
    [fv.btnmenu1 addTarget:self action:@selector(taskbuttonTapped:) forControlEvents:UIControlEventTouchUpInside];
    [fv.btnmenu2 addTarget:self action:@selector(MyAccountbuttonTapped:) forControlEvents:UIControlEventTouchUpInside];
    [fv.btnmenu3 addTarget:self action:@selector(MessagebuttonTapped:) forControlEvents:UIControlEventTouchUpInside];
    [fv.btnmenu4 addTarget:self action:@selector(ContactbuttonTapped:) forControlEvents:UIControlEventTouchUpInside];
    [mainview addSubview:fv];
    
 //   NSLog(@"task id=%@",taskid);
 //   menuview.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"topbar-1"]];
    
    mainscroll.contentSize = CGSizeMake(0, 300);
    //   mainscroll.contentSize = CGSizeMake(0, mainscroll.bounds.size.height * 1.5);
 //   [self taskdetailUrl];
    
    NSUserDefaults *prefs = [NSUserDefaults standardUserDefaults];
    userid=[prefs valueForKey:@"userid"];
titleview.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"topbar-1"]];
    NSLog(@"message id=%@",messageid);
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
    
    NSLog(@"get value method called");
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
-(void)MessagedetailUrl
{
    NSString *str=[NSString stringWithFormat:@"%@message_ios/msg_details?msgid=%@",URL_LINK,[messageid stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
    //   NSLog(@"str=%@",str);
    BOOL net=[urlobj connectedToNetwork];
    if (net==YES) {
        [urlobj global:str typerequest:@"array" withblock:^(id result, NSError *error,BOOL completed) {
            
            //     NSLog(@"event result----- %@", result);
            taskdic = [[NSMutableDictionary alloc]init];
            
            if ([[result valueForKey:@"status"] isEqualToString:@"Success"])
            {
                taskdic=[[[result valueForKey:@"response"] objectAtIndex:0] mutableCopy];
                 //   NSLog(@"task details=%@",taskdic);
          
                taskid=[taskdic valueForKey:@"task_id"];
                lbltaskcode.text=[NSString stringWithFormat:@"%@",[taskdic valueForKey:@"task_code"]];
                lblsendername.text=[taskdic valueForKey:@"sender_name"];
                NSString *date=[NSString stringWithFormat:@"%@",[taskdic valueForKey:@"message_date"]];
                NSString *time=[NSString stringWithFormat:@"%@",[taskdic valueForKey:@"message_time"]];
                lbldate.text=[date stringByAppendingString:time];
                lblmessage.text=[taskdic valueForKey:@"message"];
                NSString *attach=[NSString stringWithFormat:@"%@",[taskdic valueForKey:@"attach_file"]];
                recieverid=[taskdic valueForKey:@"message_sender_id"];
                if ([attach isEqualToString:@""])
                {
                    btnattachment.hidden=YES;
                }
                else{
                    btnattachment.hidden=NO;
                }
                /*
                UIFont *font1 = [UIFont fontWithName:@"OpenSans-Light" size:12.0];
                
                NSDictionary *arialDict = [NSDictionary dictionaryWithObject: font1 forKey:NSFontAttributeName];
                
                NSMutableAttributedString *aAttrString1 = [[NSMutableAttributedString alloc] initWithString:lblmessage.text attributes: arialDict];
                
                
                
                CGRect rect;
                
                
                
                rect =[aAttrString1 boundingRectWithSize:CGSizeMake(715, 1000) options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading context:nil];
                 */
                NSInteger rw=ceil(lblmessage.text.length/50.0);
                NSInteger len=rw*21;
                lblmessage.frame=CGRectMake(lblmessage.frame.origin.x, lblmessage.frame.origin.y, lblmessage.frame.size.width,len);
                btntaskview.frame=CGRectMake(btntaskview.frame.origin.x, lblmessage.frame.origin.y+lblmessage.frame.size.height+10, btntaskview.frame.size.width,btntaskview.frame.size.height);
                btnreply.frame=CGRectMake(btnreply.frame.origin.x, btntaskview.frame.origin.y+btntaskview.frame.size.height+3, btnreply.frame.size.width,btnreply.frame.size.height);
                 mainscroll.contentSize = CGSizeMake(0, mainscroll.contentSize.height+len);
            }
            
           
        }];
    }
    else
    {
        
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

- (IBAction)attachmentclk:(id)sender
{
    
        UIImageView *downloadimg=[[UIImageView alloc]init];
        [downloadimg sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@",[taskdic valueForKey:@"attach_file"]]] placeholderImage:[UIImage imageNamed:@"no image"] options:/* DISABLES CODE */ (0) == 0?SDWebImageRefreshCached : 0];
        NSLog(@"file=%@",[taskdic valueForKey:@"attach_file"]);
        NSLog(@"image=%@",downloadimg.image);
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
                    [downloadimg sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@",[taskdic valueForKey:@"attach_file"]]] placeholderImage:[UIImage imageNamed:@"no image"] options:/* DISABLES CODE */ (0) == 0?SDWebImageRefreshCached : 0];
                    NSLog(@"file=%@",[taskdic valueForKey:@"attach_file"]);
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
- (IBAction)taskviewclk:(id)sender
{
    TaskDetailsViewController *obj=[self.storyboard instantiateViewControllerWithIdentifier:@"TaskDetailsViewControllersid"];
    obj.taskid=taskid;
    [self.navigationController pushViewController:obj animated:YES];
}
- (IBAction)replyclk:(id)sender
{
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
       
        [self sendmesg];
    }
    
    //
    
    
}

-(void)sendmesg
{
    
    NSString *str=[NSString stringWithFormat:@"%@message_ios/insert_message?task_id=%@&sender_id=%@&reciver_id=%@&message=%@&attachment=",URL_LINK,[taskid stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding],[userid stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding],[recieverid stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding],[mesgview.txtvwmesg.text stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
    NSLog(@"str=%@",str);
    BOOL net=[urlobj connectedToNetwork];
    if (net==YES) {
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
        
        
        
        
        
        
        
        //    id result=[urlobj GlobalDict_image:str Globalstr_image:@"array" globalimage:imageData];
        
        //    NSLog(@"result=%@",result);
        
        
        
        
        
       
        /*
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
