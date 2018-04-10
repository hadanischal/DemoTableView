//
//  ListViewModels.h
//  DemoAppiOS
//
//  Created by Nischal Hada on 4/10/18.
//  Copyright © 2018 NischalHada. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol ListControllerDeleagte;

@protocol ListControllerDeleagte
@optional
- (void)connectionDidReceiveFailure:(NSString *)error;
- (void)connectionDidFinishLoading:(NSDictionary *)dictResponseInfo;
@end

@interface ListViewModels : NSObject
@property(strong, nonatomic) NSArray *arrFacts;
@property(assign, nonatomic) id<ListControllerDeleagte> delegate;
- (void)fetchDataFromJSONFile;
@end



