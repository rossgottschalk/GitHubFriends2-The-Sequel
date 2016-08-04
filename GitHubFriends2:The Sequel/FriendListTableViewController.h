//
//  FriendListTableViewController.h
//  GitHubFriends2:The Sequel
//
//  Created by Ross Gottschalk on 8/3/16.
//  Copyright © 2016 The Iron Yard. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol APIControllerProtocol
-(void)didReceiveAPIResults:(NSDictionary *)gitHubResponse;

@end

@interface FriendListTableViewController : UITableViewController

@end
