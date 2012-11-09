//
//  KGNoise.h
//  KGNoise
//
//  Created by David Keegan on 9/11/12.
//  Copyright (c) 2012 David Keegan. All rights reserved.
//

#import <Foundation/Foundation.h>
#if TARGET_OS_IPHONE
#import <UIKit/UIKit.h>
#else
#import <Cocoa/Cocoa.h>
#endif

#pragma mark - KGNoise

@interface KGNoise : NSObject

+ (void)drawNoiseWithOpacity:(CGFloat)opacity;
+ (void)drawNoiseWithOpacity:(CGFloat)opacity andBlendMode:(CGBlendMode)blendMode;

@end

#pragma mark - KGNoise Color

#if TARGET_OS_IPHONE
@interface UIColor(KGNoise)
- (UIColor *)colorWithNoiseWithOpacity:(CGFloat)opacity;
- (UIColor *)colorWithNoiseWithOpacity:(CGFloat)opacity andBlendMode:(CGBlendMode)blendMode;
@end
#else
@interface NSColor(KGNoise)
- (NSColor *)colorWithNoiseWithOpacity:(CGFloat)opacity;
- (NSColor *)colorWithNoiseWithOpacity:(CGFloat)opacity andBlendMode:(CGBlendMode)blendMode;
@end
#endif

#pragma mark - KGNoiseView

#if TARGET_OS_IPHONE
@interface KGNoiseView : UIView
#else
@interface KGNoiseView : NSView
@property (strong, nonatomic) NSColor *backgroundColor;
#endif
@property (nonatomic) CGFloat noiseOpacity;
@property (nonatomic) CGBlendMode noiseBlendMode;
@end

#pragma mark - KGNoiseLinearGradientView

@interface KGNoiseLinearGradientView : KGNoiseView
#if TARGET_OS_IPHONE
@property (strong, nonatomic) UIColor *alternateBackgroundColor;
#else
@property (strong, nonatomic) NSColor *alternateBackgroundColor;
#endif
@end

#pragma mark - KGNoiseRadialGradientView

@interface KGNoiseRadialGradientView : KGNoiseView
#if TARGET_OS_IPHONE
@property (strong, nonatomic) UIColor *alternateBackgroundColor;
#else
@property (strong, nonatomic) NSColor *alternateBackgroundColor;
#endif
@end
