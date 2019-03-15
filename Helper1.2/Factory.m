//
//  Factory.m
//  UINavigationControllerDemo2
//
//  Created by qianfeng0 on 16/1/4.
//  Copyright (c) 2016年 XinYa.Li. All rights reserved.
//

#import "Factory.h"

@implementation Factory

+ (UIButton *)createButtonWithTitle:(NSString *)title frame:(CGRect)frame target:(id)target action:(SEL)selector{
    UIColor *color = MyRedColor;
    return [self createButtonWithTitle:title frame:frame backgroundColor:color target:target action:selector];
}

+ (UIButton *)createButtonWithTitle:(NSString *)title frame:(CGRect)frame backgroundColor:(UIColor *)backgroundColor target:(id)target action:(SEL)selector{
    
    return [self createButtonWithTitle:title frame:frame backgroundColor:backgroundColor backgroundImage:nil target:target action:selector];
}

+ (UIButton *)createButtonWithTitle:(NSString *)title frame:(CGRect)frame backgroundColor:(UIColor *)backgroundColor backgroundImage:(UIImage *)backImage target:(id)target action:(SEL)selector{
    
    return [self createButtonWithTitle:title frame:frame backgroundColor:backgroundColor image:nil backgroundImage:backImage target:target action:selector];
}

+ (UIButton *)createButtonWithTitle:(NSString *)title frame:(CGRect)frame backgroundColor:(UIColor *)backgroundColor image:(UIImage *)image backgroundImage:(UIImage *)backImage target:(id)target action:(SEL)selector{
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setTitle:title forState:UIControlStateNormal];
    button.frame = frame;
    button.backgroundColor = backgroundColor;
    [button setImage:image forState:UIControlStateNormal];
    [button setBackgroundImage:backImage forState:UIControlStateNormal];
    [button addTarget:target action:selector forControlEvents:UIControlEventTouchUpInside];
    button.layer.cornerRadius = 7.f;
    button.layer.masksToBounds = YES;
    return button;
}

+ (UITextField *)createTextFieldWithFrame:(CGRect)frame text:(NSString *)text{
    UITextField *textField = [self createTextFieldWithFrame:frame placeholder:nil];
    textField.text = text;
    return textField;
}

+ (UITextField *)createTextFieldWithFrame:(CGRect)frame  placeholder:(NSString *)placeholder{
    return [self createTextFieldWithFrame:frame borderStyle:UITextBorderStyleRoundedRect backgroundColor:[UIColor grayColor] placeholder:placeholder];
}

+ (UITextField *)createTextFieldWithFrame:(CGRect)frame borderStyle:(UITextBorderStyle)style backgroundColor:(UIColor*)color placeholder:(NSString *)placeholder{
    return [self createTextFieldWithFrame:frame borderStyle:style backgroundColor:color placeholder:placeholder secureTextEntry:NO];
}

+ (UITextField *)createTextFieldWithFrame:(CGRect)frame borderStyle:(UITextBorderStyle)style backgroundColor:(UIColor*)color placeholder:(NSString *)placeholder secureTextEntry:(BOOL)secure{
    UITextField *textField = [[UITextField alloc]init];
    textField.frame = frame;
    textField.borderStyle = style;
    textField.backgroundColor = color;
    textField.placeholder = placeholder;
    textField.secureTextEntry = secure;
    return textField;
}

+ (UILabel *)createLabelWithFrame:(CGRect)frame text:(NSString *)text  systemFontOfSize:(float)size{
    return [self createLabelWithFrame:frame text:text backgroundColor:[UIColor clearColor] textColor:[UIColor blackColor] textAlignment:NSTextAlignmentCenter font:[UIFont italicSystemFontOfSize:size]];
}


+ (UILabel *)createLabelWithFrame:(CGRect)frame text:(NSString *)text backgroundColor:(UIColor*)backColor textColor:(UIColor*)textColor textAlignment:(NSTextAlignment)textAlignment font:(UIFont*)font {
    UILabel *label = [[UILabel alloc]initWithFrame:frame];
    label.text = text;
    label.backgroundColor = backColor;
    label.textColor = textColor;
    label.textAlignment = textAlignment;
    label.font = font;
    return label;
}

+ (UIImageView *)createImageViewWithFrame:(CGRect)frame imageName:(NSString *)imageName{
    UIImageView *imageView = [[UIImageView alloc]initWithFrame:frame];
    imageView.image = [UIImage imageNamed:imageName];
    return imageView;
}

+ (UIView *)createViewWithFrame:(CGRect)frame backgroundColor:(UIColor*)color{
    UIView *view = [[UIView alloc]initWithFrame:frame];
    view.backgroundColor = color;
    return view;
}

+(void)createAlertTitle:(NSString *)title message:(NSString *)message passSelf:(id)passSelf {
    if (!title) {
        title = @"提示";
    }
    UIAlertController *alert=[UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
    //创建一个action
    UIAlertAction *cancel=[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleCancel handler:nil];
    [alert addAction:cancel];
    [passSelf presentViewController:alert animated:YES completion:nil];
}

#pragma mark-正则表达式//邮箱验证
+ (BOOL)validateEmail:(NSString *)email
{
    NSString *emailRegex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    return [emailTest evaluateWithObject:email];
}
#pragma mark-正则表达式//手机号验证
+ (BOOL)validateMobile:(NSString *)mobile
{
    //手机号以13，14， 15，17，18开头，八个 \d 数字字符
    NSString *phoneRegex = @"1[3|4|5|7|8|][0-9]{9}";
    NSPredicate *phoneTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",phoneRegex];
    return [phoneTest evaluateWithObject:mobile];
}


#pragma mark-判断用户是否登录过
+ (BOOL) isDenglu{
    NSString *loginName =  LoginName;
    
    if ([loginName isEqualToString:@""]||!loginName || [Token isEqualToString:@""] || !Token)
    {
        return NO;
    }
    else
    {
        return YES;
    }
}
//判断数据是否为空
+ (BOOL) isBlankData:(id)data {
    if ([data isEqual: [NSNull null] ]||data == nil||data == NULL) {
        return YES;
    }

    return NO;
}
//判断字符串是否为空
+ (BOOL) isBlankString:(NSString *)string {
    
    if (string == nil || string == NULL) {
        
        return YES;
        
    }
    
    if ([string isKindOfClass:[NSNull class]]) {
        
        return YES;
        
    }
    
    if ([[string stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]] length]==0) {
        
        return YES;
        
    }
    
    return NO;
    
}
#pragma mark-判断用屏幕尺寸
+ (NSString *) currentResolution {
    float h=ScreenHeight;
    NSString *str=[NSString stringWithFormat:@"%f",h];

    if ([str isEqualToString:@"480.000000"]) {
        
        return @"4";
        
    }else if([str isEqualToString:@"568.000000"]){
        
        return @"5";
        
    }else if([str isEqualToString:@"667.000000"]){
        
        return @"6";
        
    }else{
        
        return @"6+";
        
    }
    
}
+ (BOOL)errorInfoDataStatus:(id)data :(NSString *)status{
    if ([[[NSUserDefaults standardUserDefaults] objectForKey:@"errorInfor"] isEqualToString:@"error"]||[data isKindOfClass: [NSNull class]]||data == nil||data == NULL||[status isEqualToString:@"1"]
        ) {
        [[NSUserDefaults standardUserDefaults] setObject:nil forKey:@"errorInfor"];
        return YES;
    }else{
        return NO;
    }
}
+ (BOOL)errorInfoData:(id)data{//如果走了404  数据是没有的  这么传值会崩溃 此方法慎用
    if ([[[NSUserDefaults standardUserDefaults] objectForKey:@"errorInfor"] isEqualToString:@"error"]||[data isKindOfClass: [NSNull class]]||data == nil||data == NULL
) {
        [[NSUserDefaults standardUserDefaults] setObject:nil forKey:@"errorInfor"];
        return YES;
    }else{
        return NO;
    }
}
+ (BOOL)errorInfo{
    if ([[[NSUserDefaults standardUserDefaults] objectForKey:@"errorInfor"] isEqualToString:@"error"]
        ) {
        [[NSUserDefaults standardUserDefaults] setObject:nil forKey:@"errorInfor"];
        return YES;
    }else{
        return NO;
    }
}
//+ (void)findIsOpenHF{//查询是否开通汇付
//    
//    [BMNetwokAPI CheckIsOpenChinaPnrUsername:LoginName successBlock:^(id returnData) {
//        NSLog(@"%@",returnData);
//        NSLog(@"%@",returnData[@"msg"]);
//        //是否开通hf
//
//        [[NSUserDefaults standardUserDefaults] setObject:isHF forKey:@"isOpenHF"];
//        
//    } failureBlock:^(NSError *error) {
//        
//    } showHUD:YES];
//    
//}

#pragma mark-判断密码是否是数字字母
+ (BOOL)checkIsHaveNumAndLetter:(NSString*)pPassword{
    
    NSRegularExpression *tNumRegularExpression = [NSRegularExpression regularExpressionWithPattern:@"[0-9]" options:NSRegularExpressionCaseInsensitive error:nil];
    //数字的个数
    NSInteger tNumMatchCount = [tNumRegularExpression numberOfMatchesInString:pPassword
                                
                                                                      options:NSMatchingReportProgress
                                
                                                                        range:NSMakeRange(0, pPassword.length)];
    
    
    NSRegularExpression *tLetterRegularExpression = [NSRegularExpression regularExpressionWithPattern:@"[A-Za-z]" options:NSRegularExpressionCaseInsensitive error:nil];
    //字母的个数
    NSInteger tLetterMatchCount = [tLetterRegularExpression numberOfMatchesInString:pPassword options:NSMatchingReportProgress range:NSMakeRange(0, pPassword.length)];

    if (tNumMatchCount == pPassword.length){
        //全部是数字
        return NO;
    }else if (tLetterMatchCount == pPassword.length){
        //全部是字母
        return NO;
    }else if (tNumMatchCount + tLetterMatchCount == pPassword.length & tNumMatchCount != 0 & tLetterMatchCount != 0){
        //字母数字混合
        return YES;
    }else{
        //包含非数字 非字母
        return NO;
    }
}
//加千分位
+ (NSString *)positiveFormat:(NSString *)text{
    
    if(!text || [text floatValue] == 0){
        return @"0.00";
    }else{
        if ([[text substringWithRange:NSMakeRange(0,1)]isEqualToString:@"0"]) {
            return text;
        }
        NSNumberFormatter *numberFormatter = [[NSNumberFormatter alloc] init];
        [numberFormatter setPositiveFormat:@",###.00;"];
        return [numberFormatter stringFromNumber:[NSNumber numberWithDouble:[text doubleValue]]];
    }
    return @"";
}
//加千分位不保留小数
+ (NSString *)positiveFormatNoSX:(NSString *)text{
    
    if(!text || [text floatValue] == 0){
        return @"0";
    }else{
        NSNumberFormatter *numberFormatter = [[NSNumberFormatter alloc] init];
        [numberFormatter setPositiveFormat:@",###;"];
        return [numberFormatter stringFromNumber:[NSNumber numberWithDouble:[text doubleValue]]];
    }
    return @"";
}
@end
