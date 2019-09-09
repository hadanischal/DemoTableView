//
//  ListViewModelProtocol.h
//  DemoAppiOS
//
//  Created by Nischal Hada on 8/9/19.
//  Copyright © 2019 NischalHada. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ListViewModelProtocol.h"
#import "ListViewControllerProtocol.h"

@protocol ListViewModelProtocol<NSObject>

-(void) setViewDelegate:( id<ListViewControllerProtocol>) viewDelegate;

@property(strong, nonatomic) NSArray *arrFacts;
- (void)fetchDataFromJSONFile;

@end
