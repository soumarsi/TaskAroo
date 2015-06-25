//
//  TaskShowViewController.m
//  TaskAroo
//
//  Created by Prosenjit Kolay on 14/04/15.
//  Copyright (c) 2015 Prosenjit Kolay. All rights reserved.
//

#import "TaskShowViewController.h"
#import "HeaderView.h"

@interface TaskShowViewController ()<NSURLConnectionDataDelegate>

@end

@implementation TaskShowViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    operation =[[NSOperationQueue alloc] init];
    arrmain=[[NSMutableArray alloc]init];
    arrcat=[[NSMutableArray alloc]init];
    
    [self footercall];
    
//    [self headercall];
    
    NSUserDefaults *prefs = [NSUserDefaults standardUserDefaults];
    userid=[prefs valueForKey:@"userid"];
    NSLog(@"userid=%@",userid);
    [self loaddata];
    
    [self headercall];
    

}


-(void)loaddata
{
    NSOperationQueue *myQueue11 = [[NSOperationQueue alloc] init];
    [myQueue11 addOperationWithBlock:^{

//   NSString *str=[NSString stringWithFormat:@"http://www.esolz.co.in/lab3/taskaroo/index.php/tasklist_ios?userid=278&page=2&orderby=task_title&ordertype=asc&limit=4&task=complete"];
    NSString *str=[NSString stringWithFormat:@"%@tasklist_ios?userid=%@&orderby=task_title&ordertype=asc&limit=4&task=active&page=1",URL_LINK,userid];
    NSLog(@"task url=%@",str);
    NSURL *url=[NSURL URLWithString:str];
    NSURLRequest *request=[NSURLRequest requestWithURL:url];
         [[NSOperationQueue mainQueue] addOperationWithBlock:^{
             
    NSURLConnection *connection=[NSURLConnection connectionWithRequest:request delegate:self];
    connection=nil;
         }];
    }];
    
}
- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    DATA=[data mutableCopy];
}
- (void)connectionDidFinishLoading:(NSURLConnection *)connection
{
    NSError *error;
    mainDic=[NSJSONSerialization JSONObjectWithData:DATA options:kNilOptions error:&error];
 //   NSLog(@"values:%@",mainDic);
    arrmain=[mainDic valueForKey:@"task"];
 //     NSLog(@"values:%@",arrmain);
   NSString *totaltask=[mainDic valueForKey:@"total"];
      NSLog(@"total task:%@",totaltask);
    for (NSDictionary *dicmain in arrmain)
    {
        NSMutableDictionary *mutDic=[[NSMutableDictionary alloc] init];
        [mutDic setValue:[dicmain valueForKey:@"additional_details"] forKey:@"additional_details"];
        [mutDic setValue:[dicmain valueForKey:@"address"] forKey:@"address"];
        [mutDic setValue:[dicmain valueForKey:@"bid_mode"] forKey:@"bid_mode"];
        [mutDic setValue:[dicmain valueForKey:@"bidclose_deadline"] forKey:@"bidclose_deadline"];
        [mutDic setValue:[dicmain valueForKey:@"city"] forKey:@"city"];
        [mutDic setValue:[dicmain valueForKey:@"contractor_spend"] forKey:@"contractor_spend"];
        [mutDic setValue:[dicmain valueForKey:@"description"] forKey:@"description"];
        [mutDic setValue:[dicmain valueForKey:@"id"] forKey:@"id"];
        [mutDic setValue:[dicmain valueForKey:@"payment_mode"] forKey:@"payment_mode"];
        [mutDic setValue:[dicmain valueForKey:@"referralcode"] forKey:@"referralcode"];
        [mutDic setValue:[dicmain valueForKey:@"state"] forKey:@"state"];
        [mutDic setValue:[dicmain valueForKey:@"task_award"] forKey:@"task_award"];
        [mutDic setValue:[dicmain valueForKey:@"taskclose_deadline"] forKey:@"taskclose_deadline"];
        [mutDic setValue:[dicmain valueForKey:@"taskcode"] forKey:@"taskcode"];
        [mutDic setValue:[dicmain valueForKey:@"tasktitle"] forKey:@"tasktitle"];
        [mutDic setValue:[dicmain valueForKey:@"zipcode"] forKey:@"zipcode"];
        [arrcat addObject:mutDic];
    }
    
    NSLog(@"values:%@",arrcat);
   
    
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
