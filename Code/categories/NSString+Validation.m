//
//  NSString+Validation.m
//  fireplug-ios
//
//  Created by Cory Walker on 13/07/2012.
//
//

#import "NSString+Validation.h"

@implementation NSString (Validation)

- (BOOL)isEmail
{
    BOOL stricterFilter = YES; // Discussion http://blog.logichigh.com/2010/09/02/validating-an-e-mail-address/
    NSString *stricterFilterString = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSString *laxString = @".+@.+\\.[A-Za-z]{2}[A-Za-z]*";
    NSString *emailRegex = stricterFilter ? stricterFilterString : laxString;
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    return [emailTest evaluateWithObject:self];
}

- (BOOL)isBlank
{
    return [self isEqualToString:@""];
}

- (BOOL)isWhitespace
{
    NSString *trimmed = [self stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    return [trimmed isEqualToString:@""];
}

@end
