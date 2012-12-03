//
//  AkimboDataStoreDelegate.h
//  akimbo-ios
//
//  Created by Wes Okes on 12/3/12.
//  Copyright (c) 2012 Akimbo. All rights reserved.
//

@class AkimboDataStore;

@protocol AkimboDataStoreDelegate <NSObject>

@optional
- (void)dataStore:(AkimboDataStore *)store change:(NSArray *)records;
- (void)dataStore:(AkimboDataStore *)store changeBuffered:(NSArray *)records;
- (void)dataStore:(AkimboDataStore *)store add:(NSArray *)records;
- (void)dataStore:(AkimboDataStore *)store remove:(id)record;
- (void)dataStore:(AkimboDataStore *)store removeAll:(NSArray *)records;
- (void)dataStoreWillLoad:(AkimboDataStore *)store;
- (void)dataStore:(AkimboDataStore *)store load:(NSArray *)records;

@end
