//
//  CASpringAnimationVController.m
//  iOS动画集合
//
//  Created by mzq on 2017/2/14.
//  Copyright © 2017年 bww. All rights reserved.
//

#import "CASpringAnimationVController.h"

@interface CASpringAnimationVController ()

@end

@implementation CASpringAnimationVController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor whiteColor];
    
    [self springAnimation];
}

- (void)springAnimation {

    UILabel * redLbl = [[UILabel alloc]initWithFrame:CGRectMake(100, 100, 100, 100)];
    redLbl.backgroundColor = [UIColor redColor];
    [self.view addSubview:redLbl];
    
    //也可以写 position.y
    CASpringAnimation * spring = [CASpringAnimation animationWithKeyPath:@"position.x"];
    
    //阻尼系数，阻止弹簧伸缩的系数，阻尼系数越大，停止越快
    spring.damping = 5;
    
    //刚度系数(劲度系数/弹性系数)，刚度系数越大，形变产生的力就越大，运动越快
    spring.stiffness = 100;
    
    //质量，影响图层运动时的弹簧惯性，质量越大，弹簧拉伸和压缩的幅度越大
    spring.mass = 1;
    
    //初始速率，动画视图的初始速度大小   速率为正数时，速度方向与运动方向一致，速率为负数时，速度方向与运动方向相反
    spring.initialVelocity = 0;
    
    spring.fromValue = @(redLbl.layer.position.x);
    spring.toValue = @(redLbl.layer.position.x + 50);
    
    //settlingDuration  结算时间 返回弹簧动画到停止时的估算时间，根据当前的动画参数估算通常弹簧动画的时间使用结算时间比较准确
    spring.duration =  spring.settlingDuration;
    
    [redLbl.layer addAnimation:spring forKey:spring.keyPath];
}




@end
