//
//  User.m
//  Twitter
//
//  Created by Roy Zou on 11/7/15.
//  Copyright © 2015 ruoyu. All rights reserved.
//

#import "User.h"
#import "TwitterClient.h"

static User *currentUser = nil;

@interface User()

@property (nonatomic, strong) NSDictionary *dictionary;

@end

@implementation User



- (id)initWithDictionary:(NSDictionary *)inputDictionary {
    self = [super init];
    if (self) {
        self.dictionary = inputDictionary;
        self.name = inputDictionary[@"name"];
        self.screenName = inputDictionary[@"screen_name"];
        self.profileImageUrl = inputDictionary[@"profile_image_url_https"];
        self.tagline = inputDictionary[@"profileImageUrl"];
    }
    
    return self;
}

NSString * const currentUserKey = @"currentUserKey";

+ (User *)currentUser {
    if (currentUser == nil) {
        NSData *data = [[NSUserDefaults standardUserDefaults] objectForKey:currentUserKey];
        if (data != nil) {
            NSDictionary *dictionary = [NSJSONSerialization JSONObjectWithData:data options:0 error:NULL];
            currentUser = [[User alloc] initWithDictionary:dictionary];
        }
    }
    return currentUser;
}

+ (void)setCurrentUser:(User *)currentUser {
    if (currentUser != nil) {
        NSData *data = [NSJSONSerialization dataWithJSONObject:currentUser.dictionary options:0 error:NULL];
        [[NSUserDefaults standardUserDefaults] setObject:data forKey:currentUserKey];
    } else {
        [[NSUserDefaults standardUserDefaults] setObject:nil forKey:currentUserKey];
    }
    [[NSUserDefaults standardUserDefaults] synchronize];
}

+ (void) logout {
    [User setCurrentUser:nil];
    [[TwitterClient sharedInstance].requestSerializer removeAccessToken];
    
}

@end
