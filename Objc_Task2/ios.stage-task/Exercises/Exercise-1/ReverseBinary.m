#import "ReverseBinary.h"

UInt8 ReverseInteger(UInt8 n) {
    

    int result = 0;
    int lastBit = 0;
    
    
    for(int i = 0; i < 8; i++) {

        lastBit = n & 1;
        n = n >> 1;
        result = (result << 1) | lastBit;
    }
    
    return result;
}
