//
//  TableViewController.m
//  testtale
//
//  Created by 陈欢 on 2018/5/28.
//  Copyright © 2018年 陈欢. All rights reserved.
//

#import "TableViewController.h"
#import "Test.h"
#import "CHAddMessageViewController.h"
#import "LocialNotificationManager.h"
@interface TableViewController ()
@property (nonatomic, strong) NSMutableArray *array;
@property (nonatomic, strong) UIButton *button;
@end

@implementation TableViewController
- (UIButton *)button
{
    if (!_button) {
        _button = [[UIButton alloc]init];
        [_button setTitle:@"发布" forState:UIControlStateNormal];
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
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(sveSql:) name:@"fastsave" object:nil];
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
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}


- (NSArray<UITableViewRowAction *> *)tableView:(UITableView *)tableView editActionsForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewRowAction *dele = [UITableViewRowAction rowActionWithStyle:UITableViewRowActionStyleDefault title:@"删除" handler:^(UITableViewRowAction * _Nonnull action, NSIndexPath * _Nonnull indexPath) {
        Test *model = self.array[indexPath.row];
        [model deleteObject];
        [self.array removeObjectAtIndex:indexPath.row];
        [self.tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
        
        
    }];
    
    return @[dele];
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
    //[[LocialNotificationManager manager] registerLocalNotification:6 key:@"注册本地通知"];
    CHAddMessageViewController *vc = [[CHAddMessageViewController alloc]init];
    vc.isPlan = YES;
    [self.navigationController pushViewController:vc animated:YES];
    
    
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    self.array = [[Test findAll]mutableCopy];
    [self.tableView reloadData];
    
}

- (void)sveSql:(NSNotification *)note
{
    NSUserDefaults *userDefaults = [[NSUserDefaults alloc] initWithSuiteName:@"group.com.mtcha00.fast"];
    
    NSString *saveString = [userDefaults objectForKey:@"fast"];
    
    
    
    if (saveString.length == 0) {
        return;
    } else {
        
        Test *model = [[Test alloc]init];
        
        model.s = saveString;
        
        if ([model save]) {
            [userDefaults setObject:@"" forKey:@"fast"];
        }
        
        self.array = [[Test findAll]mutableCopy];
        [self.tableView reloadData];
    }
}
@end
