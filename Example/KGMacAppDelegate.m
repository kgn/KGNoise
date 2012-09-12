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
    self.viewLeft.backgroundColor = [NSColor darkGrayColor];
    self.viewLeft.noiseBlendMode = kCGBlendModeMultiply;
    self.viewLeft.noiseOpacity = 0.1;

    self.viewRight.backgroundColor = [NSColor lightGrayColor];
    self.viewRight.noiseOpacity = 0.2;
}

@end
