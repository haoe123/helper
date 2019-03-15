//
//  MySvgImg.m
//  钱吧
//
//  Created by MacBook on 15/1/23.
//  Copyright (c) 2015年 Justin Jun. All rights reserved.
//

#import "MySvgImg.h"

@implementation MySvgImg

- (instancetype)initWithFrame:(CGRect)frame size:(CGFloat)size text:(NSString *)text color:(UIColor *)color
{
    self = [super initWithFrame:frame];
    if (self) {
        self.font = [UIFont fontWithName:@"IconFont" size:size];
        self.text = text;
        self.textColor = color;
        self.textAlignment = NSTextAlignmentCenter;
    }
    return self;
}
+ (instancetype)svgImgWithFrame:(CGRect)frame size:(CGFloat)size text:(NSString *)text color:(UIColor *)color
{
    return [[self alloc] initWithFrame:frame size:size text:text color:(UIColor *)color];
}
- (void)awakeFromNib
{
     self.font = [UIFont fontWithName:@"IconFont" size:28];
     self.textAlignment = NSTextAlignmentCenter;
     self.textColor = [UIColor colorWithRed:0.11f green:0.55f blue:0.85f alpha:1.00f];
}
-(instancetype)fontzie:(NSString *)font{
    self.text = font;
    return self;
}
//使用方法
//在info.plist中添加Fonts provided by application（array）item0 更改为iconfont.tff

/*
 MySvgImg *mIIcon = [MySvgImg svgImgWithFrame:CGRectMake(180, 100, 100, 100) size:15 text:@"\U0000e604" color:[UIColor redColor]];
 [self.view addSubview:mIIcon];
 */
@end
