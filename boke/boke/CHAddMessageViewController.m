//
//  CHAddMessageViewController.m
//  boke
//
//  Created by 陈欢 on 2018/5/28.
//  Copyright © 2018年 陈欢. All rights reserved.
//

#import "CHAddMessageViewController.h"
#import "CHAddModel.h"
@interface CHAddMessageViewController () <UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITextField *addText;

@property  (nonatomic, copy) NSString *addString;
@end

@implementation CHAddMessageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



- (IBAction)save:(id)sender {
    
    CHAddModel *model = [[CHAddModel alloc]init];
    
    model.addMessage = self.addText.text;
    [model save];
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
