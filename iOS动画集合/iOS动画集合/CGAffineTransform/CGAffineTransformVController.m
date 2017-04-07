//
//  CGAffineTransformVController.m
//  iOS动画集合
//
//  Created by bww on 2017/2/15.
//  Copyright © 2017年 bww. All rights reserved.
//


/*
 CoreGraphic框架中的CGAffineTransform类可用于设定UIView的transform属性,控制视图的缩放,旋转和平移操作
 */

#import "CGAffineTransformVController.h"

@interface CGAffineTransformVController ()

@end

@implementation CGAffineTransformVController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor whiteColor];
    
    
    UIButton * makeTranslationBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    makeTranslationBtn.frame = CGRectMake(50, 100, 100, 30);
    makeTranslationBtn.backgroundColor = [UIColor purpleColor];
    [makeTranslationBtn addTarget:self action:@selector(makeTranslation:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:makeTranslationBtn];
    
    
    UIButton * translateBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    translateBtn.frame = CGRectMake(200, 100, 100, 30);
    translateBtn.backgroundColor = [UIColor redColor];
    [translateBtn addTarget:self action:@selector(translate:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:translateBtn];
    
    
    
    UIButton * identityBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    identityBtn.frame = CGRectMake(50, 180, 100, 30);
    identityBtn.backgroundColor = [UIColor greenColor];
    [identityBtn addTarget:self action:@selector(identity:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:identityBtn];
    
    UIButton * makeScaleBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    makeScaleBtn.frame = CGRectMake(200, 180, 100, 30);
    makeScaleBtn.backgroundColor = [UIColor blueColor];
    [makeScaleBtn addTarget:self action:@selector(makeScale:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:makeScaleBtn];
    
    
    UIButton * makeRotationBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    makeRotationBtn.frame = CGRectMake(50, 260, 100, 30);
    makeRotationBtn.backgroundColor = [UIColor yellowColor];
    [makeRotationBtn addTarget:self action:@selector(makeRotation:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:makeRotationBtn];
    
}

//CGAffineTransformMakeTranslation(,):  只能变化一次，因为这种方式的变化始终是以最原始的状态值进行变化的，所以只能变化一次
- (void)makeTranslation:(UIButton *)sender {

    UIButton *transBtn = (UIButton *)sender;
    transBtn.transform = CGAffineTransformMakeTranslation(0, -10);
}

//CGAffineTransformTranslate(CGAffineTransform t, <#CGFloat tx#>, <#CGFloat ty#>):能够多次变化，每次变化都是以上一次的状态（CGAffineTransform t）进行的变化，所以可以多次变化

- (void)translate:(UIButton *)sender {
    
    UIButton *transBtn = (UIButton *)sender;
    transBtn.transform = CGAffineTransformTranslate(transBtn.transform, 0, -10);
}

// CGAffineTransformIdentity:清空所有的设置的transform(一般和动画配合使用，只能使用于transfofrm设置的画面)
- (void)identity:(UIButton *)sender {
    
    UIButton *transBtn = (UIButton *)sender;
    transBtn.transform = CGAffineTransformIdentity;
}

//CGAffineTransformMakeScale( CGFloat  sx,  CGFloat  sy) （缩放:设置缩放比例）仅通过设置缩放比例就可实现视图扑面而来和缩进频幕的效果。
- (void)makeScale:(UIButton *)sender {
    
    UIButton *transBtn = (UIButton *)sender;
    transBtn.transform = CGAffineTransformScale(transBtn.transform, 1.2, 1.2);
}

// CGAffineTransformMakeRotation( CGFloat  angle) （旋转:设置旋转角度
- (void)makeRotation:(UIButton *)sender {
    
    UIButton *transBtn = (UIButton *)sender;
    transBtn.transform = CGAffineTransformMakeRotation(M_PI_2);
    
}


@end
