//
//  ListViewControllerProtocol.h
//  DemoAppiOS
//
//  Created by Nischal Hada on 9/9/19.
//  Copyright © 2019 NischalHada. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ListViewControllerProtocol.h"


@protocol ListViewControllerProtocol<NSObject>

- (void)connectionDidReceiveFailure:(NSString *)error;
- (void)connectionDidFinishLoading:(NSDictionary *)dictResponseInfo;

@end
