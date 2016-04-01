//
//  TextLoadingView.h
//  TextLoadingAnimation
//
//  Created by apple on 16/4/1.
//  Copyright © 2016年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum {
    kTextAnimate_ShowIn,
    kTextAnimate_ShowOut_Wait,
    kTextAnimate_ShowOut_Run,
    kTextAnimate_ShowOut_Finish,
}TextAnimateStatus;

@interface TextLoadingView : UIView

- (instancetype)initWithFrame:(CGRect)frame;

@property (assign, nonatomic) TextAnimateStatus textAnimateStatus;

- (void)textLineAnimation_Start;
- (void)textLineAnimation_End;

@end
