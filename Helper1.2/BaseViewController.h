//
//  BaseViewController.h
//  UINavigationControllerDemo2
//
//  Created by wanghailong on 16/1/4.
//  Copyright © 2016年 HailongExcellency. All rights reserved.
//

#import <UIKit/UIKit.h>

//BaseViewController作为所有UI阶段视图控制器的父类。
/*
 由于我们后续生成的视图控制器都继承与Base，而Base继承与UIViewController所以我们生成的视图控制器，都是UIViewController的子类。
 */
@interface BaseViewController : UIViewController

//初始化数据
- (void)initData;

//创建视图方法
- (void)createView;

//添加用户交互信息
- (void)addTouchAction;

//声明创建上导航右侧按钮
- (void)createRightNavigationBarButtonWithTitle:(NSString *)title target:(id)target action:(SEL)selector;

- (void)createLeftNavigationBarButtonWithTitle:(NSString *)title target:(id)target action:(SEL)selector;
@end








