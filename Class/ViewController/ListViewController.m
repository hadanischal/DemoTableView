//
//  ListViewController.m
//  DemoAppiOS
//
//  Created by Nischal Hada on 4/10/18.
//  Copyright © 2018 NischalHada. All rights reserved.
//

#import "ListViewController.h"
#import "Constant+Header.h"
#import "AppDelegate.h"
#import "TableViewDataSource.h"
#import "TableViewDelegate.h"
#import "ListViewModels.h"

//-- Private declaration properties
@interface ListViewController ()

@property(strong, nonatomic) UIRefreshControl *refreshControler;
@property(strong, nonatomic) TableViewDataSource *tableviewDatasource; //-- Tableview datasource
@property(strong, nonatomic) TableViewDelegate *tableviewDelegate; //-- Tableview delegate

@end

@implementation ListViewController {
    // The view model - not synthesized
    id<ListViewModelProtocol> _viewModel;
}

-(id<ListViewModelProtocol>) listViewModel {
    return (id<ListViewModelProtocol>) _viewModel;
}

-(void) setupViewModel {
    id<ListViewModelProtocol> viewModel = [[ListViewModels alloc] init];
    _viewModel = viewModel;
    [_viewModel setViewDelegate:self];
}


- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupViewModel];
    [self setupUI];
    [self setupEventBinding];
    [self setupUIBinding];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void) dealloc {
    _refreshControler = nil;
}



// MARK:
// MARK: Setup UI

-(void) setupUI {
 
    self.navigationItem.title = @"List View";

    //-- Change status bar style
    [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleDefault;
    
    //-- NavigationBar right bar item
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemRefresh target:self action:@selector(btnRefreshClicked:)];
    
    //-- Tableview's row height & estimated row height
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    if ([[UIDevice currentDevice].model isEqualToString:@"iPad"] || [[UIDevice currentDevice].model isEqualToString:@"ipad"]) {
        self.tableView.estimatedRowHeight = 110.0;
    } else {
        self.tableView.estimatedRowHeight = 65.0;
    }
    self.tableView.tableFooterView = [UIView new];
    
    //-- Tableview's pull to refresh control
    _refreshControler = [[UIRefreshControl alloc] init];
    if (@available(iOS 10.0, *)) {
        self.tableView.refreshControl = _refreshControler;
    } else {
        [self.tableView addSubview:_refreshControler];
    }
    [_refreshControler addTarget:self action:@selector(pullToRefresh:) forControlEvents:UIControlEventValueChanged];

    //-- Initiate the datasource for table view & integrate datesource methods with the help of viewModels
    _tableviewDatasource = [[TableViewDataSource alloc] initTableView:self.tableView withViewController:[self listViewModel]];
    //-- Initiate the delegate for table view & integrate delegate methods with the help of viewModels
    _tableviewDelegate = [[TableViewDelegate alloc] initTableView:self.tableView withViewController:[self listViewModel]];
}


-(void) setupEventBinding {}

-(void) setupUIBinding {
    [[self listViewModel] fetchDataFromJSONFile];
}
    
#pragma mark - ==================================
#pragma mark viewModels Delegate methods
#pragma mark ==================================

//-- A delegate method called after the un-successful execution by viewModels
- (void)connectionDidReceiveFailure:(NSString *)error {
    self.title = @"";
    [appDelegate displayAnAlertWith:kALERT andMessage:error];
    dispatch_async(dispatch_get_main_queue(), ^{
        //-- To hide the network indicator once the response is availble.
        [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO];
        [_refreshControler endRefreshing];
    });
}

//-- A delegate method called after the successful execution by viewModels
- (void)connectionDidFinishLoading:(NSDictionary *)dictResponseInfo {
    self.title = dictResponseInfo[kTITLE];
    dispatch_async(dispatch_get_main_queue(), ^{
        //-- To hide the network indicator once the response is availble.
        [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO];
        [_refreshControler endRefreshing];
        if ([self listViewModel].arrFacts != nil && [self listViewModel].arrFacts.count > 0) {
            self.tableView.hidden = NO;
        } else {
            self.tableView.hidden = YES;
        }
        [self.tableView reloadData];
    });
}

#pragma mark - ==================================
#pragma mark Controls click events
#pragma mark ==================================

//-- Click event for top right bar button item
- (IBAction)btnRefreshClicked:(id)sender {
    dispatch_async(dispatch_get_main_queue(), ^{
        //-- To show the network indicator until the process is running.
        [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:YES];
    });
    [_refreshControler endRefreshing];
    [[self listViewModel] fetchDataFromJSONFile];
}

//-- Pull to refresh event by pulling down the tableview
- (IBAction)pullToRefresh:(id)sender {
    [_refreshControler beginRefreshing];
    dispatch_async(dispatch_get_main_queue(), ^{
        //-- To show the network indicator until the process is running.
        [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:YES];
    });
    [[self listViewModel]fetchDataFromJSONFile];
}

@end

