#import "IPFormatConverter.h"

@implementation IPFormatConverter

- (NSString *)ipFormatConverter:(NSArray *)numbersArray {
    
    NSString *address = @"";
    
    if (numbersArray.count > 0) {
        
        NSNumber *number;
        
        for (int i = 0; i < 4; i++) {
            
            //handling case when the number of elements in numbersArray is less than 4.
            if (numbersArray.count < i + 1) {
                number = @0;
            } else {
                //good case
                number = numbersArray[i];
            }
            
            //exception handling
            if (number.intValue > 255) {
                return @"The numbers in the input array can be in the range from 0 to 255.";
            }
            
            //exception handling
            if (number.intValue < 0) {
                return @"Negative numbers are not valid for input.";
            }
            
            address = [address stringByAppendingFormat:@"%@.", number];
        }
        
        //remove "." in the end of the adress
        address = [address substringToIndex:[address length] - 1];
    }
    
    return address;
}

@end
