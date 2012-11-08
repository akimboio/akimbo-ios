//
//  ExampleTable.m
//  akimbo-ios
//
//  Created by Jared Lewis on 11/8/12.
//  Copyright (c) 2012 Akimbo. All rights reserved.
//

#import "ExampleTable.h"

@interface ExampleTable ()

@end

@implementation ExampleTable

- (void)initSections
{
    [super initSections];
    
    AkimboUITableViewControllerSection *section = [[AkimboUITableViewControllerSection alloc] init];
    [self addSection:section];
    [section addDelegate:self];
    
    //Add some fake items to the store
    NSMutableArray *items = [[NSMutableArray alloc] init];
    for (int i = 0; i < 50; i++) {
        [items addObject:@{
            @"name": [NSString stringWithFormat:@"Item - %d", i]
        }];
    }
    [section.store load:items];
}

- (void)tableSection:(AkimboUITableViewControllerSection *)section configureCell:(UITableViewCell *)cell withRecord:(NSDictionary *)record
{
    [cell.textLabel setText:[record objectForKey:@"name"]];
}

@end
