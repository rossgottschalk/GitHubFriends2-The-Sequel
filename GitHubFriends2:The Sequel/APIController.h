//
//  APIController.h
//  GitHubFriends2:The Sequel
//
//  Created by Ross Gottschalk on 8/3/16.
//  Copyright © 2016 The Iron Yard. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FriendListTableViewController.h"

@interface APIController : NSObject

@property (strong, nonatomic) id<APIControllerProtocol> delegate;
-(void)searchGitHubFor: (NSString *)searchTerm;

@end
