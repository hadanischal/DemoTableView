//
//  ListViewModels.h
//  DemoAppiOS
//
//  Created by Nischal Hada on 4/10/18.
//  Copyright © 2018 NischalHada. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ListViewModelProtocol.h"

@interface ListViewModels : NSObject<ListViewModelProtocol>
@property(strong, nonatomic) NSArray *arrFacts;
- (void)fetchDataFromJSONFile;
@end



