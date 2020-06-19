//
//  CALayer+FMAnimation.h
//  Animation
//
//  Created by 郑桂华 on 2019/12/9.
//  Copyright © 2019 郑桂华. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>

NS_ASSUME_NONNULL_BEGIN
@class FMAnimation;
@interface CALayer (FMAnimation)

@property(nonatomic, strong, readonly)FMAnimation *animator;

@end

NS_ASSUME_NONNULL_END
