//
//  CalculatorManager.swift
//  Calculator
//
//  Created by Jean Ferreira on 22/11/17.
//  Copyright © 2017 jean rights reserved.
//
import Foundation

struct CalculatorManager {
    private var accumulator: Double?
    
    
    var result: Double? {
        get {
            return accumulator
        }
    }
    
    mutating func performOperation(_ symbol: String) {

    }
    
    mutating func setOperand(_ operand: Double) {
        accumulator = operand
    }
}