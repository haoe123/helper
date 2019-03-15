//
//  LXYToast.h
//
//  Created by garyxuan on 16-7-13.
//  Copyright (c) 2016年 wangxiaoxuan. All rights reserved.

//#import <QuartzCore/QuartzCore.h>
#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, LXYToastPosition){
    LXYToastPositionCenter,
    LXYToastPositionTop,
    LXYToastPositionBottom
};

@interface LXYToast : NSObject
/**
 * 中间显示+时间默认 show in center and duration is default 1.5
 * @param text 内容
 */
 + (void)showText:(NSString*)text;

  /**
  * 给定位置 + 时间默认 show in position(LXYToastPosition) we given and duration is default 1.5
  */
 + (void)showText:(NSString*)text position:(LXYToastPosition)position;

 /**
  * 自定义位置 + 自定义时间
  */
 + (void)showText:(NSString*)text position:(LXYToastPosition)position duration:(CGFloat)duration;

 /**
  * 给定位置 + 偏移量 + 自定义时间 show in position(LXYToastPosition) we given with a offset and duration is default 1.5
  */
 + (void)showText:(NSString*)text position:(LXYToastPosition)position offset:(CGFloat)offset duration:(CGFloat)duration; 
 @end