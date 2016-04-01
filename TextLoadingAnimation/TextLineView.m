//
//  TextLineView.m
//  TextLoadingAnimation
//
//  Created by apple on 16/4/1.
//  Copyright (c) 2016年 apple. All rights reserved.
//

#import "TextLineView.h"

@implementation TextLineView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    if (!self) {
        self = nil;
    }
    
    _shapeLayer_1 = [CAShapeLayer layer];
    _shapeLayer_1.lineWidth = self.height;
    _shapeLayer_1.fillColor = [UIColor clearColor].CGColor;
    _shapeLayer_1.strokeColor = [UIColor redColor].CGColor;
    [self.layer addSublayer:_shapeLayer_1];
    
    _shapeLayer_2 = [CAShapeLayer layer];
    _shapeLayer_2.lineWidth = self.height;
    _shapeLayer_2.fillColor = [UIColor clearColor].CGColor;
    _shapeLayer_2.strokeColor = [UIColor redColor].CGColor;
    [self.layer addSublayer:_shapeLayer_2];
    
    _bezierPath_1 = [UIBezierPath bezierPath];
    _bezierPath_2 = [UIBezierPath bezierPath];
    
//    [self createUI];
    
//    [self LineAnimation_Start];
//    [self LineAnimation_End];
    
    return self;
}

- (void)lineAnimation_Start
{
    [_bezierPath_1 removeAllPoints];
    [_bezierPath_1 moveToPoint:CGPointMake(0, self.height/2.0)];
    [_bezierPath_1 addLineToPoint:CGPointMake(self.width, self.height/2.0)];
    _shapeLayer_1.path = _bezierPath_1.CGPath;
    _shapeLayer_1.strokeEnd = 1.0;

    CABasicAnimation *strokeEndAnimation = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
    strokeEndAnimation.fromValue = [NSNumber numberWithFloat:0.0f];
    strokeEndAnimation.toValue = [NSNumber numberWithFloat:1.0f];
    strokeEndAnimation.duration = 1.4f;
    strokeEndAnimation.removedOnCompletion = NO;
    strokeEndAnimation.fillMode = kCAFillModeForwards;
    [_shapeLayer_1 addAnimation:strokeEndAnimation forKey:strokeEndAnimation.keyPath];
}


- (void)lineAnimation_End
{
    CGFloat duration = 1.0;
    
    //  shapeLayer_1
    
    [_bezierPath_1 removeAllPoints];
    [_bezierPath_1 moveToPoint:CGPointMake(0, self.height/2.0)];
    [_bezierPath_1 addLineToPoint:CGPointMake(self.width, self.height/2.0)];
    _shapeLayer_1.path = _bezierPath_1.CGPath;
    _shapeLayer_1.strokeEnd = 0.5;
    
    CABasicAnimation *basicAnimation_1 = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
    basicAnimation_1.fromValue = [NSNumber numberWithFloat:0.5];
    basicAnimation_1.toValue = [NSNumber numberWithFloat:0];
    basicAnimation_1.duration = duration;
    basicAnimation_1.removedOnCompletion = NO;
    basicAnimation_1.fillMode = kCAFillModeForwards;
    [_shapeLayer_1 addAnimation:basicAnimation_1 forKey:basicAnimation_1.keyPath];
    
    
    
    //  shapeLayer_2
    
    [_bezierPath_2 removeAllPoints];
    [_bezierPath_2 moveToPoint:CGPointMake(0, self.height/2.0)];
    [_bezierPath_2 addLineToPoint:CGPointMake(self.width, self.height/2.0)];
    _shapeLayer_2.path = _bezierPath_2.CGPath;
    _shapeLayer_2.strokeStart = 0.5;
    
    CABasicAnimation *basicAnimation_2 = [CABasicAnimation animationWithKeyPath:@"strokeStart"];
    basicAnimation_2.fromValue = [NSNumber numberWithFloat:0.5];
    basicAnimation_2.toValue = [NSNumber numberWithFloat:1.0];
    basicAnimation_2.duration = duration;
    basicAnimation_2.removedOnCompletion = NO;
    basicAnimation_2.fillMode = kCAFillModeForwards;
    [_shapeLayer_2 addAnimation:basicAnimation_2 forKey:basicAnimation_2.keyPath];
}



/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
