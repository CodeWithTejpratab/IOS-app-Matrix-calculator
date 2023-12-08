//
//  testwrapper.m
//  NumericalCMPT
//
//  Created by Emil Thomas Levin on 12/7/23.
//

#import <Foundation/Foundation.h>
#import "testwrapper.h"
#import "test.hpp"

@implementation TestWrapper

+ (double)addNumbers:(double)num1 with:(double)num2 {
    return add_numbers(num1, num2);  // Call the C++ function
}

@end

