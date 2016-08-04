//
//  Friend.h
//  GitHubFriends2:The Sequel
//
//  Created by Ross Gottschalk on 8/3/16.
//  Copyright © 2016 The Iron Yard. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Friend : NSObject

@property (nonatomic) NSString *name;
@property (nonatomic) NSString *username;
@property (nonatomic) NSString *location;
@property (nonatomic) NSNumber *publicRepos;

+ (Friend *)friendWithDictionary:(NSDictionary *)aDict;


@end
