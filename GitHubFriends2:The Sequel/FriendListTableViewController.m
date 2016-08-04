//
//  FriendListTableViewController.m
//  GitHubFriends2:The Sequel
//
//  Created by Ross Gottschalk on 8/3/16.
//  Copyright © 2016 The Iron Yard. All rights reserved.
//

#import "FriendListTableViewController.h"
#import "APIController.h"
#import "DeatilViewController.h"
#import "Friend.h"

@interface FriendListTableViewController () <APIControllerProtocol>

@property (strong, nonatomic) NSMutableArray *friends;


@end

@implementation FriendListTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"GitHub Friends";
    self.friends = [[NSMutableArray alloc] init];
    APIController *apiController = [[APIController alloc] init];
    apiController.delegate = self;
    [apiController searchGitHubFor: @"rossgottschalk"];
    
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"FriendCell"];

    
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.friends.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"FriendCell" forIndexPath:indexPath];
    cell.textLabel.text = self.friends [indexPath.row];
    
    
    // Configure the cell...
    
    return cell;
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/


#pragma mark - Navigation

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    DeatilViewController *detailVC = [self.storyboard instantiateViewControllerWithIdentifier:@"FriendBioSegue"];
    Friend *selectedFriend = self.friends[indexPath.row];
    detailVC.friend = selectedFriend;
    
    
}


// In a storyboard-based application, you will often want to do a little preparation before navigation
//- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
//{
//    if ([segue.identifier isEqualToString:@"FriendBioSegue"])
//    {
//        DeatilViewController *detailVC = [segue destinationViewController];
//        UITableViewCell *selectedCell = (UITableViewCell *) sender;
//        NSIndexPath *indexPath = [self.tableView indexPathForCell:selectedCell];
//        Friend *selectedFriend = self.friends [indexPath.row];
//        detailVC.friend = selectedFriend;
//        
//    }
//
//}


-(void)didReceiveAPIResults:(NSDictionary *)gitHubResponse
{
    NSString *resultName = gitHubResponse[@"name"];
    [self.friends addObject:resultName];
    dispatch_async(dispatch_get_main_queue(), ^{
        [self.tableView reloadData];
    });
    //shout out to greg for this^^
}

@end
