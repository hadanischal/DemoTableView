//
//  TableViewDataSource.m
//  FactObjective
//
//  Created by Nilesh Prajapati on 23/11/17.
//  Copyright © 2017 Nilesh Prajapati. All rights reserved.
//

#import "TableViewDataSource.h"
#import "NSString+Additions.h"
#import <SDWebImage/UIImageView+WebCache.h>
#import "Fact.h"

@interface TableViewDataSource()<UITableViewDataSource>
@end

@implementation TableViewDataSource
@synthesize factsController = _factsController;

#pragma mark - ==================================
#pragma mark Initial methods for alloc & dealloc
#pragma mark ==================================

//-- Initialize method
- (id)initTableView:(UITableView *)tableView withViewController:(FactsController *)controller {
    if (self == [super init]) {
        _factsController = controller;
        tableView.dataSource = self;
    }
    return self;
}

- (void)dealloc {
    _factsController = nil;
}

#pragma mark - ==================================
#pragma mark Table view data source
#pragma mark ==================================

//-- A method to display contents in a tableview's cell.
- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    //-- Reuse the cell with the identifier.
    static NSString *reuseIdentifier = @"reuseIdentifier";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseIdentifier];
    if (cell == nil) {
        //-- Configure the cell if not available
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:reuseIdentifier];
        cell.detailTextLabel.numberOfLines = 0;
        cell.detailTextLabel.textColor = [UIColor lightGrayColor];
        cell.imageView.contentMode = UIViewContentModeScaleAspectFit;
        if ([[UIDevice currentDevice].model isEqualToString:@"iPad"] || [[UIDevice currentDevice].model isEqualToString:@"ipad"]) {
            cell.detailTextLabel.font = [UIFont fontWithName:cell.detailTextLabel.font.familyName size:cell.detailTextLabel.font.pointSize + 8.0];
            cell.textLabel.font = [UIFont fontWithName:cell.textLabel.font.familyName size:cell.textLabel.font.pointSize + 8.0];
        }
    }
    @try {
        if (_factsController.arrFacts.count > 0) {
            //-- To fetch the object based on index
            Fact *obj_fact = [_factsController.arrFacts objectAtIndex:indexPath.row];
            
            //-- To display the title text
            if (![obj_fact.title isEqual:[NSNull null]] && [[obj_fact.title trim] length] > 0) {
                cell.textLabel.text = [obj_fact.title trim];
            } else {
                cell.textLabel.text = @"No title available for this row.";
            }
            
            //-- To display the description text
            if (![obj_fact.descr isEqual:[NSNull null]] && [[obj_fact.descr trim] length] > 0) {
                cell.detailTextLabel.text = [obj_fact.descr trim];
            } else {
                cell.detailTextLabel.text = @"No description available for this row.";
            }
            
            //-- To display the image in asynchronously manner to avoid the user interaction conflict.
            if (![obj_fact.imageHref isEqual:[NSNull null]] && [[obj_fact.imageHref trim] length] > 0) {
                NSURL *imageurl = [NSURL URLWithString:[obj_fact.imageHref trim]];
                __unsafe_unretained __typeof(cell)weakCell = cell;
                [cell.imageView sd_setImageWithURL:imageurl completed:^(UIImage * _Nullable image, NSError * _Nullable error, SDImageCacheType cacheType, NSURL * _Nullable imageURL) {
                    if (image) {
                        //-- Resize the image and display it in the row.
                        if ([[UIDevice currentDevice].model isEqualToString:@"iPad"] || [[UIDevice currentDevice].model isEqualToString:@"ipad"]) {
                            weakCell.imageView.image = [self imageWithImage:image scaledToSize:CGSizeMake(100.0, 100.0)];
                        } else {
                            weakCell.imageView.image = [self imageWithImage:image scaledToSize:CGSizeMake(60.0, 60.0)];
                        }
                    } else {
                        weakCell.imageView.image = nil;
                    }
                    //-- To size the cell as after loading image asynchronously
                    [weakCell layoutSubviews];
                    [weakCell setNeedsLayout];
                }];
            } else {
                cell.imageView.image = nil;
            }
        } else {
            //-- Static text while there's nothing to display in table's list.
            cell.detailTextLabel.text = @"Click on Refresh icon or \"Pull to Refresh\" to fetch the data from server.";
        }
    } @catch (NSException *exception) {
        NSLog(@"An exception occurred due to %@", exception.reason);
    } @finally {
        return cell;
    }
}

//-- A method to deliver the number of rows in a single section.
- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (_factsController.arrFacts.count > 0) {
        return _factsController.arrFacts.count;
    } else {
        return 1;
    }
}

#pragma mark - ==================================
#pragma mark User-defined methods
#pragma mark ==================================

//-- A method to resize the image before display in a tableview' cell
- (UIImage *)imageWithImage:(UIImage *)image scaledToSize:(CGSize)newSize {
    //UIGraphicsBeginImageContext(newSize);
    // In next line, pass 0.0 to use the current device's pixel scaling factor (and thus account for Retina resolution).
    // Pass 1.0 to force exact pixel size.
    
    CGSize size = image.size;
    
    CGFloat widthRatio  = newSize.width  / image.size.width;
    CGFloat heightRatio = newSize.height / image.size.height;
    
    // Figure out what our orientation is, and use that to form the rectangle
    if(widthRatio > heightRatio) {
        newSize = CGSizeMake(size.width * heightRatio, size.height * heightRatio);
    } else {
        newSize = CGSizeMake(size.width * widthRatio,  size.height * widthRatio);
    }
    
    // This is the rect that we've calculated out and this is what is actually used below
    CGRect rect = CGRectMake(0, 0, newSize.width, newSize.height);
    
    // Actually do the resizing to the rect using the ImageContext stuff
    UIGraphicsBeginImageContextWithOptions(newSize, NO, 0.0);
    [image drawInRect:rect];
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return newImage;
}

@end
