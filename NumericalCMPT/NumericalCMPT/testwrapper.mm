//
//  testwrapper.m
//  NumericalCMPT
//
//  Created by Emil Thomas Levin on 12/7/23.
//

#import <Foundation/Foundation.h>
// testwrapper.mm

#import "testwrapper.h"
#include "test.hpp" // Include the C++ header with the numerical methods
#include <vector>

using namespace std;

@implementation TestWrapper

- (NSArray<NSNumber *> *)solveMatrix:(NSArray<NSArray<NSNumber *> *> *)matrix withMethod:(NSInteger)method {
    // Convert the NSArray input to the std::vector for C++ processing
    vector<vector<double>> cppMatrix;
    for (NSArray<NSNumber *> *row in matrix) {
        vector<double> cppRow;
        for (NSNumber *number in row) {
            cppRow.push_back([number doubleValue]);
        }
        cppMatrix.push_back(cppRow);
    }
    
    // Call the C++ function
    vector<double> solution = chooseMethodAndSolve(cppMatrix, static_cast<int>(method));
    
    // Convert the std::vector result back to NSArray for Objective-C
    NSMutableArray<NSNumber *> *solutionArray = [NSMutableArray arrayWithCapacity:solution.size()];
    for (double value : solution) {
        [solutionArray addObject:@(value)];
    }
    
    return solutionArray;
}

@end

