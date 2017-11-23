//
//  ViewController.swift
//  Calculator
//
//  Created by Jean Ferreira on 22/11/17.
//  Copyright © 2017  rights reserved.
//

import UIKit

class ViewController: UIViewController {

   @IBOutlet weak var display: UILabel!
    var userIsTyping: Bool = false
    
    var displayValue: Double {
        get {
            return Double(display.text!)!
        }
        set {
            display.text = String(newValue)
        }
    }
    
    @IBAction func touchClear(_ sender: UIButton) {
        userIsTyping = false
        display.text = "0"
    }
    
    @IBAction func touchDigit(_ sender: UIButton) {
        let digit = sender.currentTitle!
        if userIsTyping {
            let textDisplay = display.text ?? ""
            display.text = textDisplay + digit
        } else {
            display.text = digit
            userIsTyping = true
        }
    }
    
    @IBAction func performOperation(_ sender: UIButton) {
        userIsTyping = false

        if let mathSymbol = sender.currentTitle {
            switch mathSymbol {
            case "+":
                break;
            case "-":
                break;
            case "⨉":
                break;
            case "÷":
                break;
            case "=":
                break;
            case "±":
                display.text = String(-displayValue)
                break;
            case "%":
                break;
            case "√":
                display.text = String(sqrt(displayValue))
                break;
            default:
                break;
            }
        }
    }

    @IBAction func performOperation(_ sender: UIButton) {
        if userIsTyping {
            userIsTyping = false
            manager.setOperand(displayValue)
        }

        if let mathSymbol = sender.currentTitle {
            manager.performOperation(mathSymbol)
        }
        
        if let result = manager.result {
            displayValue = result
        }
    }

}

