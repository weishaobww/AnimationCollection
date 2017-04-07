//
//  CombineViewController.m
//  iOS动画集合
//
//  Created by bww on 2017/2/15.
//  Copyright © 2017年 bww. All rights reserved.
//

#import "CombineViewController.h"

@interface CombineViewController ()
{
    UIImageView *_imageView;
}
@end

@implementation CombineViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    _imageView = [[UIImageView alloc]initWithFrame:CGRectMake(30, 60, 150, 50)];
    _imageView.image = [UIImage imageNamed:@"3"];
    [self.view addSubview:_imageView];
    
    
    //组合动画,将图像向下移动,同时图像的透明度变化
    
    //同时运行多个动画效果
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:2.0];
    [_imageView setAlpha:0.0];
    [UIView commitAnimations];
    
    
    
    [UIView beginAnimations:nil context:nil];     //开始动画
    [UIView setAnimationDuration:2.0];           //动画时长
    //图像向下移动
    CGPoint point = _imageView.center;
    point.y +=150;
    [_imageView setCenter:point];
    [UIView commitAnimations];                    //提交动画
    
}


@end
