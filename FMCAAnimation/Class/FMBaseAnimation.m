//
//  FMBaseAnimation.m
//  Animation
//
//  Created by 郑桂华 on 2019/12/9.
//  Copyright © 2019 郑桂华. All rights reserved.
//

#import "FMBaseAnimation.h"

@interface FMBaseAnimation ()

@end

@implementation FMBaseAnimation

- (FMAnimationDelegate *)delegate{
    if (_delegate == nil) {
        _delegate = [[FMAnimationDelegate alloc] init];
    }
    return _delegate;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.aniRemovedOnCompletion = NO;
        self.aniFillMode = kCAFillModeForwards;
        self.aniRepeatCount = 1;
    }
    return self;
}


- (FMBaseAnimation * _Nonnull (^)(NSString * _Nonnull))key{
    WeakSelf;
    return ^(NSString *key){
        weakSelf.animationKey = key;
        return weakSelf;
    };
}

- (FMBaseAnimation * _Nonnull (^)(FMAnimationType))type{
    WeakSelf;
    return ^(FMAnimationType type){
        weakSelf.aniType = type;
        return weakSelf;
    };
}

- (FMBaseAnimation * _Nonnull (^)(NSTimeInterval))duration{
    WeakSelf;
    return ^(NSTimeInterval interval){
        weakSelf.aniDuration = interval;
        return weakSelf;
    };
}

- (FMBaseAnimation * _Nonnull (^)(float))repeat{
    WeakSelf;
    return ^(float count){
        weakSelf.aniRepeatCount = count;
        return weakSelf;
    };
}

- (FMBaseAnimation * _Nonnull (^)(BOOL))reverse{
    WeakSelf;
    return ^(BOOL autore){
        weakSelf.aniAutoreverses = autore;
        return weakSelf;
    };
}

- (FMBaseAnimation * _Nonnull (^)(BOOL))reOnCom{
    WeakSelf;
    return ^(BOOL remove){
        weakSelf.aniRemovedOnCompletion = remove;
        return weakSelf;
    };
}

- (FMBaseAnimation * _Nonnull (^)(CAMediaTimingFillMode _Nonnull))fillMode{
    WeakSelf;
    return ^(CAMediaTimingFillMode model){
        weakSelf.aniFillMode = model;
        return weakSelf;
    };
}

- (FMBaseAnimation * _Nonnull (^)(CAMediaTimingFunctionName _Nonnull))timeFuncName{
    WeakSelf;
    return ^(CAMediaTimingFunctionName name){
        weakSelf.aniTimeFuncName = name;
        return weakSelf;
    };
}

- (FMBaseAnimation * _Nonnull (^)(FMAnimationStartBlock _Nonnull))start{
    WeakSelf;
    return ^(FMAnimationStartBlock start){
        weakSelf.delegate.start = start;
        return weakSelf;
    };
}

- (FMBaseAnimation * _Nonnull (^)(FMAnimationStopBlock _Nonnull))stop{
    WeakSelf;
    return ^(FMAnimationStopBlock stop){
        weakSelf.delegate.stop = stop;
        return weakSelf;
    };
}

@end
