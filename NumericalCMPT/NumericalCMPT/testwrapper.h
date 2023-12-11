//
//  testwrapper.h
//  NumericalCMPT
//
//  Created by Emil Thomas Levin on 12/7/23.
//

#import <Foundation/Foundation.h>

#ifndef testwrapper_h
#define testwrapper_h
//#include <vector>

// Forward declaration
//std::vector<double> chooseMethodAndSolve(std::vector<std::vector<double>>& matrix, int method);

// Declare the Objective-C++ class interface
@interface TestWrapper : NSObject

// Declare a method to solve the matrix which will be implemented in .mm file
- (NSArray<NSNumber *> *)solveMatrix:(NSArray<NSArray<NSNumber *> *> *)matrix withMethod:(NSInteger)method;

@end


#endif /* testwrapper_h */
