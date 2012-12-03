//
//  TableViewControllerSection.h
//  fireplug-ios
//
//  Created by Jared Lewis on 9/4/12.
//  Copyright (c) 2012 Akimbo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AkimboObservable.h"
#import "AkimboDataStore.h"
#import "AkimboDataStoreDelegate.h"

@class AkimboUITableViewController;
@class AkimboUITableViewControllerSection;


/////////////////////////////////////////////////////////////////////
//  Delegate Protocols
/////////////////////////////////////////////////////////////////////
@protocol AkimboUITableViewControllerSectionDelegate <NSObject>

@optional
- (void)tableSection:(AkimboUITableViewControllerSection *)section cellClicked:(UITableViewCell *)cell withRecord:(id)record;
- (void)tableSection:(AkimboUITableViewControllerSection *)section renderCell:(UITableViewCell *)cell;
- (void)tableSection:(AkimboUITableViewControllerSection *)section configureCell:(UITableViewCell *)cell withRecord:(id)record;
- (void)tableSection:(AkimboUITableViewControllerSection *)section configureSelectedCell:(UITableViewCell *)cell withRecord:(id)record;
- (void)tableSection:(AkimboUITableViewControllerSection *)section configureUnselectedCell:(UITableViewCell *)cell withRecord:(id)record;
- (void)tableSection:(AkimboUITableViewControllerSection *)section selectionChange:(NSArray *)selection;
- (void)tableSection:(AkimboUITableViewControllerSection *)section removeCell:(UITableViewCell *)cell withRecord:(id)record;
- (CGFloat)tableSection:(AkimboUITableViewControllerSection *)section heightForCell:(UITableViewCell *)cell withRecord:(id)record;
@end

@interface AkimboUITableViewControllerSection : AkimboObservable <AkimboDataStoreDelegate>

@property (nonatomic, weak) AkimboUITableViewController *tableViewController;
@property (nonatomic) NSString *cellClass;
@property (nonatomic) BOOL cellIsXib;
@property (nonatomic) AkimboDataStore *store;
@property (nonatomic) NSMutableArray *selection;
@property (nonatomic) BOOL multiSelect;
@property (nonatomic) BOOL editable;
@property (nonatomic) UIView *header;
@property (nonatomic) NSString *headerTitle;
@property (nonatomic) UIView *footer;
@property (nonatomic) UIView *customView;
@property (nonatomic) BOOL canEdit;
@property (nonatomic) BOOL canDelete;
@property (nonatomic) CGFloat cellHeight;
@property (nonatomic) CGFloat headerHeight;
@property (nonatomic) CGFloat footerHeight;

//Init Methods
- (id)initWithCellClass:(NSString *)cellClass;
- (id)initWithStore:(AkimboDataStore *)store;
+ (id)sectionWithSingleView:(UIView *)view;

//Init setup methods
- (void)initComponent;
- (void)initHeader;

//Methods to extend
- (UITableViewCell *)getCellWithRecord:(id)record;
- (CGFloat)getHeaderHeight;
- (CGFloat)getFooterHeight;
- (CGFloat)getCellHeight:(id)record;
- (void)renderCell:(UITableViewCell *)cell withRecord:(id)record atIndexPath:(NSIndexPath *)indexPath;
- (void)configureCell:(UITableViewCell *)cell withRecord:(id)record;
- (void)configureSelectedCell:(UITableViewCell *)cell withRecord:(id)record;
- (void)configureUnselectedCell:(UITableViewCell *)cell withRecord:(id)record;
- (void)selectedCell:(UITableViewCell *)cell withRecord:(id)record;
- (void)unselectedCell:(UITableViewCell *)cell withRecord:(id)record;
- (void)removeCell:(UITableViewCell *)cell withRecord:(id)record;
- (BOOL)canEditRecord:(id)record;
- (BOOL)canDeleteRecord:(id)record;

//Methods
- (NSIndexPath *)getIndexPathForRecord:(id)record;
- (void)clearSelection;
- (void)selectRecord:(id)record;
- (void)selectRecord:(id)record callDelegate:(BOOL)callDelegate;
- (void)deselectRecord:(id)record;

//Event Methods
- (void)onCellClicked:(UITableViewCell *)cell withRecord:(id)record;
- (void)onRemoveCell:(UITableViewCell *)cell withRecord:(id)record;
- (void)onSelectionChange:(NSArray *)selection;

@end
