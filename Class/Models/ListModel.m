//
//  ListModel.m
//  DemoAppiOS
//
//  Created by Nischal Hada on 4/10/18.
//  Copyright © 2018 NischalHada. All rights reserved.
//

#import "ListModel.h"
#import "Constant+Header.h"

@implementation ListModel
@synthesize title = _title;
@synthesize descr = _descr;
@synthesize imageHref = _imageHref;

//-- A method to convert the JSON/dictionary value to object model.
- (id)initObjectWithDictionary:(NSDictionary *)dictInfo {
    if (self == [super init]) {
        _title = dictInfo[kTITLE];
        _descr = dictInfo[kDESCRIPTION];
        _imageHref = dictInfo[kIMAGEREF];
    }
    return self;
}

- (void)dealloc {
    _title = nil;
    _descr = nil;
    _imageHref = nil;
}
@end

