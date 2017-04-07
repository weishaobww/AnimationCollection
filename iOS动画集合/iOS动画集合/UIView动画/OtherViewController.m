//
//  OtherViewController.m
//  iOS动画集合
//
//  Created by bww on 2017/2/15.
//  Copyright © 2017年 bww. All rights reserved.
//

#import "OtherViewController.h"

@interface OtherViewController ()

@end

@implementation OtherViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    
    //开始动画
    // + (void)beginAnimations:(nullable NSString *)animationID context:(nullable void *)context;
    
    //提交动画
    //+(void)commitAnimations;
    
    
    //设置动画代理
    //+ (void)setAnimationDelegate:(nullable id)delegate;
    
    //动画将要开始时执行方法**(必须先设置动画代理)
    //+ (void)setAnimationWillStartSelector:(nullable SEL)selector;
    
    //动画已结束时执行方法**(必须先设置动画代理)
    //+ (void)setAnimationDidStopSelector:(nullable SEL)selector;
    
    
    
    //设置动画延迟执行(delay: 秒为单位)
    //+ (void)setAnimationDelay:(NSTimeInterval)delay;
    
    
    //设置曲线动画,默认是匀速进行:
    //+ (void)setAnimationCurve:(UIViewAnimationCurve)curve;
    
    //动画的重复播放此时
    //+ (void)setAnimationRepeatCount:(float)repeatCount;
    
    //如果为YES,逆向(相反)动画效果,结束后返回动画逆向前的状态,默认为NO
    //+ (void)setAnimationRepeatAutoreverses:(BOOL)repeatAutoreverses;
    
    
    /**
     @param transition 动画的过度效果
     @param view       过渡效果作用视图
     @param  cache     如果为YES,开始和结束视图分别渲染一次并在动画中创建帧;否则,视图将会渲染每一帧.例如,你不需要再视图转变中不停的更新, 你只需要等到转换完成再去更新视图
     */
    //+ (void)setAnimationTransition:(UIViewAnimationTransition)transition forView:(UIView *)view cache:(BOOL)cache;
    
    //默认为YES,为NO时跳过动画效果,直接跳到执行后的状态
    //+ (void)setAnimationsEnabled:(BOOL)enabled;
    
}

@end
