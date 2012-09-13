//
//  UIImage+KGNoise.m
//  KGNoiseExample
//
//  Created by Cory Imdieke on 9/13/12.
//  Copyright (c) 2012 BitSuites, LLC. All rights reserved.
//

#import "UIImage+KGNoise.h"
#import "KGNoise.h"

@implementation UIImage (KGNoise)

- (UIImage *)imageWithNoiseOpacity:(CGFloat)opacity{
	return [self imageWithNoiseOpacity:opacity andBlendMode:kCGBlendModeScreen];
}

- (UIImage *)imageWithNoiseOpacity:(CGFloat)opacity andBlendMode:(CGBlendMode)blendMode{
	// Create a context to draw in
	CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
	CGContextRef context = CGBitmapContextCreate(NULL,
												 self.size.width,
												 self.size.height,
												 8, /* bits per channel */
												 (self.size.width * 4), /* 4 channels per pixel * numPixels/row */
												 colorSpace,
												 kCGImageAlphaPremultipliedLast);
	CGColorSpaceRelease(colorSpace);
	
	// Flip context
	CGContextTranslateCTM(context, 0, self.size.height);
	CGContextScaleCTM(context, 1.0, -1.0);
	
	UIGraphicsPushContext(context);
	
	// Draw the image
	[self drawAtPoint:CGPointMake(0.0, 0.0)];
	
	// Noise on top
	[KGNoise drawNoiseWithOpacity:opacity andBlendMode:blendMode];
	
	// Create a CGImage from the context
    CGImageRef rawImage = CGBitmapContextCreateImage(context);
	UIGraphicsPopContext();
    CGContextRelease(context);
    
    // Create a UIImage from the CGImage
    UIImage *finishedImage = [UIImage imageWithCGImage:rawImage];
    CGImageRelease(rawImage);
    
    return finishedImage;
}

@end
