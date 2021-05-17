#import "TwoDimensionalArraySorter.h"

@implementation TwoDimensionalArraySorter

- (NSArray *)twoDimensionalSort:(NSArray<NSArray *> *)array {
    
    NSMutableArray *commonArray = [NSMutableArray new];
    NSMutableArray<NSString *> *stringsArray = [NSMutableArray new];
    NSMutableArray<NSNumber *> *numbersArray = [NSMutableArray new];
    
    for (NSArray *nestedArray in array) {
        
        if ([nestedArray isKindOfClass:NSArray.class]) {
            
            //adding objects to arrays corresponding to theeir classes
            [stringsArray addObjectsFromArray:[self checkElementsOf:nestedArray forClass:NSString.class]];
            [numbersArray addObjectsFromArray:[self checkElementsOf:nestedArray forClass:NSNumber.class]];

        } else {
            
            //case when entered array contain something else except for arrays
            return @[];
        }
    }
    
    //case when both arrays aren't empty
    if (stringsArray.count && numbersArray.count) {
        
        //add numbers array with ascending sorting to common array
        [commonArray addObject:[numbersArray sortedArrayUsingSelector:@selector(compare:)]];
        
        //add strings array with descending sorting to common array
        NSSortDescriptor *sortDescriptor;
        sortDescriptor = [[NSSortDescriptor alloc] initWithKey:nil ascending:NO];
        [commonArray addObject:[stringsArray sortedArrayUsingDescriptors:@[sortDescriptor]]];
        
        return [commonArray copy];
    }
    
    //case when only one of arrays isn't empty
    [commonArray addObjectsFromArray:[numbersArray sortedArrayUsingSelector:@selector(compare:)]];
    [commonArray addObjectsFromArray:[stringsArray sortedArrayUsingSelector:@selector(compare:)]];
    
    return [commonArray copy];
}

- (NSArray *)checkElementsOf:(NSArray *)array forClass:(Class)class {
    
    NSMutableArray *finalArray = [NSMutableArray new];
    
    for (id object in array) {
        
        if ([object isKindOfClass: class]) {
            [finalArray addObject:object];
        }
    }
    
    return [finalArray copy];
}

@end
