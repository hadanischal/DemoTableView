//
//  TableViewDataSource.h
//  FactObjective
//
//  Created by Nilesh Prajapati on 23/11/17.
//  Copyright © 2017 Nilesh Prajapati. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "FactsController.h"

@interface TableViewDataSource : NSObject
@property(strong, nonatomic) FactsController *factsController;
- (id)initTableView:(UITableView *)tableView withViewController:(FactsController *)controller;
@end
