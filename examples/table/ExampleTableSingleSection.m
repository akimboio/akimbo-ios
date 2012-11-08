//
//  ExampleTableSingleSection.m
//  akimbo-ios
//
//  Created by Jared Lewis on 11/8/12.
//  Copyright (c) 2012 Akimbo. All rights reserved.
//

#import "ExampleTableSingleSection.h"

@interface ExampleTableSingleSection ()

@end

@implementation ExampleTableSingleSection

#pragma mark - Init Methods
- (void)initSections
{
    [super initSections];
    
    AkimboUITableViewControllerSection *section = [[AkimboUITableViewControllerSection alloc] init];
    [section addDelegate:self];
    NSDictionary *data = [self getData:ExampleTableDataSourceSencha];
    NSArray *records = [data objectForKey:@"topics"];
    [self addSection:section];
    [section.store load:records];
}

#pragma mark - AkimboUITableViewSection Delegate Methods
- (void)tableSection:(AkimboUITableViewControllerSection *)section configureCell:(UITableViewCell *)cell withRecord:(NSDictionary *)record
{
    [cell.textLabel setText:[record objectForKey:@"topic_title"]];
}

- (void)tableSection:(AkimboUITableViewControllerSection *)section cellClicked:(UITableViewCell *)cell withRecord:(id)record
{
    UIViewController *viewController = [[UIViewController alloc] init];
    UIWebView *webView = [[UIWebView alloc] init];
    [viewController setView:webView];
    NSString *urlString = [NSString stringWithFormat:@"http://www.sencha.com/forum/showthread.php?t=%@&p=%@", [record objectForKey:@"topic_id"], [record objectForKey:@"post_id"]];
    
    NSURL *url = [NSURL URLWithString:urlString];
    NSURLRequest *requestObj = [NSURLRequest requestWithURL:url];
    [webView loadRequest:requestObj];
    [self.navigationController pushViewController:viewController animated:YES];
}

@end
