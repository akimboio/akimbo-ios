//
//  ExampleMainViewController.m
//  akimbo-ios
//
//  Created by Jared Lewis on 11/8/12.
//  Copyright (c) 2012 Akimbo. All rights reserved.
//

#import "ExampleMainNavigationViewController.h"

@interface ExampleMainNavigationViewController ()

@end

@implementation ExampleMainNavigationViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        [self pushViewController:[[ExampleMainTableViewController alloc] init] animated:NO];
    }
    return self;
}

@end
