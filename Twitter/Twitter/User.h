//
//  User.h
//  Twitter
//
//  Created by Roy Zou on 11/7/15.
//  Copyright © 2015 ruoyu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface User : NSObject

@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *screenName;
@property (nonatomic, strong) NSString *profileImageUrl;
@property (nonatomic, strong) NSString *tagline;


- (id)initWithDictionary:(NSDictionary *) inputDictionary;


+ (User *)currentUser;
+ (void)setCurrentUser:(User *)currentUser;
+ (void) logout;


@end
