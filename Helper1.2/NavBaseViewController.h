//
//  NavBaseViewController.h
//  qianBaJinRong
//
//  Created by li xinya on 16/8/24.
//  Copyright © 2016年 li xinya. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NavBaseViewController : UIViewController

@property(nonatomic,strong)UIView *NavBaseViewControllerView;
@property(nonatomic,strong)UIButton *NavBaseViewControllerLeftBt;
@property(nonatomic,strong)UIButton *NavBaseViewControllerRightBt;
@property(nonatomic,strong)UILabel *NavBaseViewControllerLabel;



//初始化数据
- (void)initData;

//创建视图方法
- (void)createView;

//添加用户交互信息
- (void)addTouchAction;


-(void)LeftBlack;//左侧返回按钮

- (void)createRightNavigationBarButtonWithTitle:(NSString *)title target:(id)target action:(SEL)selector;
- (void)createLeftNavigationBarButtonWithTitle:(NSString *)title target:(id)target action:(SEL)selector;
- (void)createRightNavigationBarButtonWithImage:(UIImage *)image target:(id)target action:(SEL)selector;//图片按钮
@end

