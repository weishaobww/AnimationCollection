//
//  SingleViewController.m
//  iOS动画集合
//
//  Created by bww on 2017/2/15.
//  Copyright © 2017年 bww. All rights reserved.
//

#import "SingleViewController.h"

@interface SingleViewController ()
{
    UIImageView *_imageView;
}
@end

@implementation SingleViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    _imageView = [[UIImageView alloc]initWithFrame:CGRectMake(30, 60, 150, 50)];
    _imageView.image = [UIImage imageNamed:@"3"];
    [self.view addSubview:_imageView];
    
    
    //基本写法,代码必须放在Begin和Commit之间
    //[UIView beginAnimations:nil context:nil];   //开始动画
    //code ...
    //[UIView commitAnimations];                 //提交动画
    
    
    [UIView beginAnimations:nil context:nil];   //开始动画
    [UIView setAnimationDuration:2.0];
    //图像向下移动
    CGPoint point = _imageView.center;
    point.y +=150;
    [_imageView setCenter:point];
    [UIView commitAnimations];                 //提交动画
    
}

@end
