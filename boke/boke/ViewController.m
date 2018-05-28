//
//  ViewController.m
//  boke
//
//  Created by 陈欢 on 2018/5/28.
//  Copyright © 2018年 陈欢. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
{
    NSString *variable;  //成员变量
}

@property (nonatomic, copy) NSMutableArray *testArray;
@end
NSString *str = @"全局变量";
@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    NSMutableArray *array = [NSMutableArray arrayWithObjects:@"1",@"2", nil];
    
    _testArray = array; // 此处是实例变量赋值 没有经过set和get方法  改为self.testArray = array 就会奔溃
    
    [self.testArray removeObjectAtIndex:0];
    NSLog(@"%@", self.testArray);
    
    //输出是2
    
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
