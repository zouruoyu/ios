//
//  TweetDateFormatter.h
//  Twitter
//
//  Created by Roy Zou on 11/8/15.
//  Copyright © 2015 ruoyu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TweetDateFormatter : NSDateFormatter
+ (NSString *) stringFromDate:(NSDate *)date withDateFormat:(NSString *)dateFormat ;
+ (NSDate *) dateFromString:(NSString *)date withDateFormat:(NSString *)dateFormat;
@end
