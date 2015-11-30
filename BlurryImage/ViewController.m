//
//  ViewController.m
//  BlurryImage
//
//  Created by 谈Xx on 15/8/24.
//  Copyright (c) 2015年 谈Xx. All rights reserved.
//

#import "ViewController.h"
#import "UIImage+ImageEffects.h"
#import "bluryView.h"

@interface ViewController ()
@property (nonatomic, strong) bluryView *Aa;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
     self.Aa = [bluryView bluryWithbluryImg:[UIImage imageNamed:@"FriendsBackground"] andFrame:CGRectMake(11, 11, 300, 200) andBluryType:nil];
    
//    self.Aa.bluryColor = [UIColor redColor];
//    Aa.bluryType = bluryTypeExtraLight;
//    Aa.bluryAlpha = 0.9;
    
    [self.view addSubview:self.Aa];
    self.Aa.bluryType = bluryTypeExtraLight;
    
    
}



@end
