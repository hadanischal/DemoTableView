//
//  Utility.m
//  DemoAppiOS
//
//  Created by Nischal Hada on 4/10/18.
//  Copyright © 2018 NischalHada. All rights reserved.
//

#import "Utility.h"
#import "Constant+Header.h"
#import "SVProgressHUD.h"

@implementation Utility




+ (void)showSVProgressBlackBackgroundWhiteForeground {
    [SVProgressHUD show];
    [SVProgressHUD setDefaultStyle:SVProgressHUDStyleCustom];
    [SVProgressHUD setBackgroundColor:[[UIColor blackColor] colorWithAlphaComponent:0.4]];
    
    [SVProgressHUD setForegroundColor:whiteTextColor];
    
    [SVProgressHUD setRingThickness:1.0];
    //[SVProgressHUD setMinimumSize: CGSizeMake(14, 14)];
    
}

+ (void)showSVProgressWhiteBackgroundBlackForeground{
    [SVProgressHUD show];
    [SVProgressHUD setDefaultStyle:SVProgressHUDStyleCustom];
    [SVProgressHUD setBackgroundColor:[UIColor whiteColor]]; //[[UIColor whiteColor] colorWithAlphaComponent:0.4]];
    
    [SVProgressHUD setForegroundColor:blackTextColor];
    
    [SVProgressHUD setRingThickness:1.0];
    // [SVProgressHUD setRingRadius:8.0];
    
}

+ (void)showSVProgressDismiss{
    [SVProgressHUD dismiss];

}

@end
