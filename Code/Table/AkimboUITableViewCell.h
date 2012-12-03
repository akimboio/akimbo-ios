//
//  FireplugTableViewCell.h
//  fireplug-ios
//
//  Created by Jared Lewis on 8/21/12.
//  Copyright (c) 2012 Akimbo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AkimboUITableViewController.h"
#import "AkimboUITableViewControllerSection.h"

@class AkimboUITableViewControllerSection;

@interface AkimboUITableViewCell : UITableViewCell

@property (nonatomic, weak) AkimboUITableViewControllerSection *section;
@property (nonatomic, weak) id record;

//Methods
- (void)initComponent;
- (void)configureWithRecord:(id)record fromSection:(AkimboUITableViewControllerSection *)section;
- (void)configureSelectedWithRecord:(id)record fromSection:(AkimboUITableViewControllerSection *)section;
- (void)configureUnselectedWithRecord:(id)record fromSection:(AkimboUITableViewControllerSection *)section;
@end
