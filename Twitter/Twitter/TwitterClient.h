//
//  TwitterClient.h
//  Twitter
//
//  Created by Roy Zou on 11/5/15.
//  Copyright © 2015 ruoyu. All rights reserved.
//

#import "BDBOAuth1RequestOperationManager.h"
#import "User.h"

@interface TwitterClient : BDBOAuth1RequestOperationManager

+ (TwitterClient *) sharedInstance;

- (void) openUrl:(NSURL *)url;
- (void) loginWithCompletion:(void(^)(User *user, NSError *error))completion;
@end
