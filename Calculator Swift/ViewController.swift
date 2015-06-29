//
//  ViewController.swift
//  Calculator Swift
//
//  Created by MaheepK on 24/06/15.
//  Copyright (c) 2015 Getondemand. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var display: UILabel!
    
    var  userIsInMiddleOfTypingNumber:Bool = false
    
    @IBAction func appendDigit(sender: UIButton) {
        
        let digit = sender.currentTitle!
        
        if userIsInMiddleOfTypingNumber {
            display.text = display.text! + digit
        } else {
            display.text = digit
            userIsInMiddleOfTypingNumber = true
        }
        
        println("digit = \(digit)")
        
    }
    
    var operandStack:Array<Double> = Array<Double>()
    
    @IBAction func enter() {
        
        userIsInMiddleOfTypingNumber = false
        operandStack.append(displayValue)
     
        println("Operand Stack = \(operandStack)" )
        
    }
    
    @IBAction func operate(sender: UIButton) {
        
    }
    
    
    var displayValue: Double {
        
        get{
           
           return NSNumberFormatter().numberFromString(display.text!)!.doubleValue
            
        }
        set{
            display.text = "\(newValue)"
            userIsInMiddleOfTypingNumber = false
        }
    }
    
}

