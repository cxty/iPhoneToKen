//
//  ViewController.h
//  PhoneToKen
//
//  Created by gan chen on 12-7-31.
//  Copyright (c) 2012年 gan chen. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
@property (retain, nonatomic) IBOutlet UITextField *key;
@property (retain, nonatomic) IBOutlet UILabel *timestamp_txt;
@property (retain, nonatomic) IBOutlet UITextField *rancode_txt;
@property (retain, nonatomic) IBOutlet UIButton *reCode;
- (IBAction)RefCode:(UIButton *)sender;

-(void)ShowCode:(NSTimer *)timer;

@end
