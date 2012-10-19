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

    KGNoiseRadialGradientView *noiseView = [[KGNoiseRadialGradientView alloc] initWithFrame:self.window.rootViewController.view.bounds];
    noiseView.backgroundColor = [UIColor colorWithRed:0.814 green:0.798 blue:0.747 alpha:1.000];
    noiseView.alternateBackgroundColor = [UIColor colorWithRed:1.000 green:0.986 blue:0.945 alpha:1.000];
    noiseView.noiseOpacity = 0.3;
    [self.window.rootViewController.view addSubview:noiseView];

    CGRect noiseToolbarViewRect = self.window.rootViewController.view.bounds;
    noiseToolbarViewRect.size.height = 48;
    noiseToolbarViewRect.origin.y = CGRectGetHeight(self.window.rootViewController.view.bounds)-CGRectGetHeight(noiseToolbarViewRect);
    KGNoiseLinearGradientView *noiseToolbarView = [[KGNoiseLinearGradientView alloc] initWithFrame:noiseToolbarViewRect];
    noiseToolbarView.backgroundColor = [UIColor colorWithWhite:0.102 alpha:1.000];
    noiseToolbarView.alternateBackgroundColor = [UIColor colorWithWhite:0.250 alpha:1.000];
    noiseToolbarView.noiseBlendMode = kCGBlendModeMultiply;
    noiseToolbarView.noiseOpacity = 0.2;
    [self.window.rootViewController.view addSubview:noiseToolbarView];

    CGRect noiseNavbarViewRect = self.window.rootViewController.view.bounds;
    noiseNavbarViewRect.size.height = 48;
    KGNoiseLinearGradientView *noiseNavbarView = [[KGNoiseLinearGradientView alloc] initWithFrame:noiseNavbarViewRect];
    noiseNavbarView.backgroundColor = [UIColor colorWithRed:0.307 green:0.455 blue:0.909 alpha:1.000];
    noiseNavbarView.alternateBackgroundColor = [UIColor colorWithRed:0.363 green:0.700 blue:0.909 alpha:1.000];
    noiseNavbarView.noiseBlendMode = kCGBlendModeMultiply;
    noiseNavbarView.noiseOpacity = 0.08;
    [self.window.rootViewController.view addSubview:noiseNavbarView];

    [self.window makeKeyAndVisible];
    return YES;
}

@end
