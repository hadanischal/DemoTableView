//
//  ListModel.h
//  DemoAppiOS
//
//  Created by Nischal Hada on 4/10/18.
//  Copyright © 2018 NischalHada. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ListModel : NSObject

@property(copy, nonatomic) NSString *title; //-- Contains the 'title' of a record.
@property(copy, nonatomic) NSString *descr; //-- Contains the 'description' of a record.
@property(copy, nonatomic) NSString *imageHref; //-- Contains the 'image'url of a record.
- (id)initObjectWithDictionary:(NSDictionary *)dictInfo; //-- A method to convert the JSON/dictionary value to object model.

@end
