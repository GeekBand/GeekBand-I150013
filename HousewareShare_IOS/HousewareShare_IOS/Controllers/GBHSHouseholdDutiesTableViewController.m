//
//  GBHSHouseholdDutiesTableViewController.m
//  HousewareShare_IOS
//
//  Created by as4 on 15/8/27.
//  Copyright (c) 2015年 GBHS. All rights reserved.
//

#import "GBHSHouseholdDutiesTableViewController.h"

@interface GBHSHouseholdDutiesTableViewController ()

@property (nonatomic, strong) NSArray * sectionNameList;
@end

@implementation GBHSHouseholdDutiesTableViewController

- (NSArray *)sectionNameList
{
    return @[@"需要去做", @"建议去做", @"已经完成"];
}

- (void)setUptableView
{
    if (self.tableView) {
        [self.tableView setDataSource:self];
        [self.tableView setDelegate:self];
        [self.tableView setTableFooterView:[[UIView alloc] initWithFrame:CGRectZero]];
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUptableView];
    
    UIView *navigationCenterView = [[UIView alloc]init];
    navigationCenterView.frame = CGRectMake(WIDTH/2-40, 34, 80, 25);
    navigationCenterView.backgroundColor = [UIColor clearColor];
    
    UILabel *navigationCenterLabel = [[UILabel alloc]init];
    navigationCenterLabel.frame = CGRectMake(0, 0, 80, 25);
    navigationCenterLabel.textColor = [UIColor whiteColor];
    navigationCenterLabel.text = @"老公家务";
    
    [navigationCenterView addSubview:navigationCenterLabel];
    /**
     设置导航栏颜色为紫色
     */
    [self.navigationController.navigationBar setBarTintColor:[UIColor purpleColor]];
    
    self.navigationItem.titleView = navigationCenterView;
    
 
    

    
    /*修改标题栏字体颜色*/
    //  [self.navigationController.navigationBar setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor whiteColor], UITextAttributeTextColor,nil]];
    //
    

    
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
    return [self.sectionNameList count];
}

- (NSString*)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return [self.sectionNameList objectAtIndex:section];
}

//- (UIView*)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
//{
//    return [[UIView alloc] init];
//}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return 0;
}

/*
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:<#@"reuseIdentifier"#> forIndexPath:indexPath];
    
    // Configure the cell...
    
    return cell;
}
*/

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
