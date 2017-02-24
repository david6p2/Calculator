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
  
  var displayValue: Double {
    get{
      return Double(display.text!)!
    }
    set{
      display.text = String(newValue)
    }
  }
  
  @IBAction func digitPressed(_ sender: UIButton) {
    let digit = sender.currentTitle!
    if userIsInTheMiddleOfTyping {
      display.text?.append(digit)
    }else{
      display.text = digit
      userIsInTheMiddleOfTyping = true
    }
  }
  
  @IBAction func performOperation(_ sender: UIButton) {
    userIsInTheMiddleOfTyping = false
    if let mathematicalSymbol = sender.currentTitle {
      switch mathematicalSymbol {
      case "π":
        displayValue = Double.pi
      case "√":
        displayValue = sqrt(displayValue)
      default:
        break
      }
    }
  }

}

