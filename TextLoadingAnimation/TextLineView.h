//
//  TextLineView.h
//  TextLoadingAnimation
//
//  Created by apple on 16/4/1.
//  Copyright (c) 2016年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>



@class TextLineView;

@protocol TextLineAnimateDelegate <NSObject>

@required
- (void)textLineAnimateStop:(TextLineView *)textLineView;

@end



@interface TextLineView : UIView

@property (strong, nonatomic) CAShapeLayer  *shapeLayer_1;
@property (strong, nonatomic) CAShapeLayer  *shapeLayer_2;

@property (strong, nonatomic) UIBezierPath  *bezierPath_1;
@property (strong, nonatomic) UIBezierPath  *bezierPath_2;
@property (assign, nonatomic) id <TextLineAnimateDelegate> delegate;

- (instancetype)initWithFrame:(CGRect)frame;

- (void)lineAnimation_Start;
- (void)lineAnimation_End;

@end
