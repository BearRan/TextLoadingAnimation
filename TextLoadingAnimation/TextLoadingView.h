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
    kTextAnimate_Check_Finish,
}TextAnimateStatus;



@protocol TextLoadingAnimationFinishDelegate <NSObject>

@required
- (void)textLoadingAnimationFinish;

@end


@interface TextLoadingView : UIView

- (instancetype)initWithFrame:(CGRect)frame;

@property (assign, nonatomic) TextAnimateStatus textAnimateStatus;
@property (assign, nonatomic) id<TextLoadingAnimationFinishDelegate> delegate;

- (void)textLineAnimation_Start;
- (void)textLineAnimation_End;

@end
