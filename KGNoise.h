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

@interface KGNoise : NSObject

+ (void)drawNoiseWithOpacity:(CGFloat)opacity;
+ (void)drawNoiseWithOpacity:(CGFloat)opacity andBlendMode:(CGBlendMode)blendMode;

@end

#if TARGET_OS_IPHONE
@interface KGNoiseView : UIView
#else
@interface KGNoiseView : NSView
@property (strong, nonatomic) NSColor *backgroundColor;
#endif
@property (nonatomic) CGFloat noiseOpacity;
@property (nonatomic) CGBlendMode noiseBlendMode;
@end
