//
//  TextLoadingView.m
//  TextLoadingAnimation
//
//  Created by apple on 16/4/1.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "TextLoadingView.h"

@interface TextLoadingView ()
{
    UIImageView     *_paperImageView;
    UIImageView     *_checkImageView;
    NSMutableArray  *_lineBgView_Array;
}

@end

@implementation TextLoadingView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    if (!self) {
        self = nil;
    }
    
    self.backgroundColor = [UIColor orangeColor];
    
    [self createUI];
    
    return self;
}


- (void)createUI
{
    _paperImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"ICON_Paper"]];
    [self addSubview:_paperImageView];
    [_paperImageView BearSetCenterToParentViewWithAxis:kAXIS_X_Y];
    
    int lineBgView_count = 3;
    _lineBgView_Array = [NSMutableArray new];
    
    CGFloat paper_width = _paperImageView.width;
    CGFloat paper_height = _paperImageView.height;
    CGFloat line_startY_Ratio = 0.3;
    CGFloat line_endY_Ratio = 0.05;
    CGFloat line_width_Ratio = 0.65;
    CGFloat line_height_Ratio = (1 - line_startY_Ratio - line_endY_Ratio)/(float)lineBgView_count/2.0;
    CGFloat line_gap_Ratio = line_height_Ratio;
    
    for (int i = 0; i < lineBgView_count; i++) {
        
        UIView *lineBgView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, paper_width * line_width_Ratio, paper_height * line_height_Ratio)];
        lineBgView.backgroundColor = [UIColor grayColor];
        [_paperImageView addSubview:lineBgView];
        [_lineBgView_Array addObject:lineBgView];
    }
    
    [UIView BearAutoLayViewArray:_lineBgView_Array layoutAxis:kLAYOUT_AXIS_Y center:YES offStart:paper_height * line_startY_Ratio offEnd:paper_height * (line_endY_Ratio + line_gap_Ratio)];
    
    
//    _checkImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"ICON_Check"]];
//    [_paperImageView addSubview:_checkImageView];
//    [_checkImageView BearSetCenterToParentViewWithAxis:kAXIS_X_Y];
    
    
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
