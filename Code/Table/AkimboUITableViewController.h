//
//  TableViewController.h
//  fireplug-ios
//
//  Created by Jared Lewis on 7/19/12.
//  Copyright (c) 2012 Akimbo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AkimboUITableViewControllerSection.h"

/////////////////////////////////////////////////////////////////////
//  Needed classes
/////////////////////////////////////////////////////////////////////
@class AkimboUITableViewController;
@class AkimboUITableViewControllerSection;
@class LoadingViewController;
@class FireplugApplicationConfig;
@class FireplugLoadingView;
@class FireplugErrorView;

/////////////////////////////////////////////////////////////////////
//  Interface
/////////////////////////////////////////////////////////////////////
@interface AkimboUITableViewController : UITableViewController

@property (nonatomic, readonly) NSMutableArray *sections;

//Init methods
- (void)initComponent;
- (void)initProperties;
- (void)initSections;
- (void)initStyle;

//Methods
- (void)addSection:(AkimboUITableViewControllerSection *)section;
- (void)removeSection:(AkimboUITableViewControllerSection *)section;
- (void)removeAllSections;

- (UITableViewCell *)getCellForRowAtIndexPath:(NSIndexPath *)indexPath;
- (UITableViewCell *)getCellFromClass:(NSString *)classString;
- (AkimboUITableViewControllerSection *)getSectionFromIndexPath:(NSIndexPath *)indexPath;
- (id)getRecordFromIndexPath:(NSIndexPath *)indexPath;
- (int)getSectionIndex:(AkimboUITableViewControllerSection *)section;

- (void)reloadData;
- (void)registerCellClass:(NSString *)classString;
- (void)removeCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath withRecord:(id)record;

@end