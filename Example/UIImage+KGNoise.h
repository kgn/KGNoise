//
//  UIImage+KGNoise.h
//  KGNoiseExample
//
//  Created by Cory Imdieke on 9/13/12.
//  Copyright (c) 2012 BitSuites, LLC. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (KGNoise)

- (UIImage *)imageWithNoiseOpacity:(CGFloat)opacity;
- (UIImage *)imageWithNoiseOpacity:(CGFloat)opacity andBlendMode:(CGBlendMode)blendMode;

@end
