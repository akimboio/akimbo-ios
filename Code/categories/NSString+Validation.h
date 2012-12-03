//
//  NSString+Validation.h
//  fireplug-ios
//
//  Created by Cory Walker on 13/07/2012.
//
//

#if TARGET_OS_IPHONE
#import <UIKit/UIKit.h>
#else
#include <Cocoa/Cocoa.h>
#endif

// This category enhances NSString by providing
// methods to validate the strings.
@interface NSString (Validation)
- (BOOL)isEmail;
- (BOOL)isBlank;
- (BOOL)isWhitespace;
@end
