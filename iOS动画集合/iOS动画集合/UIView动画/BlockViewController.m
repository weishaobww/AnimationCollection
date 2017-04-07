//
//  BlockViewController.m
//  iOS动画集合
//
//  Created by bww on 2017/2/15.
//  Copyright © 2017年 bww. All rights reserved.
//

#import "BlockViewController.h"

@interface BlockViewController ()
{
    UIImageView *_imageView;
}
@end

@implementation BlockViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    _imageView = [[UIImageView alloc]initWithFrame:CGRectMake(30, 60, 150, 50)];
    _imageView.image = [UIImage imageNamed:@"3"];
    [self.view addSubview:_imageView];

    
    
    //方法一:
    [UIView animateWithDuration:3.0 animations:^{
        
        //code
    }];
    
    
    //方法二:
    [UIView animateWithDuration:3.0 animations:^{
        //code...
        
    } completion:^(BOOL finished) {
        //动画完成之后
        //code...
    }];
    
    
    //方法三:
    //参数一:动画时长   参数二:动画延迟  参数三:动画过渡效果
    [UIView animateWithDuration:3.0 delay:2.0 options:UIViewAnimationOptionCurveEaseIn animations:^{
        
        //code...
    } completion:^(BOOL finished) {
        //动画完成后执行
        //code...
    }];
    
    
    //方法四:
    //参数一:动画时长  参数二:动画延迟  参数三:类似弹簧振动效果 0~1   参数四:初始速度
    //参数五:动画过渡效果
    [UIView animateWithDuration:3.0 delay:0.0 usingSpringWithDamping:1.0 initialSpringVelocity:5.0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        CGPoint point = _imageView.center;
        point.y += 150;
        [_imageView setCenter:point];
        [_imageView setAlpha:0];
        
    } completion:^(BOOL finished) {
        
        //动画完成后执行
        //code
        [_imageView setAlpha:1];
    }];

    
}

@end
