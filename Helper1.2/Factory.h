//
//  Factory.h
//  UINavigationControllerDemo2
//
//  Created by qianfeng0 on 16/1/4.
//  Copyright (c) 2016年 XinYa.Li. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>


@interface Factory : NSObject

#pragma button

+ (UIButton *)createButtonWithTitle:(NSString *)title frame:(CGRect)frame target:(id)target action:(SEL)selector;

+ (UIButton *)createButtonWithTitle:(NSString *)title frame:(CGRect)frame backgroundColor:(UIColor *)backgroundColor target:(id)target action:(SEL)selector;

+ (UIButton *)createButtonWithTitle:(NSString *)title frame:(CGRect)frame backgroundColor:(UIColor *)backgroundColor backgroundImage:(UIImage *)backImage target:(id)target action:(SEL)selector;

+ (UIButton *)createButtonWithTitle:(NSString *)title frame:(CGRect)frame backgroundColor:(UIColor *)backgroundColor image:(UIImage *)image backgroundImage:(UIImage *)backImage target:(id)target action:(SEL)selector;

#pragma textField

+ (UITextField *)createTextFieldWithFrame:(CGRect)frame text:(NSString *)text;

+ (UITextField *)createTextFieldWithFrame:(CGRect)frame  placeholder:(NSString *)placeholde;

+ (UITextField *)createTextFieldWithFrame:(CGRect)frame borderStyle:(UITextBorderStyle)style backgroundColor:(UIColor*)color placeholder:(NSString *)placeholder;

+ (UITextField *)createTextFieldWithFrame:(CGRect)frame borderStyle:(UITextBorderStyle)style backgroundColor:(UIColor*)color placeholder:(NSString *)placeholder secureTextEntry:(BOOL)secure;

#pragma label

+ (UILabel *)createLabelWithFrame:(CGRect)frame text:(NSString *)text  systemFontOfSize:(float)size;

+ (UILabel *)createLabelWithFrame:(CGRect)frame text:(NSString *)text backgroundColor:(UIColor*)backColor textColor:(UIColor*)textColor textAlignment:(NSTextAlignment)textAlignment font:(UIFont*)font;

#pragma imageview
+ (UIImageView *)createImageViewWithFrame:(CGRect)frame imageName:(NSString *)imageName;

#pragma view

+ (UIView *)createViewWithFrame:(CGRect)frame backgroundColor:(UIColor*)color;

#pragma mark 弹窗
+(void)createAlertTitle:(NSString *)title message:(NSString *)message passSelf:(id)passSelf;

#pragma 正则限制邮箱
+ (BOOL)validateEmail:(NSString *)email;

#pragma 正则限制手机号
+ (BOOL)validateMobile:(NSString *)mobile;

#pragma mark-判断用户是否登录过
+ (BOOL) isDenglu;
//判断数据是否为空
+ (BOOL) isBlankData:(id)data;
//判断字符串是否为空
+ (BOOL) isBlankString:(NSString *)str;
#pragma mark-判断用屏幕尺寸
+ (NSString *) currentResolution;
//判断网络请求数据问题
+ (BOOL)errorInfoDataStatus:(id)data :(NSString *)status;
+ (BOOL)errorInfoData:(id)data;
+ (BOOL)errorInfo;
+ (void)findIsOpenHF;//是否开回复
//判断密码是否是数字字母
+ (BOOL)checkIsHaveNumAndLetter:(NSString*)pPassword;
+ (NSString *)positiveFormat:(NSString *)text;//加千分位
//加千分位不保留小数
+ (NSString *)positiveFormatNoSX:(NSString *)text;
@end
