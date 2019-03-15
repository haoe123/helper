//
//  NavBaseViewController.m
//  qianBaJinRong
//
//  Created by li xinya on 16/8/24.
//  Copyright © 2016年 li xinya. All rights reserved.
//

#import "NavBaseViewController.h"

@interface NavBaseViewController ()

@end

@implementation NavBaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = WhiteColor;
    
    //初始化数据
    [self initData];
    //创建视图方法
    [self createView];
    //添加用户交互信息
    [self addTouchAction];
   
}
- (void)viewWillAppear:(BOOL)animated{
    
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

#pragma  mark - 重写返回按钮
-(void)LeftBlack{
    
    UIButton *btn=[UIButton buttonWithType:UIButtonTypeCustom];
    btn.bounds=CGRectMake(0, 0,60,50);
    btn.tag = 222;
    
    [btn setImage:[UIImage imageNamed:@"back_ico"] forState:UIControlStateNormal];
    btn.imageEdgeInsets = UIEdgeInsetsMake(0, 0, 0, 0);;
    [btn addTarget:self action:@selector(blackbtn) forControlEvents:UIControlEventTouchUpInside];
    
    UIBarButtonItem *leftButton = [[UIBarButtonItem alloc] initWithCustomView:btn];
    
    if(([[[UIDevice currentDevice] systemVersion] floatValue]>=7.0?20:0))
        
    {
        
        UIBarButtonItem *negativeSpacer = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace
                                                                                       target:nil action:nil];
        negativeSpacer.width = -30;//这个数值可以根据情况自由变化
        self.navigationItem.leftBarButtonItems = @[negativeSpacer, leftButton];
        
        
    }else{
        
        
        self.navigationItem.leftBarButtonItem = leftButton;
        
        
        
    }
}
//返回按钮事件
-(void)blackbtn{
    
        [self dismissViewControllerAnimated:YES completion:nil];
    [self.navigationController popViewControllerAnimated:YES];
    
}

//声明创建上导航右侧按钮
- (void)createRightNavigationBarButtonWithTitle:(NSString *)title target:(id)target action:(SEL)selector{
    UIBarButtonItem *right = [[UIBarButtonItem alloc]initWithTitle:title style:UIBarButtonItemStyleDone target:target action:selector];
    self.navigationItem.rightBarButtonItem = right;
}
//声明创建上导航右侧按钮
- (void)createRightNavigationBarButtonWithImage:(UIImage *)image target:(id)target action:(SEL)selector{
    UIBarButtonItem *right = [[UIBarButtonItem alloc]initWithImage:image style:UIBarButtonSystemItemFixedSpace target:target action:selector];
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



@end
