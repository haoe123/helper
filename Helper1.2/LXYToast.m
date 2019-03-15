//
//  LXYToast.m
//
//  Created by garyxuan on 16-7-13.
//  Copyright (c) 2016年 wangxiaoxuan. All rights reserved.

#import "LXYToast.h"
#define ToastTextFont  [UIFont boldSystemFontOfSize:15]
#define ToastTextColor [UIColor whiteColor]
#define ToastTextBackgroundColor [UIColor clearColor]
#define ToastBackgroundColor [UIColor colorWithRed:0 green:0 blue:0 alpha:0.7]
#define ToastDispalyDuration 1.5f

@interface LXYToast ()
@property (nonatomic,strong) UIButton *contentView;
@property (nonatomic,assign) CGFloat duration;
@end

@implementation LXYToast
- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIDeviceOrientationDidChangeNotification object:[UIDevice currentDevice]];
}

- (id)initWithText:(NSString*)text
{
    if (self = [super init]) {
        NSDictionary * dict=[NSDictionary dictionaryWithObject:ToastTextFont forKey:NSFontAttributeName];
        CGRect rect=[text boundingRectWithSize:CGSizeMake(250,CGFLOAT_MAX) options:NSStringDrawingTruncatesLastVisibleLine|NSStringDrawingUsesFontLeading|NSStringDrawingUsesLineFragmentOrigin attributes:dict context:nil];
        UILabel *textLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0,rect.size.width + 40, rect.size.height+ 10)];
        textLabel.backgroundColor = ToastTextBackgroundColor;
        textLabel.textColor = ToastTextColor;
        textLabel.textAlignment = NSTextAlignmentCenter;
        textLabel.font = ToastTextFont;
        textLabel.text = text;
        textLabel.numberOfLines = 0;

        UIButton *contentView = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, textLabel.frame.size.width, textLabel.frame.size.height)];
        _contentView = contentView;
        _contentView.layer.cornerRadius = 5.0f;
        _contentView.backgroundColor = ToastBackgroundColor;
        [_contentView addSubview:textLabel];
        _contentView.autoresizingMask = UIViewAutoresizingFlexibleWidth;
        [_contentView addTarget:self action:@selector(toastTaped:) forControlEvents:UIControlEventTouchDown];
        _contentView.alpha = 0.0f;
        _duration = ToastDispalyDuration;
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(deviceOrientationDidChanged) name:UIDeviceOrientationDidChangeNotification object:[UIDevice currentDevice]];
    }
    return self;
}

- (void)deviceOrientationDidChanged
{
    [self dismiss];
}

- (void)toastTaped:(UIButton *)sender
{
    [self dismiss];
}

- (void)appear
{
    [UIView beginAnimations:@"appear" context:NULL];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseIn];
    [UIView setAnimationDuration:0.3];
    _contentView.alpha = 1.0f;
    [UIView commitAnimations];
}

- (void)dismiss
{
    [UIView beginAnimations:@"dismiss" context:NULL];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseOut];
    [UIView setAnimationDelegate:self];
    [UIView setAnimationDidStopSelector:@selector(didDismiss)];
    [UIView setAnimationDuration:0.3];
    _contentView.alpha = 0.0f;
    [UIView commitAnimations];
}

- (void)didDismiss
{
    [_contentView removeFromSuperview];
    _contentView = nil;
}

- (void)show
{
    // Displayed on the top of app
    UIWindow *window = [[[UIApplication sharedApplication] windows] lastObject];
    _contentView.center = window.center;
    [window  addSubview:_contentView];
    [self appear];
    [self performSelector:@selector(dismiss) withObject:nil afterDelay:_duration];
}

- (void)showTopWithOffset:(CGFloat)offset{
    UIWindow *window = [[[UIApplication sharedApplication] windows] lastObject];
    _contentView.center = CGPointMake(window.center.x, offset + _contentView.frame.size.height/2);
    [window  addSubview:_contentView];
    [self appear];
    [self performSelector:@selector(dismiss) withObject:nil afterDelay:_duration];
}

- (void)showBottomWithOffset:(CGFloat)offset{
    UIWindow *window = [[[UIApplication sharedApplication] windows] lastObject];
    _contentView.center = CGPointMake(window.center.x, window.frame.size.height-(offset + _contentView.frame.size.height/2));
    [window  addSubview:_contentView];
    [self appear];
    [self performSelector:@selector(dismiss) withObject:nil afterDelay:_duration];
}


#pragma mark -对外接口 External interface
 + (void)showText:(NSString*)text
 {
    [LXYToast showText:text position:LXYToastPositionCenter offset:0.0f duration:ToastDispalyDuration];
 }

 + (void)showText:(NSString*)text position:(LXYToastPosition)position
 {
    [LXYToast showText:text position:position offset:0.0f duration:ToastDispalyDuration];
 }

 + (void)showText:(NSString*)text position:(LXYToastPosition)position duration:(CGFloat)duration
 {
    [LXYToast showText:text position:position offset:0.0f duration:duration];
 }

 + (void)showText:(NSString*)text position:(LXYToastPosition)position offset:(CGFloat)offset duration:(CGFloat)duration
 {
    LXYToast *toast = [[LXYToast alloc] initWithText:text];
    [toast setDuration:duration];
    if (position == LXYToastPositionCenter)
    {
        [toast show];
    }else if (position == LXYToastPositionTop)
    {
        [toast showTopWithOffset:offset];
    }else if (position == LXYToastPositionBottom)
    {
        [toast showBottomWithOffset:offset];
    }
 }


@end