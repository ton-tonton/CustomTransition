//
//  BaseAnimation.h
//  CustomTransition
//
//  Created by Tawatchai Sunarat on 3/25/15.
//  Copyright (c) 2015 ton. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum{
    AnimationTypePresent,
    AnimationTypeDismiss
} AnimationType;

@interface BaseAnimation : NSObject <UIViewControllerAnimatedTransitioning>

@property (nonatomic, assign) AnimationType type;

@end
