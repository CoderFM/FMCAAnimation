//
//  FMAnimation.h
//  Animation
//
//  Created by 郑桂华 on 2019/11/22.
//  Copyright © 2019 郑桂华. All rights reserved.
//

#import "FMBaseAnimation.h"
#import "FMAnimationItem.h"
#import "FMAnimationConstant.h"

NS_ASSUME_NONNULL_BEGIN



@interface FMAnimation : FMBaseAnimation

@property(nonatomic, weak)CALayer *targetLayer;

@property(nonatomic, copy, readonly)FMAnimation *(^type)(FMAnimationGroupType type);

// Position
@property(nonatomic, copy, readonly)FMAnimationItem *(^positionX)(CGFloat x);
@property(nonatomic, copy, readonly)FMAnimationItem *(^positionY)(CGFloat y);
@property(nonatomic, copy, readonly)FMAnimationItem *(^position)(CGPoint point);

// Translation
@property(nonatomic, copy, readonly)FMAnimationItem *(^translationX)(CGFloat x);
@property(nonatomic, copy, readonly)FMAnimationItem *(^translationY)(CGFloat y);
@property(nonatomic, copy, readonly)FMAnimationItem *(^translationZ)(CGFloat z);

// Rotation
@property(nonatomic, copy, readonly)FMAnimationItem *(^rotationX)(CGFloat x);
@property(nonatomic, copy, readonly)FMAnimationItem *(^rotationY)(CGFloat y);
@property(nonatomic, copy, readonly)FMAnimationItem *(^rotationZ)(CGFloat z);

// Scale
@property(nonatomic, copy, readonly)FMAnimationItem *(^scaleX)(CGFloat x);
@property(nonatomic, copy, readonly)FMAnimationItem *(^scaleY)(CGFloat y);
@property(nonatomic, copy, readonly)FMAnimationItem *(^scaleZ)(CGFloat z);

// opacity
@property(nonatomic, copy, readonly)FMAnimationItem *(^opacity)(CGFloat opacity);

// backgroundColor
@property(nonatomic, copy, readonly)FMAnimationItem *(^bgColor)(UIColor *color);

// cornerRadius
@property(nonatomic, copy, readonly)FMAnimationItem *(^cornerRadius)(CGFloat cornerRadius);

// borderWidth
@property(nonatomic, copy, readonly)FMAnimationItem *(^borderWidth)(CGFloat borderWidth);

// borderColor
@property(nonatomic, copy, readonly)FMAnimationItem *(^bdColor)(UIColor *color);

// path
@property(nonatomic, copy, readonly)FMAnimationItem *(^positionPath)(UIBezierPath *path);

@end

NS_ASSUME_NONNULL_END
