//
//  KGNoise.m
//  KGNoise
//
//  Created by David Keegan on 9/11/12.
//  Copyright (c) 2012 David Keegan. All rights reserved.
//

#import "KGNoise.h"

@implementation KGNoise

+ (void)drawNoiseWithOpacity:(CGFloat)opacity{
    [self drawNoiseWithOpacity:opacity andBlendMode:kCGBlendModeScreen];
}

+ (void)drawNoiseWithOpacity:(CGFloat)opacity andBlendMode:(CGBlendMode)blendMode{
    static CGImageRef noiseImageRef = nil;
    static dispatch_once_t oncePredicate;
    dispatch_once(&oncePredicate, ^{
        NSUInteger width = 128, height = width;
        NSUInteger size = width*height;
        char *rgba = (char *)malloc(size); srand(115);
        for(NSUInteger i=0; i < size; ++i){rgba[i] = rand()%256;}
        CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceGray();
        CGContextRef bitmapContext =
        CGBitmapContextCreate(rgba, width, height, 8, width, colorSpace, kCGImageAlphaNone);
        CFRelease(colorSpace);
        noiseImageRef = CGBitmapContextCreateImage(bitmapContext);
        CFRelease(bitmapContext);
        free(rgba);
    });

#if TARGET_OS_IPHONE
    CGContextRef context = UIGraphicsGetCurrentContext();
#else
    CGContextRef context = [[NSGraphicsContext currentContext] graphicsPort];
#endif

    CGContextSaveGState(context);
    CGContextSetAlpha(context, opacity);
    CGContextSetBlendMode(context, blendMode);

#if TARGET_OS_IPHONE
    if([[UIScreen mainScreen] respondsToSelector:@selector(scale)]){
        CGFloat scaleFactor = [[UIScreen mainScreen] scale];
        CGContextScaleCTM(context, 1/scaleFactor, 1/scaleFactor);
    }
#else
    if([[NSScreen mainScreen] respondsToSelector:@selector(backingScaleFactor)]){
        CGFloat scaleFactor = [[NSScreen mainScreen] backingScaleFactor];
        CGContextScaleCTM(context, 1/scaleFactor, 1/scaleFactor);
    }
#endif

    CGRect imageRect = (CGRect){CGPointZero, CGImageGetWidth(noiseImageRef), CGImageGetHeight(noiseImageRef)};
    CGContextDrawTiledImage(context, imageRect, noiseImageRef);
    CGContextRestoreGState(context);
}

@end

@implementation KGNoiseView

#if TARGET_OS_IPHONE
- (id)initWithFrame:(CGRect)frameRect{
#else
- (id)initWithFrame:(NSRect)frameRect{
#endif
    if((self = [super initWithFrame:frameRect])){
        [self setup];
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder{
    if((self = [super initWithCoder:aDecoder])){
        [self setup];
    }
    return self;
}

- (void)setup{
#if TARGET_OS_IPHONE
    self.backgroundColor = [UIColor grayColor];
#else
    self.backgroundColor = [NSColor grayColor];
#endif
    self.noiseOpacity = 0.1;
    self.noiseBlendMode = kCGBlendModeScreen;
}

#if TARGET_OS_IPHONE
#else
- (void)setBackgroundColor:(NSColor *)backgroundColor{
    if(_backgroundColor != backgroundColor){
        _backgroundColor = backgroundColor;
        [self setNeedsDisplay:YES];
    }
}
#endif

- (void)setNoiseOpacity:(CGFloat)noiseOpacity{
    if(_noiseOpacity != noiseOpacity){
        _noiseOpacity = noiseOpacity;
#if TARGET_OS_IPHONE        
        [self setNeedsDisplay];
#else
        [self setNeedsDisplay:YES];
#endif
    }
}

- (void)setNoiseBlendMode:(CGBlendMode)noiseBlendMode{
    if(_noiseBlendMode != noiseBlendMode){
        _noiseBlendMode = noiseBlendMode;
#if TARGET_OS_IPHONE
        [self setNeedsDisplay];
#else
        [self setNeedsDisplay:YES];
#endif
    }
}

#if TARGET_OS_IPHONE
- (void)drawRect:(CGRect)dirtyRect{
    CGContextRef context = UIGraphicsGetCurrentContext();    
#else
- (void)drawRect:(NSRect)dirtyRect{
    CGContextRef context = [[NSGraphicsContext currentContext] graphicsPort];    
#endif
    [self.backgroundColor setFill];
    CGContextFillRect(context, self.bounds);
    [KGNoise drawNoiseWithOpacity:self.noiseOpacity andBlendMode:self.noiseBlendMode];
}

@end
