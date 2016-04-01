//
//  ViewController.m
//  TextLoadingAnimation
//
//  Created by apple on 16/4/1.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "ViewController.h"
#import "TextLoadingView.h"

@interface ViewController ()
{
    TextLoadingView *textLoagdingView;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    CGFloat loadingView_width = 300;
    
    textLoagdingView = [[TextLoadingView alloc] initWithFrame:CGRectMake(0, 0, loadingView_width, loadingView_width)];
    [self.view addSubview:textLoagdingView];
    [textLoagdingView BearSetCenterToParentViewWithAxis:kAXIS_X_Y];
    
    UIButton *startBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 150, 50)];
    startBtn.backgroundColor = [[UIColor blueColor] colorWithAlphaComponent:0.6];
    [startBtn setTitle:@"start" forState:UIControlStateNormal];
    [startBtn addTarget:self action:@selector(startBtnEvent) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:startBtn];
    [startBtn BearSetRelativeLayoutWithDirection:kDIR_DOWN destinationView:nil parentRelation:YES distance:50 center:YES];
}

- (void)startBtnEvent
{
    [textLoagdingView textLineAnimation_Start];
    
    CGFloat delayTime = 5.0f;
    dispatch_time_t timer = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(delayTime *NSEC_PER_SEC));
    dispatch_after(timer, dispatch_get_main_queue(), ^{
        [textLoagdingView textLineAnimation_End];
    });
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
