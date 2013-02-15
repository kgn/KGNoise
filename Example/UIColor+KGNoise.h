//
//  UIColor+KGNoise.h
//  KGNoiseExample
//
//  Created by Cory Imdieke on 9/14/12.
//  Copyright (c) 2012 BitSuites, LLC. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (KGNoise)

- (UIColor *)colorWithNoiseOpacity:(CGFloat)opacity;
- (UIColor *)colorWithNoiseOpacity:(CGFloat)opacity andBlendMode:(CGBlendMode)blendMode;

@end
