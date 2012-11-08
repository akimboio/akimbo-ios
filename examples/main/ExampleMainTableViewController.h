//
//  ExampleMainTableViewController.h
//  akimbo-ios
//
//  Created by Jared Lewis on 11/8/12.
//  Copyright (c) 2012 Akimbo. All rights reserved.
//

#import "AkimboUITableViewController.h"

@interface ExampleMainTableViewController : AkimboUITableViewController <AkimboUITableViewControllerSectionDelegate>

- (UILabel *)createHeaderWithText:(NSString *)text;

@end
