//
//  CABasicAnimationVController.m
//  iOS动画集合
//
//  Created by mzq on 2017/2/14.
//  Copyright © 2017年 bww. All rights reserved.
//

#import "CABasicAnimationVController.h"

@interface CABasicAnimationVController ()

@end

@implementation CABasicAnimationVController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.automaticallyAdjustsScrollViewInsets = NO;
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    //添加到layer层的动画(CABasicAnimation)
    //对一个view进行core animation动画，本质上是对该view的.layer进行动画操纵
    
    
    [self positionCABasicAnimation];
    
    [self scaleCABasicAnimation];
    
    [self opacityCABasicAnimation];
    
    [self rotationCABasicAnimation];
    
    [self boundsCABasicAnimation];
}

//(1)位置移动   position
- (void)positionCABasicAnimation {

    UILabel * redLbl = [[UILabel alloc]initWithFrame:CGRectMake(50, 80, 80, 80)];
    redLbl.backgroundColor = [UIColor redColor];
    redLbl.text = @"位置移动动画";
    redLbl.textColor = [UIColor whiteColor];
    redLbl.adjustsFontSizeToFitWidth = YES;
    [self.view addSubview:redLbl];
    
    //position不能写错,是系统自定义的
    //keypath类型要和fromvalue tovalue类型匹配
    //position 表示位置移动
    
    CABasicAnimation * position = [CABasicAnimation animationWithKeyPath:@"position"];
    position.toValue = [NSValue valueWithCGRect:CGRectMake(200, 120, 80, 80)];
    position.duration = 2;
    //动画结束是否移除(就是不返回原来的位置),下面两行代码一起写
    position.removedOnCompletion = NO;
    position.fillMode = kCAFillModeForwards;
    
    //自动变回去
    //ani.autoreverses =YES;
    
     //添加动画  (forkey是随便写)
    [redLbl.layer addAnimation:position forKey:@"pst"];
}

//(2)缩放动画  transform.scale
- (void)scaleCABasicAnimation {

    UILabel *label1 =[[UILabel alloc]initWithFrame:CGRectMake(100, 100, 70, 70)];
    label1.backgroundColor =[UIColor blueColor];
    label1.text = @"缩放动画";
    label1.textColor = [UIColor whiteColor];
    label1.adjustsFontSizeToFitWidth = YES;
    [self.view addSubview:label1];
    
    CABasicAnimation * scale = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    scale.toValue = @(3);
    scale.duration = 2;
    //动画结束是否移除(就是不返回原来的位置),下面两行代码一起写
    scale.removedOnCompletion = NO;
    scale.fillMode = kCAFillModeForwards;
    //自动变回去
    //scale.autoreverses = YES;
    
    //添加动画  (forkey是随便写)
    [label1.layer addAnimation:scale forKey:@"sc"];
}


//(3)透明度变化    opacity
- (void)opacityCABasicAnimation{

    UILabel *purpleLbl= [[UILabel alloc]initWithFrame:CGRectMake(20, 400, 70, 70)];
    purpleLbl.backgroundColor =[UIColor purpleColor];
    purpleLbl.text = @"透明度变化动画";
    purpleLbl.textColor = [UIColor whiteColor];
    purpleLbl.adjustsFontSizeToFitWidth = YES;
    [self.view addSubview:purpleLbl];
    
    CABasicAnimation * opacity = [CABasicAnimation animationWithKeyPath:@"opacity"];
    opacity.fromValue = [NSNumber numberWithFloat:1.0];
    opacity.toValue = [NSNumber numberWithFloat:0.1];
    opacity.duration = 2.0f;
    //动画结束是否移除(就是不返回原来的位置),下面两行代码一起写
    opacity.removedOnCompletion = NO;
    opacity.fillMode = kCAFillModeForwards;
    //自动变回去
    //scale.autoreverses = YES;
    
    [purpleLbl.layer addAnimation:opacity forKey:@"opacity"];
}


//(4)旋转动画 transform.rotation.z
- (void)rotationCABasicAnimation {

    UILabel *label3 =[[UILabel alloc]initWithFrame:CGRectMake(50, 500, 70, 70)];
    label3.backgroundColor =[UIColor redColor];
    label3.text = @"旋转动画";
    label3.textColor = [UIColor whiteColor];
    label3.adjustsFontSizeToFitWidth = YES;
    [self.view addSubview:label3];
    //旋转动画
    CABasicAnimation* rotationAnimation =
    [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];//"z"还可以是“x”“y”，表示沿z轴旋转
    rotationAnimation.toValue = [NSNumber numberWithFloat:(2 * M_PI) * 3];
    // 3 is the number of 360 degree rotations
    // Make the rotation animation duration slightly less than the other animations to give it the feel
    // that it pauses at its largest scale value
    rotationAnimation.duration = 2.0f;
    rotationAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut]; //缓入缓出
    [label3.layer addAnimation:rotationAnimation forKey:@"transform.rotation.z"];
}

//(5)界限变化   bounds
- (void)boundsCABasicAnimation
{
    
    UILabel *label4 =[[UILabel alloc]initWithFrame:CGRectMake(50, 600, 70, 70)];
    label4.backgroundColor =[UIColor redColor];
    label4.text = @"界限变化动画";
    label4.textColor = [UIColor whiteColor];
    label4.adjustsFontSizeToFitWidth = YES;
    [self.view addSubview:label4];
    //界限
    CABasicAnimation *boundsAnimation = [CABasicAnimation animationWithKeyPath:@"bounds"];
    boundsAnimation.fromValue = [NSValue valueWithCGRect: label4.layer.bounds];
    boundsAnimation.toValue = [NSValue valueWithCGRect:CGRectZero];
    boundsAnimation.duration =3.0;
    [label4.layer addAnimation:boundsAnimation forKey:@"bounds"];
    
}

@end
