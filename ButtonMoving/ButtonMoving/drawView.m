//
//  drawView.m
//  move
//
//  Created by zhangyu on 16/10/26.
//  Copyright © 2016年 zhangyu. All rights reserved.
//

#import "drawView.h"

@implementation drawView



- (void)drawRect:(CGRect)rect {
    // MARK: - 使用UIBezierPath[贝塞尔路径,完美路径]绘图
    // 1.创建路径对象
    UIBezierPath *path = [UIBezierPath bezierPath];
    
    // 2.设置路径
    // 圆心
    CGPoint center = CGPointMake(self.center.x, self.center.y - 100);
    // 半径
    CGFloat radius = 100;
    
    // 起始结束角度!
    CGFloat startA = 0;
    CGFloat endA = M_PI * 2;
    
    [path addArcWithCenter:center radius:radius startAngle:startA endAngle:endA clockwise:NO];
    
    // 渲染
    [path stroke];
    
}

@end
