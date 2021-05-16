#import "Pairs.h"

@implementation Pairs

- (NSInteger)countPairs:(NSArray <NSNumber *> *)array number:(NSNumber *)number {
    
    int counter = 0;
    
    for (NSUInteger i = array.count - 1; i > 0; i--) {
        for (int j = 0; j < i; j++) {
            
            if ((array[i].intValue - array[j].intValue) == number.intValue) {
                counter++;
            }
        }
    }
    
    return counter;
}

@end
