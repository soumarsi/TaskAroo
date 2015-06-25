//
//  GlobalViewController.h
//  TaskAroo1
//
//  Created by Prosenjit Kolay on 20/03/15.
//  Copyright (c) 2015 Prosenjit Kolay. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GlobalViewController : UIViewController
{
    UIView *loader_shadow_View;
}

-(void)footercall;
-(void)headercall;
-(void)homeheadercall;
-(void)checkLoader;
-(UIView *)addPaddingView;
-(void)deleteDocDirectory;
-(NSString *)changeformate_string24hr:(NSString *)date;
-(NSString *)changeformate_string12hr:(NSString *)date;
@end
