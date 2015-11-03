//
//  Filter.h
//  Yelp
//
//  Created by roy on 11/1/15.
//  Copyright © 2015 codepath. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FilterSection : NSObject
@property (strong, nonatomic) NSString *headerName;
@property (strong, nonatomic) NSArray *filters;

+ (NSArray *) generateAllFilters;

@end
