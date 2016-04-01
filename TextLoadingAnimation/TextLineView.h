//
//  TextLineView.h
//  TextLoadingAnimation
//
//  Created by apple on 16/4/1.
//  Copyright (c) 2016年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TextLineView : UIView

@property (strong, nonatomic) CAShapeLayer  *shapeLayer_1;
@property (strong, nonatomic) CAShapeLayer  *shapeLayer_2;

@property (strong, nonatomic) UIBezierPath  *bezierPath_1;
@property (strong, nonatomic) UIBezierPath  *bezierPath_2;

- (instancetype)initWithFrame:(CGRect)frame;

- (void)lineAnimation_Start;
- (void)lineAnimation_End;

@end
