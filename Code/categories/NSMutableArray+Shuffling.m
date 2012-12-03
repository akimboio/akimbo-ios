//
//  NSMutableArray_Shuffling.m
//  fireplug-ios
//
//  Created by Cory Walker on 04/07/2012.
//
//

#import "NSMutableArray+Shuffling.h"

@implementation NSMutableArray (Shuffling)

- (void)shuffle
{
    static BOOL seeded = NO;

    if (seeded == NO) {
        seeded = YES;
        srandom(time(NULL));
    }
    
    NSUInteger count = [self count];
    for (NSUInteger i = 0; i < count; ++i) {
        // Select a random element between i and end of array to swap with.
        int nElements = count - i;
        int n = (random() % nElements) + i;
        [self exchangeObjectAtIndex:i withObjectAtIndex:n];
    }
}

@end
