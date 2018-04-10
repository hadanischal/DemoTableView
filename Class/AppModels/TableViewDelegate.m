//
//  TableViewDelegate.m
//  DemoAppiOS
//
//  Created by Nischal Hada on 4/10/18.
//  Copyright © 2018 NischalHada. All rights reserved.
//

#import "TableViewDelegate.h"

@interface TableViewDelegate()<UITableViewDelegate>
@end

@implementation TableViewDelegate
@synthesize factsController = _factsController;

#pragma mark - ==================================
#pragma mark Initial methods for alloc & dealloc
#pragma mark ==================================

- (id)initTableView:(UITableView *)tableView withViewController:(ListViewModels *)controller {
    if (self == [super init]) {
        _factsController = controller;
        tableView.delegate = self;
    }
    return self;
}

- (void)dealloc {
    _factsController = nil;
}

#pragma mark - ==================================
#pragma mark Table view delegate method
#pragma mark ==================================

//-- A delegate method of a tableview which called while clicking on table's row.
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:TRUE];
}

@end
