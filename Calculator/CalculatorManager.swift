//
//  CalculatorManager.swift
//  Calculator
//
//  Created by Jean Ferreira on 22/11/17.
//  Copyright � 2017 jean rights reserved.
//
import Foundation

struct CalculatorManager {
    
    enum Operation {
        case unaryOperation ((Double)->Double)
        case binaryOperation ((Double,Double)->Double)
        case equals
        case unknown
    }
    
    private var binaryOperationMemory:PreviousBinaryOperation?
    
    private struct PreviousBinaryOperation {
        let function : (Double,Double)->Double
        let firstOperand: (Double)
        
        func perform(with secondOperand:Double)->Double {
            return function(firstOperand,secondOperand)
        }
    }
    
    private var accumulator: Double = 0.0
    private let operations = [
        "+":Operation.binaryOperation({$0 + $1}),
        "-":Operation.binaryOperation({$0 - $1}),
        "x":Operation.binaryOperation({$0 * $1}),
        "÷":Operation.binaryOperation({$0 / $1}),
        "±":Operation.unaryOperation({-$0}),
        "%":Operation.unaryOperation({$0 / 100}),
        "√":Operation.unaryOperation(sqrt),
        "=":Operation.equals
    ]
    
    var result: Double? {
        get {
            return accumulator
        }
    }
    
    //add
    mutating func toucheClear(){
        self.binaryOperationMemory = nil
    }
    
    mutating func doPreviousByOperation(){
        guard let memory = binaryOperationMemory else { return }
        accumulator = memory.perform(with: accumulator)
        self.binaryOperationMemory = nil
    }
    
    
    mutating func performOperation(_ symbol: String) {
        
        guard let operation = operations[symbol] else {return}
        
        switch operation {
        case .unaryOperation(let op):
            accumulator = op(accumulator)
        case .binaryOperation(let op):
            binaryOperationMemory = PreviousBinaryOperation(function: op, firstOperand: accumulator)
        case .equals:
            doPreviousByOperation()
        default:
            break
        }
    }
    
    mutating func setOperand(_ operand: Double){
        accumulator = operand
    }
    
}
