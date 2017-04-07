//
//  ContextViewController.m
//  iOS动画集合
//
//  Created by bww on 2017/2/15.
//  Copyright © 2017年 bww. All rights reserved.
//

#import "ContextViewController.h"

@interface ContextViewController ()
{
    UIImageView *_imageView;
}
@end

@implementation ContextViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    _imageView = [[UIImageView alloc]initWithFrame:CGRectMake(30, 60, 150, 50)];
    _imageView.image = [UIImage imageNamed:@"3"];
    [self.view addSubview:_imageView];
    
    //指定上下文动画
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    [UIView beginAnimations:nil context:context];
    [UIView setAnimationDuration:3.0];
    [_imageView setAlpha:0.5];
    [UIView commitAnimations];
}


@end
