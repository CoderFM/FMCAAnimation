//
//  CALayer+FMAnimation.m
//  Animation
//
//  Created by 郑桂华 on 2019/12/9.
//  Copyright © 2019 郑桂华. All rights reserved.
//

#import "CALayer+FMAnimation.h"
#import "FMAnimation.h"

@implementation CALayer (FMAnimation)

- (FMAnimation *)animator{
    FMAnimation *animator = [[FMAnimation alloc] init];
    animator.targetLayer = self;
    return animator;
}

@end
