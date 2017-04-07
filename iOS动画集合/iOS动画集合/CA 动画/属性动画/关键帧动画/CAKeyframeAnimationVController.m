//
//  CAKeyframeAnimationVController.m
//  iOS动画集合
//
//  Created by mzq on 2017/2/14.
//  Copyright © 2017年 bww. All rights reserved.
//

/*
 之所以叫做关键帧动画是因为，这个类可以实现，某一属性按照一串的数值进行动画，就好像制作动画的时候一帧一帧的制作一样。
 
 CABasicAnimation只能从一个数值(fromValue)变到另一个数值(toValue)，而CAKeyframeAnimation会使用一个NSArray保存这些数值
 
  values：就是上述的NSArray对象。里面的元素称为”关键帧”(keyframe)。动画对象会在指定的时间(duration)内，依次显示values数组中的每一个关键帧
 
  path：可以设置一个CGPathRef\CGMutablePathRef,让层跟着路径移动。path只对CALayer的anchorPoint和position起作用。如果你设置了path，那么values将被忽略
 
  keyTimes：可以为对应的关键帧指定对应的时间点,其取值范围为0到1.0,keyTimes中的每一个时间值都对应values中的每一帧.当keyTimes没有设置的时候,各个关键帧的时间是平分的
 */

#warning 链接  http://www.cnblogs.com/wendingding/p/3801330.html
#warning 链接  http://blog.csdn.net/samuelltk/article/details/9048325

#define angle2Radian(angle)  ((angle)/180.0*M_PI)


#import "CAKeyframeAnimationVController.h"

@interface CAKeyframeAnimationVController ()<CAAnimationDelegate>
{
    BOOL   isclick;
}
@property(nonatomic,strong)UIView  *customView;

@property(nonatomic,strong)UIImageView *iconImageView;

@property(nonatomic,strong)UILabel *redLbl;

@end

@implementation CAKeyframeAnimationVController

- (void)viewDidLoad {
    [super viewDidLoad];


    self.view.backgroundColor = [UIColor whiteColor];
    
    [self shakeCAKeyframeAnimation];
    
    [self loveCAKeyframeAnimation];
    
    [self valuesCAKeyframeAnimation];
    
    [self pathCAKeyframeAnimation];
    
}
//点击爱心的动画  (transform.scale)
- (void)loveCAKeyframeAnimation {

    UIButton *btn =[UIButton  buttonWithType:UIButtonTypeSystem];
    btn.center=self.view.center;
    [btn setBackgroundImage:[UIImage  imageNamed:@"profile_btn_unlike@2x"] forState:UIControlStateNormal];
    
    btn.bounds=CGRectMake(0, 0, 50, 50);
    [btn addTarget:self action:@selector(clickme:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:btn];
}


//抖动动画  (图标向左向右偏转一个弧度（4），产生抖动的视觉效果)
- (void)shakeCAKeyframeAnimation {

    self.iconImageView = [[UIImageView alloc]initWithFrame:CGRectMake(100, 300, 100, 100)];
    self.iconImageView.image = [UIImage imageNamed:@"朋友圈.png"];
    [self.view addSubview:self.iconImageView];
    
    //1.创建核心动画
    CAKeyframeAnimation * keyAnima = [CAKeyframeAnimation animation];
    keyAnima.keyPath = @"transform.rotation";
    keyAnima.duration = 0.1;
    
    //设置图标抖动弧度
    //把度数转换为弧度  度数/180*M_PI
    keyAnima.values = @[@(-angle2Radian(4)),@(angle2Radian(4)),@(-angle2Radian(4))];
    //设置动画的重复次数(设置为最大值)
    keyAnima.repeatCount = MAXFLOAT;
    
    keyAnima.removedOnCompletion = NO;
    keyAnima.fillMode = kCAFillModeForwards;
    
    [self.iconImageView.layer addAnimation:keyAnima forKey:keyAnima.keyPath];
}

//放大缩小的动画如果用CABasicAnimation是实现不了的,因为CABasicAnimation只能从一个值到另一个值,而 CAKeyframeAnimation 是通过一串值得变化来实现的
-(void)clickme:(UIButton *)btn {
    
    isclick=!isclick;
    
    [btn setBackgroundImage:[UIImage  imageNamed:(isclick==YES?@"profile_btn_like@2x":@"profile_btn_unlike@2x")] forState:UIControlStateNormal];

    CAKeyframeAnimation * keyframe = [CAKeyframeAnimation animation];
    keyframe.keyPath = @"transform.scale";
    
    //大小从1 到 1.4 再到 0.9 再到 1.15 最后返回原来的大小
    keyframe.values = @[@1.0 ,@1.4, @0.9, @1.15, ];
    //keyTimes：可以为对应的关键帧指定对应的时间点,其取值范围为0到1.0,keyTimes中的每一个时间值都对应values中的每一帧.当keyTimes没有设置的时候,各个关键帧的时间是平分的
//    keyframe.keyTimes = @[@(0.0),@(0.1),@(0.5),@(0.75),@(1.0)];
    keyframe.duration = 1;
    keyframe.calculationMode = kCAAnimationCubic;
    
    
    [btn.layer addAnimation:keyframe forKey:keyframe.keyPath];
}


// 添加多个value的动画
- (void)valuesCAKeyframeAnimation {

    self.customView = [[UIView alloc]initWithFrame:CGRectMake(100, 100, 100, 100)];
    self.customView.backgroundColor = [UIColor redColor];
    [self.view addSubview:self.customView];
    
    //1.创建核心动画
    CAKeyframeAnimation *keyAnima = [CAKeyframeAnimation animation];
    //平移
    keyAnima.keyPath = @"position";
    //1.1告诉系统要执行什么动画
    NSValue *value1 = [NSValue valueWithCGPoint:CGPointMake(100, 100)];
    NSValue *value2 = [NSValue valueWithCGPoint:CGPointMake(200, 100)];
    NSValue *value3 = [NSValue valueWithCGPoint:CGPointMake(200, 200)];
    NSValue *value4 = [NSValue valueWithCGPoint:CGPointMake(100, 200)];
    NSValue *value5 = [NSValue valueWithCGPoint:CGPointMake(100, 100)];
    keyAnima.values = @[value1,value2,value3,value4,value5];
    //1.2设置动画执行完毕后，不删除动画
    keyAnima.removedOnCompletion = NO;
    //1.3设置保存动画的最新状态
    keyAnima.fillMode = kCAFillModeForwards;
    //1.4设置动画执行的时间
    keyAnima.duration = 4.0;
    //1.5设置动画的节奏
    keyAnima.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    //设置代理，开始—结束
    keyAnima.delegate = self;
    //2.添加核心动画
    [self.customView.layer addAnimation:keyAnima forKey:nil];
}

//通过path路径动画
- (void)pathCAKeyframeAnimation {

    self.redLbl = [[UILabel alloc]initWithFrame:CGRectMake(300, 100, 50, 50)];
    self.redLbl.backgroundColor = [UIColor redColor];
    self.redLbl.text = @"path动画";
    self.redLbl.textColor = [UIColor whiteColor];
    self.redLbl.adjustsFontSizeToFitWidth = YES;
    [self.view addSubview:self.redLbl];
    
    CGMutablePathRef path = CGPathCreateMutable();
    //将路径的起点定位到（50  120）
    CGPathMoveToPoint(path, NULL, 50.0,120.0);
    //下面5行添加5条直线的路径到path中
    CGPathAddLineToPoint(path, NULL, 60, 130);
    CGPathAddLineToPoint(path, NULL, 70, 140);
    CGPathAddLineToPoint(path, NULL, 80, 150);
    CGPathAddLineToPoint(path, NULL, 90, 160);
    CGPathAddLineToPoint(path, NULL, 100, 170);
    //下面四行添加四条曲线路径到path
    CGPathAddCurveToPoint(path,NULL,50.0,275.0,150.0,275.0,70.0,120.0);
    CGPathAddCurveToPoint(path,NULL,150.0,275.0,250.0,275.0,90.0,120.0);
    CGPathAddCurveToPoint(path,NULL,250.0,275.0,350.0,275.0,110.0,120.0);
    CGPathAddCurveToPoint(path,NULL,350.0,275.0,450.0,275.0,130.0,120.0);
    //以“position”为关键字
    
    
    CAKeyframeAnimation * animation = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    //设置path属性
    animation.path = path;
    animation.duration = 3;
//    animation.autoreverses = YES;
    CFRelease(path);
    [self.redLbl.layer addAnimation:animation forKey:animation.keyPath];
    
}

#pragma mark -- CAAnimationDelegate

-(void)animationDidStart:(CAAnimation *)anim
{
    NSLog(@"开始动画");
}

-(void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag
{
    NSLog(@"结束动画");
}

@end
