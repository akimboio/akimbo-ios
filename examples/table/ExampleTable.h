//
//  ExampleTable.h
//  akimbo-ios
//
//  Created by Jared Lewis on 11/8/12.
//  Copyright (c) 2012 Akimbo. All rights reserved.
//

#import "Akimbo.h"

enum {
    ExampleTableDataSourceSencha = 0,
    ExampleTableDataSourceNooga = 1,
};
typedef NSUInteger ExampleTableDataSource;

@interface ExampleTable : AkimboUITableViewController <AkimboUITableViewControllerSectionDelegate>

- (NSDictionary *)getData:(ExampleTableDataSource)source;
- (UILabel *)createHeaderWithText:(NSString *)text;

@end
