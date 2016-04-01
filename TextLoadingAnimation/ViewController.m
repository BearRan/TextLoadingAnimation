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

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    CGFloat loadingView_width = 100;
    
    TextLoadingView *textLoagdingView = [[TextLoadingView alloc] initWithFrame:CGRectMake(0, 0, loadingView_width, loadingView_width)];
    [self.view addSubview:textLoagdingView];
    [textLoagdingView BearSetCenterToParentViewWithAxis:kAXIS_X_Y];
    
    
    [textLoagdingView textLineAnimation_Start];
    
    
    CGFloat delayTime = 4.0f;
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
