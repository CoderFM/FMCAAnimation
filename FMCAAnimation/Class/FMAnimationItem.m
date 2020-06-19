//
//  FMAnimationItem.m
//  Animation
//
//  Created by 郑桂华 on 2019/12/7.
//  Copyright © 2019 郑桂华. All rights reserved.
//

#import "FMAnimationItem.h"

@interface FMAnimationItem ()

@end

@implementation FMAnimationItem

- (void)setPath:(UIBezierPath *)path{
    _path = path;
    self.aniType = FMAnimationKeyFrame;
}

- (CAAnimation *)animation{
    
    CAAnimation *animation;
    if (self.aniType == FMAnimationBasic) {
        CABasicAnimation *anim = [CABasicAnimation animation];
        anim.keyPath = self.keyPath;
        anim.toValue = self.toValue;
        
        animation = anim;
    } else if (self.aniType == FMAnimationSpring) {
        CASpringAnimation *anim = [CASpringAnimation animation];
        anim.mass = 1;
        anim.keyPath = self.keyPath;
        anim.toValue = self.toValue;
        
        animation = anim;
    } else {
        CAKeyframeAnimation *anim = [CAKeyframeAnimation animation];
        anim.keyPath = self.keyPath;
        anim.path = self.path.CGPath;
        animation = anim;
    }
    
    animation.duration = self.aniDuration;
    animation.removedOnCompletion = self.aniRemovedOnCompletion;
    animation.fillMode = self.aniFillMode;
    animation.delegate = self.delegate;
    animation.repeatCount = self.aniRepeatCount;
    animation.autoreverses = self.aniAutoreverses;
    if (self.aniTimeFuncName) {
        animation.timingFunction = [CAMediaTimingFunction functionWithName:self.aniTimeFuncName];
    }
    return animation;
}



@end
