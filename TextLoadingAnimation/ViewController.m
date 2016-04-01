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
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
