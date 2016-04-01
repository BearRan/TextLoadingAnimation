//
//  TextLoadingView.m
//  TextLoadingAnimation
//
//  Created by apple on 16/4/1.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "TextLoadingView.h"
#import "TextLineView.h"

@interface TextLoadingView () <TextLineAnimateDelegate>
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
    
    _textAnimateStatus = kTextAnimate_ShowIn;
    [self createUI];
    
    return self;
}


- (void)createUI
{
    _paperImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"ICON_Paper"]];
    [self addSubview:_paperImageView];
    [_paperImageView BearSetCenterToParentViewWithAxis:kAXIS_X_Y];
    
    
    [_paperImageView setWidth:150];
    [_paperImageView setHeight:200];
    
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
        
        TextLineView *textLineView = [[TextLineView alloc] initWithFrame:CGRectMake(0, 0, paper_width * line_width_Ratio, paper_height * line_height_Ratio)];
        textLineView.delegate = self;
        textLineView.backgroundColor = [[UIColor orangeColor] colorWithAlphaComponent:0.7];
        [_paperImageView addSubview:textLineView];
        [_lineBgView_Array addObject:textLineView];

    }
    
    [UIView BearAutoLayViewArray:_lineBgView_Array layoutAxis:kLAYOUT_AXIS_Y center:YES offStart:paper_height * line_startY_Ratio offEnd:paper_height * (line_endY_Ratio + line_gap_Ratio)];
    
//    [self performSelector:@selector(textLineAnimation_Start) withObject:nil afterDelay:1.0f];
//    [self performSelector:@selector(textLineAnimation_End) withObject:nil afterDelay:1.5f];
    
    
    
//    _checkImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"ICON_Check"]];
//    [_paperImageView addSubview:_checkImageView];
//    [_checkImageView BearSetCenterToParentViewWithAxis:kAXIS_X_Y];
    
    
}


- (void)textLineAnimation_Start
{
    _textAnimateStatus = kTextAnimate_ShowIn;
    
    TextLineView *textLineView = _lineBgView_Array[0];
    [textLineView lineAnimation_Start];
}


- (void)textLineAnimation_End
{
    _textAnimateStatus = kTextAnimate_ShowOut_Wait;
}

- (void)textLineAnimation_Detail
{
    _textAnimateStatus = kTextAnimate_ShowOut_Run;
    
    __block int i = 0;
    CGFloat duration = 0.2f;   //间隔时间
    dispatch_queue_t queue = dispatch_get_main_queue();
    dispatch_source_t timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, queue);
    
    dispatch_source_set_timer(timer, DISPATCH_TIME_NOW, duration * NSEC_PER_SEC, 0);
    dispatch_source_set_event_handler(timer, ^{
        
        
        if (i > [_lineBgView_Array count] - 1) {
            
            dispatch_source_cancel(timer);  //执行i次后停止
        }else{
            
            TextLineView *textLineView_1 = _lineBgView_Array[i];
            [textLineView_1 lineAnimation_End];
        }
        i++;
    });
    dispatch_resume(timer);
    
}



#pragma mark 重写方法

@synthesize textAnimateStatus = _textAnimateStatus;
- (void)setTextAnimateStatus:(TextAnimateStatus)textAnimateStatus
{
    _textAnimateStatus = textAnimateStatus;
}

#pragma mark TextLineView Delegate
- (void)textLineAnimateStop:(TextLineView *)textLineView
{
    for (int i = 0; i < [_lineBgView_Array count]; i++) {
        
        TextLineView *textLineView_Now = (TextLineView *)_lineBgView_Array[i];
        
        TextLineView *textLineView_Later;
        if (i < [_lineBgView_Array count] - 1) {
            textLineView_Later = (TextLineView *)_lineBgView_Array[i + 1];
        }else{
             textLineView_Later = (TextLineView *)_lineBgView_Array[0];
        }
        
        if ([textLineView_Now isEqual:textLineView]) {
            
            BOOL res1 = (_textAnimateStatus == kTextAnimate_ShowIn);
            BOOL res2 = (_textAnimateStatus == kTextAnimate_ShowOut_Wait);
            BOOL res3 = (i == [_lineBgView_Array count] - 1);
            
            if (res1 || (res2 && !res3)) {
                [textLineView_Later lineAnimation_Start];
            }
            else if (res2 && res3) {
                [self textLineAnimation_Detail];
            }
        }
        
    }
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
