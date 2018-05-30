//
//  TodayViewController.m
//  FastNoteEverything
//
//  Created by feirui on 2018/5/30.
//  Copyright © 2018年 陈欢. All rights reserved.
//

#import "TodayViewController.h"
#import <NotificationCenter/NotificationCenter.h>

@interface TodayViewController () <NCWidgetProviding>
@property (weak, nonatomic) IBOutlet UILabel *pastText;

@end

@implementation TodayViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.pastText.text = [[UIPasteboard generalPasteboard]string];
    // Do any additional setup after loading the view from its nib.
}
- (IBAction)saveClick:(id)sender {
    
    if (![self.pastText.text isEqualToString:@""]) {
        
        NSUserDefaults *userDefault = [[NSUserDefaults alloc]initWithSuiteName:@"group.com.mtcha00.fast"];
        
        [userDefault setObject:self.pastText.text forKey:@"fast"];
    }
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)widgetPerformUpdateWithCompletionHandler:(void (^)(NCUpdateResult))completionHandler {
    // Perform any setup necessary in order to update the view.
    
    // If an error is encountered, use NCUpdateResultFailed
    // If there's no update required, use NCUpdateResultNoData
    // If there's an update, use NCUpdateResultNewData

    completionHandler(NCUpdateResultNewData);
}

@end
