//
//  TableViewDataSource.h
//  DemoAppiOS
//
//  Created by Nischal Hada on 4/10/18.
//  Copyright © 2018 NischalHada. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "ListViewModels.h"


@interface TableViewDataSource : NSObject
@property(strong, nonatomic) ListViewModels *factsController;
- (id)initTableView:(UITableView *)tableView withViewController:(ListViewModels *)controller;
@end
