//
//  CalculatorBrain.h
//  Calculator
//
//  Created by David Cespedes on 12/02/12.
//  Copyright (c) 2012 LSR Marketing Service. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CalculatorBrain : NSObject

- (void)pushOperand:(double)operand;
- (double)performOperation:(NSString *)operation;
@end
