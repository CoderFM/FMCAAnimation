//
//  FMAnimation.m
//  Animation
//
//  Created by 郑桂华 on 2019/11/22.
//  Copyright © 2019 郑桂华. All rights reserved.
//

#import "FMAnimation.h"


@interface FMAnimation ()
@property(nonatomic, strong)NSMutableArray<FMAnimationItem *> *animations;
@property(nonatomic, assign)FMAnimationGroupType groupType;
@end

FMAnimationItem* FMCreateAnimationItem(NSString *keyPath, id toValue, FMAnimation *animator);

@implementation FMAnimation

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.animations = [NSMutableArray array];
    }
    return self;
}

- (void)dealloc
{
    if (self.groupType == FMAnimationGroupTypeSeries) { //连续的
        NSTimeInterval begin = 0;
        NSMutableArray *animtions = [NSMutableArray array];
        for (FMAnimationItem *item in self.animations) {
            CAAnimation *ani = item.animation;
            ani.beginTime = CACurrentMediaTime() + begin;
            [animtions addObject:ani];
            [self.targetLayer addAnimation:ani forKey:@""];
            begin = ani.duration + begin;
        }
    } else { // 同时的
        NSTimeInterval interval = 0;
        NSMutableArray *animtions = [NSMutableArray array];
        for (FMAnimationItem *item in self.animations) {
            [animtions addObject:item.animation];
            interval = MAX(interval, item.aniDuration * item.aniRepeatCount);
        }
        CAAnimationGroup *group = [CAAnimationGroup animation];
        group.animations = [animtions copy];
        group.removedOnCompletion = self.aniRemovedOnCompletion;
        group.fillMode = self.aniFillMode;
        group.duration = MAX(interval, self.aniDuration);
        group.repeatCount = self.aniRepeatCount;
        group.autoreverses = self.aniAutoreverses;
        if (self.aniTimeFuncName) {
            group.timingFunction = [CAMediaTimingFunction functionWithName:self.aniTimeFuncName];
        }
        [self.targetLayer addAnimation:group forKey:@""];
    }
}

- (FMAnimation * _Nonnull (^)(FMAnimationGroupType))type{
    WeakSelf;
    return ^(FMAnimationGroupType type){
        weakSelf.groupType = type;
        return weakSelf;
    };
}

- (FMAnimationItem * _Nonnull (^)(CGFloat))positionX{
    WeakSelf;
    return ^(CGFloat x){
        return FMCreateAnimationItem(kCAPositionX, @(x), weakSelf);
    };
}

- (FMAnimationItem * _Nonnull (^)(CGFloat))positionY{
    WeakSelf;
    return ^(CGFloat y){
        return FMCreateAnimationItem(kCAPositionY, @(y), weakSelf);
    };
}

- (FMAnimationItem * _Nonnull (^)(CGPoint))position{
    WeakSelf;
    return ^(CGPoint point){
        return FMCreateAnimationItem(kCAPosition, [NSValue valueWithCGPoint:point], weakSelf);
    };
}

- (FMAnimationItem * _Nonnull (^)(CGFloat))translationX{
    WeakSelf;
    return ^(CGFloat x){
        return FMCreateAnimationItem(kCATranslationX, @(x), weakSelf);
    };
}

- (FMAnimationItem * _Nonnull (^)(CGFloat))translationY{
    WeakSelf;
    return ^(CGFloat y){
        return FMCreateAnimationItem(kCATranslationY, @(y), weakSelf);
    };
}

- (FMAnimationItem * _Nonnull (^)(CGFloat))translationZ{
    WeakSelf;
    return ^(CGFloat z){
        return FMCreateAnimationItem(kCATranslationZ, @(z), weakSelf);
    };
}

- (FMAnimationItem * _Nonnull (^)(CGFloat))rotationX{
    WeakSelf;
    return ^(CGFloat x){
        return FMCreateAnimationItem(kCARotationX, @(x), weakSelf);
    };
}

- (FMAnimationItem * _Nonnull (^)(CGFloat))rotationY{
    WeakSelf;
    return ^(CGFloat y){
        return FMCreateAnimationItem(kCARotationY, @(y), weakSelf);
    };
}

- (FMAnimationItem * _Nonnull (^)(CGFloat))rotationZ{
    WeakSelf;
    return ^(CGFloat z){
        return FMCreateAnimationItem(kCARotationZ, @(z), weakSelf);
    };
}

- (FMAnimationItem * _Nonnull (^)(CGFloat))scaleX{
    WeakSelf;
    return ^(CGFloat x){
        return FMCreateAnimationItem(kCAScaleX, @(x), weakSelf);
    };
}

- (FMAnimationItem * _Nonnull (^)(CGFloat))scaleY{
    WeakSelf;
    return ^(CGFloat y){
        return FMCreateAnimationItem(kCAScaleY, @(y), weakSelf);
    };
}

- (FMAnimationItem * _Nonnull (^)(CGFloat))scaleZ{
    WeakSelf;
    return ^(CGFloat z){
        return FMCreateAnimationItem(kCAScaleZ, @(z), weakSelf);
    };
}

- (FMAnimationItem * _Nonnull (^)(CGFloat))opacity{
    WeakSelf;
    return ^(CGFloat opacity){
        return FMCreateAnimationItem(kCAOpacity, @(opacity), weakSelf);
    };
}

- (FMAnimationItem * _Nonnull (^)(CGFloat))cornerRadius{
    WeakSelf;
    return ^(CGFloat cornerRadius){
        return FMCreateAnimationItem(kCACornerRadius, @(cornerRadius), weakSelf);
    };
}

- (FMAnimationItem * _Nonnull (^)(CGFloat))borderWidth{
    WeakSelf;
    return ^(CGFloat borderWidth){
        return FMCreateAnimationItem(kCABorderWidth, @(borderWidth), weakSelf);
    };
}

- (FMAnimationItem * _Nonnull (^)(UIColor * _Nonnull))bgColor{
    WeakSelf;
    return ^(UIColor *color){
        return FMCreateAnimationItem(kCABackgroundColor, color.CGColor, weakSelf);
    };
}

- (FMAnimationItem * _Nonnull (^)(UIColor * _Nonnull))bdColor{
    WeakSelf;
    return ^(UIColor *color){
        return FMCreateAnimationItem(kCABorderColor, color.CGColor, weakSelf);
    };
}

- (FMAnimationItem * _Nonnull (^)(UIBezierPath * _Nonnull))positionPath{
    WeakSelf;
    return ^(UIBezierPath *path){
        FMAnimationItem *item = [[FMAnimationItem alloc] init];
        item.keyPath = kCAPosition;
        item.path = path;
        item.next = weakSelf;
        [weakSelf.animations addObject:item];
        return item;
    };
}

@end

FMAnimationItem* FMCreateAnimationItem(NSString *keyPath, id toValue, FMAnimation *animator) {
    FMAnimationItem *item = [[FMAnimationItem alloc] init];
    item.keyPath = keyPath;
    item.toValue = toValue;
    item.next = animator;
    [animator.animations addObject:item];
    return item;
}
