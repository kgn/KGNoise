//
//  KGMacAppDelegate.h
//  KGNoiseExample
//
//  Created by David Keegan on 9/11/12.
//  Copyright (c) 2012 David Keegan. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "KGNoise.h"

@interface KGAppDelegate : NSObject <NSApplicationDelegate>

@property (assign) IBOutlet NSWindow *window;
@property (weak) IBOutlet KGNoiseView *viewLeft;
@property (weak) IBOutlet KGNoiseView *viewRight;

@end
