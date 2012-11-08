//
//  ExampleMainTableViewController.m
//  akimbo-ios
//
//  Created by Jared Lewis on 11/8/12.
//  Copyright (c) 2012 Akimbo. All rights reserved.
//

#import "ExampleMainTableViewController.h"

//Table Imports
#import "ExampleTableSingleSection.h"
#import "ExampleTableMultipleSections.h"
#import "ExampleTableMultipleSources.h"

@interface ExampleMainTableViewController ()

@end

@implementation ExampleMainTableViewController

- (void)initSections
{
    [super initSections];
    
    [self initTableSection];
}

- (void)initTableSection
{
    AkimboUITableViewControllerSection *tableSection = [[AkimboUITableViewControllerSection alloc] init];
    [tableSection addDelegate:self];
    [tableSection setHeader:[self createHeaderWithText:@"Tables"]];
    [tableSection setHeaderHeight:40];
    [self addSection:tableSection];
    
    //Create the example cells
    [tableSection.store addItem:@{
        @"title": @"Single Section",
        @"class": NSStringFromClass([ExampleTableSingleSection class])
     }];
    [tableSection.store addItem:@{
        @"title": @"Multiple Sections",
        @"class": NSStringFromClass([ExampleTableMultipleSections class])
     }];
    [tableSection.store addItem:@{
        @"title": @"Multiple Sources",
        @"class": NSStringFromClass([ExampleTableMultipleSources class])
     }];
}

- (UILabel *)createHeaderWithText:(NSString *)text
{
    UILabel *headerLabel = [[UILabel alloc] init];
    [headerLabel setBackgroundColor:[UIColor grayColor]];
    [headerLabel setTextColor:[UIColor whiteColor]];
    [headerLabel setText:text];
    [headerLabel sizeToFit];
    return headerLabel;
}

- (void)tableSection:(AkimboUITableViewControllerSection *)section configureCell:(UITableViewCell *)cell withRecord:(NSDictionary *)record
{
    cell.textLabel.text = [record objectForKey:@"title"];
}

- (void)tableSection:(AkimboUITableViewControllerSection *)section cellClicked:(UITableViewCell *)cell withRecord:(NSDictionary *)record
{
    if ([record objectForKey:@"action"]) {
        id block = [record objectForKey:@"action"];
        ((void(^)(void))block)();
    }
    
    if ([record objectForKey:@"class"]) {
        Class class = NSClassFromString([record objectForKey:@"class"]);
        id instance = [[class alloc] init];
        [[instance navigationItem] setTitle:[record objectForKey:@"title"]];
        [self.navigationController pushViewController:instance animated:YES];
        
    }
}

@end
