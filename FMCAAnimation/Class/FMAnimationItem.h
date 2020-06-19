//
//  FMAnimationItem.h
//  Animation
//
//  Created by 郑桂华 on 2019/12/7.
//  Copyright © 2019 郑桂华. All rights reserved.
//

#import "FMBaseAnimation.h"
#import "FMAnimationConstant.h"
#import "FMAnimationDelegate.h"


NS_ASSUME_NONNULL_BEGIN
@class FMAnimation;
@interface FMAnimationItem : FMBaseAnimation

@property(nonatomic, weak)FMAnimation *next;

@property(nonatomic, copy)NSString *keyPath;
@property(nonatomic, strong)id toValue;

@property(nonatomic, strong)UIBezierPath *path;
@property(nonatomic, readonly)CAAnimation *animation;



@end

NS_ASSUME_NONNULL_END
