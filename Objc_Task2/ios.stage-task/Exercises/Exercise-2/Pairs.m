#import "Pairs.h"

@implementation Pairs

- (NSInteger)countPairs:(NSArray <NSNumber *> *)array number:(NSNumber *)number {
    
    int counter = 0;
    
    for (int i = 0; i < array.count - 1; i++) {
        
        for(int j = i + 1; j < array.count; j++) {
            
            if (ABS((array[i].intValue - array[j].intValue)) == number.intValue) {
                counter++;
            }
        }
    }
    
    return counter;
}

@end
