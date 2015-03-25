//
//  BaseAnimation.m
//  CustomTransition
//
//  Created by Tawatchai Sunarat on 3/25/15.
//  Copyright (c) 2015 ton. All rights reserved.
//

#import "BaseAnimation.h"

@implementation BaseAnimation

#pragma mark - UIViewControllerAnimatedTransitioning

- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext {
    NSAssert(NO, @"animateTransition: should be handled by subclass of BaseAnimation");
}

- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext {
    return 1.0;
}

#pragma mark - Custom method

- (void)handlePinch:(UIPinchGestureRecognizer *)pinch {
    NSAssert(NO, @"handlePinch: should be handled by a subclass of BaseAnimation");
}

@end
