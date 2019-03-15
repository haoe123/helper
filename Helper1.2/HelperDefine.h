//
//  HelperDefine.h
//  Homework
//
//  Created by wanghailong on 15/12/31.
//  Copyright © 2015年 HailongExcellency. All rights reserved.
//

#ifndef HelperDefine_h
#define HelperDefine_h
/*
 抱歉，您的可用余额小于1元
 抱歉，您的新手标额度不足，只能购买XXX元，确认购买？
 抱歉，您的本次购买还差XXXXX元，去充值？
 抱歉，您所购买的标的剩余金额额度不足，只能购买XXX元，确认购买？
 抱歉，您已不是新手了，新手标仅限新手投资
 请填写正确的手机号码
 账号密码不匹配
 验证码输入错误
 短信验证码输入错误
 两次输入的密码不一致，请重新输入
 */
//定义RGB值
#define RGBA(r, g, b, a) [UIColor colorWithRed:r/255.0f green:g/255.0f blue:b/255.0f alpha:a]
#define RGB(r, g, b) RGBA(r, g, b, 1.f)
#define RandomColor RGB(arc4random()%255, arc4random()%255, arc4random()%255)
#define textStr @"http://api.playsm.com/index.php"
#define showText1 @" 抱歉，您的可用余额小于1元"
#define showText2 @"  抱歉，您的新手标额度不足，只能购买元，确认购买？"
#define showText3 @"  抱歉，您的本次购买还差XXXXX元，去充值？"
#define showText4 @"  抱歉，您所购买的标的剩余金额额度不足，只能购买XXX元，确认购买？"
#define showText5 @" 抱歉，您已不是新手了，新手标仅限新手投资"
#define showText6 @"  请填写正确的手机号码"
#define showText7 @"  账号密码不匹配"
#define showText8 @"  验证码输入错误"
#define showText9 @"  短信验证码输入错误"
#define showText10 @"  两次输入的密码不一致，请重新输入"

//ios系统版本
#define ios8x [[[UIDevice currentDevice] systemVersion] floatValue] >=8.0f
#define ios7x ([[[UIDevice currentDevice] systemVersion] floatValue] >= 7.0f) && ([[[UIDevice currentDevice] systemVersion] floatValue] < 8.0f)
#define ios6x [[[UIDevice currentDevice] systemVersion] floatValue] < 7.0f
#define iosNot6x [[[UIDevice currentDevice] systemVersion] floatValue] >= 7.0f


#define iphone4x_3_5 ([UIScreen mainScreen].bounds.size.height==480.0f)

#define iphone5x_4_0 ([UIScreen mainScreen].bounds.size.height==568.0f)

#define iphone6_4_7 ([UIScreen mainScreen].bounds.size.height==667.0f)

#define iphone6Plus_5_5 ([UIScreen mainScreen].bounds.size.height==736.0f || [UIScreen mainScreen].bounds.size.height==414.0f)

//屏幕宽高
#define kScreenW [[UIScreen mainScreen] bounds].size.width
#define kScreenH [[UIScreen mainScreen] bounds].size.height

//屏幕frame,bounds,size
#define kScreenFrame [UIScreen mainScreen].bounds
#define kScreenBounds [UIScreen mainScreen].bounds
#define kScreenSize [UIScreen mainScreen].bounds.size



#define rgb(r,g,b) [UIColor colorWithRed:r/255.0f green:g/255.0f blue:b/255.0f alpha:1.0f]
#define rgba(r,g,b,a) [UIColor colorWithRed:r/255.0f green:g/255.0f blue:b/255.0f alpha:a]
#define hexColor(colorV) [UIColor colorWithHexColorString:@#colorV]
#define hexColorAlpha(colorV,a) [UIColor colorWithHexColorString:@#colorV alpha:a];


#define StringFromInteger(i) [NSString stringWithFormat:@"%@",@(i)]
//定义屏幕宽度
#define ScreenWidth [UIScreen mainScreen].bounds.size.width
//定义屏幕高度
#define ScreenHeight [UIScreen mainScreen].bounds.size.height
//手机号
#define phoneOldNumber [[NSUserDefaults standardUserDefaults] objectForKey:@"uiPhone"]
#pragma 颜色



#define WhiteColor [UIColor whiteColor]
#define BlackColor [UIColor blackColor]
#define BlueColor [UIColor blueColor]
#define YellowColor [UIColor yellowColor]
#define GreenColor [UIColor greenColor]
#define OrangeColor [UIColor orangeColor]
#define ClearColor [UIColor clearColor]
#define GrayColor [UIColor grayColor]
#define CyanColor [UIColor cyanColor]
#define RedColor [UIColor redColor]
#define SkyColor RGBA(38,187,251,1)
//#define FenColor RGB(255,101,110);
#define FenColor RGBA(243,150,193,1)
#define FenHuangColor RGBA(255,242,190,1)
#define HuiColor RGBA(200,200,200,1)
#define danFenColor RGBA(255,246,220,1)
#define MyBlueColor RGBA(45,150,255,1)
#define MyRedColor RGBA(201,6,6,1)
#define MyGrayColor RGBA(230,230,230,1)
#define MyYellowColor RGBA(253,182,61,1)
#define MyRedColor RGBA(245,41,0,1)
//colorWithRed:45/255.0f green:150/255.0f blue:255/255.0f alpha:1
#endif /* HelperDefine_h */



//用户名
#define LoginName [[NSUserDefaults standardUserDefaults] objectForKey:@"LoginName"]

#define Token [[NSUserDefaults standardUserDefaults] objectForKey:@"token"]

#define isOpenHF [[NSUserDefaults standardUserDefaults] objectForKey:@"isOpenHF"]

#define useriiId [[NSUserDefaults standardUserDefaults] objectForKey:@"userId"]

#define isActive [[NSUserDefaults standardUserDefaults] objectForKey:@"isActive"]//线上线下

#define isSpecicalUser [[NSUserDefaults standardUserDefaults] objectForKey:@"isSpecicalUser"]//是否是特殊用户

#define isVip [[NSUserDefaults standardUserDefaults] objectForKey:@"vip"]//vip
