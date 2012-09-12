//
//  KGIOSAppDelegate.m
//  KGNoiseEample
//
//  Created by David Keegan on 9/11/12.
//  Copyright (c) 2012 David Keegan. All rights reserved.
//

#import "KGIOSAppDelegate.h"
#import "KGNoise.h"

@implementation KGIOSAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
	self.window.rootViewController = [[UIViewController alloc] init];

    KGNoiseView *noiseView = [[KGNoiseView alloc] initWithFrame:self.window.rootViewController.view.bounds];
    noiseView.backgroundColor = [UIColor darkGrayColor];
    noiseView.noiseBlendMode = kCGBlendModeMultiply;
    noiseView.noiseOpacity = 0.1;
    [self.window.rootViewController.view addSubview:noiseView];

    [self.window makeKeyAndVisible];
    return YES;
}

@end
