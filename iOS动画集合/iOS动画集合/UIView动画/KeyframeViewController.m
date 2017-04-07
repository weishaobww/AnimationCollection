//
//  KeyframeViewController.m
//  iOS动画集合
//
//  Created by bww on 2017/2/15.
//  Copyright © 2017年 bww. All rights reserved.
//

#import "KeyframeViewController.h"

@interface KeyframeViewController ()
{
    UIImageView *_airportImageView1;
    UIImageView *_airportImageView2;
    UIImageView *_airportImageView3;
}
@property (nonatomic,strong)UIView * redView;

@end

@implementation KeyframeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.redView = [[UIView alloc]initWithFrame:CGRectMake(100, 100, 100, 100)];
    self.redView.backgroundColor = [UIColor redColor];
    [self.view addSubview:self.redView];
    
    
    _airportImageView1 = [[UIImageView alloc]initWithFrame:CGRectMake(50, 500, 50, 50)];
    _airportImageView1.image = [UIImage imageNamed:@"4.png"];
    [self.view addSubview:_airportImageView1];
    
    
    _airportImageView2 = [[UIImageView alloc]initWithFrame:CGRectMake(self.view.frame.size.width-50, 400, 50, 50)];
    _airportImageView2.image = [UIImage imageNamed:@"fan.png"];
    _airportImageView2.alpha = 0;
    [self.view addSubview:_airportImageView2];
    
    
    _airportImageView3 = [[UIImageView alloc]initWithFrame:CGRectMake(0, 500, 50, 50)];
    _airportImageView3.image = [UIImage imageNamed:@"4.png"];
    _airportImageView3.alpha = 0;
    [self.view addSubview:_airportImageView3];

    
    
    //关键帧动画
    //1.UIView动画已经具备高级的方法来创建动画,而且可以更好地理解和创建动画,IOS7以后苹果新加了一个animateKeyframesWithDuration的方法,我们可以使用它来创建更多更复杂跟炫酷的动画效果,而不需要去使用核心动画(coreAnimation)
    
    //创建关键帧方法
    /**
     * @param duration   动画时长
     * @param delay      动画延迟
     * @param options    动画效果选项
     * @param animations 动画执行代码 (里面可以是多个关键帧动画)
     * @param completion 动画结束执行代码
     */
    //+ (void)animateKeyframesWithDuration:(NSTimeInterval)duration delay:(NSTimeInterval)delay options:(UIViewKeyframeAnimationOptions)options animations:(void (^)(void))animations completion:(void (^ __nullable)(BOOL finished))completion;
    
    //添加关键帧方法:
    /**
     * @param frameStartTime  动画相对开始时间 (当前帧动画开始的时间 = 第几个帧/动画的总时长)
     * @param frameDuration   动画相对持续时间 (一帧的时长 = 总帧数 / 总时长)
     * @param animations      动画执行代码 (可以对当前帧的动画做一些其他的设置，比如位置上的改变。)
     */
    //+ (void)addKeyframeWithRelativeStartTime:(double)frameStartTime relativeDuration:(double)frameDuration animations:(void (^)(void))animations;
    
    
    //创建一个关键帧的动画
    [self oneKeyframAnimation];
    
    //创建四个关键帧的动画
    [self kryFrameAnimation];
    
    //Keyframe动画(复杂点的)
    [self keyframeAnimation1];
}

- (void)oneKeyframAnimation {

    UIView * blueView = [[UIView alloc]initWithFrame:CGRectMake(100, 300, 100, 100)];
    blueView.backgroundColor = [UIColor blueColor];
    [self.view addSubview:blueView];
   
    [UIView animateKeyframesWithDuration:2 delay:0.0 options:UIViewKeyframeAnimationOptionBeginFromCurrentState animations:^{
        
        //start time and duration between 0.0 and 1.0
        [UIView addKeyframeWithRelativeStartTime:0 relativeDuration:1 animations:^{
            
            blueView.frame = CGRectMake(200, 400, 100, 100);
            
        }];
        
    } completion:nil];
}

//创建四个关键帧的动画
- (void)kryFrameAnimation {

    void (^keyFram)() = ^(){
    
        for (int i = 0 ; i < 4; i ++) {
            __block CGRect redFram = self.redView.frame;
            
            /*
             frameStartTime:当前帧动画开始的时间 = 第几个帧/动画的总时长。
             relativeDuration一帧的时长 = 总帧数 / 总时长。
             @param   startTime      关键帧开始时间,该时间是相对整个关键帧动画持续时间的相对时间,一般值在0到1之间.  如果为0,则表明这一关键帧从整个动画的第0秒开始执行,如果设为0.5,则表明从整个动画的中间开始执行
             @param   relativeDuration 关键帧持续时间,该时间同样是相对整个关键帧动画持续时间的相对时间,一般值也在0到1之间,如果设为0.25, 则表明这一关键帧的持续时间为整个动画持续时间的四分之一
             */
            [UIView addKeyframeWithRelativeStartTime:i/4.0 relativeDuration:1/4.0 animations:^{
                switch (i) {
                    case 0:
                        redFram.origin.x += 100;
                        self.redView.frame = redFram;
                        break;
                    case 1:
                        redFram.origin.y += 100;
                        self.redView.frame = redFram;
                        break;
                    case 2:
                        redFram.origin.x -= 100;
                        self.redView.frame = redFram;
                        break;
                    case 3:
                        redFram.origin.y -= 100;
                        self.redView.frame = redFram;
                        break;

                    default:
                        break;
                }
            }];
        }
    };
    
    /*
     duration：动画的总时长
     delay：延迟启动动画的时间
     options：选择动画的效果。
     animations ：需要执行的动画，里面可以是多个关键帧动画
     */
    [UIView animateKeyframesWithDuration:4.0 delay:0.0 options:UIViewKeyframeAnimationOptionBeginFromCurrentState animations:keyFram completion:nil];
}


//Keyframe动画(复杂点的)
-(void)keyframeAnimation1
{
    CGAffineTransform  zoomInScaleTransform = CGAffineTransformMakeScale(0.3, 0.3);
    [UIView animateKeyframesWithDuration:3.0 delay:0.0 options:UIViewKeyframeAnimationOptionCalculationModeLinear animations:^{
        
        
        //第一个关键帧：完成1号纸飞机视图运动到右上角并移出屏幕，视图逐渐变小的动画。该关键帧从整个动画的第0秒开始执行，持续时间为0.6秒。
        [UIView addKeyframeWithRelativeStartTime:0 relativeDuration:0.2 animations:^{
            
            CGPoint point = _airportImageView1.center;
            point.x += self.view.frame.size.width;
            point.y += -180;
            _airportImageView1.center = point;
            _airportImageView1.transform =zoomInScaleTransform;
            
        }];
        
        
        //第二个关键帧：由于2号纸飞机视图的初始透明度为零，所以在第二个关键帧将透明度设为1，并且缩小视图。注意这两个动作需要在瞬间完成，所以relativeDuration设为0.01，一个极短的时间。开始时间为整个动画的第0.9秒开始，较第一个关键帧延迟0.3秒。
        [UIView addKeyframeWithRelativeStartTime:0.3 relativeDuration:0.01 animations:^{
            
            _airportImageView2.alpha = 1;
            _airportImageView2.transform = zoomInScaleTransform;
            
        }];
        
        
        //第三个关键帧：与第二个关键帧同时开始执行，完成2号纸飞机视图从小变大、并且往左下角运动，一直移出屏幕。持续时间为1.5秒。
        [UIView addKeyframeWithRelativeStartTime:0.3 relativeDuration:0.5 animations:^{
            
            _airportImageView2.transform = CGAffineTransformIdentity;
            CGPoint point = _airportImageView2.center;
            point.x -= self.view.frame.size.width;
            point.y += 90;
            _airportImageView2.center = point;
            
        }];
        
        
        //第四个关键帧：与第二个关键帧作用相似，改变3号纸飞机视图的透明度，同样是在瞬间完成。
        [UIView addKeyframeWithRelativeStartTime:0.9 relativeDuration:0.01 animations:^{
            
            _airportImageView3.alpha = 1;
            
        }];
        
        
        //第五个关键帧：与第四个关键帧同时执行， 完成向右移动的动画，持续0.3秒
        [UIView addKeyframeWithRelativeStartTime:0.9 relativeDuration:0.1 animations:^{
            
            CGPoint point = _airportImageView3.center;
            point.x += 50;
            _airportImageView3.center = point;
            
        }];
        
        
    } completion:^(BOOL finished) {
        
    }];
    
}



@end
