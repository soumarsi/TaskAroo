//
//  TaskShowViewController.h
//  TaskAroo
//
//  Created by Prosenjit Kolay on 14/04/15.
//  Copyright (c) 2015 Prosenjit Kolay. All rights reserved.
//

#import "GlobalViewController.h"

@interface TaskShowViewController : GlobalViewController
{
    NSMutableArray *arrmain,*arrcat;
    NSDictionary *mainDic;
    NSOperationQueue *operation;
    NSMutableData *DATA;
    NSString *userid;
    
}

@end
