//
//  TweetDateFormatter.m
//  Twitter
//
//  Created by Roy Zou on 11/8/15.
//  Copyright © 2015 ruoyu. All rights reserved.
//

#import "TweetDateFormatter.h"

@implementation TweetDateFormatter
- (id) init {
    self = [super init];
    if (self) {
        self.dateStyle = NSDateFormatterShortStyle;
        self.timeStyle = NSDateFormatterShortStyle;
    }
    return self;
}

+ (NSString *) stringFromDate:(NSDate *)date withDateFormat:(NSString *)dateFormat {
    TweetDateFormatter *tweetDateFormatter = [[TweetDateFormatter alloc] init];
    tweetDateFormatter.dateFormat = dateFormat;
    return [tweetDateFormatter stringFromDate:date];
}

+ (NSDate *) dateFromString:(NSString *)date withDateFormat:(NSString *)dateFormat{
    TweetDateFormatter *tweetDateFormatter = [[TweetDateFormatter alloc] init];
    tweetDateFormatter.dateFormat = dateFormat;
    return [tweetDateFormatter dateFromString:date];
}
@end


