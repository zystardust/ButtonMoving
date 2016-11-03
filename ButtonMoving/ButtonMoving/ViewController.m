//
//  ViewController.m
//  ButtonMoving
//
//  Created by zhangyu on 2016/11/3.
//  Copyright © 2016年 zhangyu. All rights reserved.
//

#import "ViewController.h"
#import "drawView.h"
@interface ViewController ()


@end

@implementation ViewController{
    UIButton *_circleBtn ;
    NSInteger i ;
    NSTimer *_timer;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    drawView *view = [[drawView alloc]initWithFrame:self.view.frame];
    view.backgroundColor = [UIColor grayColor];
    [self.view addSubview:view];
    
    _circleBtn = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 40, 40)];
    _circleBtn.center = self.view.center;
    _circleBtn.backgroundColor = [UIColor colorWithRed:1 green:0 blue:0 alpha:0.7];
    _circleBtn.layer.cornerRadius = 20;
    [self.view addSubview:_circleBtn];
    i = 1;
    [_circleBtn addTarget:self action:@selector(didCircle) forControlEvents:UIControlEventTouchUpInside];
}

-(void)didCircle {
    NSLog(@"我被点击了");
}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    if (!_timer) {
        NSTimer *timer = [NSTimer timerWithTimeInterval:0.01 target:self selector:@selector(move) userInfo:nil repeats:YES];
        [[NSRunLoop currentRunLoop] addTimer:timer forMode:NSRunLoopCommonModes];
        _timer = timer;
    }
    
}
-(void)move {
    //    [UIView animateWithDuration:1 animations:^{
    _circleBtn.center = CGPointMake(self.view.center.x - 100 * sin(M_PI_4 / 90 * i), self.view.center.y - 100 + 100 * cos(M_PI_4 / 90 * i));
    //    } completion:^(BOOL finished) {
    i++;
    //    }];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}
-(void)dealloc {
    [_timer invalidate];
}
@end
