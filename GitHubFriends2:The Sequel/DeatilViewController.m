//
//  DeatilViewController.m
//  GitHubFriends2:The Sequel
//
//  Created by Ross Gottschalk on 8/3/16.
//  Copyright © 2016 The Iron Yard. All rights reserved.
//

#import "DeatilViewController.h"

@interface DeatilViewController ()
@property (weak, nonatomic) IBOutlet UILabel *realNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *usernnameLabel;
@property (weak, nonatomic) IBOutlet UILabel *locationLabel;
@property (weak, nonatomic) IBOutlet UILabel *publicReposLabel;

@end

@implementation DeatilViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"About Me";
    self.realNameLabel.text = self.friend.name;
    self.usernnameLabel.text = self.friend.username;
    self.locationLabel.text = self.friend.location;

    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
