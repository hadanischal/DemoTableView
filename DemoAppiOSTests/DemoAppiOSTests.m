//
//  DemoAppiOSTests.m
//  DemoAppiOSTests
//
//  Created by Nischal Hada on 4/10/18.
//  Copyright © 2018 NischalHada. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "ListViewModels.h"

@interface DemoAppiOSTests : XCTestCase

@end

@implementation DemoAppiOSTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testExample {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
        ListViewModels *obj_viewModels = [[ListViewModels alloc] init];
        [obj_viewModels fetchDataFromJSONFile];
    }];
}

@end
