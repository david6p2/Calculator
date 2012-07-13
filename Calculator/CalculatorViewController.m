//
//  CalculatorViewController.m
//  Calculator
//
//  Created by David Cespedes on 2/02/12.
//  Copyright (c) 2012 LSR Marketing Service. All rights reserved.
//

#import "CalculatorViewController.h"
#import "CalculatorBrain.h"
 
@interface CalculatorViewController()
@property (nonatomic) BOOL userIsInTheMiddleOfEnteringANumer;
@property (nonatomic, strong) CalculatorBrain *brain;
@end

@implementation CalculatorViewController

@synthesize display = _display;
@synthesize userIsInTheMiddleOfEnteringANumer = _userIsInTheMiddleOfEnteringANumer;
@synthesize brain = _brain;

- (CalculatorBrain *)brain
{
    if (!_brain) _brain = [[CalculatorBrain alloc] init];
    return _brain;
}

- (IBAction)digitPressed:(UIButton *)sender 
{
    NSString *digit = sender.currentTitle;
    if (self.userIsInTheMiddleOfEnteringANumer) {
        self.display.text = [self.display.text stringByAppendingString:digit]; //[myDisplay setText:newText];
    }else {
        self.display.text = digit;
        self.userIsInTheMiddleOfEnteringANumer = YES;
    }
}
- (IBAction)enterPressed
{
    [self.brain pushOperand:[self.display.text doubleValue]];
    self.userIsInTheMiddleOfEnteringANumer = NO;
}
- (IBAction)operationPressed:(UIButton *)sender 
{
    if (self.userIsInTheMiddleOfEnteringANumer) [self enterPressed];
    double result = [self.brain performOperation:sender.currentTitle];
    NSString *resultString = [NSString stringWithFormat:@"%g", result];
    self.display.text = resultString;
}

@end
