//
//  FMBaseAnimation.h
//  Animation
//
//  Created by 郑桂华 on 2019/12/9.
//  Copyright © 2019 郑桂华. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "FMAnimationConstant.h"
#import "FMAnimationDelegate.h"

NS_ASSUME_NONNULL_BEGIN

@class FMAnimationDelegate;
@interface FMBaseAnimation : NSObject

@property(nonatomic, strong)FMAnimationDelegate *delegate;
@property(nonatomic, copy)NSString *animationKey;

@property(nonatomic, assign)FMAnimationType aniType;

@property(nonatomic, assign)NSTimeInterval aniDuration;
@property(nonatomic, assign)float aniRepeatCount;
@property(nonatomic, assign)BOOL aniAutoreverses;
@property(nonatomic, assign)BOOL aniRemovedOnCompletion;
@property(nonatomic, copy)CAMediaTimingFillMode aniFillMode;
@property(nonatomic, copy)CAMediaTimingFunctionName aniTimeFuncName;

@property(nonatomic, copy, readonly)FMBaseAnimation *(^key)(NSString *key);

@property(nonatomic, copy, readonly)FMBaseAnimation *(^duration)(NSTimeInterval interval);
@property(nonatomic, copy, readonly)FMBaseAnimation *(^repeat)(float count);
@property(nonatomic, copy, readonly)FMBaseAnimation *(^reverse)(BOOL reverse);
@property(nonatomic, copy, readonly)FMBaseAnimation *(^reOnCom)(BOOL reOnCom);
@property(nonatomic, copy, readonly)FMBaseAnimation *(^fillMode)(CAMediaTimingFillMode fillMode);
@property(nonatomic, copy, readonly)FMBaseAnimation *(^timeFuncName)(CAMediaTimingFunctionName name);

@property(nonatomic, copy, readonly)FMBaseAnimation *(^type)(FMAnimationType type);

@property(nonatomic, copy, readonly)FMBaseAnimation *(^start)(FMAnimationStartBlock start);
@property(nonatomic, copy, readonly)FMBaseAnimation *(^stop)(FMAnimationStopBlock stop);

@end

NS_ASSUME_NONNULL_END
