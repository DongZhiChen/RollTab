//
//  ViewController.m
//  RollTab
//
//  Created by 陈东芝 on 16/11/2.
//  Copyright © 2016年 陈东芝. All rights reserved.
//

#import "ViewController.h"
#import "V_RollingTab.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    V_RollingTab *tb = [[V_RollingTab alloc] initWithFrame:CGRectMake(0, 50, [UIScreen mainScreen].bounds.size.width, 50)];
    tb.arrayTitles = @[@"TEST",@"TEST",@"TEST",@"test",@"setwee",@"TEST",@"TEST",@"TEST",@"test",@"setwee"];
    tb.isAddIndexLine = YES;
    tb.isCanRoll= YES;
    [self.view addSubview:tb];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
