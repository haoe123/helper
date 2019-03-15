//
//  UIView+Addition.h
//  HelperProject
//
//  Created by wanghailong on 15/12/30.
//  Copyright © 2015年 HailongExcellency. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (Addition)

- (CGFloat)width;

- (CGFloat)height;

- (CGFloat)left;

- (CGFloat)right;

- (CGFloat)top;

- (CGFloat)bottom;

- (void)setWidth:(CGFloat)width;

- (void)setHeight:(CGFloat)height;

- (void)setXOffset:(CGFloat)x;

- (void)setYOffset:(CGFloat)y;

- (void)setOrigin:(CGPoint)newOrigin;

- (void)setSize:(CGSize)newSize;


@end





