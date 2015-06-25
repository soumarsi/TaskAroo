//
//  MesgSubmitView.h
//  TaskAroo
//
//  Created by Prosenjit Kolay on 22/05/15.
//  Copyright (c) 2015 Prosenjit Kolay. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MesgSubmitView : UIView<UITextViewDelegate>
@property (weak, nonatomic) IBOutlet UIButton *btnsend;
@property (weak, nonatomic) IBOutlet UITextView *txtvwmesg;
@property (weak, nonatomic) IBOutlet UILabel *lblmesg;
@property (weak, nonatomic) IBOutlet UIImageView *fileimg;
@property (weak, nonatomic) IBOutlet UIButton *btnchoosefile;
- (IBAction)ChooseFileClk:(id)sender;
- (IBAction)SendClk:(id)sender;

@end
