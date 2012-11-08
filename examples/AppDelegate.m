//
//  AppDelegate.m
//  examples
//
//  Created by Jared Lewis on 11/8/12.
//  Copyright (c) 2012 Akimbo. All rights reserved.
//

#import "AppDelegate.h"
#import "ExampleMainNavigationViewController.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    
    //Create the window
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor whiteColor];
    
    //Add a table
    ExampleMainNavigationViewController *mainNavigation = [[ExampleMainNavigationViewController alloc] init];
    [self.window setRootViewController:mainNavigation];
    
    //Show the window
    [self.window makeKeyAndVisible];
    return YES;
}

@end
