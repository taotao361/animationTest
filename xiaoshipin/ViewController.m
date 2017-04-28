//
//  ViewController.m
//  xiaoshipin
//
//  Created by yangxutao on 16/11/18.
//  Copyright © 2016年 yangxutao. All rights reserved.
//

#import "ViewController.h"
#import "videoView.h"
@interface ViewController ()
@property (nonatomic, strong) UIImageView *image;
@property (nonatomic, strong) CAShapeLayer *circleLayer;
@property (nonatomic, strong) UILabel *textLabel;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
//    videoView *video = [[videoView alloc]initWithFrame:CGRectMake(0, 100, 320, 400)];
//    [self.view addSubview:video];
    
//    _image = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"01_哈哈"]];
//    _image.frame = CGRectMake(0, 300, 50, 50);
//    [self.view addSubview:_image];
    
    
    UIView *vv = [[UIView alloc]initWithFrame:CGRectMake(100, 100, 50, 50)];
    vv.backgroundColor = [UIColor redColor];
    [self.view addSubview:vv];
    
    
#pragma mark - keypath 为 tansform.scale.x
//    CABasicAnimation*pulse = [CABasicAnimation animationWithKeyPath:@"transform.scale.x"];
//    pulse.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
//    pulse.duration = 0.5 + (rand() % 10) * 0.05;
//    pulse.repeatCount = 10;//重复次数
//    pulse.autoreverses = YES;//是否自动回来
//    pulse.fromValue = [NSNumber numberWithFloat:.4];
//    pulse.toValue = [NSNumber numberWithFloat:3];
//    [vv.layer addAnimation:pulse forKey:nil];
    
  
    
#pragma mark - 动画 keypath 为 bounds
//    CABasicAnimation *anim = [CABasicAnimation animationWithKeyPath:@"bounds"];
//    anim.duration = 1.f;
//    anim.fromValue = [NSValue valueWithCGRect:CGRectMake(0,0,10,10)];
//    anim.toValue = [NSValue valueWithCGRect:CGRectMake(10,10,200,200)];
//    anim.byValue = [NSValue valueWithCGRect:self.view.bounds];
////    anim.toValue = (id)[UIColor redColor].CGColor;
////    anim.fromValue =  (id)[UIColor blackColor].CGColor;
//    anim.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
//    anim.repeatCount = 10;
//    anim.autoreverses = YES;
//    [vv.layer addAnimation:anim forKey:nil];

    
#pragma mark -    cornerRadius 圆->矩形
//    CABasicAnimation *anim2 = [CABasicAnimation animationWithKeyPath:@"cornerRadius"];
//    anim2.duration = 1.f;
//    anim2.fromValue = [NSNumber numberWithFloat:0.f];
//    anim2.toValue = [NSNumber numberWithFloat:20.f];
//    anim2.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
//    anim2.repeatCount = CGFLOAT_MAX;
//    anim2.autoreverses = YES;
//    [vv.layer addAnimation:anim2 forKey:@"cornerRadius"];

#pragma mark - contents  内容也可以以动画的形式来完成切换 例如imageView 的图片切换
//    UIImageView *imageView = [[UIImageView alloc] init];
//    imageView.frame = CGRectMake(100, 100, 100, 100);
//    [self.view addSubview:imageView];
//    CABasicAnimation *anim = [CABasicAnimation animationWithKeyPath:@"contents"];
//    anim.duration = 1.f;
//    anim.fromValue = (id)[UIImage imageNamed:@"1.png"].CGImage;
//    anim.toValue = (id)[UIImage imageNamed:@"2.png"].CGImage;
//     anim.byValue  = (id)[UIImage imageNamed:@"3.png"].CGImage;
//    // anim.toValue = (id)[UIColor redColor].CGColor;
//    // anim.fromValue =  (id)[UIColor blackColor].CGColor;
//    anim.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
//    anim.repeatCount = CGFLOAT_MAX;
//    anim.autoreverses = YES;
//    [imageView.layer addAnimation:anim forKey:nil];
    
#pragma mark - keypath = shadowColor shadowOpacity  shadowRadius shadowOffset
//    [vv.layer setShadowOffset:CGSizeMake(2,2)];
//    [vv.layer setShadowOpacity:1];
//    [vv.layer setShadowColor:[UIColor grayColor].CGColor];
//    CABasicAnimation *anim = [CABasicAnimation animationWithKeyPath:@"shadowColor"];
//    anim.duration = 1.f;
//    anim.toValue = (id)[UIColor redColor].CGColor;
//    anim.fromValue =  (id)[UIColor blackColor].CGColor;
//    anim.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
//    anim.repeatCount = CGFLOAT_MAX;
//    anim.autoreverses = YES;
//    [vv.layer addAnimation:anim forKey:nil];
    

#pragma mark - 横向移动  keypath = translation,平移，scale缩放，组合动画（例如，微信拍摄小视频的拍摄按钮效果）
//    CABasicAnimation *anim = [CABasicAnimation animation];
//    anim.keyPath = @"transform.translation.x";
//    anim.duration = 2.0;
//    anim.toValue = @300;
//    anim.removedOnCompletion = NO;
//    anim.repeatCount = 10;
//    anim.fillMode = kCAMediaTimingFunctionLinear;
//    [vv.layer addAnimation:anim forKey:nil];
    
    
#pragma mark - 触摸执行动画 类似于微信老版发小视频
    _circleLayer = [CAShapeLayer layer];
    _circleLayer.frame = CGRectMake(100, 100, 100, 100);
    _circleLayer.lineWidth = 2;
//    _circleLayer.lineCap  = @"round";
    _circleLayer.strokeColor = [UIColor greenColor].CGColor;
    _circleLayer.fillColor = [UIColor clearColor].CGColor;;
    UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:CGPointMake(50, 50) radius:50 startAngle:-M_PI endAngle:M_PI clockwise:YES];
    NSLog(@"-----%@",NSStringFromCGPoint(_circleLayer.position));
    _circleLayer.path = path.CGPath;
    [self.view.layer addSublayer:_circleLayer];
    
    _textLabel = [[UILabel alloc]initWithFrame:CGRectMake(100, 100, 100, 100)];
    _textLabel.text = @"哈哈哈";
    _textLabel.font = [UIFont systemFontOfSize:18];
    _textLabel.textColor = [UIColor redColor];
    _textLabel.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:_textLabel];
    
    UIPanGestureRecognizer *panGesture = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(panAction:)];
    _textLabel.userInteractionEnabled = YES;
    [_textLabel addGestureRecognizer:panGesture];
    
}

- (void)panAction:(UIPanGestureRecognizer *)pan {
    if (pan.state == UIGestureRecognizerStateBegan) {
        [self disappearAnimation];
    }
    if (pan.state == UIGestureRecognizerStateEnded || pan.state == UIGestureRecognizerStateCancelled) {
//        CGPoint point = [pan locationInView:pan.view];
            [self appearAnimation];
    }
}




//向外
- (void)disappearAnimation {
    CABasicAnimation *anim_scale  = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    anim_scale.toValue = @1.5;
    CABasicAnimation *anim_opacity = [CABasicAnimation animationWithKeyPath:@"opacity"];
    anim_opacity.toValue = @0;
    CAAnimationGroup *group = [CAAnimationGroup animation];
    group.duration = 0.2;
    group.fillMode = kCAFillModeForwards;
    group.removedOnCompletion = NO;
    group.animations = @[anim_scale,anim_opacity];
    [_circleLayer addAnimation:group forKey:@"disappear"];
    [_textLabel.layer addAnimation:group forKey:@"disappear"];
    
}

//向内
- (void)appearAnimation {
    CABasicAnimation *anim_scale  = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    anim_scale.toValue = @1;
    CABasicAnimation *anim_opacity = [CABasicAnimation animationWithKeyPath:@"opacity"];
    anim_opacity.toValue = @1;
    CAAnimationGroup *group = [CAAnimationGroup animation];
    group.duration = 0.5;
    group.fillMode = kCAFillModeForwards;
    group.removedOnCompletion = NO;
    group.animations = @[anim_scale,anim_opacity];
    [_circleLayer addAnimation:group forKey:@"appear"];
    [_textLabel.layer addAnimation:group forKey:@"appear"];
}






- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
