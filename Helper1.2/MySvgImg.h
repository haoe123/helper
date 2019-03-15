//
//  MySvgImg.h
//  钱吧
//
//  Created by MacBook on 15/1/23.
//  Copyright (c) 2015年 Justin Jun. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MySvgImg : UILabel

- (instancetype)initWithFrame:(CGRect)frame size:(CGFloat)size text:(NSString *)text color:(UIColor *)color;

+ (instancetype)svgImgWithFrame:(CGRect)frame size:(CGFloat)size text:(NSString *)text color:(UIColor *)color;
-(instancetype)fontzie:(NSString *)font;
@end
