//
//  ViewController.m
//  replicator
//
//  Created by saintPN-Mac on 16/3/16.
//  Copyright © 2016年 saintPN. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(100, 200, 25, 25)];
    view.backgroundColor = [UIColor purpleColor];
    view.layer.cornerRadius = CGRectGetHeight(view.bounds)/2;
    view.layer.masksToBounds = YES;
    view.layer.transform = CATransform3DMakeScale(0.01, 0.01, 0.01);
    [self.view addSubview:view];

    CAReplicatorLayer *layer = [CAReplicatorLayer layer];
    layer.bounds = self.view.bounds;
    layer.position = self.view.center;
    layer.preservesDepth = YES;
    layer.instanceColor = [UIColor whiteColor].CGColor;
    layer.instanceRedOffset = 0.1;
    layer.instanceGreenOffset = 0.1;
    layer.instanceBlueOffset = 0.1;
    layer.instanceAlphaOffset = 0.1;
    layer.instanceCount = 20;
    layer.instanceDelay = 1.0/20;
    layer.instanceTransform = CATransform3DMakeRotation((2 * M_PI) /20, 0, 0, 1);
    [layer addSublayer:view.layer];
    [self.view.layer addSublayer:layer];
    
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    animation.duration = 1;
    animation.repeatCount = MAXFLOAT;
    animation.fromValue = @(1);
    animation.toValue = @(0.01);
    [view.layer addAnimation:animation forKey:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
