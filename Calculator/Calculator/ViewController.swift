//
//  ViewController.swift
//  Calculator
//
//  Created by David Andres Cespedes on 2/24/17.
//  Copyright © 2017 David Andres Cespedes. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  
  @IBOutlet weak var display: UILabel!
  
  var userIsInTheMiddleOfTyping = false
  
  @IBAction func digitPressed(_ sender: UIButton) {
    let digit = sender.currentTitle!
    if userIsInTheMiddleOfTyping {
      display.text?.append(digit)
    }else{
      display.text = digit
      userIsInTheMiddleOfTyping = true
    }
  }
  
  var displayValue: Double {
    get{
      return Double(display.text!)!
    }
    set{
      display.text = String(newValue)
    }
  }
  
  private var brain = CalculatorBrain()
  
  @IBAction func performOperation(_ sender: UIButton) {
    if userIsInTheMiddleOfTyping {
      brain.setOperand(displayValue)
      userIsInTheMiddleOfTyping = false
    }
    userIsInTheMiddleOfTyping = false
    if let mathematicalSymbol = sender.currentTitle {
      brain.performOperation(mathematicalSymbol)
    }
    if let result = brain.result {
      displayValue = result
    }
  }
}

