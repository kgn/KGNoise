//
//  KGMacAppDelegate.m
//  KGNoiseExample
//
//  Created by David Keegan on 9/11/12.
//  Copyright (c) 2012 David Keegan. All rights reserved.
//

#import "KGMacAppDelegate.h"

@implementation KGMacAppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification{
    self.viewLeft.backgroundColor = [NSColor colorWithCalibratedRed:0.363 green:0.700 blue:0.909 alpha:1.000];
    self.viewLeft.alternateBackgroundColor = [NSColor colorWithCalibratedRed:0.307 green:0.455 blue:0.909 alpha:1.000];
    self.viewLeft.noiseBlendMode = kCGBlendModeMultiply;
    self.viewLeft.noiseOpacity = 0.1;

    self.viewRight.backgroundColor = [NSColor colorWithCalibratedWhite:0.500 alpha:1.000];
    self.viewRight.alternateBackgroundColor = [NSColor colorWithCalibratedWhite:0.750 alpha:1.000];
    self.viewRight.noiseOpacity = 0.2;

    self.imageView.image = [[NSImage imageNamed:@"button"] imageWithNoiseOpacity:0.2 andBlendMode:kCGBlendModeDarken];
}

@end
