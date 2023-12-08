//
//  testwrapper.h
//  NumericalCMPT
//
//  Created by Emil Thomas Levin on 12/7/23.
//

#import <Foundation/Foundation.h>

#ifndef testwrapper_h
#define testwrapper_h

@interface TestWrapper : NSObject

// Declare a class method that wraps the C++ function
+ (double)addNumbers:(double)num1 with:(double)num2;

@end

#endif /* testwrapper_h */
