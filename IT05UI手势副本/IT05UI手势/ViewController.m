//
//  ViewController.m
//  IT05UI手势
//
//  Created by 郭振东 on 16/5/24.
//  Copyright © 2016年 郭. All rights reserved.
//

#import "ViewController.h"

@interface ViewController (){
    UIView  *bgView;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    //UI收视就是作用在UI控件上的,让指定的UI控件有丰富的交互手势
    //UITapGestureRecognizer  Tap:点击
    bgView = [[UIView  alloc]initWithFrame:CGRectMake(10, 100, 400, 400)];
    bgView.backgroundColor = [UIColor  redColor];
    [self.view  addSubview:bgView];
    //点击
    UITapGestureRecognizer  *tap = [[UITapGestureRecognizer  alloc]initWithTarget:self action:@selector(tap:)];
    //点击几次 才算一次(双击,单击)
    tap.numberOfTapsRequired = 1;
    tap.numberOfTouchesRequired = 1;//几根手指
    [bgView  addGestureRecognizer:tap];
    //双击
    UITapGestureRecognizer  *doubleTap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(doubleTap:)];
    doubleTap.numberOfTapsRequired = 2;
    [bgView  addGestureRecognizer:doubleTap];
    
    //如果有相同的事件(两个tap),按最后的为准
    //如何让两个都有响应  当双击手势确定检监测失败才触发单击手势
    [tap requireGestureRecognizerToFail:doubleTap];
    //拖动事件
    UIPanGestureRecognizer  *pan = [[UIPanGestureRecognizer  alloc]initWithTarget:self action:@selector(pan:)];
//    [bgView  addGestureRecognizer:pan];
    //捏合手势
    UIPinchGestureRecognizer  *pin = [[UIPinchGestureRecognizer  alloc]initWithTarget:self action:@selector(pinch:)];
    [bgView  addGestureRecognizer:pin];
    //旋转
    UIRotationGestureRecognizer  *rot = [[UIRotationGestureRecognizer  alloc]initWithTarget:self action:@selector(rot:)];
    [bgView  addGestureRecognizer:rot];
    //长按
    UILongPressGestureRecognizer  *longPress = [[UILongPressGestureRecognizer  alloc]initWithTarget:self action:@selector(longPress:)];
    [bgView  addGestureRecognizer:longPress];
//  滑动手势
    UISwipeGestureRecognizer  *swipe = [[UISwipeGestureRecognizer  alloc]initWithTarget:self action:@selector(swipe:)];
    [bgView  addGestureRecognizer:swipe];
}
//滑动
- (void)swipe:(UISwipeGestureRecognizer  *)swipe {
    NSLog(@"我滑");
    CGPoint point = [swipe locationInView:self.view];
    [UIView  animateWithDuration:2.0 animations:^{
         swipe.view.transform = CGAffineTransformMakeTranslation(point.x, point.y);
    }];
   

}
   //长按
- (void)longPress:(UILongPressGestureRecognizer  *)longPress {
    NSLog(@"%f",longPress.minimumPressDuration);
    bgView.backgroundColor = [UIColor  colorWithRed:arc4random()%256/255.0 green:arc4random()%256/255.0 blue:arc4random()%256/255.0 alpha:1.0];
}
//双击
- (void)doubleTap:(UITapGestureRecognizer *)doubleTap {

    NSLog(@"%s",__FUNCTION__);
}
//旋转
- (void)rot:(UIRotationGestureRecognizer  *)rotation {
    rotation.view.transform = CGAffineTransformRotate(rotation.view.transform, rotation.rotation);

    rotation.rotation = 0;

}

//捏合
- (void)pinch:(UIPinchGestureRecognizer  *)pinch {
    NSLog(@"%f",pinch.scale);
    pinch.view.transform = CGAffineTransformScale(pinch.view.transform, pinch.scale, pinch.scale);
    pinch.scale = 1;

}
//拖动
- (void)pan:(UIPanGestureRecognizer *)pan {
//    NSLog(@"%s",__FUNCTION__);
    NSLog(@"拖移,慢慢的:%@",NSStringFromCGPoint(pan.view.center));
//NSStringFromCGPoint(<#CGPoint point#>)
    CGPoint translation = [pan translationInView:self.view];
    pan.view.center = CGPointMake(pan.view.center.x+translation.x, pan.view.center.y+translation.y);
    [pan  setTranslation:CGPointZero inView:self.view];
    
    
}
//单击
- (void)tap:(UITapGestureRecognizer  *)tap {
    NSLog(@"%s",__func__);

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
