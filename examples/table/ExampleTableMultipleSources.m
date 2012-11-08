//
//  ExampleTableMultipleSources.m
//  akimbo-ios
//
//  Created by Jared Lewis on 11/8/12.
//  Copyright (c) 2012 Akimbo. All rights reserved.
//

#import "ExampleTableMultipleSources.h"
#import "NSString+Akimbo.h"

@interface ExampleTableMultipleSources ()

@end

@implementation ExampleTableMultipleSources

#pragma mark - Init Methods
- (void)initSections
{
    [super initSections];
    
    //Create the nooga section
    AkimboUITableViewControllerSection *section = [[AkimboUITableViewControllerSection alloc] init];
    [section addDelegate:self];
    NSDictionary *data = [self getData:ExampleTableDataSourceNooga];
    NSArray *records = [data objectForKey:@"records"];
    [self addSection:section];
    [section.store load:records];
    
    //Create the sencha sections
    data = [self getData:ExampleTableDataSourceSencha];
    NSArray *topics = [data objectForKey:@"topics"];
    NSMutableDictionary *forumNames = [[NSMutableDictionary alloc] init];
    for (NSDictionary *topic in topics) {
        NSString *forumName = [topic objectForKey:@"forum_title"];
        if (![forumNames objectForKey:forumName]) {
            [forumNames setObject:[[NSMutableArray alloc] init] forKey:forumName];
        }
        NSMutableArray *forumTopics = [forumNames objectForKey:forumName];
        [forumTopics addObject:topic];
    }
    
    //Create a section for each forum name
    for (NSString *forumName in forumNames) {
        AkimboUITableViewControllerSection *section = [[AkimboUITableViewControllerSection alloc] init];
        [section addDelegate:self];
        [section setHeader:[self createHeaderWithText:forumName]];
        [section setHeaderHeight:40];
        [section.store load:[forumNames objectForKey:forumName]];
        [self addSection:section];
    }
}

#pragma mark - AkimboUITableViewSection Delegate Methods
- (void)tableSection:(AkimboUITableViewControllerSection *)section configureCell:(UITableViewCell *)cell withRecord:(NSDictionary *)record
{
    NSString *text = @"";
    if ([record objectForKey:@"title"]) {
        text = [record objectForKey:@"title"];
    }
    if ([record objectForKey:@"topic_title"]) {
        text = [record objectForKey:@"topic_title"];
    }
    [cell.textLabel setText:text];
}

- (void)tableSection:(AkimboUITableViewControllerSection *)section cellClicked:(UITableViewCell *)cell withRecord:(id)record
{
    
    UIViewController *viewController = [[UIViewController alloc] init];
    UIWebView *webView = [[UIWebView alloc] init];
    [viewController setView:webView];
    NSString *urlString = @"";
    if ([record objectForKey:@"id"]) {
        urlString = [NSString stringWithFormat:@"http://nooga.com/%@", [record objectForKey:@"id"]];
    }
    if ([record objectForKey:@"topic_id"]) {
        urlString = [NSString stringWithFormat:@"http://www.sencha.com/forum/showthread.php?t=%@&p=%@", [record objectForKey:@"topic_id"], [record objectForKey:@"post_id"]];
    }
    
    NSURL *url = [NSURL URLWithString:urlString];
    NSURLRequest *requestObj = [NSURLRequest requestWithURL:url];
    [webView loadRequest:requestObj];
    
    [self.navigationController pushViewController:viewController animated:YES];
}

@end
