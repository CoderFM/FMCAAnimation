//
//  UIView+FMAnimation.m
//  Animation
//
//  Created by 郑桂华 on 2019/12/7.
//  Copyright © 2019 郑桂华. All rights reserved.
//

#import "UIView+FMAnimation.h"
#import "CALayer+FMAnimation.h"

@implementation UIView (FMAnimation)

- (FMAnimation *)animator{
    return self.layer.animator;
}

@end
