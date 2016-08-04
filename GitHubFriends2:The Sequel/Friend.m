//
//  Friend.m
//  GitHubFriends2:The Sequel
//
//  Created by Ross Gottschalk on 8/3/16.
//  Copyright © 2016 The Iron Yard. All rights reserved.
//

#import "Friend.h"

@implementation Friend

+ (Friend *)friendWithDictionary:(NSDictionary *)aDict
{
    Friend *aFriend = nil;
    if (aDict)
    {
        aFriend = [[Friend alloc] init];
        aFriend.name = aDict [@"name"];
        aFriend.username = aDict [@"login"];
        aFriend.location = aDict [@"location"];
        aFriend.publicRepos = aDict [@"public_repos"];
    }
    
    return aFriend;
}



@end
