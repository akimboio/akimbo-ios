//
//  NSMutableArray_Shuffling.h
//  fireplug-ios
//
//  Created by Cory Walker on 04/07/2012.
//
//

#if TARGET_OS_IPHONE
#import <UIKit/UIKit.h>
#else
#include <Cocoa/Cocoa.h>
#endif

// This category enhances NSMutableArray by providing
// methods to randomly shuffle the elements.
@interface NSMutableArray (Shuffling)
- (void)shuffle;
@end
