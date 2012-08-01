//
//  ViewController.m
//  PhoneToKen
//
//  Created by gan chen on 12-7-31.
//  Copyright (c) 2012年 gan chen. All rights reserved.
//

#import "ViewController.h"
#import <CommonCrypto/CommonDigest.h>


@interface ViewController (){
    NSTimer *timers;
}

@end

@implementation ViewController
@synthesize key;
@synthesize timestamp_txt;
@synthesize rancode_txt;
@synthesize reCode;

- (void)viewDidLoad
{
    
    [super viewDidLoad];
    
    timers = [NSTimer scheduledTimerWithTimeInterval:3 target:self selector:@selector(ShowCode:) userInfo:nil repeats:YES];
    [[NSRunLoop currentRunLoop]addTimer:timers forMode:NSDefaultRunLoopMode];
    
    [self ShowCode:nil];
    
	// Do any additional setup after loading the view, typically from a nib.
}



- (void)viewDidUnload
{
    [self setKey:nil];
    [self setTimestamp_txt:nil];
    [self setRancode_txt:nil];
    [self setReCode:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

- (void)dealloc {
    [key release];
    [timestamp_txt release];
    [rancode_txt release];
    [reCode release];
    [super dealloc];
}

- (IBAction)RefCode:(UIButton *)sender {
    [self ShowCode:nil];
}

-(void)ShowCode:(NSTimer *)timer{
    NSDate * now = [NSDate date];
    NSTimeInterval interval = [now timeIntervalSince1970];
    NSString * ns = [NSString stringWithFormat:@"%ld",lround(floor(interval/30.))%1000000] ;
    
    self.timestamp_txt.text = [NSString stringWithFormat:@"%f",interval];
    
    NSString *code = [[[self Md5:[self.key.text stringByAppendingString:ns]] substringFromIndex:0] substringToIndex:6];
    
    self.rancode_txt.text = [self GetAlphnum:code];
    	
}

-(NSString *)GetAlphnum:(NSString *)str{
    NSArray *arr = [[NSArray alloc] initWithObjects:@"a",@"b",@"c",@"d",@"e",@"f",@"g",@"h",@"i",@"j",@"k",@"l",@"m",@"n",@"o",@"p",@"q",@"r",@"s",@"t",@"u",@"v",@"w",@"x",@"y",@"z",@"0",@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9", nil ];
    int re = 0;
    for(int i=0;i<[str length];i++){
        for(int j=0;j<arr.count;j++){
            
            if([[NSString stringWithFormat:@"%@",[arr objectAtIndex:j]] isEqualToString:[str substringWithRange:NSMakeRange(i, 1)]]){
                re+=(j+1)*pow(36,[str length]-i-1);
                break;
            }
            
        }
    }
    return [NSString stringWithFormat:@"%d",re];
}

-(NSString *)Md5:(NSString *)value{
    [value retain];
	const char *cStr = [value UTF8String];
	[value release];
    unsigned char result[16];
    CC_MD5( cStr, strlen(cStr), result ); // This is the md5 call
    return [NSString stringWithFormat:
			@"%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x",
			result[0], result[1], result[2], result[3],
			result[4], result[5], result[6], result[7],
			result[8], result[9], result[10], result[11],
			result[12], result[13], result[14], result[15]
			];
}

@end
