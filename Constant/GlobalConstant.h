//
//  GlobalConstant.h
//  DemoAppiOS
//
//  Created by Nischal Hada on 4/10/18.
//  Copyright © 2018 NischalHada. All rights reserved.
//

#ifndef GlobalConstant_h
#define GlobalConstant_h

#pragma mark - ========================================================
#pragma mark Log printing statements used within the application
#pragma mark ========================================================

#ifdef DEBUG
#   define DLog(FORMAT, ...) printf("%s\n",[[NSString stringWithFormat:(@"%s [Line %d] " FORMAT), __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__] UTF8String])
#else
#   define DLog(...)
#endif

#define ALog(FORMAT, ...) printf("%s\n",[[NSString stringWithFormat:(@"%s [Line %d] " FORMAT), __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__] UTF8String])

#ifdef DEBUG
#   define ULog(FORMAT, ...)  { UIAlertView *alert = [[UIAlertView alloc] initWithTitle:[NSString stringWithFormat:@"%s\n [Line %d] ", __PRETTY_FUNCTION__, __LINE__] message:[NSString stringWithFormat:(@"" FORMAT), ##__VA_ARGS__]  delegate:nil cancelButtonTitle:@"Dismiss" otherButtonTitles:nil]; [alert show]; }
#else
#   define ULog(...)
#endif

#pragma mark - ========================================================
#pragma mark iOS system versions comparision
#pragma mark ========================================================

//-- iOS system versions comparision
#define SYSTEM_VERSION_EQUAL_TO(v)                  ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedSame)
#define SYSTEM_VERSION_GREATER_THAN(v)              ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedDescending)
#define SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(v)  ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] != NSOrderedAscending)
#define SYSTEM_VERSION_LESS_THAN(v)                 ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedAscending)
#define SYSTEM_VERSION_LESS_THAN_OR_EQUAL_TO(v)     ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] != NSOrderedDescending)

#pragma mark - ========================================================
#pragma mark Application Domain 
#pragma mark ========================================================

#define appDelegate   ((AppDelegate *)[[UIApplication sharedApplication]delegate])


#pragma mark ========================================================


#define NETWORK_ACTIVITY_INDICATOR_VISIBLE [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
#define NETWORK_ACTIVITY_INDICATOR_DISABLE [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
#define START_SV_PROGRESSHUD_BLACKBAGROUND_WHITEFORGROUND [Utility showSVProgressBlackBackgroundWhiteForeground]; NETWORK_ACTIVITY_INDICATOR_VISIBLE
#define START_SV_PROGRESSHUD_WHITEBAGROUND_BLACKFORGROUND [Utility showSVProgressWhiteBackgroundBlackForeground]; NETWORK_ACTIVITY_INDICATOR_VISIBLE
#define STOP_SV_PROGRESS_HUD [Utility showSVProgressDismiss]; NETWORK_ACTIVITY_INDICATOR_DISABLE


#endif /* GlobalConstant_h */


