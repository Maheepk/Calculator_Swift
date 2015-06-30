//
//  ViewController.swift
//  Calculator Swift
//
//  Created by MaheepK on 24/06/15.
//  Copyright (c) 2015 CrayonLabs. All rights reserved.
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
        let operation = sender.currentTitle!
        
        if userIsInMiddleOfTypingNumber {
            enter()
        }
        
        switch operation {
            
            case  "×": performOperations {$0 * $1}
            case  "÷": performOperations {$1 / $0}
            case  "+": performOperations {$0 + $1}
            case  "−": performOperations {$1 - $0}
            case  "√": performOperations {sqrt($0)}
            
            default: break
        }
        
    }
    
    func performOperations(operation: (Double, Double) -> Double) {
        
        if operandStack.count >= 2 {
            displayValue = operation(operandStack.removeLast(), operandStack.removeLast())
            enter()
        }
    }
    
    func performOperations(operation: Double -> Double) {
        
        if operandStack.count >= 1 {
            displayValue = operation(operandStack.removeLast())
            enter()
        }
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

