//
//  KGMacAppDelegate.h
//  KGNoiseExample
//
//  Created by David Keegan on 9/11/12.
//  Copyright (c) 2012 David Keegan. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "KGNoise.h"

@interface KGMacAppDelegate : NSObject <NSApplicationDelegate>

@property (assign) IBOutlet NSWindow *window;
@property (weak) IBOutlet KGNoiseLinearGradientView *viewLeft;
@property (weak) IBOutlet KGNoiseRadialGradientView *viewRight;
@property (weak) IBOutlet NSImageView *imageView;

@end
