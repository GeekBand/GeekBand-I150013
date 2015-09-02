//
//  GBHSLoginTableViewController.m
//  HousewareShare_IOS
//
//  Created by as4 on 15/8/27.
//  Copyright (c) 2015年 GBHS. All rights reserved.
//

#import "GBHSLoginTableViewController.h"
#import "LoginManager.h"
#import "ApiManager.h"
#import "ApiManager+Login.h"
#import "GBHSUserModel.h"

@interface GBHSLoginTableViewController()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) LoginManager * login;
@end

@interface GBHSLoginTableViewController ()

@end

@implementation GBHSLoginTableViewController


/**
 *  初始化tabbleview相关信息
 */
- (void)setUpTableView
{
    if (self.tableView) {
        [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"test"];
        [self.tableView setDelegate:self];
        [self.tableView setDataSource:self];
        [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"reuseIdentifier"];
    }
}

/**
 *  登录逻辑
 */
- (void)doLogin
{
    [[ApiManager shareClient] doLoginWithUser:[[GBHSUserModel alloc] init] withBlock:^(id data, NSError *error) {
        NSLog(@"登录成功!");
    }];
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    [self setUpTableView];
    [self.tableView setBackgroundColor:[UIColor redColor]];
    
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
    return [[self cellTitleList] count];
}

- (NSArray*)cellTitleList
{
    return @[@"用户名", @"密码"];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"reuseIdentifier" forIndexPath:indexPath];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"reuseIdentifier"];
    }
    
    cell.textLabel.text = [[self cellTitleList] objectAtIndex:indexPath.row];
    
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

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
