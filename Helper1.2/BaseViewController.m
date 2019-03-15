//
//  BaseViewController.m
//  UINavigationControllerDemo2
//
//  Created by wanghailong on 16/1/4.
//  Copyright © 2016年 HailongExcellency. All rights reserved.
//

#import "BaseViewController.h"

@interface BaseViewController ()

@end

@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = WhiteColor;
    
    //初始化数据
//    [self initData];
    //创建视图方法
    [self createView];
    //添加用户交互信息
    [self addTouchAction];
}

- (void)initData{
    //空方法不实现 取消编译器的警告
}

- (void)createView{
    //空方法不实现 取消编译器的警告
}

- (void)addTouchAction{
    //空方法不实现 取消编译器的警告
}

//声明创建上导航右侧按钮
- (void)createRightNavigationBarButtonWithTitle:(NSString *)title target:(id)target action:(SEL)selector{
    UIBarButtonItem *right = [[UIBarButtonItem alloc]initWithTitle:title style:UIBarButtonItemStyleDone target:target action:selector];
    self.navigationItem.rightBarButtonItem = right;
}
//左侧
- (void)createLeftNavigationBarButtonWithTitle:(NSString *)title target:(id)target action:(SEL)selector {
    UIBarButtonItem *left = [[UIBarButtonItem alloc] initWithTitle:title style:UIBarButtonItemStyleDone target:target action:selector];
    self.navigationItem.leftBarButtonItem = left;
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
