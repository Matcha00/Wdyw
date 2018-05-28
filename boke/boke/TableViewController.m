//
//  TableViewController.m
//  testtale
//
//  Created by 陈欢 on 2018/5/28.
//  Copyright © 2018年 陈欢. All rights reserved.
//

#import "TableViewController.h"
#import "Test.h"
#import "CHAddModel.h"
@interface TableViewController ()
@property (nonatomic, strong) NSMutableArray *array;
@property (nonatomic, strong) UIButton *button;
@end

@implementation TableViewController
- (UIButton *)button
{
    if (!_button) {
        _button = [[UIButton alloc]init];
        [_button setTitle:@"ppp" forState:UIControlStateNormal];
        _button.backgroundColor = [UIColor redColor];
        [_button addTarget:self action:@selector(uuuuu) forControlEvents:UIControlEventTouchUpInside];
    }
    
    return _button;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.array = [[Test findAll]mutableCopy];
    
    UIView *view = [[UIView alloc]initWithFrame:CGRectZero];
    self.tableView.tableFooterView = view;
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    //self.tableView.tableHeaderView = self.button;
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:self.button];
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
#warning Incomplete implementation, return the number of sections
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete implementation, return the number of rows
    return self.array.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    
    Test *test = self.array[indexPath.row];
    cell.textLabel.text = test.s;
    
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

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
- (void)uuuuu
{
    Test *test = [[Test alloc]init];
    
    test.s = @"lllpppp";
    [test save];
    self.array = [[Test findAll]mutableCopy];
    [self.tableView reloadData];
}
@end
