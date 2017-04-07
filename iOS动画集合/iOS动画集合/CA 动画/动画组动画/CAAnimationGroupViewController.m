//
//  CAAnimationGroupViewController.m
//  iOS动画集合
//
//  Created by mzq on 16/7/28.
//  Copyright © 2016年 bww. All rights reserved.
//

#import "CAAnimationGroupViewController.h"

@interface CAAnimationGroupViewController ()

@property(nonatomic,strong)UIView *redView;

@end

@implementation CAAnimationGroupViewController

- (void)viewDidLoad {
    [super viewDidLoad];


    self.title = @"CAAnimationGroup 动画组";
    self.view.backgroundColor = [UIColor whiteColor];
    
    
    self.redView = [[UIView alloc]initWithFrame:CGRectMake(250, 250, 100, 100)];
    self.redView.backgroundColor = [UIColor redColor];
    [self.view addSubview:self.redView];
    
}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    // 1.创建一个动画组
    CAAnimationGroup * animationGroup = [CAAnimationGroup animation];
    
    // 2.设置动画组中的动画
    // 2.1.缩放动画
    CABasicAnimation * scaleAnimation = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    scaleAnimation.toValue = @(0.5);
    
    // 2.2.旋转动画
    CABasicAnimation * rotationAnimation = [CABasicAnimation animationWithKeyPath:@"transform.rotation"];
    rotationAnimation.toValue = @(arc4random_uniform(M_PI));
    
    // 2.3.位移动画
    CABasicAnimation *positionAnimation = [CABasicAnimation animation];
    
    positionAnimation.keyPath = @"position";
    positionAnimation.toValue = [NSValue valueWithCGPoint:CGPointMake(160, 500)];
    
    // 2.4.将动画添加到动画组中
    animationGroup.animations = @[scaleAnimation, rotationAnimation, positionAnimation];
    
    animationGroup.duration = 5;
    
//    animationGroup.removedOnCompletion = NO;
//    animationGroup.fillMode = kCAFillModeForwards;
    
    // 3.将动画组添加到视图的layer层
    [self.redView.layer addAnimation:animationGroup forKey:nil];
}

@end
