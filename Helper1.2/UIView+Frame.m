//
//  UIView+Frame.m
//  Journey
//
//  Created by liuxhui on 15/7/27.
//  Copyright (c) 2015年 liuxhui. All rights reserved.
//

#import "UIView+Frame.h"

@implementation UIView (Frame)

/**
 *  改变View的frame 或者其中一个或者多个属性
 *
 *  @param x x 改变x坐标
 */

- (void)jianpan
{
    // 键盘通知
    // 键盘的frame发生改变时发出的通知（位置和尺寸）
    //    UIKeyboardWillChangeFrameNotification
    //    UIKeyboardDidChangeFrameNotification
    // 键盘显示时发出的通知
    //    UIKeyboardWillShowNotification
    //    UIKeyboardDidShowNotification
    // 键盘隐藏时发出的通知
    //    UIKeyboardWillHideNotification
    //    UIKeyboardDidHideNotification
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillChangeFrame:) name:UIKeyboardWillChangeFrameNotification object:nil];//在这里注册通知
}


/**
 * 键盘的frame发生改变时调用（显示、隐藏等）
 */
- (void)keyboardWillChangeFrame:(NSNotification *)notification
{
    //    if (self.picking) return;
    /**
     notification.userInfo = @{
     // 键盘弹出\隐藏后的frame
     UIKeyboardFrameEndUserInfoKey = NSRect: {{0, 352}, {320, 216}},
     // 键盘弹出\隐藏所耗费的时间
     UIKeyboardAnimationDurationUserInfoKey = 0.25,
     // 键盘弹出\隐藏动画的执行节奏（先快后慢，匀速）
     UIKeyboardAnimationCurveUserInfoKey = 7
     }
     */
    
    NSDictionary *userInfo = notification.userInfo;

    UIView *view = [[UIView alloc] init];
    
    
    // 动画的持续时间
    double duration = [userInfo[UIKeyboardAnimationDurationUserInfoKey] doubleValue];
    
    // 键盘的frame
    CGRect keyboardF = [userInfo[UIKeyboardFrameEndUserInfoKey] CGRectValue];
    
    // 执行动画
    [UIView animateWithDuration:duration animations:^{
        // 工具条的Y值 == 键盘的Y值 - 工具条的高度
        if (keyboardF.origin.y > self.height)
        { // 键盘的Y值已经远远超过了控制器view的高度
            view.y = self.height - view.height;//这里的<span style="background-color: rgb(240, 240, 240);">self.toolbar就是我的输入框。</span>
        }
        else
        {
            view.y = keyboardF.origin.y - view.height;
        }
    }];
}

- (void)setX:(CGFloat)x             /** 改变x坐标 */
{
    CGRect frame = self.frame;
    frame.origin.x = x;
    self.frame = frame;
}
- (void)setY:(CGFloat)y             /** 改变y坐标 */
{
    CGRect frame = self.frame;
    frame.origin.y = y;
    self.frame = frame;
}
- (void)setWidth:(CGFloat)width     /** 改变宽度 */
{
    CGRect frame = self.frame;
    frame.size.width = width;
    self.frame = frame;
}
- (void)setHeight:(CGFloat)height    /** 改变高度 */
{
    CGRect frame = self.frame;
    frame.size.height = height;
    self.frame = frame;
}
- (void)setOrigin:(CGPoint)origin    /** 改变x和y的坐标 */
{
    CGRect frame = self.frame;
    frame.origin = origin;
    self.frame =frame;
}
- (void)setSize:(CGSize)size         /** 改变frame */
{
    CGRect frame = self.frame;
    frame.size = size;
    self.frame = frame;
}
- (CGFloat)x
{
    return CGRectGetMinX(self.frame);
}
- (CGFloat)y
{
    return CGRectGetMinY(self.frame);
}
- (CGFloat)width
{
    return CGRectGetWidth(self.frame);
}
- (CGFloat)height
{
    return CGRectGetHeight(self.frame);
}
- (CGPoint)origin
{
    return self.frame.origin;
}
- (CGSize)size
{
    return self.frame.size;
}


//获取view的坐标
- (CGSize)Size
{
    return self.frame.size;
}
- (CGFloat)Width        /** 获取宽度 */
{
  return  CGRectGetWidth(self.frame);
}
- (CGFloat)Heigh
{
    return  CGRectGetHeight(self.frame);
}
- (void)setCenterX:(CGFloat)centerX /** < 改变中心x坐标 > */
{
    CGPoint center = self.center;
    center.x = centerX;
    self.center =center;
}
- (void)setCenterY:(CGFloat)centerY /** < 改变中心y坐标 > */
{
    CGPoint center = self.center;
    center.y = centerY;
    self.center =center;
}
/**
 *  @author HHL, 15-08-05 23:08:30
 *
 *  get函数 获取view的各种属性
 *
 *  @return 返回各种属性
 */

- (CGFloat)centerY              /** < 获取中心y坐标 > */
{
    return self.center.y;
}
- (CGFloat)centerX              /** < 获取中心x坐标 > */
{
    return self.center.x;
}
- (CGFloat)rightX               /** < 获取右边x坐标 > */
{
    return CGRectGetMaxX(self.frame);
}
- (CGFloat)bottomY              /** < 获取下面y坐标 > */
{
    return CGRectGetMaxY(self.frame);
}
/**
 *  @author HHL, 15-08-05 23:08:34
 *
 *  @param CGSize
 *
 */
- (CGFloat)TopY         /** 获取上面的y坐标 */
{
    return CGRectGetMinY(self.frame);
}
- (CGFloat)BottomY      /** 获取下面的y坐标 */
{
    return CGRectGetMaxY(self.frame);
}
- (CGFloat)LeftX        /** 获取左边的x坐标 */
{
    return CGRectGetMinX(self.frame);
}
- (CGFloat)RightX       /** 获取右边的y坐标 */
{
    return CGRectGetMaxX(self.frame);
}
@end
