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

- (void)dealloc
{
    for (AkimboUITableViewControllerSection *section in self.sections) {
        [section removeDelegate:self];
    }
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

- (NSDictionary *)getData:(ExampleTableDataSource)source
{
    NSString *urlSource = @"";
    switch (source) {
        case 0:
            urlSource = @"http://www.sencha.com/forum/topics-remote.php?&limit=30";
            break;
            
        case 1:
            urlSource = @"http://nooga.com/article/article-api/public?category=1&limit=50";
            break;
        default:
            break;
    }

    //Add some fake items to the store
    NSData *jsonData = [NSData dataWithContentsOfURL:[NSURL URLWithString:urlSource]];
    id jsonObjects = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingMutableContainers error:nil];
    return jsonObjects;
}

@end
