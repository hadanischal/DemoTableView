//  NSString+Additions.m
//  DemoAppiOS
//
//  Created by Nischal Hada on 4/10/18.
//  Copyright © 2018 NischalHada. All rights reserved.
//


#import "NSString+Additions.h"

@implementation NSString (Additions)

#pragma mark - ===========================================
#pragma mark Return string after modifications
#pragma mark ===========================================

-(NSString *)returnStringAfterValidating
{
    NSString *returnStr = @"";
    @try
    {
        if (self) {
            if([self isEqual:[NSNull null] ] || [self isEqualToString:@""] || [self isEqualToString:@"(null)"] || [self isEqualToString:@"<null>"] || [self isEqualToString:@"nil"] || self == nil || [self isEqual:nil] || [self isKindOfClass:[NSNull class]]) {
                returnStr = @"";
            }
            else {
                returnStr = self;
            }
        }
    }
    @catch (NSException *exception) {
        returnStr = @"";
    }
    return returnStr;
}

-(NSString *)trim
{
    if (self) {
        NSString *string = self;
        string  = [string returnStringAfterValidating];
        if ([string length] > 0) {
            string = [string stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
        }
        else {
            string = @"";
        }
        return string;
    } else {
        return @"";
    }
}

@end
