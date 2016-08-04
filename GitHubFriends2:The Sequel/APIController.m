//
//  APIController.m
//  GitHubFriends2:The Sequel
//
//  Created by Ross Gottschalk on 8/3/16.
//  Copyright © 2016 The Iron Yard. All rights reserved.
//

#import "APIController.h"

@implementation APIController

- (void)searchGitHubFor:(NSString *)searchTerm
{
    NSString *escapedSearchTerm = [searchTerm stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet alphanumericCharacterSet]];
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"https://api.github.com/users/%@", escapedSearchTerm]];
    //the %@ in the url is the "escapedSearchTerm
    NSURLSession *session = [NSURLSession sharedSession];
    //go find the session created in the app and give it to me
    NSURLSessionDataTask *dataTask = [session dataTaskWithURL:url completionHandler:^(NSData *data, NSURLResponse *response, NSError *error)
                                      {
                                          if (error)
                                          {
                                              NSLog(@"Could not communicate with GitHub: %@", [error localizedDescription]);
                                          }
                                          else
                                          {
                                              NSError *parseError = nil;
                                              NSDictionary *gitHubResponse = [NSJSONSerialization JSONObjectWithData:data options:0 error:&parseError];
                                              [self.delegate didReceiveAPIResults: gitHubResponse];
                                              
                                          }
                                          
                                      }];
    [dataTask resume];

}

@end
