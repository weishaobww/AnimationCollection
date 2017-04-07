//
//  CATransitionViewController.m
//  iOS动画集合
//
//  Created by mzq on 16/7/28.
//  Copyright © 2016年 bww. All rights reserved.
//

/*
 给视图切换的时候添加动画效果
 转场动画类型
 fade           交叉淡化过渡
 push           新视图把旧视图推出去
 moveIn         新视图移到旧视图上面
 reveal         将旧视图移开,显示下面的新视图
 cube           立方体翻滚效果
 oglflip        上下左右翻转效果
 suckEffect     收缩效果,如一块布被抽走
 rippleEffect   水滴效果
 pageCurl       向上翻页效果
 pageUnCurl     向下翻页效果
 cameraIrisHollowOpen  相机镜头打开效果
 cameraIrisHollowClose  相机镜头关闭效果
 */

#import "CATransitionViewController.h"

@interface CATransitionViewController ()
{
    NSInteger _index;
}

@end

@implementation CATransitionViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.title = @"CATransition 转场动画";
    self.view.backgroundColor = [UIColor whiteColor];
    
     _index = 1;
    
    [self pictureCATransition];
    
}

- (void)pictureCATransition {
    
    for (int i = 0 ; i < 12; i ++) {
        CGFloat row = i / 3;
        CGFloat column = i % 3;
        CGFloat margin = 20;
        UIImageView * imageView = [[UIImageView alloc]initWithFrame:CGRectMake(margin + column * (100 + margin), 100 + row *(100 + margin), 100, 100)];
        imageView.image  = [UIImage imageNamed:@"1"];
        imageView.tag = 100 + i;
        [self.view addSubview:imageView];
    }
    
    [NSTimer scheduledTimerWithTimeInterval:2 target:self selector:@selector(chagePic) userInfo:nil repeats:YES];
}

- (void)chagePic {
    
    _index++;
    if (_index == 4) {
        _index = 1;
    }
    
    NSArray * types = @[@"fade",@"push",@"moveIn",@"reveal",@"cube",@"oglflip",@"suckEffect",@"rippleEffect",@"pageCurl",@"pageUnCurl",@"cameraIrisHollowOpen",@"cameraIrisHollowClose"];
    
    for (int i = 0; i < 12; i ++) {
        UIImageView * imgV = [self.view viewWithTag:100 + i];
        imgV.image = [UIImage imageNamed:[NSString stringWithFormat:@"%ld",_index]];
        
        // 创建转场动画对象
        CATransition *anim = [CATransition animation];
        // 设置转场类型
        anim.type = types[i];
        // 设置动画的方向
        anim.subtype = kCATransitionFromLeft;
        anim.duration = 2;
        
        [imgV.layer addAnimation:anim forKey:nil];
    }

}

@end
